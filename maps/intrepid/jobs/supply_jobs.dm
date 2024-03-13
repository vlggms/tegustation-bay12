/datum/job/qm
	title = "Deck Chief"
	department = "Supply"
	department_flag = SUP

	total_positions = 1
	spawn_positions = 1
	selection_color = COLOR_BROWN
	supervisors = "the Executive Officer"
	economic_power = 8
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 24)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/supply/deckofficer
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/intrepid/crew/supply/deckofficer/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e7,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 18

	access = list(
		access_maint_tunnels, access_bridge, access_emergency_storage, access_tech_storage,  access_cargo,
		access_cargo_bot, access_qm, access_mailsorting, access_terragov_crew, access_hangar,
		access_mining, access_mining_office, access_mining_station, access_commissary, access_teleporter, access_eva, access_terra_fax,
		access_radio_sup, access_radio_exp, access_radio_comm,
		access_supplylink_terragov
	)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

	culture_whitelist = list(
		TAG_FACTION = list(
			FACTION_TERRAGOV,
			FACTION_TERRASENATE_UP,
			FACTION_TERRASENATE_PCOH,
			FACTION_TERRASENATE_TCG,
			FACTION_TERRASENATE_TDC,
			FACTION_TERRASENATE_ERC,
			),
		)

/datum/job/cargo_tech
	title = "Deck Technician"
	department = "Supply"
	department_flag = SUP

	total_positions = 3
	spawn_positions = 3
	selection_color = COLOR_BROWN
	supervisors = "the Deck Chief and the Executive Officer"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/supply/tech
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/intrepid/crew/supply/tech/fleet,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/supply/tech/alien
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e3,
		/datum/mil_rank/worker/recruit,
		/datum/mil_rank/worker/trained,
		/datum/mil_rank/worker/professional
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	access = list(
		access_maint_tunnels, access_emergency_storage, access_cargo,
		access_cargo_bot, access_mailsorting, access_terragov_crew,
		access_hangar, access_commissary, access_radio_sup
	)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/mining
	title = "Prospector"
	department = "Supply"
	department_flag = SUP

	total_positions = 2
	spawn_positions = 2
	selection_color = COLOR_BROWN
	supervisors = "the Deck Chief and the Executive Officer"
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 18)
	alt_titles = list(
		"Drill Technician",
		"Shaft Miner",
		"Salvage Technician",
		)
	min_skill = list(   SKILL_HAULING = SKILL_TRAINED,
	                    SKILL_EVA     = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT   = SKILL_MAX)

	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/supply/prospector
	allowed_branches = list(
						/datum/mil_branch/exploration_division,
						/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/supply/prospector/alien
						)
	allowed_ranks = list(
					/datum/mil_rank/ed/e1,
					/datum/mil_rank/ed/e3,
					/datum/mil_rank/ed/e5,
					/datum/mil_rank/worker/recruit,
					/datum/mil_rank/worker/trained,
					/datum/mil_rank/worker/professional
					)

	access = list(
		access_mining, access_mining_office, access_mining_station,
		access_hangar,
		access_terragov_crew, access_eva,
		access_radio_exp, access_radio_sup
	)

	minimal_access = list()
