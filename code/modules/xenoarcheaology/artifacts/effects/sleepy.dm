/datum/artifact_effect/sleepy
	name = "sleepy"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA, EFFECT_PULSE)
	cooldown_time = 50
	value = 3000

/datum/artifact_effect/sleepy/getDescription()
	return "May induce temporary sense of harmony and peace in its targets."

/datum/artifact_effect/sleepy/DoEffect(var/mob/living/toucher)
	if(istype(toucher))
		var/weakness = GetAnomalySusceptibility(toucher)
		if(toucher.isSynthetic())
			to_chat(toucher, SPAN_WARNING("SYSTEM ALERT: CPU cycles slowing down."))
			return 1
		else if(ishuman(toucher) && prob(weakness * 100))
			var/mob/living/carbon/human/H = toucher
			to_chat(H, pick("<span class='notice'>You feel like taking a nap.</span>","<span class='notice'>You feel a yawn coming on.</span>","<span class='notice'>You feel a little tired.</span>"))
			H.drowsyness = min(H.drowsyness + rand(5,25) * weakness, 50 * weakness)
			H.eye_blurry = min(H.eye_blurry + rand(1,3) * weakness, 50 * weakness)
			return 1

/datum/artifact_effect/sleepy/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/mob/living/carbon/human/H in range(range,T))
			if(H.isSynthetic())
				to_chat(H, SPAN_WARNING("SYSTEM ALERT: CPU cycles slowing down."))
				continue
			var/weakness = GetAnomalySusceptibility(H)
			if(prob(weakness * 100))
				if(prob(10))
					to_chat(H, pick("<span class='notice'>You feel like taking a nap.</span>","<span class='notice'>You feel a yawn coming on.</span>","<span class='notice'>You feel a little tired.</span>"))
				H.drowsyness = min(H.drowsyness + 1 * weakness, 25 * weakness)
				H.eye_blurry = min(H.eye_blurry + 1 * weakness, 25 * weakness)
		for (var/mob/living/silicon/robot/R in range(range, holder))
			to_chat(R, "<span class='warning'>SYSTEM ALERT: CPU cycles slowing down.</span>")
		return 1

/datum/artifact_effect/sleepy/DoEffectPulse()
	if(holder)
		if(activation_sound)
			playsound(holder, activation_sound, 100)
		var/turf/T = get_turf(holder)
		for(var/mob/living/carbon/human/H in range(src.range, T))
			var/weakness = GetAnomalySusceptibility(H)
			if(prob(weakness * 100))
				to_chat(H, pick("<span class='notice'>You feel like taking a nap.</span>","<span class='notice'>You feel a yawn coming on.</span>","<span class='notice'>You feel a little tired.</span>"))
				H.drowsyness = min(H.drowsyness + rand(5,15) * weakness, 50 * weakness)
				H.eye_blurry = min(H.eye_blurry + rand(5,15) * weakness, 50 * weakness)
		for (var/mob/living/silicon/robot/R in range(range, holder))
			to_chat(R, "<span class='warning'>SYSTEM ALERT: CPU cycles slowing down.</span>")
		return 1
