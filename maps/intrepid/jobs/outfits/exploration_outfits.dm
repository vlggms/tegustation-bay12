decl/hierarchy/outfit/job/intrepid/crew/exploration/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/explorer
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/explorer
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/explorer

/decl/hierarchy/outfit/job/intrepid/crew/exploration/squad_leader
	name = OUTFIT_JOB_NAME("Squad Leader")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/squad_leader)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/squad_leader

/decl/hierarchy/outfit/job/intrepid/crew/exploration/marine
	name = OUTFIT_JOB_NAME("Marine")
	uniform = /obj/item/clothing/under/terragov/utility/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/marine)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/exploration

/decl/hierarchy/outfit/job/intrepid/crew/exploration/marine/medic
	name = OUTFIT_JOB_NAME("Combat Medic") // Note to self: Move all that stuff to specialized lockers later
	gloves = /obj/item/clothing/gloves/latex
	belt = /obj/item/storage/belt/medical
	backpack_contents = list(
						/obj/item/storage/firstaid/combat = 1,
						/obj/item/storage/firstaid/regular = 1,
						/obj/item/device/scanner/health = 1,
						)

/decl/hierarchy/outfit/job/intrepid/crew/exploration/marine/engineer
	name = OUTFIT_JOB_NAME("Combat Engineer")
	gloves = /obj/item/clothing/gloves/insulated
	belt = /obj/item/storage/belt/utility/full
	backpack_contents = list(
						/obj/item/device/multitool = 1,
						/obj/item/clothing/glasses/welding/superior = 1,
						)
