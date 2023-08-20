/datum/job/submap/obs
	title = "OBS Member"
	total_positions = 3
	outfit_type = /decl/hierarchy/outfit/job/obs/member
	supervisors = "the order"
	info = "You are one of the many TRUE humans that inhabit the universe. You and your comrades managed to find an operating \
	corvette with little resistance and now it is time to find some use for it. While technically all of you are equal, it would \
	be wise to listen to what researcher has to say on the matter, as they will be the one to acquire the means of liberating \
	humanity..."
	whitelisted_species = list(SPECIES_HUMAN)
	blacklisted_species = null
	is_semi_antagonist = TRUE

	branch = /datum/mil_branch/obs
	rank = null
	allowed_branches = list(/datum/mil_branch/obs)
	allowed_ranks = list(
		/datum/mil_rank/obs/initiate,
		/datum/mil_rank/obs/acolyte,
		)

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

/datum/job/submap/obs/pilot
	title = "OBS Pilot"
	total_positions = 1
	info = "You are the pilot aboard \"Independent\" Light Corvette. Navigate the team wherever they need to and assist the \
	scientist."
	outfit_type = /decl/hierarchy/outfit/job/obs/member/pilot

	allowed_ranks = list(
		/datum/mil_rank/obs/socius,
		)

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

/datum/job/submap/obs/scientist
	title = "OBS Researcher"
	total_positions = 1
	info = "You are the researcher of your group. By whatever means available to you, you had enough time to acquire knowledge \
	about medicine, general science and engineering. Your main goal is developing a weapon of mass destruction and assissting \
	the group in the process."
	outfit_type = /decl/hierarchy/outfit/job/obs/member/scientist


	allowed_ranks = list(
		/datum/mil_rank/obs/inquisitor,
		)

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
/var/const/access_obs_shuttle = "ACCESS_OBS_SHUTTLE"
/datum/access/obs_shuttle
	id = access_obs_shuttle
	desc = "Independent Light Corvette"
	region = ACCESS_REGION_NONE

/obj/item/card/id/obs_shuttle
	access = list(access_obs_shuttle)

// Outfits
/decl/hierarchy/outfit/job/obs
	hierarchy_type = /decl/hierarchy/outfit/job/obs
	l_ear = null
	r_ear = null

/decl/hierarchy/outfit/job/obs/member
	name = ("OBS - Job - Crew")
	id_types = list(/obj/item/card/id/obs_shuttle)
	uniform = /obj/item/clothing/under/syndicate/terragov
	shoes = /obj/item/clothing/shoes/dutyboots
	r_pocket = /obj/item/device/radio
	l_pocket = /obj/item/crowbar/prybar

/decl/hierarchy/outfit/job/obs/member/pilot
	name = ("OBS - Job - Pilot")
	glasses = /obj/item/clothing/glasses/tacgoggles
	gloves = /obj/item/clothing/gloves/thick
	suit = /obj/item/clothing/suit/storage/vest/tactical

/decl/hierarchy/outfit/job/obs/member/scientist
	name = ("OBS - Job - Researcher")
	gloves = /obj/item/clothing/gloves/latex
	suit = /obj/item/clothing/suit/storage/toggle/labcoat

/obj/effect/submap_landmark/spawnpoint/obs_shuttle
	name = "OBS Member"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/submap_landmark/spawnpoint/obs_shuttle/pilot
	name = "OBS Pilot"

/obj/effect/submap_landmark/spawnpoint/obs_shuttle/scientist
	name = "OBS Researcher"
