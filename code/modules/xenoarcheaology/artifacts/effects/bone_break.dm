/datum/artifact_effect/bone_break
	name = "bone break"
	acceptable_methods = list(
		ACTIVATE_TOUCH, ACTIVATE_ATTACK, ACTIVATE_BULLET,
		ACTIVATE_LASER, ACTIVATE_BOMB, ACTIVATE_MOB_BUMP, ACTIVATE_CHEMICAL
		)
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_PULSE)
	cooldown_time = 100
	value = 4000

/datum/artifact_effect/bone_break/getDescription()
	return "The artifact emits waves of shattering energy."

/datum/artifact_effect/bone_break/proc/BreakMob(mob/living/carbon/human/H, prob_end = 75)
	if(!ishuman(H))
		return
	to_chat(H, SPAN_DANGER("You feel a dangerous energy pass through your body!"))
	for(var/obj/item/organ/external/E in H.organs)
		if(E.fracture() && prob(prob_end))
			break
	H.recheck_bad_external_organs()

/datum/artifact_effect/bone_break/DoEffect(mob/toucher)
	if(toucher && ishuman(toucher))
		var/weakness = GetAnomalySusceptibility(toucher)
		if(prob(weakness * 100))
			BreakMob(toucher)
			return TRUE

/datum/artifact_effect/bone_break/DoEffectPulse()
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		var/turf/T = get_turf(holder)
		for(var/mob/living/carbon/human/H in range(range, T))
			var/weakness = GetAnomalySusceptibility(H)
			if(prob(weakness * 10))
				BreakMob(H, 90)
