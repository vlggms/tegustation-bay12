/obj/item/reagent_containers/chemtank
	name = "chemical tank"
	desc = "A sealed container for industrial amount of chemicals to be stored and applied to a human via IV drip."
	icon = 'icons/obj/chemtank.dmi'
	icon_state = "chemtank"
	origin_tech = list(TECH_BIO = 4)
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	throw_speed = 1
	throw_range = 2
	volume = 1000
	possible_transfer_amounts = "0.25;0.5;1;1.5"
	amount_per_transfer_from_this = 1
	var/mob/living/carbon/human/attached = null

/obj/item/reagent_containers/chemtank/Destroy()
	STOP_PROCESSING(SSobj, src)
	attached = null
	. = ..()

/obj/item/reagent_containers/chemtank/Process()
	if(!attached)
		return PROCESS_KILL

	if(loc != attached) // Must be on your back, storage slot or pockets at all time
		visible_message(SPAN_WARNING("\The [src] needle flies out of the arm of [attached]!"))
		attached.apply_damage(5, BRUTE, pick(BP_R_ARM, BP_L_ARM), damage_flags = DAM_SHARP)
		attached = null
		return PROCESS_KILL

	if(!reagents)
		return

	if(SSobj.times_fired % 2)
		return

	if(reagents.total_volume <= 0)
		return

	reagents.trans_to_mob(attached, amount_per_transfer_from_this, CHEM_BLOOD)
	queue_icon_update()

/obj/item/reagent_containers/chemtank/update_icon()
	overlays.Cut()

	if(reagents.total_volume)
		var/image/filling = image(icon, src, "fill-4")

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0 to 25)
				filling.icon_state = "fill-1"
			if(25 to 50)
				filling.icon_state = "fill-2"
			if(50 to 75)
				filling.icon_state = "fill-3"

		filling.color = reagents.get_color()
		overlays += filling

/obj/item/reagent_containers/chemtank/MouseDrop(over_object, src_location, over_location)
	if(!CanMouseDrop(over_object))
		return
	if(!ishuman(over_object))
		return
	HookUp(over_object, usr)

/obj/item/reagent_containers/chemtank/standard_pour_into(mob/user, atom/target)
	to_chat(user, SPAN_WARNING("Reagents from [src] cannot be transfered!"))
	return FALSE

/obj/item/reagent_containers/chemtank/proc/HookUp(mob/living/carbon/human/target, mob/user)
	if(istype(attached) && user == target)
		to_chat(user, SPAN_NOTICE("You swifly remove \the [src] needle from your veins."))
		attached = null
		STOP_PROCESSING(SSobj, src)
		return
	if(DoHookup(target, user, src))
		attached = target
		START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/chemtank/proc/DoHookup(mob/living/carbon/human/target, mob/user)
	if(user != target)
		to_chat(user, SPAN_WARNING("You can't reach the vein of [target]! They have to set it up themselves!"))
		return FALSE

	if(loc != user)
		to_chat(user, SPAN_WARNING("You can't reach your veins with the needle! \The [src] should be on your back or suit storage!"))
		return FALSE

	to_chat(user, SPAN_NOTICE("You attempt to inject the needle from [src] to your veins..."))
	if(!user.do_skilled(2 SECONDS, SKILL_MEDICAL, target))
		return FALSE

	user.visible_message("\The [user] successfuly deploys \the [src].")
	return TRUE

// Subtypes prefilled with chemicals
/obj/item/reagent_containers/chemtank/gottheit
	name = "chemical combat augmentation unit"
	desc = "A chemical tank supplied with a hefty amount of gottheit, a revolution in the art of combat pioneered by Ayin Kalon, \
			a well-known member of Terran fleet. The idea of hooking up soldiers on this drug is a source of debates \
			for many reasons, including morality, legality and logistics."
	possible_transfer_amounts = "0.25;0.5;1;1.5"

/obj/item/reagent_containers/chemtank/gottheit/New()
	..()
	reagents.add_reagent(/datum/reagent/gottheit, volume)
	update_icon()
