/datum/job/squad_leader
	title = "Squad Leader"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commanding Officer"
	selection_color = "#ff3300"
	minimal_player_age = 1
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/exploration/squad_leader
	allowed_branches = list(
		/datum/mil_branch/marine_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/mc/e7
	)
	min_skill = list(	SKILL_BUREAUCRACY	= SKILL_BASIC,
						SKILL_EVA			= SKILL_TRAINED,
						SKILL_SCIENCE		= SKILL_TRAINED,
						SKILL_PILOT			= SKILL_BASIC,
						SKILL_WEAPONS		= SKILL_TRAINED)

	max_skill = list(	SKILL_PILOT		= SKILL_MAX,
						SKILL_SCIENCE	= SKILL_MAX,
						SKILL_COMBAT	= SKILL_EXPERIENCED,
						SKILL_WEAPONS	= SKILL_MASTER)
	skill_points = 26

	access = list(
		access_squad_leader, access_marine, access_eva, access_maint_tunnels, access_bridge, access_emergency_storage,
		access_guppy_helm, access_terragov_crew, access_expedition_shuttle, access_expedition_shuttle_helm,
		access_guppy, access_hangar, access_stardust, access_stardust_helm,
		access_tox, access_tox_storage, access_research,
		access_xenobiology, access_xenoarch, access_terra_fax, access_radio_comm, access_radio_exp, access_radio_sci
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/squad_leader/get_description_blurb()
	return "You are the Marine Corps Squad Leader. Your duty is to organize and lead the expeditions to away sites, securing planets worthy of colonization, purging the area of hostile lifeforms in the process."

/datum/job/marine
	title = "Marine"
	department = "Exploration"
	department_flag = EXP
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Squad Leader and Commanding Officer"
	selection_color = "#ff3300"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 22
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/exploration/marine
	allowed_branches = list(
		/datum/mil_branch/marine_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/mc/e1,
		/datum/mil_rank/mc/e2,
		/datum/mil_rank/mc/e3,
		/datum/mil_rank/mc/e4
	)
	min_skill = list(	SKILL_EVA		= SKILL_BASIC,
						SKILL_WEAPONS	= SKILL_TRAINED)

	max_skill = list(	SKILL_PILOT		= SKILL_MAX,
						SKILL_SCIENCE	= SKILL_MAX,
						SKILL_COMBAT	= SKILL_EXPERIENCED,
						SKILL_WEAPONS	= SKILL_EXPERIENCED)

	access = list(
		access_marine, access_maint_tunnels, access_eva, access_emergency_storage,
		access_guppy_helm, access_terragov_crew, access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar,
		access_stardust, access_research, access_radio_exp
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/marine/get_description_blurb()
	return "You are a Marine. Your duty is to go on expeditions to away sites. You report directly to your Squad Leader and Commanding Officer. Your primary goal is securing the sector, clearing it from the hostile lifeforms and recovering anything of economic/scientific value to TerraGov. You will most likely encounter hazardous environments, aggressive wildlife or malfunctioning defense systems, so tread carefully."
