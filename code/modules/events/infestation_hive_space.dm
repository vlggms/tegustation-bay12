// Nothing more than a far more lazy copy of carp migration
// Used exclusively by infestation hive overmap obstacle
/datum/event/infestation_hive_space
	var/mobs_per_tick = 1
	/// Types of mobs that we can spawn in and throw at the ship, mostly flying types
	var/list/available_mob_types = list(/mob/living/simple_animal/hostile/infestation/floatfly)

/datum/event/infestation_hive_space/announce()
	var/announcement = ""
	if(severity > EVENT_LEVEL_MODERATE)
		announcement = "A massive migration of unknown biological entities has been detected in the vicinity of the [location_name()]. Exercise external operations with caution."
	else
		announcement = "A large migration of unknown biological entities has been detected in the vicinity of the [location_name()]. Caution is advised."

	command_announcement.Announce(announcement, "[location_name()] Sensor Array", zlevels = affecting_z)

/datum/event/infestation_hive_space/tick()
	SpawnMobs()

/datum/event/infestation_hive_space/proc/SpawnMobs(dir, speed)
	if(!living_observers_present(affecting_z))
		return

	var/Z = pick(affecting_z)
	if(!dir)
		dir = pick(GLOB.cardinal)

	if(!speed)
		speed = rand(1, 6)

	for(var/i = 1 to mobs_per_tick)
		var/turf/T = get_random_edge_turf(dir,TRANSITIONEDGE + 2, Z)
		if(istype(T, /turf/space))
			var/mob/living/simple_animal/hostile/M = pick(available_mob_types)
			M = new M(T)
			M.throw_at(get_random_edge_turf(GLOB.reverse_dir[dir], TRANSITIONEDGE + 2, Z), 250, speed, callback = CALLBACK(src, /datum/event/infestation_hive_space/proc/check_gib,M))

/datum/event/infestation_hive_space/proc/check_gib(mob/living/L)
	if(L.health <= 15)
		L.gib()
