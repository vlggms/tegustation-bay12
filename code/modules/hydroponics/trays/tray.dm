/obj/machinery/portable_atmospherics/hydroponics
	name = "hydroponics tray"
	desc = "A mechanical basin designed to nurture plants. It has various useful sensors."
	icon = 'icons/obj/hydroponics_machines.dmi'
	icon_state = "hydrotray3"
	density = TRUE
	anchored = TRUE
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	volume = 100
	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null
	stat_immune = 0

	machine_name = "hydroponics tray"
	machine_desc = "These are waist-high trays that can grow a vast variety of plants in a nutrient bath. Also comes with a sealable lid for plants that don't grow in a surrounding atmosphere. A cornerstone of self-sufficient spaceships across the galaxy."

	var/mechanical = 1         // Set to 0 to stop it from drawing the alert lights.
	var/base_name = "tray"

	// Plant maintenance vars.
	var/waterlevel = 100       // Water (max 100)
	var/nutrilevel = 10        // Nutrient (max 10)
	var/pestlevel = 0          // Pests (max 10)
	var/weedlevel = 0          // Weeds (max 10)

	// Tray state vars.
	var/dead = FALSE               // Is it dead?
	var/harvest = FALSE            // Is it ready to harvest?
	var/age = 0                    // Current plant age
	var/sampled = FALSE            // Have we taken a sample?

	// Harvest/mutation mods.
	var/yield_mod = 0          // Modifier to yield
	var/mutation_mod = 0       // Modifier to mutation chance
	var/toxins = 0             // Toxicity in the tray?
	var/mutation_level = 0     // When it hits 100, the plant mutates.
	var/tray_light = 5         // Supplied lighting.

	// Mechanical concerns.
	var/health = 0             // Plant health.
	var/lastproduce = 0        // Last time tray was harvested
	var/lastcycle = 0          // Cycle timing/tracking var.
	var/cycledelay = 150       // Delay per cycle.
	var/closed_system          // If set, the tray will attempt to take atmos from a pipe.
	var/force_update           // Set this to bypass the cycle time check.
	var/obj/temp_chem_holder   // Something to hold reagents during process_reagents()

	// Seed details/line data.
	var/datum/seed/seed = null // The currently planted seed

/obj/machinery/portable_atmospherics/hydroponics/AltClick()
	if (mechanical && !usr.incapacitated() && Adjacent(usr))
		close_lid(usr)
		return TRUE
	return ..()

/obj/machinery/portable_atmospherics/hydroponics/attack_ghost(mob/observer/ghost/user)
	if (!(harvest && seed && seed.has_mob_product))
		return

	if (!user.can_admin_interact())
		return

	var/response = alert(user, "Are you sure you want to harvest this [seed.display_name]?", "Living plant request", "Yes", "No")
	if (response == "Yes")
		harvest()

/obj/machinery/portable_atmospherics/hydroponics/Initialize()
	if (!mechanical)
		construct_state = null
	. = ..()
	temp_chem_holder = new()
	temp_chem_holder.create_reagents(10)
	temp_chem_holder.atom_flags |= ATOM_FLAG_OPEN_CONTAINER
	create_reagents(200)
	if (mechanical)
		connect()
	update_icon()
	STOP_PROCESSING_MACHINE(src, MACHINERY_PROCESS_ALL)
	START_PROCESSING(SSplants, src)
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/portable_atmospherics/hydroponics/Destroy()
	STOP_PROCESSING(SSplants, src)
	. = ..()

/obj/machinery/portable_atmospherics/hydroponics/LateInitialize()
	. = ..()
	if (locate(/obj/item/seeds) in get_turf(src))
		plant()

/obj/machinery/portable_atmospherics/hydroponics/bullet_act(obj/item/projectile/P)

	//Don't act on seeds like dionaea that shouldn't change.
	if (seed && seed.get_trait(TRAIT_IMMUTABLE) > 0)
		return

	//Override for somatoray projectiles.
	if (istype(P, /obj/item/projectile/energy/floramut) && prob(20))
		if (istype(P, /obj/item/projectile/energy/floramut/gene))
			var/obj/item/projectile/energy/floramut/gene/G = P
			if (seed)
				seed = seed.diverge_mutate_gene(G.gene, get_turf(loc))	//get_turf just in case it's not in a turf.
		else
			mutate(prob(75) ? 1 : 2)
			return
	else if (istype(P ,/obj/item/projectile/energy/florayield) && prob(20))
		yield_mod = min(10, yield_mod + rand(1, 2))
		return

	..()

/obj/machinery/portable_atmospherics/hydroponics/CanPass(atom/movable/mover, turf/target, height = 0, air_group = 0)
	if (air_group || !height)
		return TRUE

	if (istype(mover) && mover.checkpass(PASS_FLAG_TABLE))
		return TRUE
	else
		return !density

/obj/machinery/portable_atmospherics/hydroponics/proc/check_health(icon_update = TRUE)
	if (seed && !dead && health <= 0)
		die()
	check_level_sanity()
	if (icon_update)
		update_icon()

/obj/machinery/portable_atmospherics/hydroponics/proc/die()
	dead = TRUE
	mutation_level = 0
	harvest = FALSE
	weedlevel += 1 * HYDRO_SPEED_MULTIPLIER
	pestlevel = 0

//Process reagents being input into the tray.
/obj/machinery/portable_atmospherics/hydroponics/proc/process_reagents()
	if (reagents?.total_volume <= 0)
		return

	reagents.trans_to_obj(temp_chem_holder, min(reagents.total_volume, rand(1, 3)))

	for (var/datum/reagent/R in temp_chem_holder.reagents.reagent_list)

		var/reagent_total = temp_chem_holder.reagents.get_reagent_amount(R.type)

		if (seed && !dead)
			//Handle some general level adjustments.
			toxins += R.plant_toxin * reagent_total
			weedlevel += R.plant_weedkiller * reagent_total
			pestlevel += R.plant_pestkiller * reagent_total

			// Beneficial reagents have a few impacts along with health buffs.
			health += R.plant_health_mod * reagent_total
			yield_mod += R.plant_yield_mod * reagent_total
			mutation_mod += R.plant_mut_mod * reagent_total

			// Mutagen is distinct from the previous types and mostly has a chance of proccing a mutation.
			mutation_level += R.plant_mutagen + mutation_mod & reagent_total

		// Handle nutrient refilling.
		nutrilevel += R.plant_nutrients * reagent_total

		// Handle water and water refilling.
		var/water_added = 0
		if (R.plant_water != 0)
			var/water_input = R.plant_water * reagent_total
			water_added += water_input
			waterlevel += water_input

		// Water dilutes toxin level.
		if (water_added > 0)
			toxins -= round(water_added / 4)

	temp_chem_holder.reagents.clear_reagents()
	check_health()

//Harvests the product of a plant.
/obj/machinery/portable_atmospherics/hydroponics/proc/harvest(mob/user)

	//Harvest the product of the plant,
	if (!seed || !harvest)
		return

	if (closed_system)
		if (user)
			to_chat(user, SPAN_WARNING("You can't harvest from the plant while the lid is shut."))
		return

	if (user)
		. = seed.harvest(user,yield_mod)
	else
		. = seed.harvest(get_turf(src), yield_mod)
	// Reset values.
	harvest = FALSE
	lastproduce = age

	if (!seed.get_trait(TRAIT_HARVEST_REPEAT))
		yield_mod = 0
		seed = null
		dead = FALSE
		age = 0
		sampled = FALSE
		mutation_mod = 0

	check_health()

//Clears out a dead plant.
/obj/machinery/portable_atmospherics/hydroponics/proc/remove_dead(mob/user, silent)
	if (!dead)
		return

	if (closed_system)
		if (user)
			to_chat(user, SPAN_WARNING("You can't remove the dead plant while the lid is shut."))
		return FALSE

	seed = null
	dead = FALSE
	sampled = FALSE
	age = 0
	yield_mod = 0
	mutation_mod = 0

	if (!silent && user)
		to_chat(user, SPAN_NOTICE("You remove the dead plant."))
	lastproduce = 0
	check_health()
	return TRUE

// If a weed growth is sufficient, this proc is called.
/obj/machinery/portable_atmospherics/hydroponics/proc/weed_invasion()

	//Remove the seed if something is already planted.
	if (seed)
		seed = null
	seed = SSplants.seeds[pick(list("reishi", "nettles", "amanita", "mushrooms", "plumphelmet", "towercap", "harebells", "weeds", "diona"))]
	if (!seed)
		return //Weed does not exist, someone fucked up.

	dead = FALSE
	age = 0
	health = seed.get_trait(TRAIT_ENDURANCE)
	lastcycle = world.time
	harvest = FALSE
	weedlevel = 0
	pestlevel = 0
	sampled = FALSE
	update_icon()
	visible_message(SPAN_WARNING("\The [src] has been overtaken by [seed.display_name]!"))

	return

/obj/machinery/portable_atmospherics/hydroponics/proc/mutate(severity)

	// No seed, no mutations.
	if (!seed)
		return

	// Check if we should even bother working on the current seed datum.
	if (seed.mutants && seed.mutants.len && severity > 1)
		mutate_species()
		return

	// We need to make sure we're not modifying one of the global seed datums.
	// If it's not in the global list, then no products of the line have been
	// harvested yet and it's safe to assume it's restricted to this tray.
	if (!isnull(SSplants.seeds[seed.name]))
		seed = seed.diverge()
	seed.mutate(severity,get_turf(src))

	return

/obj/machinery/portable_atmospherics/hydroponics/verb/setlight()
	set name = "Set Light"
	set category = "Object"
	set src in view(1)

	if (usr.incapacitated())
		return
	if (ishuman(usr) || istype(usr, /mob/living/silicon/robot))
		var/new_light = input("Specify a light level.") as null|anything in list(0,1,2,3,4,5,6,7,8,9,10)
		if (new_light)
			tray_light = new_light
			to_chat(usr, "You set the tray to a light level of [tray_light] lumens.")
	return

/obj/machinery/portable_atmospherics/hydroponics/proc/check_level_sanity()
	//Make sure various values are sane.
	if (seed)
		health =     max(0,min(seed.get_trait(TRAIT_ENDURANCE),health))
	else
		health = 0
		dead = FALSE

	mutation_level = max(0,min(mutation_level,100))
	nutrilevel =     max(0,min(nutrilevel,10))
	waterlevel =     max(0,min(waterlevel,100))
	pestlevel =      max(0,min(pestlevel,10))
	weedlevel =      max(0,min(weedlevel,10))
	toxins =         max(0,min(toxins,10))

/obj/machinery/portable_atmospherics/hydroponics/proc/mutate_species()

	var/previous_plant = seed.display_name
	var/newseed = seed.get_mutant_variant()
	if (newseed in SSplants.seeds)
		seed = SSplants.seeds[newseed]
	else
		return

	dead = FALSE
	mutate(1)
	age = 0
	health = seed.get_trait(TRAIT_ENDURANCE)
	lastcycle = world.time
	harvest = FALSE
	weedlevel = 0

	update_icon()
	visible_message(SPAN_DANGER("\The [previous_plant] suddenly mutates into \a [seed.display_name]!"))
	return

/obj/machinery/portable_atmospherics/hydroponics/attackby(obj/item/O, mob/user)

	if (O.is_open_container())
		return FALSE

	if (O.edge && O.w_class < ITEM_SIZE_NORMAL && user.a_intent != I_HURT)

		if (!seed)
			to_chat(user, SPAN_WARNING("There is nothing to take a sample from in \the [src]."))
			return

		if (sampled)
			to_chat(user, SPAN_WARNING("There's no bits that can be used for a sampling left."))
			return

		if (dead)
			to_chat(user, SPAN_WARNING("The plant is dead."))
			return

		var/needed_skill = seed.mysterious ? SKILL_ADEPT : SKILL_BASIC
		if (prob(user.skill_fail_chance(SKILL_BOTANY, 90, needed_skill)))
			to_chat(user, SPAN_WARNING("You fail to get a usable sample."))
		else
			// Create a sample.
			seed.harvest(user, yield_mod, 1)
		health -= (rand(3, 5) * 10)

		if (prob(30))
			sampled = TRUE

		// Bookkeeping.
		check_health()
		force_update = TRUE
		Process()

		return

	else if (istype(O, /obj/item/seeds))
		plant_seed(user, O)

	else if (istype(O, /obj/item/material/minihoe))  // The minihoe

		if (weedlevel > 0)
			user.visible_message(
				SPAN_NOTICE("\The [user] uproots the weeds from \the [src]."),
				SPAN_NOTICE("You remove the weeds from \the [src].")
			)
			weedlevel = 0
			if (seed)
				var/needed_skill = seed.mysterious ? SKILL_ADEPT : SKILL_BASIC
				if (!user.skill_check(SKILL_BOTANY, needed_skill))
					to_chat(user, SPAN_WARNING("You accidentally damage \the [seed.display_name]!"))
					health -= rand(40, 60)
			check_health() // force an icon update
		else
			to_chat(user, SPAN_NOTICE("This plot is completely devoid of weeds, and doesn't need uprooting."))

	else if (istype(O, /obj/item/storage/plants))

		attack_hand(user)

		var/obj/item/storage/plants/S = O
		for (var/obj/item/reagent_containers/food/snacks/grown/G in locate(user.x, user.y, user.z))
			if (!S.can_be_inserted(G, user))
				return
			S.handle_item_insertion(G, 1)

	else if (istype(O, /obj/item/plantspray))

		var/obj/item/plantspray/spray = O
		toxins += spray.toxicity
		pestlevel -= spray.pest_kill_str
		weedlevel -= spray.weed_kill_str
		to_chat(user, SPAN_NOTICE("You spray [src] with [O]."))
		playsound(loc, 'sound/effects/spray3.ogg', 50, TRUE, -6)
		qdel(O)
		check_health()

	else if (mechanical && isWrench(O))

		//If there's a connector here, the portable_atmospherics setup can handle it.
		if (locate(/obj/machinery/atmospherics/portables_connector/) in loc)
			return ..()

		playsound(loc, 'sound/items/Ratchet.ogg', 50, TRUE)
		anchored = !anchored
		to_chat(user, SPAN_NOTICE("You [anchored ? "drop \the [src]'s securing bolts" : "free \the [src] from the floor"]."))

	else if (O.force && seed)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.visible_message(SPAN_DANGER("\The [seed.display_name] has been attacked by [user] with \the [O]!"))
		playsound(get_turf(src), O.hitsound, 100, TRUE)
		if (!dead)
			health -= O.force
			check_health()
	else if (mechanical)
		return component_attackby(O, user)

/obj/machinery/portable_atmospherics/hydroponics/proc/plant_seed(mob/user, obj/item/seeds/S)

	if (seed)
		to_chat(user, SPAN_WARNING("\The [src] already has seeds in it!"))
		return

	if (!S.seed)
		to_chat(user, "The packet seems to be empty. You throw it away.")
		qdel(S)
		return

	to_chat(user, "You plant the [S.seed.seed_name] [S.seed.seed_noun].")
	lastproduce = 0
	seed = S.seed //Grab the seed datum.
	dead = FALSE
	age = 1

	//Snowflakey, maybe move this to the seed datum
	health = (istype(S, /obj/item/seeds/cutting) ? round(seed.get_trait(TRAIT_ENDURANCE)/rand(2,5)) : seed.get_trait(TRAIT_ENDURANCE))
	lastcycle = world.time

	var/needed_skill = seed.mysterious ? SKILL_ADEPT : SKILL_BASIC
	if (prob(user.skill_fail_chance(SKILL_BOTANY, 40, needed_skill)))
		dead = TRUE
		health = 0

	qdel(S)
	check_health()

/obj/machinery/portable_atmospherics/hydroponics/attack_robot(mob/user)
	return FALSE // no hands

/obj/machinery/portable_atmospherics/hydroponics/physical_attack_hand(mob/user)
	if (harvest)
		harvest(user)
		return TRUE
	else if (dead)
		remove_dead(user)
		return TRUE
	else if (operable())
		if (mechanical)
			to_chat(user, SPAN_NOTICE("You take a look at \the [initial(name)]'s status panel..."))
		else
			to_chat(user, SPAN_NOTICE("You closely inspect \the [initial(name)]..."))
		to_chat(user, get_plant_diagnostics(user))

/obj/machinery/portable_atmospherics/hydroponics/examine(mob/user)
	. = ..(user)
	if (!seed)
		to_chat(user, "\The [src] is empty.")
		return

	to_chat(user, SPAN_NOTICE("\An [seed.display_name] plant is growing here."))

	if (user.skill_check(SKILL_BOTANY, SKILL_BASIC))
		if (weedlevel >= 5)
			to_chat(user, SPAN_DANGER("\The [src] is infested with weeds!"))
		if (pestlevel >= 5)
			to_chat(user, SPAN_DANGER("\The [src] is infested with tiny worms!"))

		if (dead)
			to_chat(user, SPAN_DANGER("\The [seed.display_name] plant is dead."))
		else if (health <= (seed.get_trait(TRAIT_ENDURANCE)/ 2))
			to_chat(user, SPAN_WARNING("The [seed.display_name] plant looks unhealthy."))
	else if (seed || weedlevel >= 5)
		to_chat(user, "There's something growing here, but you don't know anything more about it.")

	if (mechanical && Adjacent(user))
		var/turf/T = loc
		var/datum/gas_mixture/environment

		if (closed_system && (connected_port || holding))
			environment = air_contents

		if (!environment)
			if (istype(T))
				environment = T.return_air()

		if (!environment) //We're in a crate or nullspace, bail out.
			return

		var/light_string
		if (closed_system && mechanical)
			light_string = "that the internal lights are set to [tray_light] lumens"
		else
			var/light_available = T.get_lumcount() * 5
			light_string = "a light level of [light_available] lumens"

		to_chat(user, "Water: [round(waterlevel, 0.1)]/100")
		to_chat(user, "Nutrients: [round(nutrilevel, 0.1)]/10")
		to_chat(user, "The tray's sensor suite is reporting [light_string] and a temperature of [environment.temperature]K.")

/// Returns a chat string that gives a diagnostic about the contents of this tray and the health of the plant.
/obj/machinery/portable_atmospherics/hydroponics/proc/get_plant_diagnostics(mob/user)
	if (isobserver(user) || !user.skill_check(SKILL_BOTANY, SKILL_BASIC))
		if (mechanical)
			return "\The [src] has a detailed status panel, but you don't know what any of it means."
		else
			return "You can't gauge anything about the state of \the [src]."
	var/list/dat = list()

	// Get info about reagents queued up to be added to the tray
	var/stored_water = 0
	var/stored_nutrients = 0
	for (var/datum/reagent/R in reagents.reagent_list)
		stored_water += R.plant_water * R.volume
		stored_nutrients += R.plant_nutrients * R.volume

	// Get a string representation of weeds and pests
	var/weed_string = "Weed level: <b>"
	var/pest_string = "Pest level: <b>"
	switch (weedlevel)
		if (0 to 1)
			weed_string += "None"
		if (1 to 5)
			weed_string += "Low"
		else
			weed_string += SPAN_DANGER("High")
	switch (pestlevel)
		if (0 to 1)
			pest_string += "None"
		if (1 to 5)
			pest_string += "Low"
		else
			pest_string += SPAN_DANGER("High")
	weed_string += "</b>"
	pest_string += "</b>"

	// Simple stuff about the seeds
	if (!seed)
		dat += "No seeds planted."
	else
		dat += "This [initial(name)] is growing <b>[seed.display_name]</b>."

	// For hydroponics trays or master botanists, obtain a detailed readout including exact numbers for health, water, nutrients, and so on
	if (mechanical || user.skill_check(SKILL_BOTANY, SKILL_PROF))
		if (seed)
			if (!dead)
				dat += "Plant health: <b>[health]/[seed.get_trait(TRAIT_ENDURANCE)]</b>"
			else
				dat += "Plant health: [SPAN_DANGER("DEAD")]"
		dat += "Water level: <b>[waterlevel]/100</b>"
		dat += "Nutrient level: <b>[nutrilevel]/10</b>"
		dat += weed_string
		dat += pest_string
		dat += "There is <b>[stored_water] units</b> of water and <b>[stored_nutrients] units</b> of nutrients soaking into the plant."

	// Simple trays (like soil patches) just give a rough representation of how things appear
	else
		if (seed)
			if (!dead)
				dat += "Plant health: <b>[health >= seed.get_trait(TRAIT_ENDURANCE) / 2 ? "Healthy" : SPAN_DANGER("Unhealthy")]</b>"
			else
				dat += "Plant health: [SPAN_DANGER("DEAD")]"
		dat += "Water level: <b>[waterlevel > 10 ? "High" : SPAN_DANGER("Low")]</b>"
		dat += "Nutrient level: <b>[nutrilevel > 2 ? "High" : SPAN_DANGER("Low")]</b>"
		dat += weed_string
		dat += pest_string
		dat += "The soil is <b>[stored_water + stored_nutrients > 1 ? "damp" : "dry"]</b>."

	return jointext(dat, "<br>")

/obj/machinery/portable_atmospherics/hydroponics/verb/close_lid_verb()
	set name = "Toggle Tray Lid"
	set category = "Object"
	set src in view(1)
	if (usr.incapacitated())
		return

	if (ishuman(usr) || istype(usr, /mob/living/silicon/robot))
		close_lid(usr)
	return

/obj/machinery/portable_atmospherics/hydroponics/proc/close_lid(mob/living/user)
	closed_system = !closed_system
	to_chat(user, SPAN_NOTICE("You [closed_system ? "close" : "open"] the tray's lid."))
	update_icon()

//proc for trays to spawn pre-planted
/obj/machinery/portable_atmospherics/hydroponics/proc/plant()
	var/obj/item/seeds/S = locate() in get_turf(src)
	seed = S.seed
	lastproduce = 0
	dead = FALSE
	age = 1
	health = (istype(S, /obj/item/seeds/cutting) ? round(seed.get_trait(TRAIT_ENDURANCE)/rand(2,5)) : seed.get_trait(TRAIT_ENDURANCE))
	lastcycle = world.time
	qdel(S)
	check_health()

/obj/machinery/portable_atmospherics/hydroponics/do_simple_ranged_interaction(mob/user)
	if (dead)
		remove_dead()
	else if (harvest)
		harvest()
	return TRUE
