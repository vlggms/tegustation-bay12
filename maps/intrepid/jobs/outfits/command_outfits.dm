/decl/hierarchy/outfit/job/intrepid/crew/command
	name = OUTFIT_JOB_NAME("Command Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/intrepid/crew/command
	l_ear = /obj/item/device/radio/headset/headset_com

/decl/hierarchy/outfit/job/intrepid/crew/command/CO
	name = OUTFIT_JOB_NAME("Commanding Officer")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/terran/navy/service/command
	suit = /obj/item/clothing/suit/storage/terran/service/navy/command
	l_ear = /obj/item/device/radio/headset/heads/exec
	shoes = /obj/item/clothing/shoes/terran
	head = /obj/item/clothing/head/terran/navy/service/command
	id_types = list(/obj/item/card/id/intrepid/gold)
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/intrepid/crew/command/CO/New()
	..()
	BACKPACK_OVERRIDE_COMMAND

/decl/hierarchy/outfit/job/intrepid/crew/command/XO
	name = OUTFIT_JOB_NAME("Executive Officer")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/command
	l_ear = /obj/item/device/radio/headset/heads/exec
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/silver)
	pda_type = /obj/item/modular_computer/pda/heads/hop

/decl/hierarchy/outfit/job/intrepid/crew/command/XO/New()
	..()
	BACKPACK_OVERRIDE_COMMAND

/decl/hierarchy/outfit/job/intrepid/crew/command/XO/fleet
	name = OUTFIT_JOB_NAME("Executive Officer - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/command
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/command/cmo
	name = OUTFIT_JOB_NAME("Chief Medical Officer ")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/silver/medical)
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/intrepid/crew/command/cmo/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/intrepid/crew/command/cmo/fleet
	name = OUTFIT_JOB_NAME("Chief Medical Officer - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/command/chief_engineer
	name = OUTFIT_JOB_NAME("Chief Engineer")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/heads/ce
	id_types = list(/obj/item/card/id/intrepid/silver/engineering)
	pda_type = /obj/item/modular_computer/pda/heads/ce
	pda_slot = slot_l_store
	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/intrepid/crew/command/chief_engineer/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/intrepid/crew/command/chief_engineer/fleet
	name = OUTFIT_JOB_NAME("Chief Engineer - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/command/cos
	name = OUTFIT_JOB_NAME("Chief of Security")
	l_ear = /obj/item/device/radio/headset/heads/cos
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/silver/security)
	pda_type = /obj/item/modular_computer/pda/heads/hos

/decl/hierarchy/outfit/job/intrepid/crew/command/cos/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/intrepid/crew/command/cos/fleet
	name = OUTFIT_JOB_NAME("Chief of Security - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/representative
	name = OUTFIT_JOB_NAME("Terran Senator")
	l_ear = /obj/item/device/radio/headset/headset_com
	uniform = /obj/item/clothing/under/terran/navy/service
	suit = /obj/item/clothing/suit/storage/terran/service/navy
	shoes = /obj/item/clothing/shoes/terran
	head = /obj/item/clothing/head/terran/beret/grey
	id_types = list(/obj/item/card/id/intrepid/crew/representative)
	pda_type = /obj/item/modular_computer/pda/heads/paperpusher

/decl/hierarchy/outfit/job/intrepid/crew/command/bridgeofficer
	name = OUTFIT_JOB_NAME("Bridge Officer")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer/command
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/bridgeofficer)
	pda_type = /obj/item/modular_computer/pda/heads
	l_ear = /obj/item/device/radio/headset/bridgeofficer

/decl/hierarchy/outfit/job/intrepid/crew/command/bridgeofficer/fleet
	name = OUTFIT_JOB_NAME("Bridge Officer - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/command
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/command/psiadvisor
	name = OUTFIT_JOB_NAME("Psionic Advisor")
	uniform = /obj/item/clothing/under/det/grey
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/foundation
	gloves = /obj/item/clothing/gloves/white
	shoes = /obj/item/clothing/shoes/dress
	pda_type = /obj/item/modular_computer/pda/heads
	id_types = list(
		/obj/item/card/id/intrepid/crew/psiadvisor,
		/obj/item/card/id/foundation_civilian
		)
