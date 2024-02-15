/datum/artifact_effect/radiate
	name = "radiation"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA, EFFECT_PULSE)
	value = 3000
	var/radiation_strength

/datum/artifact_effect/radiate/getDescription()
	var/message_t = "Light"
	if(radiation_strength > 40)
		message_t = "Heavy"
	else if(radiation_strength > 25)
		message_t = "Moderate"
	return "[message_t] traces of radiation are detected within the surface of the artifact."

/datum/artifact_effect/radiate/New()
	..()
	radiation_strength = rand(10, 50)

/datum/artifact_effect/radiate/Value()
	. = ..()
	. += radiation_strength * 100

/datum/artifact_effect/radiate/DoEffect(mob/living/user)
	if(istype(user))
		user.apply_damage(radiation_strength * 2,IRRADIATE, damage_flags = DAM_DISPERSED)
		user.updatehealth()
		return 1

/datum/artifact_effect/radiate/DoEffectAura()
	if(holder)
		SSradiation.radiate(holder, range)
		return 1

/datum/artifact_effect/radiate/DoEffectPulse()
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		SSradiation.radiate(holder, range * rand(5, 10)) //Need to get feedback on this
		return 1
