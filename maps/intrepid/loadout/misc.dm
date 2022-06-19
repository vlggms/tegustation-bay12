/datum/gear/passport_terran
	display_name = "passports selection"
	description = "A selection of Terran passports."
	path = /obj/item/passport/terran
	flags = GEAR_HAS_SUBTYPE_SELECTION
	custom_setup_proc = /obj/item/passport/proc/set_info
	whitelisted = list(SPECIES_HUMAN)
