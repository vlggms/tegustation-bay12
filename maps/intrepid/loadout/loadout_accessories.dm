/datum/gear/accessory/terraawardmajor
	display_name = "terraGov major award selection"
	description = "A medal or ribbon awarded to TerraGov personnel for significant accomplishments."
	path = /obj/item/clothing/accessory
	cost = 8
	allowed_branches = TERRAGOV_BRANCHES

/datum/gear/accessory/terraawardmajor/New()
	..()
	var/terramajors = list()
	terramajors["iron star"] = /obj/item/clothing/accessory/medal/terragov/iron/star
	terramajors["bronze heart"] = /obj/item/clothing/accessory/medal/terragov/bronze/heart
	terramajors["silver sword"] = /obj/item/clothing/accessory/medal/terragov/silver/sword
	terramajors["medical heart"] = /obj/item/clothing/accessory/medal/terragov/heart
	terramajors["valor medal"] = /obj/item/clothing/accessory/medal/terragov/silver/terra
	terramajors["sapienterian medal"] = /obj/item/clothing/accessory/medal/terragov/gold/terra
	terramajors["peacekeeper ribbon"] = /obj/item/clothing/accessory/ribbon/terragov/peace
	terramajors["marksman ribbon"] = /obj/item/clothing/accessory/ribbon/terragov/marksman
	gear_tweaks += new/datum/gear_tweak/path(terramajors)

/datum/gear/accessory/terraawardminor
	display_name = "TerraGov minor award selection"
	description = "A medal or ribbon awarded to TerraGov personnel for minor accomplishments."
	path = /obj/item/clothing/accessory
	cost = 5
	allowed_branches = TERRAGOV_BRANCHES

/datum/gear/accessory/terraawardminor/New()
	..()
	var/terraminors = list()
	terraminors["expeditionary medal"] = /obj/item/clothing/accessory/medal/terragov/iron/terra
	terraminors["operations medal"] = /obj/item/clothing/accessory/medal/terragov/bronze/terra
	terraminors["frontier ribbon"] = /obj/item/clothing/accessory/ribbon/terragov/frontier
	terraminors["instructor ribbon"] = /obj/item/clothing/accessory/ribbon/terragov/instructor
	gear_tweaks += new/datum/gear_tweak/path(terraminors)

/datum/gear/accessory/armband_ofc
	display_name = "security officer brassard"
	path = /obj/item/clothing/accessory/armband/terragov/ofc
	allowed_roles = SECURITY_ROLES

/datum/gear/accessory/armband_mp
	display_name = "military police brassard"
	path = /obj/item/clothing/accessory/armband/terragov/mp
	allowed_branches = list(/datum/mil_branch/military_police)

/datum/gear/accessory/armband_security
	allowed_roles = SECURITY_ROLES

/datum/gear/accessory/armband_cargo
	allowed_roles = SUPPLY_ROLES

/datum/gear/accessory/armband_medical
	allowed_roles = MEDICAL_ROLES

/datum/gear/accessory/armband_emt
	allowed_roles = list(/datum/job/doctor, /datum/job/medical_trainee)

/datum/gear/accessory/armband_corpsman
	display_name = "medical armband"
	path = /obj/item/clothing/accessory/armband/medblue
	allowed_roles = list(/datum/job/cmo, /datum/job/senior_doctor, /datum/job/doctor, /datum/job/medical_trainee)

/datum/gear/accessory/armband_engineering
	allowed_roles = ENGINEERING_ROLES
