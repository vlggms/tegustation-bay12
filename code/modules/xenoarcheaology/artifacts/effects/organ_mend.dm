/datum/artifact_effect/organ_mend
	name = "organ mend"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_PULSE)
	cooldown_time = 100
	value = 12000

/datum/artifact_effect/organ_mend/getDescription()
	return "The artifact emits waves that positively affect internal organs."

/datum/artifact_effect/organ_mend/proc/HealMob(mob/living/carbon/human/H, heal_rate = 3)
	if(!ishuman(H))
		return
	for(var/obj/item/organ/internal/I in H.internal_organs)
		if(BP_IS_ROBOTIC(I) || BP_IS_CRYSTAL(I))
			continue
		if(I.organ_tag == BP_BRAIN && I.damage > I.min_bruised_damage)
			continue
		if(I.damage > 0)
			I.damage = max(I.damage - heal_rate, 0)
			if(prob(15 * heal_rate))
				to_chat(H, SPAN_NOTICE("Your feel organs in your [I.parent_organ] mend themselves."))
			return // Only one organ

/datum/artifact_effect/organ_mend/DoEffect(mob/toucher)
	if(toucher && ishuman(toucher))
		var/weakness = GetAnomalySusceptibility(toucher)
		if(prob(weakness * 100))
			HealMob(toucher)
			return TRUE

/datum/artifact_effect/organ_mend/DoEffectPulse()
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		var/turf/T = get_turf(holder)
		for(var/mob/living/carbon/human/H in range(range, T))
			var/weakness = GetAnomalySusceptibility(H)
			if(prob(weakness * 100))
				HealMob(H, 0.5)
