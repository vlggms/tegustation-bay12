/decl/hierarchy/outfit/job/intrepid/crew/research
	name = OUTFIT_JOB_NAME("Research Assistant - Exploration Division")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/research
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/research)
	pda_type = /obj/item/modular_computer/pda/science
	l_ear = /obj/item/device/radio/headset/research

/decl/hierarchy/outfit/job/intrepid/crew/research/cso
	name = OUTFIT_JOB_NAME("Chief Science Officer - Exploration Division")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/research
	l_ear = /obj/item/device/radio/headset/heads/researchdirector
	id_types = list(/obj/item/card/id/intrepid/silver/research)
	pda_type = /obj/item/modular_computer/pda/heads/rd

/decl/hierarchy/outfit/job/intrepid/crew/research/senior_scientist
	name = OUTFIT_JOB_NAME("Senior Scientist - Exploration Division")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/research
	id_types = list(/obj/item/card/id/intrepid/crew/research/senior_scientist)

/decl/hierarchy/outfit/job/intrepid/crew/research/scientist
	name = OUTFIT_JOB_NAME("Scientist - Exploration Division")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/research
	id_types = list(/obj/item/card/id/intrepid/crew/research/scientist)

/decl/hierarchy/outfit/job/intrepid/passenger/research
	hierarchy_type = /decl/hierarchy/outfit/job/intrepid/passenger/research
	l_ear = /obj/item/device/radio/headset/research

/decl/hierarchy/outfit/job/intrepid/passenger/research/scientist
	name = OUTFIT_JOB_NAME("Scientist")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/science
	id_types = list(/obj/item/card/id/intrepid/passenger/research/scientist)

/decl/hierarchy/outfit/job/intrepid/passenger/research/scientist/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/intrepid/passenger/research/assist
	name = OUTFIT_JOB_NAME("Research Assistant")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/science
	id_types = list(/obj/item/card/id/intrepid/passenger/research)

/decl/hierarchy/outfit/job/intrepid/passenger/research/assist/testsubject
	name = OUTFIT_JOB_NAME("Testing Assistant")
	uniform = /obj/item/clothing/under/rank/ntwork

/decl/hierarchy/outfit/job/intrepid/passenger/research/assist/terragov
	name = OUTFIT_JOB_NAME("Research Assistant")
	head = /obj/item/clothing/head/beret/terragov/research

/decl/hierarchy/outfit/job/intrepid/passenger/research/scientist/terragov
	name = OUTFIT_JOB_NAME("Scientist")
	head = /obj/item/clothing/head/beret/terragov/research

/decl/hierarchy/outfit/job/intrepid/passenger/research/assist/janitor
	name = OUTFIT_JOB_NAME("Custodian")
	uniform = /obj/item/clothing/under/rank/janitor
