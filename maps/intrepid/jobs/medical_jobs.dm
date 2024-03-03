/datum/job/senior_doctor
	title = "Physician"
	department = "Medical"
	department_flag = MED

	minimal_player_age = 2
	minimum_character_age = list(SPECIES_HUMAN = 29)
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Medical Officer"
	selection_color = "#013d3b"
	economic_power = 10
	alt_titles = list(
		"Surgeon")
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/medical/senior
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/medical/senior/alien,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/o1,
		/datum/mil_rank/worker/professional,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_EXPERIENCED,
	                    SKILL_ANATOMY     = SKILL_EXPERIENCED,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
						SKILL_DEVICES     = SKILL_TRAINED)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 20

	access = list(
		access_medical, access_morgue, access_virology, access_maint_tunnels, access_emergency_storage,
		access_crematorium, access_chemistry, access_surgery,
		access_medical_equip, access_terragov_crew, access_senmed, access_radio_med
	)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

/datum/job/doctor
	title = "Medical Technician"
	total_positions = 3
	spawn_positions = 3
	supervisors = "physicians and the Chief Medical Officer"
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 19)
	minimal_player_age = 0
	alt_titles = list(
		"Paramedic",
		"Corpsman")
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/medical/doctor
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/medical/doctor/alien,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e3,
		/datum/mil_rank/ed/e5,
		/datum/mil_rank/worker/professional,
	)
	min_skill = list(   SKILL_EVA     = SKILL_BASIC,
	                    SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list(
		access_medical, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_surgery, access_medical_equip,
		access_hangar, access_radio_med
	)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	skill_points = 22

/datum/job/medical_trainee
	title = "Trainee Medical Technician"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	supervisors = "medical personnel and the Chief Medical Officer"
	selection_color = "#013d3b"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	alt_titles = list(
		"Corpsman Trainee",
		)

	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/medical/doctor
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e1,
	)

	skill_points = 4
	no_skill_buffs = TRUE

	min_skill = list(   SKILL_EVA     = SKILL_TRAINED,
	                    SKILL_HAULING = SKILL_TRAINED,
	                    SKILL_MEDICAL = SKILL_EXPERIENCED,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list(
		access_medical, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_surgery, access_medical_equip,
		access_radio_med
	)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

/datum/job/medical_trainee/get_description_blurb()
	return "You are a Trainee Medical Technician. \
			<br><hr><br>\
			You are learning how to treat and recover wounded crew from the more experienced medical personnel \
			aboard. You are subordinate to the rest of the medical team."

/datum/job/chemist
	title = "Pharmacist"
	department = "Medical"
	department_flag = MED

	total_positions = 1
	spawn_positions = 1
	supervisors = "physicians and the Chief Medical Officer"
	selection_color = "#013d3b"
	economic_power = 4
	minimum_character_age = list(SPECIES_HUMAN = 25)
	minimal_player_age = 7
	alt_titles = list(
		"Chemist"
	)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/medical/contractor/chemist
	allowed_branches = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/medical/contractor/chemist/alien
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/worker/professional
	)
	min_skill = list(   SKILL_MEDICAL   = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_TRAINED)

	max_skill = list(   SKILL_MEDICAL     = SKILL_BASIC,
						SKILL_ANATOMY	  = SKILL_BASIC,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 16

	access = list(
		access_medical, access_maint_tunnels, access_emergency_storage,
		access_medical_equip, access_chemistry,
	 	access_virology, access_morgue, access_crematorium, access_radio_med
	)

	minimal_access = list()

/datum/job/chemist/get_description_blurb()
	return "You are the Pharmacist. \
			<br><hr><br>\
			You make medicine and other useful substances. You are not a doctor or medic; \
			you should not be treating patients, but rather providing the medicine to do so. \
			You are subordinate to Physicians and Chief Medical Officer."

/datum/job/psychiatrist
	title = "Counselor"
	total_positions = 1
	spawn_positions = 1
	economic_power = 5
	minimum_character_age = list(SPECIES_HUMAN = 24)
	minimal_player_age = 0
	supervisors = "the Chief Medical Officer"
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/medical/counselor
	alt_titles = list(
		"Psychiatrist",
	)

	allowed_branches = list(
		/datum/mil_branch/exploration_division = /decl/hierarchy/outfit/job/intrepid/crew/medical/counselor/ed,
		)
	allowed_ranks = list(
		/datum/mil_rank/ed/e5,
		)
	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_BASIC,
		SKILL_MEDICAL     = SKILL_BASIC
	)
	max_skill = list(
		SKILL_MEDICAL     = SKILL_MAX
	)
	access = list(
		access_medical, access_psychiatrist,
		access_terragov_crew, access_medical_equip, access_radio_med
	)

	minimal_access = list()

	software_on_spawn = list(
		/datum/computer_file/program/suit_sensors,
		/datum/computer_file/program/camera_monitor
	)

/datum/job/psychiatrist/get_description_blurb()
	return "You are the Counselor. \
			<br><hr><br>\
			Your main responsibility is the mental health and wellbeing of the crew. \
			You are subordinate to the Chief Medical Officer."
