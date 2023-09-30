/* Jobs */
/datum/job/submap/rebel_colonist
	title = "Rebel Colonist"
	info = "You are a rebel on the newly built colony. \n\
			For whatever reason, you and your comrades chose to stand up against the colony's authority and security forces.\n\
			This quick endeavour of yours, however, was most likely not left unnoticed, as the last survivor took off to the command center \
			and sent a distress signal. They were now taken hostage and may serve as a valuable asset in assuring your life and freedom.\n\n\
			<b>Make sure to listen to what your leader has to say, but you are not required to follow all of their orders. You answer to yourself only.</b>"
	total_positions = 3
	outfit_type = /decl/hierarchy/outfit/job/rebel_colonist
	is_semi_antagonist = TRUE
	skill_points = 16
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_BASIC,
		SKILL_FINANCE = SKILL_BASIC,
		SKILL_EVA = SKILL_BASIC,
		SKILL_MECH = SKILL_BASIC,
		SKILL_PILOT = SKILL_BASIC,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_BOTANY = SKILL_TRAINED,
		SKILL_COOKING = SKILL_EXPERIENCED,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED,
		SKILL_FORENSICS = SKILL_BASIC,
		SKILL_CONSTRUCTION = SKILL_EXPERIENCED,
		SKILL_ELECTRICAL = SKILL_TRAINED,
		SKILL_ATMOS = SKILL_TRAINED,
		SKILL_ENGINES = SKILL_TRAINED,
		SKILL_DEVICES = SKILL_TRAINED,
		SKILL_SCIENCE = SKILL_TRAINED,
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_TRAINED
	)

/datum/job/submap/rebel_colonist_leader
	title = "Rebel Leader"
	info = "You are the leader of rebels on the newly built colony. \
			You initiated the rebellion for reasons known only to yourself. The security forces quickly fell apart as you advanced, \
			but the last survivor of command structure managed to send a distress signal before being restrained.\n\
			Finding yourself in such a situation, you decide to take them hostage to ensure your life and freedom, as \
			the government reinforcements could be arriving at any moment now.\n\n\
			<b>The other rebels have their own motives and do not have to follow all your orders, so make your moves wisely.\n\
			You may choose to betray your team entirely, but be prepared for them to do the same when the marines land on the planet.</b>"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/rebel_colonist/leader
	is_semi_antagonist = TRUE
	skill_points = 20
	min_skill = list(
		SKILL_HAULING = SKILL_TRAINED,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED
	)
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED,
		SKILL_FINANCE = SKILL_EXPERIENCED,
		SKILL_EVA = SKILL_TRAINED,
		SKILL_MECH = SKILL_BASIC,
		SKILL_PILOT = SKILL_TRAINED,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_TRAINED,
		SKILL_BOTANY = SKILL_TRAINED,
		SKILL_COOKING = SKILL_EXPERIENCED,
		SKILL_COMBAT = SKILL_EXPERIENCED,
		SKILL_WEAPONS = SKILL_EXPERIENCED,
		SKILL_FORENSICS = SKILL_TRAINED,
		SKILL_CONSTRUCTION = SKILL_EXPERIENCED,
		SKILL_ELECTRICAL = SKILL_TRAINED,
		SKILL_ATMOS = SKILL_TRAINED,
		SKILL_ENGINES = SKILL_TRAINED,
		SKILL_DEVICES = SKILL_TRAINED,
		SKILL_SCIENCE = SKILL_TRAINED,
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_TRAINED
	)

/datum/job/submap/rebel_hostage
	title = "Rebel Colony Hostage"
	total_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/rebel_hostage
	min_skill = list(
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED,
		SKILL_FINANCE = SKILL_EXPERIENCED
	)
	max_skill = list(
		SKILL_EVA = SKILL_TRAINED,
		SKILL_PILOT = SKILL_TRAINED,
		SKILL_COMPUTER = SKILL_TRAINED,
		SKILL_BOTANY = SKILL_TRAINED,
		SKILL_COOKING = SKILL_TRAINED,
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED,
		SKILL_FORENSICS = SKILL_TRAINED,
		SKILL_CONSTRUCTION = SKILL_TRAINED,
		SKILL_ELECTRICAL = SKILL_TRAINED,
		SKILL_ATMOS = SKILL_TRAINED,
		SKILL_ENGINES = SKILL_TRAINED,
		SKILL_DEVICES = SKILL_TRAINED,
		SKILL_SCIENCE = SKILL_TRAINED,
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_TRAINED
	)

/datum/job/submap/rebel_hostage/get_description_blurb()
	return "You are the last survivor of the uprising on the newly built colony.\n\
			The rebels acted fast, executing all security and command forces. The last thing you remember is\
			sending a distress signal to all nearby ships and then being imprisoned.\n\
			The help is coming soon, you hope. Soon this pitiful rebellion will be put down and you will be saved.\n\n\
			<b>You are loyal to [GLOB.using_map.company_name] and rebels certainly do not trust you.\n\
			You are free to act however you see fit to ensure your own survival.</b>"

/* Outfits */

/decl/hierarchy/outfit/job/rebel_colonist
	name = OUTFIT_JOB_NAME("Rebel Colonist")
	id_pda_assignment = "Colonist"
	id_types = list(/obj/item/card/id/rebel_colony/security)
	pda_type = null
	l_ear = /obj/item/device/radio/headset/map_preset/playablecolony
	uniform = /obj/item/clothing/under/rank/ntwork
	shoes = /obj/item/clothing/shoes/workboots

/decl/hierarchy/outfit/job/rebel_colonist/leader
	name = OUTFIT_JOB_NAME("Rebel Leader")
	id_types = list(/obj/item/card/id/rebel_colony/captain)
	uniform = /obj/item/clothing/under/rank/ntwork/zeng

/decl/hierarchy/outfit/job/rebel_hostage
	name = OUTFIT_JOB_NAME("Rebel Colony Hostage")
	id_pda_assignment = "Command Advisor"
	id_types = null
	pda_type = null
	uniform = /obj/item/clothing/under/suit_jacket/corp/nanotrasen
	shoes = /obj/item/clothing/shoes/dress
