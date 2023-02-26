/mob/living/proc/HasDisease(datum/disease/D)
	for(var/thing in diseases)
		var/datum/disease/DD = thing
		if(D.IsSame(DD))
			return TRUE
	return FALSE

/mob/living/proc/CanContractDisease(datum/disease/D)
	if(stat == DEAD && !D.process_dead)
		return FALSE

	if(D.GetDiseaseID() in disease_resistances)
		return FALSE

	if(HasDisease(D))
		return FALSE

	if(!D.IsViableMobtype(type))
		return FALSE

	return TRUE

/mob/living/proc/CanSpreadAirborneDisease()
	return TRUE

/mob/living/carbon/human/CanSpreadAirborneDisease()
	return !((head && ((head.item_flags & ITEM_FLAG_AIRTIGHT) || (head.body_parts_covered & FACE))) || \
		(wear_mask && ((wear_mask.item_flags & ITEM_FLAG_AIRTIGHT) || (wear_mask.body_parts_covered & FACE))))

/mob/living/proc/ContactContractDisease(datum/disease/D)
	if(!CanContractDisease(D))
		return FALSE
	D.TryInfect(src)

/mob/living/proc/AirborneContractDisease(datum/disease/D, force_spread)
	if( ((D.spread_flags & DISEASE_SPREAD_AIRBORNE) || force_spread) && prob((50*D.permeability_mod) - 1))
		ForceContractDisease(D)

//Proc to use when you 100% want to try to infect someone (ignoreing protective clothing and such), as long as they aren't immune
/mob/living/proc/ForceContractDisease(datum/disease/D, make_copy = TRUE, del_on_fail = FALSE)
	if(!CanContractDisease(D))
		if(del_on_fail)
			qdel(D)
		return FALSE
	if(!D.TryInfect(src, make_copy))
		if(del_on_fail)
			qdel(D)
		return FALSE
	return TRUE

/mob/living/carbon/human/CanContractDisease(datum/disease/D)
	/*
	if(dna)
		if(HAS_TRAIT(src, TRAIT_VIRUSIMMUNE) && !D.bypasses_immunity)
			return FALSE
	*/

	for(var/thing in D.required_organs)
		if(!(locate(thing) in organs))
			return FALSE
	return ..()
