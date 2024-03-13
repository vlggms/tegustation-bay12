/decl/hierarchy/outfit/job/intrepid/crew/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/intrepid/crew/engineering
	l_ear = /obj/item/device/radio/headset/headset_eng
	pda_slot = slot_l_store
	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/intrepid/crew/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/intrepid/crew/engineering/senior_engineer
	name = OUTFIT_JOB_NAME("Senior Engineer")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/engineering/senior)
	pda_type = /obj/item/modular_computer/pda/heads/ce

/decl/hierarchy/outfit/job/intrepid/crew/engineering/senior_engineer/fleet
	name = OUTFIT_JOB_NAME("Senior Engineer - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/engineering/engineer
	name = OUTFIT_JOB_NAME("Engineer - Intrepid")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/engineering)
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/intrepid/crew/engineering/engineer/fleet
	name = OUTFIT_JOB_NAME("Engineer - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/engineering/engineer/alien
	name = OUTFIT_JOB_NAME("Engineer - Alien")
	id_types = list(/obj/item/card/id/intrepid/crew/engineering/alien)

/decl/hierarchy/outfit/job/intrepid/crew/engineering/roboticisted
	name = OUTFIT_JOB_NAME("Roboticist - Intrepid")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/contractor/engineering/roboticist)
	pda_type = /obj/item/modular_computer/pda/roboticist

/decl/hierarchy/outfit/job/intrepid/crew/engineering/roboticistfleet
	name = OUTFIT_JOB_NAME("Roboticist - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/engineering
	id_types = list(/obj/item/card/id/intrepid/contractor/engineering/roboticist)
	shoes = /obj/item/clothing/shoes/dutyboots
	pda_type = /obj/item/modular_computer/pda/roboticist

/decl/hierarchy/outfit/job/intrepid/crew/engineering/roboticistalien
	name = OUTFIT_JOB_NAME("Roboticist - Alien")
	uniform = /obj/item/clothing/under/rank/roboticist
	shoes = /obj/item/clothing/shoes/black
	id_types = list(/obj/item/card/id/intrepid/contractor/engineering/roboticist/alien)
	pda_type = /obj/item/modular_computer/pda/roboticist
