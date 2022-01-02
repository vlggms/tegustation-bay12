/obj/item/clothing/under/terragov
	name = "master terragov uniform"
	desc = "You shouldn't be seeing this."
	icon = 'maps/torch/icons/obj/obj_under_solgov.dmi' // Yes, we're using icons from Torch.
	item_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_under_solgov.dmi')
	siemens_coefficient = 0.8
	gender_icons = 1

//PT
/obj/item/clothing/under/terragov/pt
	name = "pt uniform"
	desc = "Shorts! Shirt! Miami! Sexy!"
	icon_state = "miami"
	worn_state = "miami"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/terragov/pt/expeditionary
	name = "expeditionary pt uniform"
	desc = "A baggy shirt bearing the seal of the TG Exploration Division and some dorky looking blue shorts."
	icon_state = "expeditionpt"
	worn_state = "expeditionpt"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_under_unathi.dmi'
		)

/obj/item/clothing/under/terragov/pt/fleet
	name = "fleet pt uniform"
	desc = "A tight-fitting navy blue shirt paired with black shorts. For when you need to 'get physical'."
	icon_state = "fleetpt"
	worn_state = "fleetpt"

/obj/item/clothing/under/terragov/pt/army
	name = "army pt uniform"
	desc = "Does NOT leave much to the imagination."
	icon_state = "armypt"
	worn_state = "armypt"

//Utility

/obj/item/clothing/under/terragov/utility
	name = "utility uniform"
	desc = "A comfortable turtleneck and black utility trousers."
	icon_state = "blackutility"
	item_state = "bl_suit"
	worn_state = "blackutility"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_under_unathi.dmi'
		)
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		energy = ARMOR_ENERGY_MINOR
		)

/obj/item/clothing/under/terragov/utility/fleet
	name = "fleet coveralls"
	desc = "The utility uniform of the TG Fleet, made from an insulated material."
	icon_state = "navyutility"
	item_state = "jensensuit"
	worn_state = "navyutility"

/obj/item/clothing/under/terragov/utility/fleet/combat
	name = "fleet fatigues"
	desc = "Alternative utility uniform of the TG Fleet, for when coveralls are impractical."
	icon_state = "navycombat"
	worn_state = "navycombat"

/obj/item/clothing/under/terragov/utility/exploration
	name = "exploration uniform"
	desc = "The utility uniform of the TG Exploration Division, made from biohazard resistant material. This one has silver trim."
	icon_state = "blackutility_crew"
	worn_state = "blackutility_crew"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_under_unathi.dmi'
		)

/obj/item/clothing/under/terragov/utility/exploration/officer
	name = "exploration officer's uniform"
	desc = "The utility uniform of the TG Exploration Division, made from biohazard resistant material. This one has gold trim."
	icon_state = "blackutility_com"
	worn_state = "blackutility_com"

/obj/item/clothing/under/terragov/utility/exploration_skirt
	name = "exploration skirt"
	desc = "A black turtleneck and skirt, the elusive ladies' uniform of the Exploration Division."
	icon_state = "blackservicefem"
	worn_state = "blackservicefem"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_under_unathi.dmi'
		)

/obj/item/clothing/under/terragov/utility/exploration_skirt/officer
	name = "exploration officer skirt"
	desc = "A black turtleneck and skirt, the elusive ladies' uniform of the Exploration Division. This one has gold trim."
	icon_state = "blackservicefem_com"
	worn_state = "blackservicefem_com"

/obj/item/clothing/under/terragov/utility/army
	name = "army fatigues"
	desc = "The utility uniform of the TG Army, made from durable material."
	icon_state = "greenutility"
	item_state = "jensensuit"
	worn_state = "greenutility"

/obj/item/clothing/under/terragov/utility/army/urban
	name = "urban fatigues"
	desc = "An urban version of the TG Army utility uniform, made from durable material."
	icon_state = "greyutility"
	item_state = "gy_suit"
	worn_state = "greyutility"

/obj/item/clothing/under/terragov/utility/army/tan
	name = "tan fatigues"
	desc = "A tan version of the TG Army utility uniform, made from durable material."
	icon_state = "tanutility"
	item_state = "johnny"
	worn_state = "tanutility"

//Service

/obj/item/clothing/under/terragov/service
	name = "service uniform"
	desc = "A service uniform of some kind."
	icon_state = "whiteservice"
	worn_state = "whiteservice"
	siemens_coefficient = 0.9

/obj/item/clothing/under/terragov/service/fleet
	name = "fleet service uniform"
	desc = "The service uniform of the TG Fleet, made from immaculate white fabric."
	icon_state = "whiteservice"
	item_state = "nursesuit"
	worn_state = "whiteservice"
	starting_accessories = list(/obj/item/clothing/accessory/navy)

/obj/item/clothing/under/terragov/service/fleet/skirt
	name = "fleet service skirt"
	desc = "The service uniform skirt of the TG Fleet, made from immaculate white fabric."
	icon_state = "whiteservicefem"
	worn_state = "whiteservicefem"

/obj/item/clothing/under/terragov/service/army
	name = "army service uniform"
	desc = "The service uniform of the TG Army. Slimming."
	icon_state = "greenservice"
	item_state = "johnny"
	worn_state = "greenservice"
	starting_accessories = list(/obj/item/clothing/accessory/brown)

/obj/item/clothing/under/terragov/service/army/skirt
	name = "army service skirt"
	desc = "The service uniform skirt of the TG Army. Slimming."
	icon_state = "greenservicefem"
	worn_state = "greenservicefem"

/obj/item/clothing/under/terragov/service/army/command
	name = "marine officer's service uniform"
	desc = "The service uniform of the TG Army. Slimming and stylish."
	icon_state = "greenservice_com"
	item_state = "johnny"
	worn_state = "greenservice_com"
	starting_accessories = list(/obj/item/clothing/accessory/brown)

/obj/item/clothing/under/terragov/service/army/command/skirt
	name = "marine officer's service skirt"
	desc = "The service uniform skirt of the TG Army. Slimming and stylish."
	icon_state = "greenservicefem_com"
	worn_state = "greenservicefem_com"

/*** Paths with accessories attached ***/
// Exploration
/obj/item/clothing/under/terragov/utility/exploration/command
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/command)

/obj/item/clothing/under/terragov/utility/exploration/engineering
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/engineering)

/obj/item/clothing/under/terragov/utility/exploration/security
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/security)

/obj/item/clothing/under/terragov/utility/exploration/medical
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/medical)

/obj/item/clothing/under/terragov/utility/exploration/supply
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/supply)

/obj/item/clothing/under/terragov/utility/exploration/service
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/service)

/obj/item/clothing/under/terragov/utility/exploration/exploration
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/exploration)

/obj/item/clothing/under/terragov/utility/exploration/research
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/research)

// Exploration officer
/obj/item/clothing/under/terragov/utility/exploration/officer/command
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/command)

/obj/item/clothing/under/terragov/utility/exploration/officer/engineering
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/engineering)

/obj/item/clothing/under/terragov/utility/exploration/officer/security
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/security)

/obj/item/clothing/under/terragov/utility/exploration/officer/medical
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/medical)

/obj/item/clothing/under/terragov/utility/exploration/officer/supply
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/supply)

/obj/item/clothing/under/terragov/utility/exploration/officer/service
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/service)

/obj/item/clothing/under/terragov/utility/exploration/officer/exploration
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/exploration)

/obj/item/clothing/under/terragov/utility/exploration/officer/research
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/research)

// Fleet //
/obj/item/clothing/under/terragov/utility/fleet/command
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/command/fleet)

/obj/item/clothing/under/terragov/utility/fleet/command/pilot
	starting_accessories = list(/obj/item/clothing/accessory/terragov/specialty/pilot)

/obj/item/clothing/under/terragov/utility/fleet/engineering
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/engineering/fleet)

/obj/item/clothing/under/terragov/utility/fleet/security
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/security/fleet)

/obj/item/clothing/under/terragov/utility/fleet/medical
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/medical/fleet)

/obj/item/clothing/under/terragov/utility/fleet/supply
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/supply/fleet)

/obj/item/clothing/under/terragov/utility/fleet/service
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/service/fleet)

/obj/item/clothing/under/terragov/utility/fleet/exploration
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/exploration/fleet)

// Fleet - Combat
/obj/item/clothing/under/terragov/utility/fleet/combat/security
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/security/fleet)

/obj/item/clothing/under/terragov/utility/fleet/combat/medical
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/medical/fleet, /obj/item/clothing/accessory/armband/medblue)

/obj/item/clothing/under/terragov/utility/fleet/combat/command
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/command/fleet)

/obj/item/clothing/under/terragov/utility/fleet/combat/exploration
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/exploration/fleet)

/obj/item/clothing/under/terragov/utility/fleet/combat/engineering
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/engineering/fleet)

/obj/item/clothing/under/terragov/utility/fleet/combat/service
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/service/fleet)

/obj/item/clothing/under/terragov/utility/fleet/combat/supply
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/supply/fleet)

// Army
/obj/item/clothing/under/terragov/utility/army/command
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/command/army)

/obj/item/clothing/under/terragov/utility/army/engineering
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/engineering/army)

/obj/item/clothing/under/terragov/utility/army/security
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/security/army)

/obj/item/clothing/under/terragov/utility/army/medical
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/medical/army)

/obj/item/clothing/under/terragov/utility/army/medical/banded
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/medical/army, /obj/item/clothing/accessory/armband/medblue)

/obj/item/clothing/under/terragov/utility/army/supply
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/supply/army)

/obj/item/clothing/under/terragov/utility/army/service
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/service/army)

/obj/item/clothing/under/terragov/utility/army/exploration
	starting_accessories = list(/obj/item/clothing/accessory/terragov/department/exploration/army)

//dress

/obj/item/clothing/under/terragov/dress/exploration
	name = "exploration dress uniform"
	desc = "The dress uniform of the TG Exploration Division in silver trim."
	icon_state = "greydress"
	worn_state = "greydress"
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_under_unathi.dmi'
		)

/obj/item/clothing/under/terragov/dress/exploration/skirt
	name = "exploration dress skirt"
	desc = "A feminine version of the TG Exploration Division dress uniform in silver trim."
	icon_state = "greydressfem"
	worn_state = "greydressfem"

/obj/item/clothing/under/terragov/dress/exploration/command
	name = "exploration officer's dress uniform"
	desc = "The dress uniform of the TG Exploration Division in gold trim."
	icon_state = "greydress_com"
	worn_state = "greydress_com"

/obj/item/clothing/under/terragov/dress/exploration/command/skirt
	name = "exploration officer's dress skirt"
	desc = "A feminine version of the TG Exploration Division dress uniform in gold trim."
	icon_state = "greydressfem_com"
	worn_state = "greydressfem_com"
