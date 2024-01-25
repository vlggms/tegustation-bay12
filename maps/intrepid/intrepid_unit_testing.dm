/datum/map/intrepid
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/escape = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/merchant = NO_SCRUBBER|NO_APC,
		/area/shuttle/research = 0,
		/area/shuttle/escape_pod1/station = NO_SCRUBBER|NO_APC|NO_VENT,
		/area/shuttle/escape_pod2/station = NO_SCRUBBER|NO_APC|NO_VENT,
		/area/shuttle/escape_pod3/station = NO_SCRUBBER|NO_APC|NO_VENT,
		/area/turbolift/marine/lift = NO_SCRUBBER|NO_APC|NO_VENT,
		/area/turbolift/intrepidcargo/lift = NO_SCRUBBER|NO_APC|NO_VENT,
		/area/turbolift/port/lift = NO_SCRUBBER|NO_APC|NO_VENT,
		/area/turbolift/starboard/lift = NO_SCRUBBER|NO_APC|NO_VENT,
		/area/intrepid/misc/maint = NO_SCRUBBER|NO_VENT,
		/area/shuttle/ambulance/home = NO_SCRUBBER|NO_VENT,
		/area/shuttle/pithos/cargo = NO_SCRUBBER|NO_VENT,
		/area/shuttle/research/maint = NO_SCRUBBER|NO_VENT,
		/area/intrepid/department/command/AI/AICore = NO_SCRUBBER|NO_VENT,
		/area/intrepid/department/command/AI/AIFoyer = NO_SCRUBBER|NO_VENT,
		/area/intrepid/department/command/obstructionfielddisperser = NO_SCRUBBER|NO_VENT,
		/area/intrepid/department/engineering/construction = NO_SCRUBBER|NO_VENT,
	)
	area_coherency_test_exempted_root_areas = list(
		/area/space,
		/area/exoplanet,
	)
