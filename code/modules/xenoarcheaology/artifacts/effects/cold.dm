//inverse of /datum/artifact_effect/heat, the two effects split up for neatness' sake
/datum/artifact_effect/cold
	name = "cold"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA)
	cooldown_time = 50
	value = 4000
	var/target_temp

/datum/artifact_effect/cold/getDescription()
	return "The artifact emits low temperature waves."

/datum/artifact_effect/cold/New()
	..()
	target_temp = rand(0, 150)

/datum/artifact_effect/cold/DoEffect(var/mob/user)
	if(holder)
		if (istype(user))
			to_chat(user, "<span class='warning'>A chill passes up your spine!</span>")
		var/datum/gas_mixture/env = holder.loc.return_air()
		if(env && env.temperature > target_temp)
			env.temperature = max(env.temperature - rand(15,25), target_temp)

/datum/artifact_effect/cold/DoEffectAura()
	if(holder)
		var/datum/gas_mixture/env = holder.loc.return_air()
		if(env && env.temperature > target_temp)
			env.temperature -= pick(0, 0, 1)
