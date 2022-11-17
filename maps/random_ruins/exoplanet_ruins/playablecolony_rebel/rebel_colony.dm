#include "rebel_colony_radio.dm"

/datum/map_template/ruin/exoplanet/rebel_colony
	name = "rebel colony"
	id = "rebel_colony"
	description = "a recently established Terran colony meant to operate as a prison world. Contact with its supervisor was lost few weeks ago."
	suffixes = list("playablecolony_rebel/colony_rebel.dmm")
	spawn_cost = 3
	player_cost = 4
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS
	ruin_tags = RUIN_HUMAN|RUIN_HABITAT
	ban_ruins = list(/datum/map_template/ruin/exoplanet/playablecolony, /datum/map_template/ruin/exoplanet/playablecolony2)
	apc_test_exempt_areas = list(
		/area/map_template/rebel_colony/EDIT_ME = NO_SCRUBBER|NO_VENT
	)
	spawn_weight = 0.15

/decl/submap_archetype/rebel_colony
	descriptor = "rebel colony"
	crew_jobs = list(
		/datum/job/submap/rebel_colonist_leader,
		/datum/job/submap/rebel_colonist,
		/datum/job/submap/rebel_hostage
	)

/* Jobs */

/datum/job/submap/rebel_colonist
	title = "Rebel Colonist"
	info = "You are a rebel on the newly built colony. \
			For whatever reason, you and your comrades chose to stand up against the colony's authority and security forces."
	total_positions = 4
	outfit_type = /decl/hierarchy/outfit/job/rebel_colonist
	is_semi_antagonist = TRUE
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_BASIC,
		SKILL_FINANCE = SKILL_BASIC,
		SKILL_EVA = SKILL_BASIC,
		SKILL_MECH = SKILL_BASIC,
		SKILL_PILOT = SKILL_BASIC,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_BOTANY = SKILL_TRAINED,
		SKILL_COOKING = SKILL_EXPERIENCED,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED,
		SKILL_FORENSICS = SKILL_BASIC,
		SKILL_CONSTRUCTION = SKILL_EXPERIENCED,
		SKILL_ELECTRICAL = SKILL_TRAINED,
		SKILL_ATMOS = SKILL_TRAINED,
		SKILL_ENGINES = SKILL_TRAINED,
		SKILL_DEVICES = SKILL_TRAINED,
		SKILL_SCIENCE = SKILL_TRAINED,
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_TRAINED
	)

/datum/job/submap/rebel_colonist_leader
	title = "Rebel Leader"
	info = "You are the leader of rebels on the newly built colony. \
			You initiated the rebellion for reasons unknown to others and now you have to make sure it prospers."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/rebel_colonist/leader
	is_semi_antagonist = TRUE
	skill_points = 24
	min_skill = list(
		SKILL_HAULING = SKILL_TRAINED,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED
	)
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED,
		SKILL_FINANCE = SKILL_EXPERIENCED,
		SKILL_EVA = SKILL_TRAINED,
		SKILL_MECH = SKILL_BASIC,
		SKILL_PILOT = SKILL_TRAINED,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_TRAINED,
		SKILL_BOTANY = SKILL_TRAINED,
		SKILL_COOKING = SKILL_EXPERIENCED,
		SKILL_COMBAT = SKILL_EXPERIENCED,
		SKILL_WEAPONS = SKILL_EXPERIENCED,
		SKILL_FORENSICS = SKILL_TRIANED,
		SKILL_CONSTRUCTION = SKILL_EXPERIENCED,
		SKILL_ELECTRICAL = SKILL_TRAINED,
		SKILL_ATMOS = SKILL_TRAINED,
		SKILL_ENGINES = SKILL_TRAINED,
		SKILL_DEVICES = SKILL_TRAINED,
		SKILL_SCIENCE = SKILL_TRAINED,
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_TRAINED
	)

/datum/job/submap/rebel_hostage
	title = "Captured Colony Administrator"
	info = "You are the colony administrator that was captured by rebel forces."
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/rebel_hostage
	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED,
		SKILL_FINANCE = SKILL_EXPERIENCED
	)

/* Access */
/var/const/access_rebelcolony = "ACCESS_REBELCOLONY"
/datum/access/rebel_colony
	id = access_rebelcolony
	desc = "Rebel Colony"
	region = ACCESS_REGION_NONE

/obj/item/card/id/voxship
	access = list(access_rebelcolony)

/* Outfits */

/decl/hierarchy/outfit/job/rebel_colonist
	name = OUTFIT_JOB_NAME("Rebel Colonist")
	hierarchy_type = /decl/hierarchy/outfit/job/rebel_colonist
	id_types = null
	pda_type = null
	l_ear = /obj/item/device/radio/headset/map_preset/playablecolony
	uniform = /obj/item/clothing/under/rank/ntwork
	shoes = /obj/item/clothing/shoes/workboots

/decl/hierarchy/outfit/job/rebel_colonist/leader
	name = OUTFIT_JOB_NAME("Rebel Leader")
	uniform = /obj/item/clothing/under/rank/ntwork/zeng

/decl/hierarchy/outfit/job/rebel_hostage
	name = OUTFIT_JOB_NAME("Captured Colony Administrator")
	id_types = null
	pda_type = null
	uniform = /obj/item/clothing/under/suit_jacket/corp/nanotrasen
	shoes = /obj/item/clothing/shoes/dress

/* Landmarks */

/obj/effect/submap_landmark/spawnpoint/rebel_colonist_spawn
	name = "Rebel Colonist"

/obj/effect/submap_landmark/spawnpoint/rebel_colonist_leader_spawn
	name = "Rebel Leader"

/obj/effect/submap_landmark/spawnpoint/rebel_hostage_spawn
	name = "Captured Colony Administrator"

/obj/effect/submap_landmark/joinable_submap/rebel_colony
	name = "Rebel Colony"
	archetype = /decl/submap_archetype/rebel_colony

/* Areas */

/area/map_template/rebel_colony
	name = "\improper Colony Hallways"
	icon_state = "halls"
	icon = 'maps/random_ruins/exoplanet_ruins/playablecolony/colony.dmi'

/area/map_template/rebel_colony/engineering
	name = "\improper Colony Engineering"
	icon_state = "processing"

/area/map_template/rebel_colony/atmospherics
	name = "\improper Colony Atmospherics"
	icon_state = "shipping"

/area/map_template/rebel_colony/bathroom
	name = "\improper Colony Lavatory"
	icon_state = "shower"

/area/map_template/rebel_colony/commons
	name = "\improper Colony Common Area"
	icon_state = "A"

/area/map_template/rebel_colony/messhall
	name = "\improper Colony Mess Hall"
	icon_state = "B"

/area/map_template/rebel_colony/tcomms
	name = "\improper Colony Secure Storage"
	icon_state = "C"

/area/map_template/rebel_colony/jail
	name = "\improper Colony Jail"
	icon_state = "D"

/area/map_template/rebel_colony/armory
	name = "\improper Colony Armory"
	icon_state = "F"

/area/map_template/rebel_colony/hydroponics
	name = "\improper Colony Hydroponics Bay"
	icon_state = "X"

/area/map_template/rebel_colony/airlock
	name = "\improper Colony Primary External Airlock"
	icon_state = "airlock"

/area/map_template/rebel_colony/medbay
	name = "\improper Colony Hospital"
	icon_state = "D"

/area/map_template/rebel_colony/surgery
	name = "\improper Colony Operating Theatre"
	icon_state = "F"

/area/map_template/rebel_colony/mineralprocessing
	name = "\improper Colony Mining Bay"
	icon_state = "A"

/area/map_template/rebel_colony/command
	name = "\improper Colony Operations Center"
	icon_state = "B"

/area/map_template/rebel_colony/dorms
	name = "\improper Colony Dormitories"
	icon_state = "C"
