/obj/machinery/quantumpad
	name = "quantum pad"
	desc = "A bluespace quantum-linked telepad used for teleporting objects to other quantum pads."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "qpad-idle"
	idle_power_usage = 10 KILOWATTS
	construct_state = /decl/machine_construction/default/panel_closed
	wires = /datum/wires/quantumpad
	maximum_component_parts = list(/obj/item/stock_parts = 14)
	var/icon_state_default = "qpad"
	var/teleport_delay = 2 SECONDS
	var/teleport_cooldown_time = 30 SECONDS
	var/teleport_cooldown
	var/teleporting = FALSE //if it's in the process of teleporting
	/// List of whitelisted types; If set - only these things can pass through
	var/list/teleport_only = list()
	var/teleport_power_cost = 100 KILOWATTS
	var/power_efficiency = 1
	var/obj/machinery/quantumpad/linked_pad

	// Mapping
	var/static/list/mapped_quantum_pads = list()
	var/map_pad_id = ""
	var/map_pad_link_id = ""

/obj/machinery/quantumpad/Initialize()
	. = ..()
	if(map_pad_id)
		mapped_quantum_pads[map_pad_id] = src

/obj/machinery/quantumpad/Destroy()
	mapped_quantum_pads -= map_pad_id
	return ..()

/obj/machinery/quantumpad/examine(mob/user)
	. = ..()
	to_chat(user, SPAN_NOTICE("It is [ linked_pad ? "currently" : "not"] linked to another pad."))
	if(!panel_open)
		to_chat(user, SPAN_NOTICE("The panel is <i>screwed</i> in, obstructing the linking device."))
	else
		to_chat(user, SPAN_NOTICE("The <i>linking</i> device is now able to be <i>scanned</i> with a multitool."))

	if(world.time < teleport_cooldown)
		to_chat(user, SPAN_NOTICE("[src] will be operational in [round((teleport_cooldown - world.time) / 10)] seconds."))

/obj/machinery/quantumpad/on_update_icon()
	if(panel_open || (stat & NOPOWER))
		icon_state = "[icon_state_default]-o"
	else
		icon_state = "[icon_state_default]-idle"
	return

/obj/machinery/quantumpad/attackby(obj/item/I, mob/user, params)
	if(user.a_intent == I_HURT)
		return ..()

	if(istype(I, /obj/item/device/assembly/signaler) && panel_open)
		return wires.Interact(user)

	if(istype(I, /obj/item/device/multitool))
		var/obj/item/device/multitool/M = I
		if(panel_open)
			M.set_buffer(src)
			to_chat(user, SPAN_NOTICE("You save the data in [M]'s buffer. It can now be linked to pads with closed panels."))
			return TRUE

		else
			var/obj/machinery/quantumpad/buffer = M.get_buffer(/obj/machinery/quantumpad)
			if(!istype(buffer))
				return TRUE
			if(buffer == src)
				to_chat(user, SPAN_WARNING("You cannot link a pad to itself!"))
				return TRUE
			else
				linked_pad = buffer
				to_chat(user, SPAN_NOTICE("You link [src] to the one in [I]'s buffer."))
		return TRUE

	if(isWrench(I) && !panel_open)
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		to_chat(user, SPAN_NOTICE("You [anchored ? "un" : ""]anchor \the [src]."))
		anchored = !anchored
		return TRUE

	if(istype(I, /obj/item/quantum_keycard))
		var/obj/item/quantum_keycard/K = I
		if(K.qpad)
			to_chat(user, SPAN_NOTICE("You insert [K] into [src]'s card slot, activating it."))
			physical_attack_hand(user, K.qpad)
		else
			to_chat(user, SPAN_NOTICE("You insert [K] into [src]'s card slot, initiating the link procedure."))
			if(do_after(user, 40, target = src))
				to_chat(user, SPAN_NOTICE("You complete the link between [K] and [src]."))
				K.LinkPad(src)
		return TRUE

	return ..()

/obj/machinery/quantumpad/physical_attack_hand(mob/user, obj/machinery/quantumpad/target_pad = linked_pad)
	if(!target_pad || QDELETED(target_pad))
		if(!map_pad_link_id || !initMappedLink())
			to_chat(user, SPAN_WARNING("Target pad not found!"))
			return

	if(panel_open)
		to_chat(user, SPAN_WARNING("[src]'s panel is open!"))
		return

	if(stat & NOPOWER)
		to_chat(user, SPAN_WARNING("[src] is unpowered!"))
		return

	if(teleporting)
		to_chat(user, SPAN_WARNING("[src] is charging up. Please wait."))
		return

	if(!anchored)
		to_chat(user, SPAN_WARNING("[src] is not anchored."))
		return

	if(world.time < teleport_cooldown)
		to_chat(user, SPAN_WARNING("[src] is recharging. Please wait for [round((teleport_cooldown - world.time) / 10)] seconds."))
		return

	if(target_pad.teleporting)
		to_chat(user, SPAN_WARNING("Target pad is busy. Please wait."))
		return

	if(target_pad.stat & NOPOWER)
		to_chat(user, SPAN_WARNING("Target pad is not responding to ping."))
		return

	if(!target_pad.anchored)
		to_chat(user, SPAN_WARNING("Target pad is not anchored."))
		return

	add_fingerprint(user)
	AttemptTeleport(user, target_pad)
	return TRUE

/obj/machinery/quantumpad/attack_ghost(mob/observer/ghost)
	. = ..()
	if(.)
		return
	if(!linked_pad && map_pad_link_id)
		initMappedLink()
	if(linked_pad)
		ghost.forceMove(get_turf(linked_pad))

/obj/machinery/quantumpad/RefreshParts()
	..()
	teleport_delay = 15 SECONDS / clamp(total_component_rating_of_type(/obj/item/stock_parts/micro_laser), 1, 30)
	teleport_cooldown_time = 150 SECONDS / clamp(total_component_rating_of_type(/obj/item/stock_parts/micro_laser), 1, 30)
	power_efficiency = 0.2 * clamp(total_component_rating_of_type(/obj/item/stock_parts/capacitor), 1, 30)

/obj/machinery/quantumpad/proc/sparks()
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, get_turf(src))
	s.start()

/obj/machinery/quantumpad/proc/AttemptTeleport(mob/user, obj/machinery/quantumpad/target_pad = linked_pad)
	if(!target_pad)
		return

	playsound(get_turf(src), 'sound/weapons/flash.ogg', 25, TRUE)
	teleporting = TRUE
	addtimer(CALLBACK(src, .proc/DoTeleport, user, target_pad), teleport_delay)

/obj/machinery/quantumpad/proc/DoTeleport(mob/user, obj/machinery/quantumpad/target_pad = linked_pad)
	if(!src || QDELETED(src))
		teleporting = FALSE
		return
	if(stat & NOPOWER)
		to_chat(user, SPAN_WARNING("[src] is unpowered!"))
		teleporting = FALSE
		return
	if(!target_pad || QDELETED(target_pad) || target_pad.stat & NOPOWER)
		to_chat(user, SPAN_WARNING("Linked pad is not responding to ping. Teleport aborted."))
		teleporting = FALSE
		return
	if(can_use_power_oneoff(teleport_power_cost / power_efficiency, powered() ? power_channel : LOCAL))
		to_chat(user, SPAN_WARNING("Not enough power to perform the jump. Teleport aborted."))
		teleporting = FALSE
		return

	use_power_oneoff(teleport_power_cost / power_efficiency, powered() ? power_channel : LOCAL)
	teleporting = FALSE
	teleport_cooldown = world.time + teleport_cooldown_time

	sparks()
	target_pad.sparks()

	flick("[icon_state_default]-beam", src)
	playsound(get_turf(src), 'sound/weapons/emitter2.ogg', 25, TRUE)
	flick("[target_pad.icon_state_default]-beam", target_pad)
	playsound(get_turf(target_pad), 'sound/weapons/emitter2.ogg', 25, TRUE)
	for(var/atom/movable/ROI in get_turf(src))
		if(QDELETED(ROI))
			continue // Sleeps in CHECK_TICK
		if(LAZYLEN(teleport_only) && !(ROI.type in teleport_only))
			continue // Cannot teleport these

		// if is anchored, don't let through
		if(ROI.anchored)
			if(isliving(ROI))
				var/mob/living/L = ROI
				//only TP living mobs buckled to non anchored items
				if(!L.buckled || L.buckled.anchored)
					continue
			else
				continue

		// Don't TP ghosts
		if(isobserver(ROI))
			continue

		do_teleport(ROI, get_turf(target_pad), type = /decl/teleport)
		CHECK_TICK

/obj/machinery/quantumpad/proc/initMappedLink()
	. = FALSE
	var/obj/machinery/quantumpad/link = mapped_quantum_pads[map_pad_link_id]
	if(link)
		linked_pad = link
		. = TRUE

/obj/machinery/quantumpad/mining
	name = "mining quantum pad"
	desc = "A bluespace quantum-linked telepad used for teleporting ores to other quantum pads."
	icon_state = "pad-idle"
	icon_state_default = "pad"
	idle_power_usage = 0
	teleport_power_cost = 20 KILOWATTS // It only teleports ores, after all
	maximum_component_parts = list(/obj/item/stock_parts = 12)

/obj/machinery/quantumpad/mining/Initialize()
	. = ..()
	teleport_only = subtypesof(/obj/item/ore)
