/obj/item/clothing/accessory/terragov/skillbadge
	name = "skill badge"
	desc = "A skill badge signifying that the bearer has passed the advanced training on spawning wrong types. Informally known as 'Shouldn't be seeing this'."
	slot = ACCESSORY_SLOT_INSIGNIA
	var/badgecolor

/obj/item/clothing/accessory/terragov/skillbadge/get_mob_overlay(mob/user_mob, slot)
	var/image/I = ..()
	if(!istype(loc, /obj/item/clothing))
		return I
	I.icon_state = "ec_spec_badge"
	I.color = badgecolor
	return I

/obj/item/clothing/accessory/terragov/skillbadge/medical
	name = "\improper Basic First Aid Training badge"
	desc = "A skill badge signifying that the bearer has passed the basic training on operating medical equipment and life-saving measures."
	icon_state = "ec_badge_med"
	badgecolor = "#47799e"

/obj/item/clothing/accessory/terragov/skillbadge/medical/advanced
	name = "\improper Advanced First Aid Training badge"
	desc = "A skill badge signifying that the bearer has passed the advanced training on operating medical equipment, machinery, and applying said knowledge when needed. Informally known as 'Para-paramedic'."

/obj/item/clothing/accessory/terragov/skillbadge/mech
	name = "\improper Exosuit Training badge"
	desc = "A skill badge signifying that the bearer has passed the training on usage and maintenance of exosuits."
	icon_state = "ec_badge_exo"
	badgecolor = "#72763d"
