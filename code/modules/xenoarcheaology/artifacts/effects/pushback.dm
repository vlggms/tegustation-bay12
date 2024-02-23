/datum/artifact_effect/pushback
	name = "pushback"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_PULSE)
	cooldown_time = 50
	value = 2000
	var/throw_range
	var/damage
	var/speed = 3

/datum/artifact_effect/pushback/getDescription()
	return "The artifacts emits unstable gravitational force."

/datum/artifact_effect/pushback/New()
	..()
	throw_range = range + rand(-1, 3)
	damage = rand(5, 15)

/datum/artifact_effect/pushback/Value()
	. = ..()
	. += throw_range * 1500
	. += damage * 300

/datum/artifact_effect/pushback/DoEffect(mob/toucher)
	if(holder && istype(toucher, /mob/living))
		var/mob/living/M = toucher
		var/weakness = GetAnomalySusceptibility(M)
		M.apply_damage(damage * weakness, BRUTE, damage_flags = DAM_DISPERSED)
		M.throw_at(get_target_turf(M), throw_range, speed)

		to_chat(M, SPAN_DANGER("A violent force slams into you as you touch \the [holder]!"))
		holder.visible_message(SPAN_WARNING("\The [holder] shines bright as it releases a wave of energy!"))
		playsound(get_turf(holder), "sound/magic/repulse.ogg", 100)

/datum/artifact_effect/pushback/DoEffectPulse()
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		var/turf/T = get_turf(holder)
		for (var/mob/living/M in range(range, T))
			var/weakness = GetAnomalySusceptibility(M)
			M.apply_damage(damage * weakness, BRUTE, damage_flags = DAM_DISPERSED)
			M.throw_at(get_target_turf(M), throw_range, speed)
			to_chat(M, SPAN_DANGER("A violent force explodes outward from \the [holder] and sends you flying!"))

		holder.visible_message(SPAN_WARNING("\The [holder] shines bright as it releases a wave of energy!"))
		playsound(get_turf(holder), "sound/magic/repulse.ogg", 100)

//returns a turf at a distance of 'throw_range' away from the artifact
/datum/artifact_effect/pushback/proc/get_target_turf(mob/M)
	if(holder)
		var/turf/step = get_step_away(M, holder, throw_range)

		if (!step)
			return get_turf(M)

		var/x = step.x
		var/y = step.y

		if (step.x < M.x)
			x = step.x - throw_range
		else if (step.x > M.x)
			x = step.x + throw_range

		if (step.y < M.y)
			y = step.y - throw_range
		else if (step.y > M.y)
			y = step.y + throw_range

		var/turf/T = locate(x, y, M.z)

		if (T)
			return T
		else
			return step