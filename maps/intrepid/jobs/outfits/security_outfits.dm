/decl/hierarchy/outfit/job/intrepid/crew/security
	hierarchy_type = /decl/hierarchy/outfit/job/intrepid/crew/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/torch/crew/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/intrepid/crew/security/brig_chief
	name = OUTFIT_JOB_NAME("Brig Chief")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/security/brigchief)
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/intrepid/crew/security/brig_chief/fleet
	name = OUTFIT_JOB_NAME("Brig Chief - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/security/forensic_tech
	name = OUTFIT_JOB_NAME("Forensic Technician")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/security/forensic)
	pda_type = /obj/item/modular_computer/pda/forensics

/decl/hierarchy/outfit/job/intrepid/crew/security/forensic_tech/fleet
	name = OUTFIT_JOB_NAME("Forensic Technician - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/security/forensic_tech/agent
	name = OUTFIT_JOB_NAME("Forensic Technician - TG Agent")
	uniform = /obj/item/clothing/under/det/grey
	suit = /obj/item/clothing/suit/storage/toggle/agent_jacket
	shoes = /obj/item/clothing/shoes/dress

/decl/hierarchy/outfit/job/intrepid/crew/security/officer
	name = OUTFIT_JOB_NAME("Security Officer")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/security)
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/intrepid/crew/security/officer/fleet
	name = OUTFIT_JOB_NAME("Security Officer - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/security
	shoes = /obj/item/clothing/shoes/dutyboots
