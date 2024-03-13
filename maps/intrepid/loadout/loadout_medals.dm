/datum/gear/accessory/terragov_combat_medals
	display_name = "Terran Government veteran award selection"
	description = "A medal awarded to TerraGov military veterans."
	path = /obj/item/clothing/accessory
	cost = 8
	allowed_branches = COMBAT_BRANCHES
	minimum_character_age = list(SPECIES_HUMAN = 55) // Combat veterans  of these events can't be really young

/datum/gear/accessory/terragov_combat_medals/New()
	..()
	var/veteran_medals = list()
	veteran_medals["Terran Independence"] = /obj/item/clothing/accessory/medal/terragov/gold/star/terran_independence
	veteran_medals["Sol front"] = /obj/item/clothing/accessory/medal/terragov/gold/sun/sol_defense
	veteran_medals["Confederation front"] = /obj/item/clothing/accessory/medal/terragov/gold/sword/isc_attack
	gear_tweaks += new /datum/gear_tweak/path(veteran_medals)

/datum/gear/accessory/terragov_major_medals
	display_name = "Terran Government major award selection"
	description = "A medal or ribbon awarded to TerraGov personnel for significant accomplishments."
	path = /obj/item/clothing/accessory
	cost = 8
	allowed_branches = TERRAGOV_BRANCHES

/datum/gear/accessory/terragov_major_medals/New()
	..()
	var/terra_majors = list()
	terra_majors["iron star"] = /obj/item/clothing/accessory/medal/terragov/iron/star
	terra_majors["bronze heart"] = /obj/item/clothing/accessory/medal/terragov/bronze/heart
	terra_majors["silver sword"] = /obj/item/clothing/accessory/medal/terragov/silver/sword
	terra_majors["medical heart"] = /obj/item/clothing/accessory/medal/terragov/heart
	terra_majors["valor medal"] = /obj/item/clothing/accessory/medal/terragov/silver/terra
	terra_majors["terran medal"] = /obj/item/clothing/accessory/medal/terragov/gold/terra
	gear_tweaks += new /datum/gear_tweak/path(terra_majors)

// Bad choice medals :)
/datum/gear/accessory/isc_medals
	display_name = "Independent Space Confederation award selection"
	description = "A medal or ribbon awarded to ISC personnel. Not a lot of people will appreciate you waving it around, however."
	path = /obj/item/clothing/accessory
	cost = 8
	allowed_branches = CIVILIAN_BRANCHES // There's a good chance an ex-soldier from ISC will not be let into the military here

/datum/gear/accessory/isc_medals/New()
	..()
	var/isc_medals = list()
	isc_medals["alliance medal"] = /obj/item/clothing/accessory/medal/terragov/silver/isc
	gear_tweaks += new /datum/gear_tweak/path(isc_medals)
