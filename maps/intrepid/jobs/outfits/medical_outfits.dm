/decl/hierarchy/outfit/job/intrepid/crew/medical
	hierarchy_type = /decl/hierarchy/outfit/job/intrepid/crew/medical
	l_ear = /obj/item/device/radio/headset/headset_med
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/intrepid/crew/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/intrepid/crew/medical/senior
	name = OUTFIT_JOB_NAME("Physician")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/medical/senior)

/decl/hierarchy/outfit/job/intrepid/crew/medical/senior/fleet
	name = OUTFIT_JOB_NAME("Physician - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/medical/contractor/senior
	name = OUTFIT_JOB_NAME("Physician - Contractor")
	id_types = list(/obj/item/card/id/intrepid/contractor/medical/senior)

/decl/hierarchy/outfit/job/intrepid/crew/medical/doctor
	name = OUTFIT_JOB_NAME("Medical Technician")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/medical)
	l_ear = /obj/item/device/radio/headset/headset_corpsman

/decl/hierarchy/outfit/job/intrepid/crew/medical/doctor/fleet
	name = OUTFIT_JOB_NAME("Medical Technician - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/headset_corpsman

/decl/hierarchy/outfit/job/intrepid/crew/medical/contractor
	name = OUTFIT_JOB_NAME("Medical Technician - Contractor")
	uniform = /obj/item/clothing/under/rank/medical
	shoes = /obj/item/clothing/shoes/white
	id_types = list(/obj/item/card/id/intrepid/contractor/medical)

/decl/hierarchy/outfit/job/intrepid/crew/medical/contractor/mortus
	name = OUTFIT_JOB_NAME("Mortician")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black

/decl/hierarchy/outfit/job/intrepid/crew/medical/contractor/paramedic
	name = OUTFIT_JOB_NAME("Paramedic")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/intrepid/crew/medical/contractor/chemist
	name = OUTFIT_JOB_NAME("Chemist")
	uniform = /obj/item/clothing/under/rank/chemist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/chemistry
	id_types = list(/obj/item/card/id/intrepid/contractor/chemist)

/decl/hierarchy/outfit/job/intrepid/crew/medical/contractor/chemist/New()
	..()
	BACKPACK_OVERRIDE_CHEMISTRY

/decl/hierarchy/outfit/job/intrepid/crew/medical/contractor/chemist/alien
	name = OUTFIT_JOB_NAME("Chemist")
	id_types = list(/obj/item/card/id/intrepid/contractor/chemist/alien)

/decl/hierarchy/outfit/job/intrepid/crew/medical/counselor
	name = OUTFIT_JOB_NAME("Counselor")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
	shoes = /obj/item/clothing/shoes/white
	id_types = list(
		/obj/item/card/id/intrepid/contractor/medical/counselor,
		/obj/item/card/id/foundation_civilian)

/decl/hierarchy/outfit/job/intrepid/crew/medical/counselor/ed
	name = OUTFIT_JOB_NAME("Counselor - Exploration Division")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/medical/counselor/fleet
	name = OUTFIT_JOB_NAME("Counselor - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots
