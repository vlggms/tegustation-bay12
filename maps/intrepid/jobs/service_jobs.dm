/datum/job/crew
	title = "Crewman"
	department = "Service"
	department_flag = SRV
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Executive Officer and TerraGov Personnel"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 20
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/service/crewman
	allowed_branches = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/intrepid/crew/service/crewman/fleet,
		/datum/mil_branch/army,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/service/crewman/alien
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e1,
		/datum/mil_rank/ed/e3,
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/army/e1,
		/datum/mil_rank/army/e2,
		/datum/mil_rank/worker/recruit,
		/datum/mil_rank/worker/trained
	)

	access = list(
		access_maint_tunnels, access_emergency_storage
	)

/datum/job/janitor
	title = "Janitor"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Executive Officer"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 20
	alt_titles = list(
		"Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/service/janitor
	allowed_branches = list(
		/datum/mil_branch/exploration_division = /decl/hierarchy/outfit/job/intrepid/crew/service/janitor/ec,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/intrepid/crew/service/janitor/fleet,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/service/janitor/alien
	)
	allowed_ranks = list(
		/datum/mil_rank/ed/e3,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/worker/recruit,
		/datum/mil_rank/worker/trained
	)
	min_skill = list(   SKILL_HAULING = SKILL_BASIC)

	access = list(
		access_maint_tunnels, access_emergency_storage,
		access_janitor
	)

	minimal_access = list()

/datum/job/chef
	title = "Cook"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 18)
	supervisors = "the Executive Officer"
	alt_titles = list(
		"Chef",
		"Culinary Specialist"
		)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/crew/service/cook
	allowed_branches = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/intrepid/crew/service/cook/fleet,
		/datum/mil_branch/worker = /decl/hierarchy/outfit/job/intrepid/crew/service/cook/alien
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/worker/trained,
		/datum/mil_rank/worker/professional
	)
	min_skill = list(   SKILL_COOKING   = SKILL_TRAINED,
	                    SKILL_BOTANY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_BASIC)

	access = list(
		access_hydroponics, access_kitchen,
		access_bar,
		access_commissary, access_radio_serv
	)

	minimal_access = list()
