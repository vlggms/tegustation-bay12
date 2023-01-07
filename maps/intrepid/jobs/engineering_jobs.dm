/datum/job/senior_engineer
	title = "Senior Engineer"
	department = "Engineering"
	department_flag = ENG

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Chief Engineer"
	selection_color = "#5b4d20"
	economic_power = 7
	minimal_player_age = 3
	minimum_character_age = list(SPECIES_HUMAN = 27)
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/engineering/senior_engineer
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e7,
	)
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_TRAINED,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_TRAINED,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_TRAINED)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 24

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
		access_tcomsat, access_terragov_crew, access_seneng, access_hangar, access_network, access_radio_eng
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/senior_engineer/get_description_blurb()
	return "You are the Senior Engineer. You are a veteran SNCO. \
			<br><hr><br>\
			You are subordinate to the Chief Engineer though you may have many years more experience than them \
			and your subordinates are the rest of engineering. You should be an expert in practically every \
			engineering area and familiar and possess leadership skills. \
			Coordinate the team and ensure the smooth running of the department along with the Chief Engineer."

/datum/job/engineer
	title = "Engineer"
	department = "Engineering"
	department_flag = ENG

	total_positions = 6
	spawn_positions = 6
	supervisors = "the Chief Engineer"
	economic_power = 5
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 19)
	ideal_character_age = 30
	alt_titles = list(
		"Engine Technician",
		"Damage Control Technician",
		"Electrician",
		"Atmospheric Technician",
		)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/engineering/engineer
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/engineering/engineer/alien,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e3,
		/datum/mil_rank/ed/e5,
		/datum/mil_rank/worker/trained,
		/datum/mil_rank/worker/professional
	)
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 20

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
		access_terragov_crew, access_hangar, access_radio_eng
	)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/engineer/get_description_blurb()
	return "You are an Engineer. \
			<br><hr><br>\
			You operate under one of many titles and may be highly specialised in a specific area of engineering. \
			You probably have at least a general familiarity with most other areas though this is not expected. \
			You are subordinate to the Senior Engineer and the Chief Engineer and are expected to follow them."

/datum/job/engineer_trainee
	title = "Engineer Trainee"
	department = "Engineering"
	department_flag = ENG

	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Engineer and Engineering Personnel"
	selection_color = "#5b4d20"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 20

	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/engineering/engineer
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e1,
	)

	skill_points = 4
	no_skill_buffs = TRUE

	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_HAULING      = SKILL_TRAINED,
	                    SKILL_EVA          = SKILL_TRAINED,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_TRAINED,
	                    SKILL_ATMOS        = SKILL_TRAINED,
	                    SKILL_ENGINES      = SKILL_TRAINED)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)

	access = list(
		access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_eva, access_tech_storage, access_janitor, access_construction,
		access_hangar, access_radio_eng
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/engineer_trainee/get_description_blurb()
	return "You are an Engineer Trainee. \
			<br><hr><br>\
			You are learning how to operate the various onboard engineering systems from senior engineering staff. \
			You are subordinate to all of the other engineers aboard."

/datum/job/roboticist
	title = "Roboticist"
	department = "Engineering"
	department_flag = ENG|ROB

	total_positions = 2
	spawn_positions = 2
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 25)
	supervisors = "the Chief Engineer."
	selection_color = "#5b4d20"
	economic_power = 6
	alt_titles = list(
		"Mechsuit Technician",
		)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/engineering/roboticisted
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/engineering/roboticistalien,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e5,
		/datum/mil_rank/worker/trained,
		/datum/mil_rank/worker/professional,
	)
	min_skill = list(   SKILL_COMPUTER		= SKILL_TRAINED,
	                    SKILL_DEVICES		= SKILL_TRAINED,
	                    SKILL_EVA           = SKILL_TRAINED,
	                    SKILL_ANATOMY       = SKILL_TRAINED,
						SKILL_CONSTRUCTION  = SKILL_BASIC,
						SKILL_ELECTRICAL    = SKILL_BASIC,
	                    SKILL_MECH          = HAS_PERK)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_EXPERIENCED,
	                    SKILL_ENGINES      = SKILL_EXPERIENCED,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_MEDICAL      = SKILL_EXPERIENCED,
	                    SKILL_ANATOMY      = SKILL_EXPERIENCED)
	skill_points = 20

	access = list(
		access_robotics, access_engine, access_radio_eng
	)

	minimal_access = list()

/datum/job/roboticist/get_description_blurb()
	return "You are the Roboticist. \
			<br><hr><br>\
			You are responsible for repairing, upgrading and handling ship synthetics (like robots). \
			You are also responsible for the production of exosuits(mechs) and bots for various departments. \
			You answer to the Chief Engineer."
