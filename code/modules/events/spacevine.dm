/var/global/spacevines_spawned = 0

/datum/event/spacevine
	announceWhen	= 60
	var/area/chosen_area = /area/hallway

/datum/event/spacevine/start()
	spacevine_infestation(area_type = chosen_area)
	spacevines_spawned = 1

/datum/event/spacevine/announce()
	level_seven_announcement()
