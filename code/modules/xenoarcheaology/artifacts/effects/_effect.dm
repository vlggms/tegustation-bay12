/datum/artifact_effect
	var/name = "unknown effect"
	var/range = 4
	var/atom/holder
	var/pulse_tick = 0
	var/pulse_period = 10
	var/artifact_id = ""
	var/effect_type
	var/list/possible_effect_types = list()
	/// What activation methods artifact can have to roll for this effect
	var/list/acceptable_methods = list(
		ACTIVATE_TOUCH, ACTIVATE_SPEECH, ACTIVATE_TEMPERATURE, ACTIVATE_ATTACK, ACTIVATE_BULLET,
		ACTIVATE_LASER, ACTIVATE_BOMB, ACTIVATE_MOB_BUMP, ACTIVATE_WATER, ACTIVATE_CHEMICAL
		)
	var/activation_sound = 'sound/effects/psi/power_used.ogg'
	var/cooldown_time = 10
	var/toggled = FALSE
	var/on_time //time artifact should stay on for when toggled
	var/time_min_range = 50
	var/time_max_range = 200
	// Base value of this effect
	var/value = 0

/datum/artifact_effect/New(atom/artifact)
	..()
	if(artifact)
		holder = artifact

	//this will be replaced by the excavation code later, but it's here just in case
	artifact_id = "[pick("kappa","sigma","antaeres","beta","omicron","iota","epsilon","omega","gamma","delta","tau","alpha")]-[rand(100,999)]"

	//random charge time and distance
	switch(pick(100;1, 50;2, 25;3))
		if(1)
			//short range, short charge time
			pulse_period = rand(4, 8)
			range = rand(2, 4)
		if(2)
			//medium range, medium charge time
			pulse_period = rand(8, 16)
			range = rand(7, 14)
		if(3)
			//large range, long charge time
			pulse_period = rand(16, 28)
			range = rand(20, 40)

	if(!effect_type)
		effect_type = pick(possible_effect_types)

	if(!on_time)
		on_time = rand(time_min_range, time_max_range)
		switch(effect_type)
			if(EFFECT_AURA) // No need to keep it at specific values, but still should be high enough
				on_time = max(pulse_period*12, rand(time_min_range, time_max_range))
			if(EFFECT_PULSE) // Basically enough to do one or two pulses
				on_time = max(pulse_period*24, rand(time_min_range, time_max_range))

/datum/artifact_effect/proc/Activate(user)
	if(!toggled)
		addtimer(CALLBACK(src, /datum/artifact_effect/proc/toggle_off), on_time)
		if(activation_sound && holder)
			playsound(holder, activation_sound, 100)
		if(user && istype(user, /mob) && effect_type == EFFECT_TOUCH)
			var/mob/M = user
			DoEffect(M)
	toggled = !toggled
	if(holder)
		if(istype(holder, /obj/machinery/artifact))
			var/obj/machinery/artifact/A = holder
			A.icon_state = "ano[A.icon_num][toggled]"

		var/atom/toplevelholder = holder
		while(!isnull(toplevelholder.loc) && !istype(toplevelholder.loc, /turf))
			toplevelholder = toplevelholder.loc
		var/display_msg = pick("momentarily glows brightly!","distorts slightly for a moment!","flickers slightly!","vibrates!","shimmers slightly for a moment!")
		if(!toggled)
			display_msg = pick("grows dull!","fades in intensity!","suddenly becomes very still!","suddenly becomes very quiet!")
			toplevelholder.visible_message("<span class='notice'>[icon2html(toplevelholder, viewers(get_turf(toplevelholder)))] [toplevelholder] [display_msg]</span>")
		else
			toplevelholder.visible_message("<span class='warning'>[icon2html(toplevelholder, viewers(get_turf(toplevelholder)))] [toplevelholder] [display_msg]</span>")

/datum/artifact_effect/proc/DoEffect(mob/user) // Targeted effect

/datum/artifact_effect/proc/DoEffectAura(atom/holder) // Repeating aura effect

/datum/artifact_effect/proc/DoEffectPulse(atom/holder) // Charging pulse effect, similar to aura

/datum/artifact_effect/proc/UpdateMove()

/datum/artifact_effect/proc/getDescription()
	return "Unknown properties."

/datum/artifact_effect/proc/process()
	if(toggled)
		if(effect_type == EFFECT_AURA)
			DoEffectAura()
		else if(effect_type == EFFECT_PULSE)
			pulse_tick++
			if(pulse_tick >= pulse_period)
				pulse_tick = 0
				DoEffectPulse()

/datum/artifact_effect/proc/toggle_off()
	Activate(null)

//returns 0..1, with 1 being no protection and 0 being fully protected
/proc/GetAnomalySusceptibility(mob/living/carbon/human/H)
	if(!istype(H))
		return 1

	var/protected = 0

	//anomaly suits give best protection, but excavation suits are almost as good
	if(istype(H.back,/obj/item/rig/hazmat) || istype(H.back, /obj/item/rig/hazard))
		var/obj/item/rig/rig = H.back
		if(rig.suit_is_deployed() && !rig.offline)
			protected += 1

	if(istype(H.wear_suit,/obj/item/clothing/suit/bio_suit/anomaly))
		protected += 0.7
	else if(istype(H.wear_suit,/obj/item/clothing/suit/space/void/excavation))
		protected += 0.6

	if(istype(H.head,/obj/item/clothing/head/bio_hood/anomaly))
		protected += 0.3
	else if(istype(H.head,/obj/item/clothing/head/helmet/space/void/excavation))
		protected += 0.2

	//latex gloves and science goggles also give a bit of bonus protection
	if(istype(H.gloves,/obj/item/clothing/gloves/latex))
		protected += 0.1

	if(istype(H.glasses,/obj/item/clothing/glasses/science))
		protected += 0.1

	return 1 - protected

/datum/artifact_effect/proc/Value()
	return value
