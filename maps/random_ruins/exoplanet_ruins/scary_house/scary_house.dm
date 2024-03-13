/datum/map_template/ruin/exoplanet/scary_house
	name = "scary house"
	id = "scary_house"
	description = "Spooky house."
	suffixes = list("scary_house/scary_house.dmm")
	spawn_cost = 0.5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS|TEMPLATE_FLAG_NO_RUINS
	ruin_tags = RUIN_HUMAN
	apc_test_exempt_areas = list(
		/area/map_template/scary_house_1 = NO_SCRUBBER|NO_VENT,
		/area/map_template/scary_house_2 = NO_SCRUBBER|NO_VENT|NO_APC
	)

// Area //
/area/map_template/scary_house_1
	name = "\improper House"

/area/map_template/scary_house_2
	name = "\improper Shed"
