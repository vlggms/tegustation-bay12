/datum/job/captain
	title = "Commanding Officer"
	supervisors = "the Terran Government and the Terran Constitution"
	minimal_player_age = 14
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 40)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/command/CO
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o7
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_TRAINED,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "You are the Commanding Officer. You are the top dog. \
			<br><hr><br>\
			You are an experienced professional officer in control of an entire ship, \
			and ultimately responsible for all that happens onboard. Your job is to make sure \
			[GLOB.using_map.full_name] fulfils its space exploration mission. \
			Delegate to your Executive Officer and your department heads to effectively manage the ship, \
			and listen to and trust their expertise."

/datum/job/captain/post_equip_rank(var/mob/person, var/alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("All hands, [alt_title || title] [person.real_name] on deck!", new_sound = announce_sound)
	..()

/datum/job/hop
	title = "Executive Officer"
	supervisors = "the Commanding Officer"
	department = "Command"
	department_flag = COM
	minimal_player_age = 14
	economic_power = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/command/XO
	allowed_branches = list(
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/intrepid/crew/command/XO/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o4
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers, access_heads, access_medical, access_morgue, access_tox, access_tox_storage,
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_chapel_office, access_tech_storage,
		access_atmospherics, access_bar, access_janitor, access_crematorium, access_kitchen, access_robotics, access_cargo, access_construction,
		access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo,
		access_qm, access_network, access_surgery, access_research, access_mining, access_mining_office, access_mailsorting, access_heads_vault,
		access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_gateway, access_sec_doors, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
		access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_terragov_crew,
		access_emergency_armory, access_sec_guard, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_senadv,
		access_marine, access_squad_leader, access_pilot, access_commissary, access_stardust, access_stardust_helm,
		access_rd, access_terra_fax, access_intrepid_helm,
		access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec, access_radio_sup, access_radio_serv, access_radio_exp, access_radio_sci
	)

	minimal_access = list(
		access_security, access_brig, access_armory, access_forensics_lockers, access_heads, access_medical, access_morgue, access_tox, access_tox_storage,
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_chapel_office, access_tech_storage,
		access_atmospherics, access_bar, access_janitor, access_crematorium, access_kitchen, access_robotics, access_cargo, access_construction,
		access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo,
		access_qm, access_network, access_surgery, access_research, access_mining, access_mining_office, access_mailsorting, access_heads_vault,
		access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_gateway, access_sec_doors, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
		access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_terragov_crew,
		access_emergency_armory, access_sec_guard, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_senadv,
		access_marine, access_squad_leader, access_pilot, access_commissary, access_stardust, access_stardust_helm,
		access_rd, access_terra_fax, access_intrepid_helm,
		access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec, access_radio_sup, access_radio_serv, access_radio_exp, access_radio_sci
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hop/get_description_blurb()
	return "You are the Executive Officer. You are an experienced senior officer, second in command of the ship \
			and right hand of the Commanding Officer.\
			<br><hr><br>\
			You are responsible for the smooth operation of the ship under your Commanding Officer. \
			In their absence, you are expected to take their place. Your primary duty is directly managing \
			department heads and all those outside a department heading. You are also responsible for the \
			contractors and passengers aboard the ship. Consider the Bridge Officers tools at your disposal."

/datum/job/rd
	title = "Chief Science Officer"
	supervisors = "the Commanding Officer and the Executive Officer"
	economic_power = 12
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/research/cso
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/o3,
	)

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_TRAINED,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_TRAINED)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge, access_rd,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_stardust, access_stardust_helm, access_guppy_helm,
		access_squad_leader, access_marine, access_eva, access_terragov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_maint_tunnels, access_terra_fax, access_radio_comm,
		access_radio_sci, access_radio_exp, access_medical, access_chemistry
	)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/aidiag,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/rd/get_description_blurb()
	return "You are the Chief Science Officer. \
			<br><hr><br>\
			You are responsible for the research department. You handle the science aspects of the project \
			and liase with the corporate interests of the Expeditionary Corps Organisation. \
			Make sure science gets done, do some yourself, and get your scientists on away missions to \
			find things to benefit the project. Advise the CO on science matters."

/datum/job/cmo
	title = "Chief Medical Officer"
	supervisors = "the Commanding Officer and the Executive Officer"
	economic_power = 14
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/command/cmo
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/o3,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_EXPERIENCED,
	                    SKILL_ANATOMY     = SKILL_EXPERIENCED,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
						SKILL_DEVICES     = SKILL_TRAINED)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 26

	access = list(
		access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_heads,
		access_chapel_office, access_crematorium, access_chemistry, access_virology, access_aquila,
		access_cmo, access_surgery, access_RC_announce, access_keycard_auth, access_psychiatrist,
		access_medical_equip, access_terragov_crew, access_senmed, access_hangar, access_terra_fax, access_radio_comm,
		access_radio_med
	)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/cmo/get_description_blurb()
	return "You are the Chief Medical Officer. \
			<br><hr><br>\
			You manage the medical department. You ensure all members of medical are skilled, tasked and \
			handling their duties. Ensure your doctors are staffing your infirmary and your \
			corpsman/paramedics are ready for response. Act as a second surgeon or backup pharmacist in the \
			absence of either. You are expected to know medical very well, along with general regulations."

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "the Commanding Officer and the Executive Officer"
	economic_power = 12
	minimum_character_age = list(SPECIES_HUMAN = 27)
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/command/chief_engineer
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/intrepid/crew/command/chief_engineer/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/o3,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3
	)
	min_skill = list(   SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_TRAINED,
	                    SKILL_EVA          = SKILL_TRAINED,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_TRAINED,
	                    SKILL_ATMOS        = SKILL_TRAINED,
	                    SKILL_ENGINES      = SKILL_EXPERIENCED)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 30

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
		access_tech_storage, access_robotics, access_atmospherics, access_janitor, access_construction,
		access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_terragov_crew, access_aquila, access_seneng, access_hangar, access_terra_fax, access_intrepid_helm, access_radio_comm,
		access_radio_eng
		)


	minimal_access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
		access_tech_storage, access_atmospherics, access_janitor, access_construction,
		access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_terragov_crew, access_seneng, access_hangar, access_robotics, access_terra_fax, access_intrepid_helm, access_radio_comm,
		access_radio_eng
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports)

/datum/job/chief_engineer/get_description_blurb()
	return "You are the Chief Engineer. \
			<br><hr><br>\
			You manage the Engineering Department. You are responsible for the Senior Engineer, \
			who is your right hand and (should be) an experienced, skilled engineer. \
			Delegate to and listen to them. Manage your engineers, ensure vessel power stays on, \
			breaches are patched and problems are fixed. Advise the CO on engineering matters. \
			You are also responsible for the maintenance and control of any vessel synthetics. \
			You are an experienced engineer with a wealth of theoretical knowledge. \
			You should also know vessel regulations to a reasonable degree."

/datum/job/hos
	title = "Chief of Security"
	supervisors = "the Commanding Officer and the Executive Officer"
	economic_power = 10
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 25)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/command/cos
	allowed_branches = list(
		/datum/mil_branch/military_police,
	)
	allowed_ranks = list(
		/datum/mil_rank/military_police/o1,
		/datum/mil_rank/military_police/o3
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_TRAINED,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 28

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers,
		access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_heads, access_aquila,
		access_hos, access_RC_announce, access_keycard_auth, access_sec_doors,
		access_terragov_crew, access_gun, access_emergency_armory, access_hangar, access_terra_fax,
		access_radio_comm, access_radio_sec
	)

	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hos/get_description_blurb()
	return "You are the Chief of Security. \
			<br><hr><br>\
			You manage ship security and entirety of military police force aboard it: \
			The Security Officers/Troopers, Brig Chief and the Detective. You keep the vessel safe. \
			You handle both internal and external security matters. You are the law. \
			You are expected to know the constitution, \
			Terran law and Alert Procedure to a very high degree along with general regulations. \
			You are subordinate to the CO and the XO, but your only true loyalty is for the Terran Government, \
			its people and their wellbeing."

/datum/job/representative
	title = "Terran Senator"
	department = "Support"
	department_flag = SPT

	total_positions = 1
	spawn_positions = 1
	supervisors = "the Terran Constitution and your chosen faction within the senate"
	selection_color = "#2f2f7f"
	economic_power = 16
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/representative
	allowed_branches = list(/datum/mil_branch/terragov)
	allowed_ranks = list(/datum/mil_rank/terragov/gov)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_FINANCE     = SKILL_EXPERIENCED)
	skill_points = 20
	minimum_character_age = list(SPECIES_HUMAN = 28)

	access = list(
		access_representative, access_security, access_medical,
		access_bridge, access_cargo, access_terragov_crew,
		access_hangar, access_terra_fax, access_radio_comm
	)

	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/representative/get_description_blurb()
	return "You are the Terran Senator. \
			<br><hr><br>\
			You are one of the many senators that resign in Terran Senate. \
			You have been assigned to oversee the exploration mission of this vessel. \
			You are also responsible for monitoring for any serious missteps of justice, \
			Terran constituion or other ethical and legal issues aboard, informing and advising \
			the Commanding Officer on them. You are also responsible for furthering the vision of your chosen \
			senate faction. \
			<br><hr><br>\
			You are NOT a subbordinate of any officers aboard the ship, but you are expected to obey all LAWFUL \
			orders issued to you. \
			Your only true loyalty is for the Terran Government and especially the faction you are a part of. \
			Do not be afraid to further your own agenda if it is ensuring success of your faction."

/datum/job/bridgeofficer
	title = "Bridge Officer"
	department = "Support"
	department_flag = SPT

	total_positions = 3
	spawn_positions = 3
	supervisors = "the Commanding Officer and heads of staff"
	selection_color = "#2f2f7f"
	minimal_player_age = 0
	economic_power = 8
	minimum_character_age = list(SPECIES_HUMAN = 22)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/command/bridgeofficer
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/intrepid/crew/command/bridgeofficer/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/o1,
		/datum/mil_rank/fleet/o1
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 20


	access = list(
		access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
		access_bridge, access_janitor, access_kitchen, access_cargo, access_mailsorting, access_RC_announce, access_keycard_auth,
		access_terragov_crew, access_aquila, access_aquila_helm, access_guppy, access_guppy_helm, access_external_airlocks,
		access_eva, access_hangar, access_cent_creed, access_marine, access_expedition_shuttle, access_expedition_shuttle_helm, access_teleporter,
		access_terra_fax, access_intrepid_helm, access_radio_comm, access_radio_eng, access_radio_exp, access_radio_serv, access_radio_sci, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/bridgeofficer/get_description_blurb()
	return "You are a Bridge Officer. \
			<br><hr><br>\
			You are a very junior officer. You do not give orders of your own. You are subordinate to all of \
			command. You handle matters on the bridge and report directly to the CO and XO. \
			You take the Intrepid's helm and pilot the dropships if needed. You monitor bridge computer programs \
			and communications and report relevant information to command."

/datum/job/psiadvisor
	title = "Psionic Advisor"
	department = "Support"
	department_flag = SPT

	selection_color = "#2f2f7f"
	total_positions = 1
	spawn_positions = 1
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 28)
	minimal_player_age = 7
	supervisors = "the Commanding Officer"
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/command/psiadvisor
	allowed_branches = list(/datum/mil_branch/terragov)
	allowed_ranks = list(/datum/mil_rank/terragov/psiadvisor)
	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED,
		SKILL_FINANCE = SKILL_TRAINED,
		SKILL_MEDICAL = SKILL_BASIC
	)
	max_skill = list(
		SKILL_COMBAT  = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED
	)
	skill_points = 20
	access = list(access_psiadvisor, access_security, access_medical, access_engine, access_maint_tunnels, access_external_airlocks,
				access_eva, access_bridge, access_cargo, access_RC_announce, access_terragov_crew, access_hangar)
	minimal_access = list()
	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/records
	)

/datum/job/psiadvisor/equip(mob/living/carbon/human/H)
	psi_faculties = list("[PSI_REDACTION]" = PSI_RANK_OPERANT, "[PSI_COERCION]" = PSI_RANK_OPERANT, "[PSI_PSYCHOKINESIS]" = PSI_RANK_OPERANT, "[PSI_ENERGISTICS]" = PSI_RANK_OPERANT)
	return ..()

/datum/job/psiadvisor/get_description_blurb()
	return "You are the Psionic Advisor. \
			<br><hr><br>\
			You are psionically awakened, and you are the first and only exposure most of the crew will \
			have to the mentally gifted. Your main responsibility is advising the Commanding Officer on \
			psionic matters, and helping freshly awakened psions discover and control their abilities, and \
			overseeing them, or suppress it if they wish to do so. You must report any violent psions to the \
			appropriate personnel to take care of them. Avoid direct confrontation with them as much as possible."
