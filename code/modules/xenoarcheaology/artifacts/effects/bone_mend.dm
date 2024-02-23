/datum/artifact_effect/bone_mend
	name = "bone mend"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_PULSE)
	cooldown_time = 100
	value = 8000

/datum/artifact_effect/bone_mend/getDescription()
	return "The artifact emits waves of mending energy."

/datum/artifact_effect/bone_mend/proc/HealMob(mob/living/carbon/human/H)
	if(!ishuman(H))
		return
	for(var/obj/item/organ/external/E in H.bad_external_organs)
		if(!(E.status & ORGAN_BROKEN))
			continue
		if(E.mend_fracture())
			to_chat(H, SPAN_NOTICE("You feel shattered bones in your [E.name] mend themselves."))

/datum/artifact_effect/bone_mend/DoEffect(mob/toucher)
	if(toucher && ishuman(toucher))
		var/weakness = GetAnomalySusceptibility(toucher)
		if(prob(weakness * 100))
			HealMob(toucher)
			return TRUE

/datum/artifact_effect/bone_mend/DoEffectPulse()
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		var/turf/T = get_turf(holder)
		for(var/mob/living/carbon/human/H in range(range, T))
			var/weakness = GetAnomalySusceptibility(H)
			if(prob(weakness * 10))
				HealMob(H)
