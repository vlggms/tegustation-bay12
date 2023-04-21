/datum/job/assistant
	title = "Passenger"
	total_positions = 12
	spawn_positions = 12
	supervisors = "every officer aboard the ship"
	economic_power = 6
	announced = FALSE
	alt_titles = list(
		"Journalist" = /decl/hierarchy/outfit/job/intrepid/passenger/passenger/journalist,
		"Historian",
		"Botanist",
		"Investor" = /decl/hierarchy/outfit/job/intrepid/passenger/passenger/investor,
		"Psychologist" = /decl/hierarchy/outfit/job/intrepid/passenger/passenger/psychologist,
		"Naturalist",
		"Ecologist",
		"Entertainer",
		"Sociologist",
		"Trainer",
		)
	outfit_type = /decl/hierarchy/outfit/job/intrepid/passenger/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)

/datum/job/assistant/get_description_blurb()
	return "You are the Passenger. \
			<br><hr><br>\
			For whatever personal reasons you had - you are now onboard the border exploration and control ship - \
			TGLV Intrepid. Enjoy your stay however you like, but make sure not to be an issue for the crew. \
			While technically you are not a subordinate to anyone - you are expected to obey all LAWFUL orders \
			issued by the Command and Security members; After all, you are just a civilian."

/datum/job/merchant
	title = "Merchant"
	department = "Civilian"
	department_flag = CIV

	total_positions = 2
	spawn_positions = 2
	availablity_chance = 30
	supervisors = "the invisible hand of the market"
	minimal_player_age = 0
	create_record = 0
	outfit_type = /decl/hierarchy/outfit/job/intrepid/merchant
	allowed_branches = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/alien,
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/alien,
	)
	latejoin_at_spawnpoints = 1
	access = list(access_merchant)
	announced = FALSE
	min_skill = list(   SKILL_FINANCE = SKILL_TRAINED,
	                    SKILL_PILOT	  = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 24
	required_language = null
