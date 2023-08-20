/obj/structure/banner
	name = "\improper banner"
	desc = "Invisible banner representing forces of Mime Empire. Ave." // Don't spawn this
	icon = 'icons/obj/explo_banner.dmi'
	anchored = TRUE
	obj_flags = OBJ_FLAG_ANCHORABLE
	layer = ABOVE_HUMAN_LAYER

/obj/structure/banner/solgov
	name = "\improper SCG banner"
	desc = "A wooden pole bearing a banner of Sol Central Government. Ave."
	icon_state = "wood_sol"

// Exploration banners
// Created via capsules found in explo_banner.dm
/obj/structure/banner/exploration
	name = "\improper exoplanet banner"
	obj_flags = 0
	var/flick_state = "deploy_sol"
	var/planted_information = null

/obj/structure/banner/exploration/Initialize()
	. = ..()
	flick(flick_state, src)

/obj/structure/banner/exploration/examine(mob/user)
	. = ..()
	if(planted_information)
		to_chat(user, "<span class='notice'>[planted_information]</span>")

/obj/structure/banner/exploration/solgov
	name = "\improper SCG exoplanet banner"
	desc = "A rugged metal frame with a banner of Sol Central Government on it. Resistant to radiation bleaching."
	icon_state = "steel_sol"

/obj/structure/banner/exploration/terragov
	name = "\improper TG exoplanet banner"
	desc = "A rugged metal frame with a banner of Terran Government on it. Resistant to radiation bleaching."
	icon_state = "steel_sol" // Update da icon
