// This event spawns a "Leaviathan" - giant abomination overmap "obstacle";
// As long as it is alive - the sector will be constantly flooded with infestation hive overmap obstacles,
// which operate similar to carp schools.
// When ship approaches Leviathan itself - it will be bombarded with abominations and flesh meteors.
// It takes 8 OFD charges to kill it.
/datum/event/leviathan_spawn
	announceWhen = 5
	endWhen = 6

/datum/event/leviathan_spawn/announce()
	command_announcement.Announce(
		"Leviathan class abomination has been spotted within the sector. All civilian personnel is advised to evacuate \
		to the closest safe area immediatelly. \nMilitary responders must contain the threat until it is too late.",
		"[GLOB.using_map.company_name] Infestation Alert",
		'sound/effects/alarm_catastrophe.ogg',
		zlevels = affecting_z,
		)

/datum/event/leviathan_spawn/start()
	var/list/candidate_turfs = block(locate(OVERMAP_EDGE, OVERMAP_EDGE, GLOB.using_map.overmap_z), locate(GLOB.using_map.overmap_size - OVERMAP_EDGE, GLOB.using_map.overmap_size - OVERMAP_EDGE, GLOB.using_map.overmap_z))
	candidate_turfs = where(candidate_turfs, /proc/can_not_locate, /obj/effect/overmap/visitable)
	var/turf/T = pick(candidate_turfs)
	new /obj/effect/temp_visual/ftl(T)
	new /obj/effect/overmap/event/leviathan(T)
