/obj/item/explo_banner
	name = "\improper banner capsule"
	desc = "Capsule used to rapidly deploy banners of a government to put claims on newly explored exoplanets."
	icon = 'icons/obj/items.dmi'
	icon_state = "banner_stowed"
	w_class = ITEM_SIZE_HUGE
	/// Which group this banner is associated with. Used for statistics: Who claimed how many planets.
	var/claim_government = "Mime Empire" // Edit this for subtypes
	/// Type of banner created on use
	var/obj/banner_type = /obj/structure/banner/exploration

/obj/item/explo_banner/afterattack(atom/target, mob/living/carbon/human/user, proximity)
	if(!istype(user))
		return
	if(!proximity)
		return
	var/turf/simulated/T = target
	if(!istype(T) || T.density)
		return
	if(!allowed(user))
		to_chat(user, "<span class='warning'>\The [src] does not recognize your authority!</span>")
		return
	var/obj/effect/overmap/visitable/sector/exoplanet/P = map_sectors["[z]"]
	if(!istype(P))
		to_chat(user, "<span class='warning'>\The [src] must be deployed on a planet!</span>")
		return
	if(P.claim) // You were too late!
		to_chat(user, "<span class='warning'>The planet has already been claimed by [P.claim]!</span>")
		return
	var/obj/item/card/id/ID = user.GetIdCard()
	if(!istype(ID) || !ID.registered_name)
		to_chat(user, "<span class='warning'>You must have an appropriate identification card!</span>")
		return
	if(!user.unEquip(src))
		return

	var/obj/structure/banner/exploration/E = new(T)
	var/dudename = ID.registered_name
	if(istype(ID.military_rank))
		dudename = "[ID.military_rank.name] [dudename]"
	E.planted_information = "Planted on [stationdate2text()] by [dudename], [user.get_assignment()] of \the [claim_government]."
	T.visible_message("<span class='notice'>[user] successfully claims this world for \the [claim_government]!</span>")
	playsound(T, 'sound/effects/banner_deploy.ogg', 35, 1)
	P.claim = claim_government
	SSstatistics.add_field(STAT_FLAGS_PLANTED, list("gov" = claim_government, "user" = user, "planet" = P.name))
	qdel(src)

/* Various subtypes */
/obj/item/explo_banner/terragov
	name = "\improper TerraGov banner capsule"
	desc = "TerraGov banner packed in a rapid deployment capsule. Used for staking claims on new worlds in the name of Terran Government."
	claim_government = "Terran Government"
	banner_type = /obj/structure/banner/exploration/terragov

/obj/item/explo_banner/solgov
	name = "\improper SCG banner capsule"
	desc = "SCG banner packed in a rapid deployment capsule. Used for staking claims on new worlds in the name of Sol Central Government."
	claim_government = "Sol Central Government"
	banner_type = /obj/structure/banner/exploration/solgov
