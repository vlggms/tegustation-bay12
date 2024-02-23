/datum/artifact_effect/stun
	name = "stun"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_PULSE)
	cooldown_time = 50
	value = 5000

/datum/artifact_effect/stun/getDescription()
	return "Effects include rapid attack on the neural centers of the body."

/datum/artifact_effect/stun/DoEffect(var/mob/toucher)
	if(toucher && iscarbon(toucher))
		var/mob/living/carbon/C = toucher
		var/susceptibility = GetAnomalySusceptibility(C)
		if(prob(susceptibility * 100))
			to_chat(C, "<span class='warning'>A powerful force overwhelms your consciousness.</span>")
			C.stuttering += 30 * susceptibility
			C.Stun(rand(1,10) * susceptibility)

/datum/artifact_effect/stun/DoEffectPulse()
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		var/turf/T = get_turf(holder)
		for (var/mob/living/carbon/C in range(range,T))
			var/susceptibility = GetAnomalySusceptibility(C)
			if(prob(100 * susceptibility))
				to_chat(C, "<span class='warning'>A wave of energy overwhelms your senses!</span>")
				C.SetStunned(4 * susceptibility)
				C.stuttering = 4 * susceptibility
