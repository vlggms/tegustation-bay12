/datum/event/blob
	announceWhen	= 12

	var/obj/effect/blob/core/Blob
	var/list/allowed_areas = list(/area/maintenance)

/datum/event/blob/announce()
	level_seven_announcement()

/datum/event/blob/start()
	var/list/possible_turfs = list()
	if(!allowed_areas.len)
		log_and_message_admins("Blob has no allowed areas.")
		kill()
		return
	for(var/ar in allowed_areas)
		var/turf/PT = get_subarea_turfs(ar, list(/proc/is_station_turf, /proc/not_turf_contains_dense_objects))
		possible_turfs += PT
	var/turf/T = null
	if(possible_turfs.len)
		T = pick(possible_turfs)
	if(!T)
		log_and_message_admins("Blob failed to find a viable turf.")
		kill()
		return

	log_and_message_admins("Blob spawned in \the [get_area(T)]", location = T)
	Blob = new /obj/effect/blob/core(T)
	for(var/i = 1; i < rand(3, 4), i++)
		Blob.Process()

/datum/event/blob/tick()
	if(!Blob || !Blob.loc)
		Blob = null
		kill()
		return
	if(IsMultiple(activeFor, 3))
		Blob.Process()
