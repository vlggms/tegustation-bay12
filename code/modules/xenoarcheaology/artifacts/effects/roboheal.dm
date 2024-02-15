/datum/artifact_effect/roboheal
	name = "robotic healing"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA, EFFECT_PULSE)
	cooldown_time = 50
	value = 9000
	var/last_message

/datum/artifact_effect/roboheal/getDescription()
	return "The artifact serves as a house to maintenance nanites swarm."

/datum/artifact_effect/roboheal/DoEffect(mob/user)
	if(user && istype(user, /mob/living/silicon/robot))
		var/mob/living/silicon/robot/R = user
		to_chat(R, "<span class='notice'>Your systems report damaged components mending by themselves!</span>")
		R.adjustBruteLoss(rand(-10,-30))
		R.adjustFireLoss(rand(-10,-30))
		return 1

/datum/artifact_effect/roboheal/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for(var/mob/living/silicon/robot/R in range(range, T))
			if(world.time - last_message > 5 SECONDS)
				to_chat(R, "<span class='notice'>SYSTEM ALERT: Beneficial energy field detected!</span>")
			R.adjustBruteLoss(-1)
			R.adjustFireLoss(-1)
			R.updatehealth()
		if(world.time - last_message > 5 SECONDS)
			last_message = world.time
		return 1

/datum/artifact_effect/roboheal/DoEffectPulse()
	if(holder)
		var/turf/T = get_turf(holder)
		for(var/mob/living/silicon/robot/R in range(range, T))
			if(world.time - last_message > 5 SECONDS)
				to_chat(R, "<span class='notice'>SYSTEM ALERT: Structural damage has been repaired by energy pulse!</span>")
			R.adjustBruteLoss(-10)
			R.adjustFireLoss(-10)
			R.updatehealth()
		if(world.time - last_message > 5 SECONDS)
			last_message = world.time
		return 1
