/decl/hierarchy/outfit/job/intrepid/crew/exploration
	name = OUTFIT_JOB_NAME("Intrepid Marine Outfit")

/decl/hierarchy/outfit/job/intrepid/crew/exploration/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/marine
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/marine
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/marine

/decl/hierarchy/outfit/job/intrepid/crew/exploration/squad_leader
	name = OUTFIT_JOB_NAME("Squad Leader")
	uniform = /obj/item/clothing/under/terragov/utility/exploration/officer
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/squad_leader)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/squad_leader

/decl/hierarchy/outfit/job/intrepid/crew/exploration/combat_medic
	name = OUTFIT_JOB_NAME("Combat Medic")
	uniform = /obj/item/clothing/under/terragov/utility/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/combat_medic)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/exploration

/decl/hierarchy/outfit/job/intrepid/crew/exploration/combat_engineer
	name = OUTFIT_JOB_NAME("Combat Engineer")
	uniform = /obj/item/clothing/under/terragov/utility/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/combat_engineer)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/exploration

/decl/hierarchy/outfit/job/intrepid/crew/exploration/marine
	name = OUTFIT_JOB_NAME("Marine")
	uniform = /obj/item/clothing/under/terragov/utility/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/marine)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/exploration
