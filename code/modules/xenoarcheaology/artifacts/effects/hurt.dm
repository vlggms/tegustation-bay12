/datum/artifact_effect/hurt
	name = "hurt"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA, EFFECT_PULSE)
	cooldown_time = 50
	value = 3000

/datum/artifact_effect/hurt/getDescription()
	return "The artifact emits waves of harmful energy."

/datum/artifact_effect/hurt/DoEffect(var/mob/toucher)
	if(toucher)
		var/weakness = GetAnomalySusceptibility(toucher)
		if(iscarbon(toucher) && prob(weakness * 100))
			var/mob/living/carbon/C = toucher
			to_chat(C, "<span class='danger'>A painful discharge of energy strikes you!</span>")
			C.adjustOxyLoss(rand(5,25) * weakness)
			C.adjustToxLoss(rand(5,25) * weakness)
			C.adjustBruteLoss(rand(5,25) * weakness)
			C.adjustFireLoss(rand(5,25) * weakness)
			C.adjustBrainLoss(rand(1,5) * weakness)
			C.apply_damage(25 * weakness, IRRADIATE, damage_flags = DAM_DISPERSED)
			C.set_nutrition(min(50 * weakness, C.nutrition))
			C.make_dizzy(6 * weakness)
			C.weakened += 6 * weakness

/datum/artifact_effect/hurt/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/mob/living/carbon/C in range(range, T))
			var/weakness = GetAnomalySusceptibility(C)
			if(prob(weakness * 100))
				if(prob(10))
					to_chat(C, "<span class='danger'>You feel a painful force radiating from something nearby.</span>")
				C.adjustBruteLoss(1 * weakness)
				C.adjustFireLoss(1 * weakness)
				C.adjustToxLoss(1 * weakness)
				C.adjustOxyLoss(1 * weakness)
				C.adjustBrainLoss(0.1 * weakness)
				C.updatehealth()

/datum/artifact_effect/hurt/DoEffectPulse()
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		var/turf/T = get_turf(holder)
		for (var/mob/living/carbon/C in range(range, T))
			var/weakness = GetAnomalySusceptibility(C)
			if(prob(weakness * 100))
				to_chat(C, "<span class='danger'>A wave of painful energy strikes you!</span>")
				C.adjustBruteLoss(3 * weakness)
				C.adjustFireLoss(3 * weakness)
				C.adjustToxLoss(3 * weakness)
				C.adjustOxyLoss(3 * weakness)
				C.adjustBrainLoss(0.1 * weakness)
				C.updatehealth()
