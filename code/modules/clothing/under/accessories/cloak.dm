/obj/item/clothing/accessory/cloak
	name = "plain cloak"
	desc = "A simple, bland cloak."
	icon_state = "cloak"
	w_class = ITEM_SIZE_NORMAL
	slot = ACCESSORY_SLOT_OVER
	slot_flags = SLOT_OCLOTHING
	high_visibility = TRUE
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/accessory/cloak/random
	name = "cloak"
	desc = "A simple cloak."

/obj/item/clothing/accessory/cloak/random/Initialize()
	color = get_random_colour(TRUE)
	. = ..()

/obj/item/clothing/accessory/cloak/terran
	name = "terran cloak"
	desc = "A cloak worn by Terran officers."
	icon_state = "cloak_terra"
