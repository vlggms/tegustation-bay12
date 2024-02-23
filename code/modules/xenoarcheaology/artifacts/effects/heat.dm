//inverse of /datum/artifact_effect/cold, the two effects split up for neatness' sake
/datum/artifact_effect/heat
	name = "heat"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA)
	cooldown_time = 50
	value = 4000
	var/target_temp

/datum/artifact_effect/heat/getDescription()
	return "The artifact emits high temperature waves."

/datum/artifact_effect/heat/New()
	..()
	target_temp = rand(350, 700)

/datum/artifact_effect/heat/DoEffect(var/mob/user)
	if(holder)
		if (istype(user))
			to_chat(user, "<span class='warning'>You feel a wave of heat travel up your spine!</span>")
		var/datum/gas_mixture/env = holder.loc.return_air()
		if(env && env.temperature < target_temp)
			env.temperature = min(env.temperature + rand(15,25), target_temp)

/datum/artifact_effect/heat/DoEffectAura()
	if(holder)
		var/datum/gas_mixture/env = holder.loc.return_air()
		if(env && env.temperature < target_temp)
			env.temperature += pick(0, 0, 1)
