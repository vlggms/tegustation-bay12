/decl/hierarchy/outfit/job/intrepid/passenger/passenger
	name = OUTFIT_JOB_NAME("Passenger")
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_types = list(/obj/item/card/id/intrepid/passenger)

/decl/hierarchy/outfit/job/intrepid/passenger/passenger/psychologist
	name = OUTFIT_JOB_NAME("Passenger")
	uniform = /obj/item/clothing/under/rank/psych/turtleneck
	shoes = /obj/item/clothing/shoes/laceup

/decl/hierarchy/outfit/job/intrepid/passenger/passenger/journalist
	name = OUTFIT_JOB_NAME("Journalist")
	backpack_contents = list(/obj/item/device/camera/tvcamera = 1,
	/obj/item/clothing/accessory/badge/press = 1)

/decl/hierarchy/outfit/job/intrepid/passenger/passenger/investor
	name = OUTFIT_JOB_NAME("Investor")

/decl/hierarchy/outfit/job/intrepid/passenger/passenger/investor/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/storage/secure/briefcase/money/case = new(H.loc)
	H.put_in_hands(case)

/decl/hierarchy/outfit/job/intrepid/merchant
	name = OUTFIT_JOB_NAME("Merchant - Intrepid")
	uniform = /obj/item/clothing/under/color/black
	l_ear = null
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_types = list(/obj/item/card/id/intrepid/merchant)

// ERT
/decl/hierarchy/outfit/job/intrepid/ert
	name = OUTFIT_JOB_NAME("ERT - Torch")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/combat
	head = /obj/item/clothing/head/beret/terragov/fleet
	gloves = /obj/item/clothing/gloves/thick
	id_types = list(/obj/item/card/id/centcom/ERT)
	pda_type = /obj/item/modular_computer/pda/ert
	l_ear = /obj/item/device/radio/headset/ert
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/ert/leader
	name = OUTFIT_JOB_NAME("ERT Leader - Torch")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/combat/command
	head = /obj/item/clothing/head/beret/terragov/fleet/command
