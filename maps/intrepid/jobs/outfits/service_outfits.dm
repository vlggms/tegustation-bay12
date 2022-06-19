/decl/hierarchy/outfit/job/intrepid/crew/service
	l_ear = /obj/item/device/radio/headset/headset_service
	hierarchy_type = /decl/hierarchy/outfit/job/intrepid/crew/service

/decl/hierarchy/outfit/job/intrepid/crew/service/crewman
	name = OUTFIT_JOB_NAME("Crewman")
	uniform = /obj/item/clothing/under/terragov/utility/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew)
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/intrepid/crew/service/crewman/fleet
	name = OUTFIT_JOB_NAME("Crewman - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/service/crewman/alien
	name = OUTFIT_JOB_NAME("Crewman - Alien")
	uniform = /obj/item/clothing/under/terragov/utility
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/alien)

/decl/hierarchy/outfit/job/intrepid/crew/service/janitor
	name = OUTFIT_JOB_NAME("Janitor")
	uniform = /obj/item/clothing/under/rank/janitor
	shoes = /obj/item/clothing/shoes/black
	id_types = list(/obj/item/card/id/intrepid/crew/service/janitor)
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/intrepid/crew/service/janitor/ec
	name = OUTFIT_JOB_NAME("Janitor - Exploration Division")
	uniform = /obj/item/clothing/under/terragov/utility/exploration
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/service/janitor/fleet
	name = OUTFIT_JOB_NAME("Janitor - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/service/janitor/alien
	name = OUTFIT_JOB_NAME("Janitor - Alien")
	uniform = /obj/item/clothing/under/rank/janitor
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/intrepid/crew/service/janitor/alien)

/decl/hierarchy/outfit/job/intrepid/crew/service/cook
	name = OUTFIT_JOB_NAME("Cook")
	uniform = /obj/item/clothing/under/rank/chef
	shoes = /obj/item/clothing/shoes/black
	id_types = list(/obj/item/card/id/intrepid/crew/service/chef)
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/intrepid/crew/service/cook/fleet
	name = OUTFIT_JOB_NAME("Cook - Fleet")
	uniform = /obj/item/clothing/under/terragov/utility/fleet/service
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/intrepid/crew/service/cook/alien
	name = OUTFIT_JOB_NAME("Cook - Alien")
	id_types = list(/obj/item/card/id/intrepid/crew/service/chef/alien)
