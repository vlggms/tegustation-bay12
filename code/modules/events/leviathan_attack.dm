// Sends you to fucking hell for daring to enter this sector, or for being too slow
// Bombards the ship with beams that may damage the ship and cause breaches
// Additionally, spawns hearts of the hive directly on the ship
/datum/event/leviathan_attack
	has_skybox_image = TRUE
	var/beams_per_tick = 1
	// Checks against world.time, not event ticks
	var/infestation_spawn_cooldown
	var/infestation_spawn_cooldown_time = 60 SECONDS
	/// How many random mobs are spawned around heart of the hive on activation
	var/infestation_spawn_count = 5
	/// Types of mobs = chance the infestation spawn will create; It utilizes pickweight
	var/list/infestation_spawn_types = list(
		/mob/living/simple_animal/hostile/infestation/larva = 30,
		/mob/living/simple_animal/hostile/infestation/broodling = 15,
		/mob/living/simple_animal/hostile/infestation/floatfly = 10,
		/mob/living/simple_animal/hostile/infestation/eviscerator = 6,
		/mob/living/simple_animal/hostile/infestation/spitter = 5,
		/mob/living/simple_animal/hostile/infestation/assembler = 3,
		/mob/living/simple_animal/hostile/infestation/rhino = 1,
		/mob/living/simple_animal/hostile/infestation/larva/implant/implanter = 1,
		)

/datum/event/leviathan_attack/get_skybox_image()
	var/image/res = overlay_image('icons/skybox/ionbox.dmi', "ions", COLOR_MAROON, RESET_COLOR)
	res.blend_mode = BLEND_ADD
	return res

/datum/event/leviathan_attack/announce()
	command_announcement.Announce(
		"DANGER! [location_name()] is currently in close vicinity to Leviathan-class abomination!\n\
		It is advised to immediately leave the area before damage to the ship reaches critical level!",
		"[GLOB.using_map.company_name] Infestation Alert",
		zlevels = affecting_z,
		)

/datum/event/leviathan_attack/tick()
	BeamAttack()
	if(world.time >= infestation_spawn_cooldown)
		InfestationSpawn()

/datum/event/leviathan_attack/proc/BeamAttack()
	if(!living_observers_present(affecting_z))
		return

	var/Z = pick(affecting_z)
	var/dir = pick(GLOB.cardinal)

	for(var/i = 1 to beams_per_tick)
		var/turf/T = get_random_edge_turf(dir, TRANSITIONEDGE + 2, Z)
		if(istype(T, /turf/space))
			var/obj/item/projectile/beam/gigabeam/leviathan/P = new(T)
			P.dispersion += pick(0, 0.1, 0.2)
			P.launch(get_random_edge_turf(GLOB.reverse_dir[dir], TRANSITIONEDGE + 2, Z), pick(BP_ALL_LIMBS), T)

/datum/event/leviathan_attack/proc/InfestationSpawn(turf/T)
	infestation_spawn_cooldown = world.time + infestation_spawn_cooldown_time
	if(!living_observers_present(affecting_z))
		return

	if(!istype(T))
		T = pick_area_turf_in_single_z_level(list(/proc/is_not_space_area), list(/proc/not_turf_contains_dense_objects, /proc/is_not_open_space, /proc/is_not_space_turf), pick(affecting_z))
		return

	new /obj/effect/hive_heart(T)
	new /datum/bubble_effect/infestation(T.x, T.y, T.z, 1, 1)
	var/list/valid_spawns = list()
	for(var/turf/TT in oview(T, 3))
		if(is_space_turf(TT))
			continue
		if(is_open_space(TT))
			continue
		valid_spawns += TT
	for(var/i = 1 to infestation_spawn_count)
		var/mob/living/L = pickweight(infestation_spawn_types)
		var/turf/TT = pick(valid_spawns)
		new L(TT)

/datum/bubble_effect/infestation/New()
	..()
	START_PROCESSING(SSfastprocess, src)

/datum/bubble_effect/infestation/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	return ..()

/datum/bubble_effect/infestation/Process()
	if(radius > 7)
		qdel(src)
		return PROCESS_KILL
	Tick()

/datum/bubble_effect/infestation/TurfEffect(turf/T)
	if(TICK_CHECK)
		return TRUE
	if(T.density)
		return TRUE
	if(prob(33))
		return TRUE
	T.ChangeTurf(/turf/simulated/floor/exoplanet/flesh)
	return TRUE
