/datum/job/submap/sol
	title = "SCG Crewman"
	total_positions = 3
	outfit_type = /decl/hierarchy/outfit/job/sol/member
	supervisors = "SCG"
	info = "You are a member of the SCG Fleet serving on a small scouting vessel."
	is_semi_antagonist = TRUE

	branch = /datum/mil_branch/civilian
	rank = /datum/mil_rank/civ/civ
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)

	no_skill_buffs = TRUE
	min_skill = list(
		SKILL_HAULING = SKILL_BASIC,
		SKILL_COMBAT = SKILL_BASIC,
		SKILL_WEAPONS = SKILL_BASIC
	)

	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_TRAINED, // They dumb
		SKILL_FINANCE = SKILL_TRAINED,
		SKILL_EVA = SKILL_MAX,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_TRAINED,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_TRAINED,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_EXPERIENCED,
		SKILL_WEAPONS = SKILL_EXPERIENCED,
		SKILL_FORENSICS = SKILL_TRAINED,
		SKILL_CONSTRUCTION = SKILL_EXPERIENCED,
		SKILL_ELECTRICAL = SKILL_EXPERIENCED,
		SKILL_ATMOS = SKILL_TRAINED,
		SKILL_ENGINES = SKILL_TRAINED,
		SKILL_DEVICES = SKILL_BASIC,
		SKILL_SCIENCE = SKILL_BASIC,
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_BASIC
	)
	skill_points = 20

/datum/job/submap/sol/captain
	title = "SCG Captain"
	total_positions = 1
	info = "You are the Captain of a light SCG corvette part of the SCG Fleet."
	outfit_type = /decl/hierarchy/outfit/job/sol/member/pilot

	min_skill = list(
		SKILL_HAULING = SKILL_BASIC,
		SKILL_EVA = SKILL_TRAINED,
		SKILL_PILOT = SKILL_TRAINED,
		SKILL_COMBAT = SKILL_BASIC,
		SKILL_WEAPONS = SKILL_BASIC
	)

	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_TRAINED,
		SKILL_FINANCE = SKILL_TRAINED,
		SKILL_EVA = SKILL_MAX,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_TRAINED,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_EXPERIENCED,
		SKILL_WEAPONS = SKILL_EXPERIENCED,
		SKILL_FORENSICS = SKILL_TRAINED,
		SKILL_CONSTRUCTION = SKILL_EXPERIENCED,
		SKILL_ELECTRICAL = SKILL_EXPERIENCED,
		SKILL_ATMOS = SKILL_TRAINED,
		SKILL_ENGINES = SKILL_TRAINED,
		SKILL_DEVICES = SKILL_BASIC,
		SKILL_SCIENCE = SKILL_BASIC,
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_BASIC
	)
	skill_points = 18

/datum/job/submap/sol/scientist
	title = "SCG Scientist"
	total_positions = 1
	info = "You are a researcher aboard an SCG vessel tasked with researching."
	outfit_type = /decl/hierarchy/outfit/job/sol/member/scientist

	min_skill = list(
		SKILL_COMPUTER = SKILL_TRAINED,
		SKILL_DEVICES = SKILL_TRAINED,
		SKILL_SCIENCE = SKILL_TRAINED,
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_BASIC
	)

	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED,
		SKILL_FINANCE = SKILL_EXPERIENCED,
		SKILL_EVA = SKILL_EXPERIENCED,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_TRAINED,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED,
		SKILL_FORENSICS = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL = SKILL_MAX,
		SKILL_ATMOS = SKILL_MAX,
		SKILL_ENGINES = SKILL_MAX,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		SKILL_MEDICAL = SKILL_EXPERIENCED,
		SKILL_ANATOMY = SKILL_EXPERIENCED,
		SKILL_CHEMISTRY = SKILL_EXPERIENCED
	)
	skill_points = 22

// Access
/var/const/access_sol_shuttle = "ACCESS_SOL_SHUTTLE"
/datum/access/sol_shuttle
	id = access_sol_shuttle
	desc = "SolGov Cruiser"
	region = ACCESS_REGION_NONE

/obj/item/card/id/sol_shuttle
	access = list(access_sol_shuttle)

// Outfits
/decl/hierarchy/outfit/job/sol
	hierarchy_type = /decl/hierarchy/outfit/job/sol
	l_ear = null
	r_ear = null

// If only we had custom SCG Outfits :(
/decl/hierarchy/outfit/job/sol/member
	name = ("Sol - Job - Crew")
	id_types = list(/obj/item/card/id/sol_shuttle)
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/dutyboots
	r_pocket = /obj/item/device/radio
	l_pocket = /obj/item/crowbar/prybar

/decl/hierarchy/outfit/job/sol/member/pilot
	name = ("Sol - Job - Captain")
	gloves = /obj/item/clothing/gloves/thick

/decl/hierarchy/outfit/job/sol/member/scientist
	name = ("Sol - Job - Scientist")
	gloves = /obj/item/clothing/gloves/latex
	suit = /obj/item/clothing/suit/storage/toggle/labcoat

/obj/effect/submap_landmark/spawnpoint/sol_shuttle
	name = "SCG Crewman"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/sol_shuttle/captain
	name = "SCG Captain"

/obj/effect/submap_landmark/spawnpoint/sol_shuttle/scientist
	name = "SCG Scientist"
