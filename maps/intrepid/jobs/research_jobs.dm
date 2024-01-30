/datum/job/senior_scientist
	title = "Senior Researcher"
	department = "Science"
	department_flag = SCI

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Science Officer"
	selection_color = "#633d63"
	economic_power = 12
	minimal_player_age = 3
	minimum_character_age = list(SPECIES_HUMAN = 30)
	alt_titles = list(
		"Research Supervisor")
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/research/senior_scientist
	allowed_branches = list(
		/datum/mil_branch/exploration_division
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/o1
	)

	access = list(
		access_tox, access_tox_storage, access_maint_tunnels, access_research, access_mining_office,
		access_mining_station, access_xenobiology, access_xenoarch, access_terragov_crew,
		access_hangar, access_stardust, access_virology, access_stardust_helm,
		access_terra_fax, access_radio_sci, access_radio_exp, access_chemistry, access_medical
	)

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_TRAINED,
	                    SKILL_SCIENCE     = SKILL_TRAINED)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 20
	possible_goals = list(/datum/goal/achievement/notslimefodder)

	culture_whitelist = list(
		TAG_FACTION = list(
			FACTION_TERRAGOV,
			FACTION_TERRASENATE_UP,
			FACTION_TERRASENATE_PCOH,
			FACTION_TERRASENATE_TCG,
			FACTION_TERRASENATE_TDC,
			FACTION_TERRASENATE_ERC,
			FACTION_SOL_CENTRAL,
			FACTION_ISC,
			FACTION_NANOTRASEN,
			FACTION_CYBERSUN,
			FACTION_FREETRADE,
			FACTION_DAIS,
			FACTION_OTHER,
			),
		)

/datum/job/scientist
	title = "Scientist"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Chief Science Officer"
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 25)
	minimal_player_age = 0
	alt_titles = list(
		"Xenoarcheologist",
		"Anomalist",
		"Researcher",
		"Xenobiologist",
		"Xenobotanist",
		"Virologist"
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_TRAINED)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/research/scientist
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/terragov = /decl/hierarchy/outfit/job/intrepid/crew/research/scientist/terragov,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/research/scientist/alien,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/o1,
		/datum/mil_rank/terragov/scientist,
		/datum/mil_rank/worker/professional,
	)

	access = list(
		access_tox, access_tox_storage, access_research, access_stardust, access_virology, access_stardust_helm,
		access_mining_office, access_mining_station, access_xenobiology,
		access_xenoarch, access_terragov_crew, access_hangar,
		access_terra_fax, access_radio_sci, access_radio_exp, access_chemistry, access_medical
	)

	minimal_access = list()
	skill_points = 20
	possible_goals = list(/datum/goal/achievement/notslimefodder)

	culture_whitelist = list(
		TAG_FACTION = list(
			FACTION_TERRAGOV,
			FACTION_TERRASENATE_UP,
			FACTION_TERRASENATE_PCOH,
			FACTION_TERRASENATE_TCG,
			FACTION_TERRASENATE_TDC,
			FACTION_TERRASENATE_ERC,
			FACTION_SOL_CENTRAL,
			FACTION_ISC,
			FACTION_NANOTRASEN,
			FACTION_CYBERSUN,
			FACTION_FREETRADE,
			FACTION_DAIS,
			FACTION_OTHER,
			),
		)

/datum/job/scientist_assistant
	title = "Research Assistant"
	department = "Science"
	department_flag = SCI
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Chief Science Officer and science personnel"
	selection_color = "#633d63"
	economic_power = 3
	minimum_character_age = list(SPECIES_HUMAN = 18)
	alt_titles = list(
		"Custodian" = /decl/hierarchy/outfit/job/intrepid/passenger/research/assist/janitor,
		"Testing Assistant" = /decl/hierarchy/outfit/job/intrepid/passenger/research/assist/testsubject,
		"Intern",
		"Clerk",
		"Field Assistant")

	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/research
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/terragov
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e3,
		/datum/mil_rank/ed/e5,
		/datum/mil_rank/terragov/scientist = /decl/hierarchy/outfit/job/intrepid/passenger/research/assist/terragov
	)
	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	access = list(
		access_tox, access_tox_storage, access_research, access_stardust,
		access_mining_office, access_mining_station, access_xenobiology,
		access_xenoarch, access_terragov_crew, access_hangar,
		access_radio_sci, access_radio_exp
	)
	possible_goals = list(/datum/goal/achievement/notslimefodder)
