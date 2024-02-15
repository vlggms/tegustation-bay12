/datum/artifact_effect/heal
	name = "heal"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA, EFFECT_PULSE)
	cooldown_time = 50
	value = 7000

/datum/artifact_effect/heal/getDescription()
	return "The artifact emits waves of soothing energy."

/datum/artifact_effect/heal/proc/HealMob(mob/living/carbon/human/H, weakness)
	if(ishuman(H))
		to_chat(H, "<span class='notice'>You feel a soothing energy invigorate you.</span>")
		for(var/obj/item/organ/external/affecting in H.organs)
			if(affecting && istype(affecting))
				affecting.heal_damage(25 * weakness, 25 * weakness)
		H.vessel.add_reagent(/datum/reagent/blood,5)
		H.adjust_nutrition(50 * weakness)
		H.adjustBrainLoss(-25 * weakness)
		H.radiation -= min(H.radiation, 25 * weakness)
		H.bodytemperature = initial(H.bodytemperature)
		H.fixblood()
		//
		H.adjustOxyLoss(-25 * weakness)
		H.adjustToxLoss(-25 * weakness)
		H.adjustBruteLoss(-25 * weakness)
		H.adjustFireLoss(-25 * weakness)
		//
		H.regenerate_icons()

/datum/artifact_effect/heal/DoEffect(mob/toucher)
	//todo: check over this properly
	if(toucher && iscarbon(toucher))
		var/weakness = GetAnomalySusceptibility(toucher)
		if(prob(weakness * 100))
			HealMob(toucher, weakness)
			return 1

/datum/artifact_effect/heal/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for(var/mob/living/carbon/C in range(range, T))
			var/weakness = GetAnomalySusceptibility(C)
			if(prob(weakness * 100))
				if(prob(10))
					to_chat(C, "<span class='notice'>You feel a soothing energy radiating from something nearby.</span>")
				C.adjustBruteLoss(-1 * weakness)
				C.adjustFireLoss(-1 * weakness)
				C.adjustToxLoss(-1 * weakness)
				C.adjustOxyLoss(-1 * weakness)
				C.adjustBrainLoss(-1 * weakness)
				C.updatehealth()

/datum/artifact_effect/heal/DoEffectPulse()
	//todo: check over this properly
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		var/turf/T = get_turf(holder)
		for (var/mob/living/carbon/C in range(range, T))
			var/weakness = GetAnomalySusceptibility(C)
			if(prob(weakness * 100))
				to_chat(C, "<span class='notice'>A wave of energy invigorates you.</span>")
				C.adjustBruteLoss(-5 * weakness)
				C.adjustFireLoss(-5 * weakness)
				C.adjustToxLoss(-5 * weakness)
				C.adjustOxyLoss(-5 * weakness)
				C.adjustBrainLoss(-5 * weakness)
				C.updatehealth()
