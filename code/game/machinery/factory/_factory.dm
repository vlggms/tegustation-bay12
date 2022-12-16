/obj/machinery/factory
	name = "automated production factory"
	desc = "Automatic factory capable of producing items provided in a blueprint."
	icon = 'icons/obj/factory.dmi'
	icon_state = "factory"
	idle_power_usage = 10
	active_power_usage = 50 KILOWATTS
	construct_state = /decl/machine_construction/default/panel_closed

	var/obj/item/factory_blueprint/stored_blueprint = null
	/// Assoc list of item paths in the machine
	var/list/stored_materials = list()
	/// Actual objects stored inside
	var/list/materials_in_contents = list()
	var/output_dir = SOUTH
	/// Amount of progress added each tick
	var/production_speed = 1
	/// If it's currently in the process of making an item
	var/producing = FALSE
	/// Currently passed ticks
	var/production_progress = 0

/obj/machinery/factory/Initialize()
	. = ..()
	if(ispath(stored_blueprint))
		stored_blueprint = new(src)

/obj/machinery/factory/Destroy()
	RemoveBlueprint()
	return ..()

/obj/machinery/factory/Process()
	if(stat & NOPOWER)
		return

	if(!producing || !istype(stored_blueprint))
		return

	if(!HasResources())
		production_progress = 0
		return

	production_progress += production_speed
	if(production_progress > stored_blueprint.production_time)
		CreateProduct()
		producing = FALSE
		update_icon()
	else
		playsound(loc, 'sound/machines/pump.ogg', 20, TRUE)

	return TRUE

/obj/machinery/factory/examine(mob/user)
	. = ..()
	if(istype(stored_blueprint))
		to_chat(user, SPAN_NOTICE("It has [stored_blueprint] installed."))

/obj/machinery/factory/physical_attack_hand(mob/living/user)
	if(!istype(stored_blueprint))
		return TRUE

	producing = !producing
	user.visible_message(SPAN_WARNING("[user] turned [producing ? "on" : "off"] \the [src]."),
		SPAN_NOTICE("You turn [producing ? "on" : "off"] \the [src]."))
	if(producing)
		START_PROCESSING_MACHINE(src, MACHINERY_PROCESS_SELF)
	update_icon()

	return TRUE

/obj/machinery/factory/cannot_transition_to(state_path)
	if(producing)
		return SPAN_NOTICE("You must turn \the [src] off first.")
	if(istype(stored_blueprint))
		return SPAN_NOTICE("You must remove the blueprint first.")
	return ..()

/obj/machinery/factory/components_are_accessible(path)
	return !producing && !istype(stored_blueprint) && ..()

/obj/machinery/factory/attackby(obj/item/I, mob/user, params)
	if(user.a_intent == I_HURT)
		return ..()

	if(istype(I, /obj/item/factory_blueprint))
		InsertBlueprint(I, user)
		return TRUE

	if(I.type in stored_blueprint.required_materials)
		InsertMaterial(I, user)
		return TRUE

	return ..()

/// Returns TRUE if there is enough resources to produce
/obj/machinery/factory/proc/HasResources()
	if(!istype(stored_blueprint))
		return FALSE

	for(var/path_type in stored_blueprint.required_materials)
		if(stored_materials[path_type] < stored_blueprint.required_materials[path_type])
			return FALSE
	return TRUE

/obj/machinery/factory/proc/InsertMaterial(obj/item/I, mob/living/user)
	if(!(I.type in stored_materials))
		stored_materials[I.type] = 0

	if(istype(I, /obj/item/stack))
		var/obj/item/stack/S = I
		stored_materials[I.type] += S.amount
	else
		stored_materials[I.type] += 1
	materials_in_contents += I
	if(istype(user))
		user.unEquip(I, src)
	I.forceMove(src)

	return TRUE

/obj/machinery/factory/proc/RemoveMaterial(path_type, mob/living/user)
	if(!locate(path_type) in materials_in_contents)
		return FALSE

	if(!(path_type in stored_materials))
		return FALSE

	var/turf/drop_turf = get_turf(src)
	if(istype(user))
		drop_turf = get_turf(user)

	stored_materials.Remove(path_type)
	for(var/obj/item/I in materials_in_contents)
		if(!istype(I, path_type))
			continue
		I.forceMove(drop_turf)
		materials_in_contents -= I

	return TRUE

/obj/machinery/factory/proc/InsertBlueprint(obj/item/factory_blueprint/B, mob/living/user)
	if(!istype(B))
		return FALSE

	if(istype(stored_blueprint))
		return FALSE

	production_progress = 0

	stored_blueprint = B
	if(istype(user))
		user.unEquip(B, src)
	B.forceMove(src)

	return TRUE

/obj/machinery/factory/proc/RemoveBlueprint(mob/living/user)
	if(istype(stored_blueprint))
		return FALSE

	production_progress = 0

	// Empty materials related to the blueprint
	for(var/path_type in stored_blueprint.required_materials)
		RemoveMaterial(path_type, user)

	var/turf/drop_turf = get_turf(src)
	if(istype(user))
		drop_turf = get_turf(user)
	stored_blueprint.forceMove(drop_turf)
	stored_blueprint = null

	return TRUE

/obj/machinery/factory/proc/CreateProduct()
	if(!istype(stored_blueprint) || !ispath(stored_blueprint.production_path))
		return FALSE

	production_progress = 0

	var/turf/drop_turf = get_step(src, output_dir)
	if(drop_turf.density)
		drop_turf = get_turf(src)

	var/list/depleting = stored_blueprint.required_materials.Copy()
	for(var/path_type in stored_materials)
		stored_materials[path_type] -= depleting[path_type]
	for(var/obj/item/I in materials_in_contents)
		if(istype(I, /obj/item/stack))
			var/obj/item/stack/S = I
			var/to_remove = min(S.amount, depleting[S.type])
			S.amount -= to_remove
			depleting[S.type] -= to_remove
			if(depleting[S.type] <= 0)
				depleting.Remove(I.type)
			if(S.amount <= 0)
				materials_in_contents -= S
				QDEL_NULL(S)
			continue
		depleting.Remove(I.type)
		materials_in_contents -= I
		QDEL_NULL(I)

	new stored_blueprint.production_path(drop_turf)
	playsound(loc,'sound/machines/ping.ogg', 50, TRUE)

	return TRUE
