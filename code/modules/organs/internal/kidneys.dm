/obj/item/organ/internal/kidneys
	name = "kidneys"
	icon_state = "kidneys"
	gender = PLURAL
	organ_tag = BP_KIDNEYS
	parent_organ = BP_GROIN
	max_damage = 70
	relative_size = 10
	var/list/bad_reagents = list(
		/datum/reagent/drink/coffee,
		)

/obj/item/organ/internal/kidneys/Process()
	. =..()

	if(!owner)
		return

	// Don't drink bad reagents with busted kidneys
	var/bad_stuff = same_entries(bad_reagents, owner.reagents.reagent_list)
	if(bad_stuff)
		if(is_bruised())
			owner.adjustToxLoss(0.1)
		else if(is_broken())
			owner.adjustToxLoss(0.3)

	if(is_bruised())
		if(prob(5) && reagents.get_reagent_amount(/datum/reagent/potassium) < 5)
			reagents.add_reagent(/datum/reagent/potassium, REM*5)
	if(is_broken())
		if(owner.reagents.get_reagent_amount(/datum/reagent/potassium) < 15)
			owner.reagents.add_reagent(/datum/reagent/potassium, REM*2)

	//If your kidneys aren't working, your body's going to have a hard time cleaning your blood.
	if(!owner.chem_effects[CE_ANTITOX])
		if(prob(33))
			if(is_broken())
				owner.adjustToxLoss(0.5)
			if(status & ORGAN_DEAD)
				owner.adjustToxLoss(1)

/obj/item/organ/internal/kidneys/robotize()
	. = ..()
	icon_state = "kidneys-prosthetic"
