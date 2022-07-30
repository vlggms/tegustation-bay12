/datum/artifact_effect/emp
	name = "emp"
	effect_type = EFFECT_PULSE
	cooldown_time = 50

/datum/artifact_effect/emp/getDescription()
	return "The artifact emits electromagnetic waves."

/datum/artifact_effect/emp/DoEffectPulse()
	if(holder)
		var/turf/T = get_turf(holder)
		empulse(T, range/2, range)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		return 1