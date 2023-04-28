/obj/item/clothing/head/terragov
	name = "master terragov hat"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')
	siemens_coefficient = 0.9

//Utility
/obj/item/clothing/head/soft/terragov
	name = "\improper Terran Government cap"
	desc = "It's a ballcap in TG colors."
	icon_state = "solsoft"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')

/obj/item/clothing/head/soft/terragov/exploration
	name = "\improper Expeditionary Corps cap"
	desc = "It's a black ballcap bearing the Exploration Division crest."
	icon_state = "expeditionsoft"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_unathi.dmi'
		)

/obj/item/clothing/head/soft/terragov/exploration/co
	name = "\improper Expeditionary Corps captain's cap"
	desc = "It's a black ballcap bearing the Exploration Division crest. The brim has gold trim."
	icon_state = "expeditioncomsoft"

/obj/item/clothing/head/soft/terragov/fleet
	name = "fleet cap"
	desc = "It's a navy blue field cap with the TG Fleet crest in a silver colour."
	icon_state = "fleetsoft"

/obj/item/clothing/head/terragov/utility
	name = "utility cover"
	desc = "An eight-point utility cover."
	icon_state = "greyutility"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	body_parts_covered = 0

/obj/item/clothing/head/terragov/utility/fleet
	name = "fleet utility cover"
	desc = "A navy blue utility cover bearing the crest of the TG Fleet."
	icon_state = "navyutility"

/obj/item/clothing/head/terragov/utility/army
	name = "army utility cover"
	desc = "A green utility cover bearing the crest of the TG Army."
	icon_state = "greenutility"

/obj/item/clothing/head/terragov/utility/army/tan
	name = "tan utility cover"
	desc = "A tan utility cover bearing the crest of the TG Army."
	icon_state = "tanutility"

/obj/item/clothing/head/terragov/utility/army/urban
	name = "urban utility cover"
	desc = "A grey utility cover bearing the crest of the TG Army."
	icon_state = "greyutility"

//Service

/obj/item/clothing/head/terragov/service
	name = "service cover"
	desc = "A service uniform cover."
	icon_state = "greenwheelcap"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet")
	body_parts_covered = 0

/obj/item/clothing/head/terragov/service/exploration
	name = "expeditionary peaked cap"
	desc = "A peaked black uniform cap belonging to the TG Expeditionary Corps."
	icon_state = "ecdresscap"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_unathi.dmi'
		)

/obj/item/clothing/head/terragov/service/exploration/command
	name = "expeditionary officer's peaked cap"
	desc = "A peaked black uniform cap belonging to the TG Expeditionary Corps. This one is trimmed in gold."
	icon_state = "ecdresscap_ofcr"

/obj/item/clothing/head/terragov/service/exploration/captain
	name = "expeditionary captain's peaked cap"
	desc = "A gold-trimmed peaked black uniform cap belonging to a Captain of the TG Expeditionary Corps."
	icon_state = "ecdresscap_capt"

/obj/item/clothing/head/terragov/service/exploration/senior_command
	name = "senior expedition officer's peaked cap"
	desc = "A peaked grey uniform cap belonging to the TG Expeditionary Corps. This one is trimmed in gold and blue."
	icon_state = "greydresscap_senior"

/obj/item/clothing/head/terragov/service/army
	name = "army wheel cover"
	desc = "A green service uniform cover with an TG Army crest."
	icon_state = "greenwheelcap"

/obj/item/clothing/head/terragov/service/army/command
	name = "army officer's wheel cover"
	desc = "A green service uniform cover with an TG Army crest and gold stripe."
	icon_state = "greenwheelcap_com"

/obj/item/clothing/head/terragov/service/army/garrison
	name = "army garrison cap"
	desc = "A green garrison cap belonging to the TG Army."
	icon_state = "greengarrisoncap"

/obj/item/clothing/head/terragov/service/army/garrison/command
	name = "army officer's garrison cap"
	desc = "A green garrison cap belonging to the TG Army. This one has a gold pin."
	icon_state = "greengarrisoncap_com"

/obj/item/clothing/head/terragov/service/army/campaign
	name = "campaign cover"
	desc = "A green campaign cover with an TG Army crest. Only found on the heads of Drill Sergeants."
	icon_state = "greendrill"

//Dress

/obj/item/clothing/head/terragov/dress
	name = "dress cover"
	desc = "A dress uniform cover."
	icon_state = "greenwheelcap"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet")
	body_parts_covered = 0

/obj/item/clothing/head/terragov/dress/fleet/garrison
	name = "fleet garrison cap"
	desc = "A white dress uniform cap. The classic sailor's choice."
	icon_state = "whitegarrisoncap"

/obj/item/clothing/head/terragov/dress/fleet
	name = "fleet dress wheel cover"
	desc = "A white dress uniform cover. This one has an TG Fleet crest."
	icon_state = "whitepeakcap"

/obj/item/clothing/head/terragov/dress/fleet/command
	name = "fleet officer's dress wheel cover"
	desc = "A white dress uniform cover. This one has a gold stripe and an TG Fleet crest."
	icon_state = "whitepeakcap_com"

/obj/item/clothing/head/terragov/dress/army
	name = "army dress wheel cover"
	desc = "A white dress uniform cover with an TG Army crest."
	icon_state = "whitewheelcap"

/obj/item/clothing/head/terragov/dress/army/command
	name = "army officer's dress wheel cover"
	desc = "A white dress uniform cover with an TG Army crest and gold stripe."
	icon_state = "whitewheelcap_com"

//Berets

/obj/item/clothing/head/beret/terragov
	name = "peacekeeper beret"
	desc = "A beret in Terran Government colors. For peacekeepers that are more inclined towards style than safety."
	icon_state = "beret_lightblue"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')

/obj/item/clothing/head/beret/terragov/research
	name = "government research beret"
	desc = "A green beret denoting service in the Bureau of Research. For scientists that are more inclined towards style than safety."
	icon_state = "beret_green"

/obj/item/clothing/head/beret/terragov/health
	name = "health service beret"
	desc = "A white beret denoting service in the Interstellar Health Service. For medics that are more inclined towards style than safety."
	icon_state = "beret_white"

/obj/item/clothing/head/beret/terragov/borderguard
	name = "border security beret"
	desc = "A green beret with a silver emblem, denoting service in the Bureau of Border Security. For border guards who are more inclined towards style than safety."
	icon_state = "beret_greensilver"

/obj/item/clothing/head/beret/terragov/exploration
	name = "expeditionary beret"
	desc = "A black beret belonging to the TG Expeditionary Corps. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_unathi.dmi'
		)

/obj/item/clothing/head/beret/terragov/exploration/security
	name = "expeditionary security beret"
	desc = "An TG Expeditionary Corps beret with a security crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_security"

/obj/item/clothing/head/beret/terragov/exploration/medical
	name = "expeditionary medical beret"
	desc = "An TG Expeditionary Corps beret with a medical crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_medical"

/obj/item/clothing/head/beret/terragov/exploration/engineering
	name = "expeditionary engineering beret"
	desc = "An TG Expeditionary Corps beret with an engineering crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_engineering"

/obj/item/clothing/head/beret/terragov/exploration/supply
	name = "expeditionary supply beret"
	desc = "An TG Expeditionary Corps beret with a supply crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_supply"

/obj/item/clothing/head/beret/terragov/exploration/service
	name = "expeditionary service beret"
	desc = "An TG Expeditionary Corps beret with a service crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_service"

/obj/item/clothing/head/beret/terragov/exploration/exploration
	name = "expeditionary exploration beret"
	desc = "An TG Expeditionary Corps beret with an exploration crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_exploration"

/obj/item/clothing/head/beret/terragov/exploration/command
	name = "expeditionary officer's beret"
	desc = "An TG Expeditionary Corps beret with a golden crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_command"

/obj/item/clothing/head/beret/terragov/exploration/branch
	name = "\improper Field Operations beret"
	desc = "An TG Expeditionary Corps beret carrying insignia of the Field Operations section. For personnel that are more inclined towards style than safety."
	icon_state = "beret_black_fieldOps"

/obj/item/clothing/head/beret/terragov/fleet
	name = "fleet beret"
	desc = "A navy blue beret belonging to the TG Fleet. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy"

/obj/item/clothing/head/beret/terragov/fleet/security
	name = "fleet security beret"
	desc = "An TG Fleet beret with a security crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_security"

/obj/item/clothing/head/beret/terragov/fleet/medical
	name = "fleet medical beret"
	desc = "An TG Fleet beret with a medical crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_medical"

/obj/item/clothing/head/beret/terragov/fleet/engineering
	name = "fleet engineering beret"
	desc = "An TG Fleet with an engineering crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_engineering"

/obj/item/clothing/head/beret/terragov/fleet/supply
	name = "fleet supply beret"
	desc = "An TG Fleet beret with a supply crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_supply"

/obj/item/clothing/head/beret/terragov/fleet/service
	name = "fleet service beret"
	desc = "An TG Fleet beret with a service crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_service"

/obj/item/clothing/head/beret/terragov/fleet/exploration
	name = "fleet exploration beret"
	desc = "An TG Fleet beret with an exploration crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_exploration"

/obj/item/clothing/head/beret/terragov/fleet/command
	name = "fleet officer's beret"
	desc = "An TG Fleet beret with a golden crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_navy_command"

/obj/item/clothing/head/beret/terragov/fleet/dress
	name = "fleet dress beret"
	desc = "A white TG Fleet beret. For personnel that are more inclined towards style than safety."
	icon_state = "beret_whiterim"

/obj/item/clothing/head/beret/terragov/fleet/dress/command
	name = "fleet officer's dress beret"
	desc = "A white TG Fleet beret with a golden crest. For personnel that are more inclined towards style than safety."
	icon_state = "beret_whiterim_com"

//helmets and other such trash

/obj/item/clothing/head/helmet/terragov
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/blue/sol)

/obj/item/clothing/head/helmet/terragov/security
	name = "security helmet"
	desc = "A helmet with 'POLICE' printed on the back in silver lettering."
	icon_state = "helmet_security"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')
	starting_accessories = null
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_helmet_unathi.dmi'
		)

/obj/item/clothing/head/helmet/terragov/command
	name = "command helmet"
	desc = "A helmet with 'TERRAN GOVERNMENT' printed on the back in gold lettering."
	icon_state = "helmet_command"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')
	starting_accessories = null

/obj/item/clothing/head/helmet/terragov/pilot
	name = "pilot's helmet"
	desc = "A pilot's helmet for operating the cockpit in style. For when you want to protect your noggin AND look stylish."
	icon_state = "pilotgov"
	starting_accessories = null

/obj/item/clothing/head/helmet/terragov/pilot/fleet
	name = "fleet pilot's helmet"
	desc = "A pilot's helmet for operating the cockpit in style. This one is worn by members of the TG Fleet."
	icon_state = "pilotfleet"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')
	starting_accessories = null

// Hardsuit helmets

/obj/item/clothing/head/helmet/space/void/command
	name = "command voidsuit helmet"
	desc = "A light, radiation resistant voidsuit helmet commonly used among SCG uniformed services."
	icon_state = "rig0_command"
	item_state = "command_helm"
	light_overlay = "helmet_light_green_alt"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')
	sprite_sheets = list(
		SPECIES_UNATHI = 'maps/torch/icons/mob/unathi/onmob_head_solgov_unathi.dmi',
		SPECIES_SKRELL = 'maps/torch/icons/mob/skrell/onmob_head_solgov_skrell.dmi',
		)
	sprite_sheets_obj = list(
		SPECIES_UNATHI = 'maps/torch/icons/obj/unathi/obj_head_solgov_unathi.dmi',
		SPECIES_SKRELL = 'maps/torch/icons/obj/skrell/obj_head_solgov_skrell.dmi',
		)

/obj/item/clothing/head/helmet/space/void/marine
	name = "marine voidsuit helmet"
	desc = "An armored helmet, standard issue of TerraGov Marine Corps exploration division. It has an armored glass dome for superiour visibility and extra anti-radiation lining."
	camera = /obj/machinery/camera/network/exploration
	icon = 'maps/intrepid/icons/obj/obj_head_terragov.dmi'
	item_icons = list(slot_head_str = 'maps/intrepid/icons/mob/onmob_head_terragov.dmi')
	icon_state = "rig_marine"
	item_state = "rig_marine"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	light_overlay = "helmet_light_dual_alt"
	tinted = FALSE

/obj/item/clothing/head/helmet/space/void/marine/dark
	name = "dark marine voidsuit helmet"
	icon_state = "rig_marine_dark"
	item_state = "rig_marine_dark"

/obj/item/clothing/head/helmet/space/void/marine/leader
	name = "squad leader voidsuit helmet"
	desc = "A reinforced helmet belonging to sergeants within TerraGov Marine Corps. Slightly more resistant than the standard issue."
	icon_state = "rig_marine_alt"
	item_state = "rig_marine_alt"
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
