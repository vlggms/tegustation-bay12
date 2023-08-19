// Ranks of the Imperial remnants

// Imperial commandos - elite light infantry
// They are hand-picked members of marine corps, deployed in a small(6-10 people) tight-knit group;
/datum/mil_branch/imperial_commando
	name = "Imperial Commando Unit"
	name_short = "ICU"
	email_domain = "icu.te"

	rank_types = list(
		/datum/mil_rank/imperial_commando,
		/datum/mil_rank/imperial_commando/engineer,
		/datum/mil_rank/imperial_commando/medic,
		/datum/mil_rank/imperial_commando/leader,
	)

	spawn_rank_types = list(
		/datum/mil_rank/imperial_commando,
		/datum/mil_rank/imperial_commando/engineer,
		/datum/mil_rank/imperial_commando/medic,
		/datum/mil_rank/imperial_commando/leader,
	)

	min_skill = list(
		SKILL_HAULING = SKILL_MASTER,
		SKILL_COMBAT = SKILL_MASTER,
		SKILL_WEAPONS = SKILL_MASTER,
		)

// The ranks
/datum/mil_rank/imperial_commando
	name = "Commando"
	name_short = "CMD"
	sort_order = 1

/datum/mil_rank/imperial_commando/engineer
	name = "Commando Engineer"
	name_short = "CMDCE"
	sort_order = 2

/datum/mil_rank/imperial_commando/medic
	name = "Commando Combat Medic"
	name_short = "CMDCM"
	sort_order = 3

/datum/mil_rank/imperial_commando/leader
	name = "Commando Squad Leader"
	name_short = "CMDSL"
	sort_order = 10
