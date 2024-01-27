/datum/map_template/ruin/exoplanet/factory
	name = "Factory"
	id = "factory"
	description = "A factory."
	suffixes = list("factory/factory.dmm")
	spawn_cost = 1
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS|TEMPLATE_FLAG_NO_RUINS
	ruin_tags = RUIN_HUMAN
	apc_test_exempt_areas = list(
		/area/map_template/factory = NO_SCRUBBER|NO_VENT|NO_APC
	)

// Area //
/area/map_template/factory
	name = "\improper Factory"

/area/map_template/factory/entrance
	name = "\improper Factory Entrance/Breakroom"

/area/map_template/factory/office
	name = "\improper Factory Office"

/area/map_template/factory/breakroom
	name = "\improper Factory Atmospherics"
