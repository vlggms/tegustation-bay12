/datum/map_template/ruin/exoplanet/generic1
	name = "tiny ruin"
	id = "generic1"
	description = "A who knows how old structure with its prior purposse unknown."
	suffixes = list("generic1/generic1.dmm")
	spawn_cost = 0.25
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS|TEMPLATE_FLAG_NO_RUINS
	ruin_tags = RUIN_HUMAN
	apc_test_exempt_areas = list(
		/area/map_template/generic1 = NO_SCRUBBER|NO_VENT|NO_APC
	)

// Area //
/area/map_template/generic1
	name = "\improper Ruins"
