#include "rebel_colony_jobs.dm"
#include "rebel_colony_radio.dm"

/datum/map_template/ruin/exoplanet/rebel_colony
	name = "rebel colony"
	id = "rebel_colony"
	description = "a recently established Terran colony meant to operate as a prison world. Contact with its supervisor was lost few weeks ago."
	suffixes = list("playablecolony_rebel/colony_rebel.dmm")
	spawn_cost = 3
	player_cost = 5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS
	ruin_tags = RUIN_HUMAN|RUIN_HABITAT
	ban_ruins = list(/datum/map_template/ruin/exoplanet/playablecolony, /datum/map_template/ruin/exoplanet/playablecolony2)
	apc_test_exempt_areas = list(
		/area/map_template/rebel_colony = NO_SCRUBBER|NO_VENT
	)
	spawn_weight = 0.15

/decl/submap_archetype/rebel_colony
	descriptor = "rebel colony"
	crew_jobs = list(
		/datum/job/submap/rebel_colonist_leader,
		/datum/job/submap/rebel_colonist,
		/datum/job/submap/rebel_hostage
	)

/datum/submap/rebel_colony/sync_cell(obj/effect/overmap/visitable/cell)
	cell.has_distress_beacon = name

/* Access */
/var/const/access_rebelcolony = "ACCESS_REBELCOLONY"
/datum/access/rebel_colony
	id = access_rebelcolony
	desc = "Rebel Colony"
	region = ACCESS_REGION_NONE

/var/const/access_rebelcolony_security = "ACCESS_REBELCOLONY_SECURITY"
/datum/access/rebel_colony_security
	id = access_rebelcolony_security
	desc = "Rebel Colony Security"
	region = ACCESS_REGION_NONE

/var/const/access_rebelcolony_command = "ACCESS_REBELCOLONY_COMMAND"
/datum/access/rebel_colony_command
	id = access_rebelcolony_command
	desc = "Rebel Colony Command"
	region = ACCESS_REGION_NONE

/obj/item/card/id/rebel_colony
	name = "identification card"
	desc = "An identification card used by Terran colonists."
	access = list(access_rebelcolony)

/obj/item/card/id/rebel_colony/security
	desc = "An identification card used by Terran colonists. This one is issued to security personnel."
	detail_color = "#e00000"
	access = list(access_rebelcolony, access_rebelcolony_security)

/obj/item/card/id/rebel_colony/captain
	desc = "An identification card used by Terran colonists. This one belonged to the colony overseer."
	detail_color = "#d4c780"
	extra_details = list("goldstripe")
	access = list(access_rebelcolony, access_rebelcolony_security, access_rebelcolony_command)

/* Landmarks */

/obj/effect/submap_landmark/spawnpoint/rebel_colonist_spawn
	name = "Rebel Colonist"

/obj/effect/submap_landmark/spawnpoint/rebel_colonist_leader_spawn
	name = "Rebel Leader"

/obj/effect/submap_landmark/spawnpoint/rebel_hostage_spawn
	name = "Rebel Colony Hostage"

/obj/effect/submap_landmark/joinable_submap/rebel_colony
	name = "Rebel Colony"
	archetype = /decl/submap_archetype/rebel_colony
	submap_datum_type = /datum/submap/rebel_colony

/* Areas */

/area/map_template/rebel_colony
	name = "\improper Colony Hallways"
	icon_state = "halls"
	icon = 'maps/random_ruins/exoplanet_ruins/playablecolony/colony.dmi'
	req_access = list(access_rebelcolony)

// Engineering
/area/map_template/rebel_colony/engineering
	name = "\improper Colony Engineering"
	icon_state = "processing"

/area/map_template/rebel_colony/atmospherics
	name = "\improper Colony Atmospherics"
	icon_state = "shipping"

/area/map_template/rebel_colony/tcomms
	name = "\improper Colony Secure Storage"
	icon_state = "C"

// Security
/area/map_template/rebel_colony/security
	name = "\improper Colony Security"
	icon_state = "A"
	req_access = list(access_rebelcolony_security)

// Medical
/area/map_template/rebel_colony/medbay
	name = "\improper Colony Hospital"
	icon_state = "D"

/area/map_template/rebel_colony/surgery
	name = "\improper Colony Operating Theatre"
	icon_state = "F"

// Crew areas
/area/map_template/rebel_colony/dorms
	name = "\improper Colony Dormitories"
	icon_state = "A"

/area/map_template/rebel_colony/commons
	name = "\improper Colony Common Area"
	icon_state = "B"

/area/map_template/rebel_colony/messhall
	name = "\improper Colony Mess Hall"
	icon_state = "C"

// Misc
/area/map_template/rebel_colony/mineralprocessing
	name = "\improper Colony Mining Bay"
	icon_state = "A"

/area/map_template/rebel_colony/command
	name = "\improper Colony Operations Center"
	icon_state = "B"
	req_access = list(access_rebelcolony_command)
