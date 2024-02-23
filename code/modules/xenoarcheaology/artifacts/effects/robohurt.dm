/datum/artifact_effect/robohurt
	name = "robotic harm"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA, EFFECT_PULSE)
	cooldown_time = 50
	value = 4000
	var/last_message

/datum/artifact_effect/robohurt/getDescription()
	return "The artifact serves as a house to harmful nanites swarm."

/datum/artifact_effect/robohurt/DoEffect(mob/user)
	if(user && istype(user, /mob/living/silicon/robot))
		var/mob/living/silicon/robot/R = user
		to_chat(R, "<span class='danger'>Your systems report severe damage has been inflicted!</span>")
		R.adjustBruteLoss(rand(20,50))
		R.adjustFireLoss(rand(20,50))
		return 1

/datum/artifact_effect/robohurt/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for(var/mob/living/silicon/robot/R in range(range, T))
			if(world.time - last_message > 5 SECONDS)
				to_chat(R, "<span class='danger'>SYSTEM ALERT: Harmful energy field detected!</span>")
			R.adjustBruteLoss(1)
			R.adjustFireLoss(1)
			R.updatehealth()
		if(world.time - last_message > 5 SECONDS)
			last_message = world.time
		return 1

/datum/artifact_effect/robohurt/DoEffectPulse()
	if(holder)
		var/turf/T = get_turf(holder)
		for(var/mob/living/silicon/robot/R in range(range, T))
			if(world.time - last_message > 5 SECONDS)
				to_chat(R, "<span class='danger'>SYSTEM ALERT: Harmful energy field detected!</span>")
			R.adjustBruteLoss(10)
			R.adjustFireLoss(10)
			R.updatehealth()
		if(world.time - last_message > 5 SECONDS)
			last_message = world.time
		return 1
