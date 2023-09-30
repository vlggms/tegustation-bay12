// Creates a bunch of wormholes on overmap, which get deleted later
/datum/event/wormhole_spawn
	announceWhen = 1
	endWhen = 180
	var/list/spawned_wormholes = list()
	var/wormhole_count = 10

/datum/event/wormhole_spawn/announce()
	command_announcement.Announce(
		"Attention: Multiple wormhole anomalies have appeared within this sector of space. Traverse carefuly.",
		"[location_name()] Long Range Scanner Update",
		zlevels = affecting_z,
		)

/datum/event/wormhole_spawn/start()
	var/list/candidate_turfs = block(locate(OVERMAP_EDGE, OVERMAP_EDGE, GLOB.using_map.overmap_z), locate(GLOB.using_map.overmap_size - OVERMAP_EDGE, GLOB.using_map.overmap_size - OVERMAP_EDGE, GLOB.using_map.overmap_z))
	candidate_turfs = where(candidate_turfs, /proc/can_not_locate, /obj/effect/overmap)
	for(var/i = 1 to wormhole_count)
		var/turf/T = pick(candidate_turfs)
		new /obj/effect/temp_visual/ftl(T)
		spawned_wormholes += new /obj/effect/overmap/event/wormhole(T)
		candidate_turfs -= T

/datum/event/wormhole_spawn/end()
	for(var/obj/effect/overmap/O in spawned_wormholes)
		animate(O, alpha = (2 SECONDS))
		QDEL_IN(O, (2 SECONDS))
	spawned_wormholes = null
	return ..()
