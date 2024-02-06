/datum/station_trait/disabled_lighting
	name = "Overloaded Lighting"
	trait_type = STATION_TRAIT_NEGATIVE
	weight = 3
	show_in_report = TRUE
	report_message = "The ship has been through a light electrical storm, and as such, some light bulbs might need replacement."

/datum/station_trait/disabled_lighting/on_round_start()
	var/overload_chance = 25 // Every fourth light
	// Low pop will have less broken lights
	if(GLOB.clients < 5)
		overload_chance = 5
	else if(GLOB.clients < 10)
		overload_chance = 15

	for(var/obj/machinery/power/apc/C in SSmachines.machinery)
		if(!C.is_critical && (C.z in GLOB.using_map.station_levels))
			C.overload_lighting(overload_chance)
