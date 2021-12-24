#define ACTIVATE_TOUCH "touch"
#define ACTIVATE_SPEECH "speech"
#define ACTIVATE_TEMPERATURE "temperature"
#define ACTIVATE_ATTACK "attack"
#define ACTIVATE_BULLET "bullet"
#define ACTIVATE_LASER "laser"
#define ACTIVATE_BOMB "bomb"
#define ACTIVATE_MOB_BUMP "bumping"
#define ACTIVATE_WATER "water"
#define ACTIVATE_CHEMICAL "chemical"

/obj/machinery/artifact
	name = "alien artifact"
	desc = "A large alien device."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = null
	density = TRUE
	waterproof = FALSE
	var/icon_num = 0
	var/datum/artifact_effect/effect = null
	var/cooldown
	var/activation_method
	var/list/possible_methods = list(
								ACTIVATE_TOUCH, ACTIVATE_SPEECH, ACTIVATE_TEMPERATURE, ACTIVATE_ATTACK, ACTIVATE_BULLET,
								ACTIVATE_LASER, ACTIVATE_BOMB, ACTIVATE_MOB_BUMP, ACTIVATE_WATER, ACTIVATE_CHEMICAL
								)
	var/attack_activation_force = 10 // Minimum force to activate if method is attack
	var/temperature_activation_required = 0 // Temperature required to activate if method is temperature
	var/temperature_activation_direction = FALSE // If false - must be below, if true - above.
	var/list/chemical_activation_reagents = list() // What reagents can activate it, if method is chemical
	var/chemical_activation_name = null // The group name of reagents needed for chemical activation
	var/stasis = 0
	var/being_used

/obj/machinery/artifact/Initialize()
	. = ..()
	if(!activation_method)
		activation_method = pick(possible_methods)
		switch(activation_method)
			if(ACTIVATE_TEMPERATURE)
				temperature_activation_direction = pick(FALSE, TRUE)
				switch(temperature_activation_direction)
					if(FALSE)
						temperature_activation_required = rand(5, 200)
					if(TRUE)
						temperature_activation_required = rand(250, 2000)
			if(ACTIVATE_ATTACK)
				attack_activation_force = rand(8, 20)
			if(ACTIVATE_CHEMICAL)
				chemical_activation_name = pick("water", "acid", "volatile", "toxin")
				switch(chemical_activation_name)
					if("water")
						chemical_activation_reagents = list(
							/datum/reagent/water,
							/datum/reagent/water/boiling,
							/datum/reagent/drink/ice)
					if("acid")
						chemical_activation_reagents = list(
							/datum/reagent/acid/sulphuric,
							/datum/reagent/acid/polytrinic,
							/datum/reagent/diethylamine)
					if("volatile")
						chemical_activation_reagents = list(
							/datum/reagent/toxin/phoron,
							/datum/reagent/thermite,
							/datum/reagent/fuel)
					if("toxin")
						chemical_activation_reagents = list(
							/datum/reagent/toxin,
							/datum/reagent/toxin/cyanide,
							/datum/reagent/toxin/amatoxin,
							/datum/reagent/toxin/venom,
							/datum/reagent/toxin/chlorine)

	InitAppearance()
	InitEffects()

/obj/machinery/artifact/proc/InitAppearance()
	if(!icon_state)
		icon_num = rand(0, 13)
		icon_state = "ano[icon_num]0"
		switch(icon_num)
			if(1, 7, 8, 12)
				name = "large crystal"
				desc = pick("It shines faintly as it catches the light.",
				"It appears to have a faint inner glow.",
				"It seems to draw you inward as you look it at.",
				"Something twinkles faintly as you look at it.",
				"It's mesmerizing to behold.")
			if(9, 13)
				name = "alien computer"
				desc = "It is covered in strange markings."
			if(10)
				name = "alien machine"
				desc = "A large alien device, there appear to be some kind of vents in the side."
			if(11)
				name = "sealed alien pod"
				desc = "A strange alien device."

/obj/machinery/artifact/proc/InitEffects()
	if(!effect)
		var/chosen_type = pick(subtypesof(/datum/artifact_effect))
		effect = new chosen_type(src)
	else
		effect = new effect(src)
	if(!(activation_method in effect.acceptable_methods))
		activation_method = pick(effect.acceptable_methods)
	return TRUE

/obj/machinery/artifact/Destroy()
	QDEL_NULL(effect)
	. = ..()

/obj/machinery/artifact/examine(mob/user)
	. = ..()
	if(stasis)
		to_chat(user, "\The [src] is currently kept in a state of stasis.")

/obj/machinery/artifact/proc/Activation(user, method)
	if(method != activation_method)
		return FALSE
	if(cooldown > world.time)
		return TRUE // For explosive act
	if(stasis)
		return TRUE
	if(effect.toggled)
		return TRUE
	if(!user) // For bomb/water activation methods with singular effects
		var/list/mobs_around = mobs_in_view(7, src)
		if(LAZYLEN(mobs_around))
			var/potential_mob = pick(mobs_in_view(7, src))
			if(potential_mob)
				user = potential_mob
	cooldown = world.time + effect.cooldown_time
	effect.Activate(user)

/obj/machinery/artifact/proc/DoEffect(user)
	if(cooldown > world.time)
		return
	if(stasis)
		return
	if(effect)
		effect.DoEffect(user)

/obj/machinery/artifact/Process()
	var/turf/T = loc
	if(!istype(T)) // We're inside a container or on null turf, either way stop processing effects
		return

	if(stasis) // Either in an anomaly container or otherwise kept in stasis
		return

	var/datum/gas_mixture/env = T.return_air()
	if(env)
		if(temperature_activation_direction && env.temperature > temperature_activation_required)
			Activation(null, ACTIVATE_TEMPERATURE)
		else if(!temperature_activation_direction && env.temperature < temperature_activation_required)
			Activation(null, ACTIVATE_TEMPERATURE)

	if(effect)
		effect.process()

/obj/machinery/artifact/attack_robot(mob/living/user)
	if(!CanPhysicallyInteract(user))
		return
	Activation(user, ACTIVATE_TOUCH)
	if(effect.toggled && effect.effect_type == EFFECT_TOUCH)
		DoEffect(user)

/obj/machinery/artifact/attack_hand(mob/living/user)
	. = ..()
	visible_message("[user] touches \the [src].")
	Activation(user, ACTIVATE_TOUCH)
	if(effect.toggled && effect.effect_type == EFFECT_TOUCH)
		DoEffect(user)

/obj/machinery/artifact/attackby(obj/item/W, mob/living/user)
	if(istype(W, /obj/item/device/ano_scanner))
		playsound(user, 'sound/effects/fastbeep.ogg', 20)
		user.visible_message(
			SPAN_NOTICE("\The [user] scans \the [src] with \the [W]."),
			SPAN_NOTICE("You scan \the [W] with \the [src]."),
			SPAN_ITALIC("You hear two fast beeps.")
		)
		if(user.skill_check(SKILL_SCIENCE, SKILL_TRAINED))
			if(activation_method in list(ACTIVATE_TOUCH, ACTIVATE_ATTACK, ACTIVATE_MOB_BUMP, ACTIVATE_BULLET, ACTIVATE_LASER))
				to_chat(user, SPAN_NOTICE("- The surface of [src] is highly susceptible to physical impacts."))
				return
			if(activation_method in list(ACTIVATE_BOMB, ACTIVATE_SPEECH, ACTIVATE_WATER))
				to_chat(user, SPAN_NOTICE("- The surface of [src] is highly susceptible to various vibrations."))
				return
		if(user.skill_check(SKILL_ATMOS, SKILL_TRAINED) && activation_method == ACTIVATE_TEMPERATURE)
			if(user.skill_check(SKILL_ATMOS, SKILL_EXPERIENCED))
				to_chat(user, SPAN_NOTICE("- The surface of [src] is susceptible to [temperature_activation_direction ? "high" : "low"] temperatures."))
				return
			to_chat(user, SPAN_NOTICE("- The surface of [src] is susceptible to certain temperatures."))
			return
		if(user.skill_check(SKILL_CHEMISTRY, SKILL_TRAINED) && activation_method == ACTIVATE_CHEMICAL)
			to_chat(user, SPAN_NOTICE("- The surface of [src] is susceptible to certain chemical reactions."))
			return
		to_chat(user, SPAN_WARNING("But can't comprehend the scan results..."))
		return

	visible_message("[user] hits \the [src] with \the [W].")
	if(W.force >= attack_activation_force)
		Activation(user, ACTIVATE_ATTACK)
		if(effect.toggled && effect.effect_type == EFFECT_TOUCH)
			DoEffect(user)
	if(istype(W, /obj/item/reagent_containers))
		for(var/reagent in chemical_activation_reagents)
			if(W.reagents.remove_reagent(reagent, 5))
				Activation(user, ACTIVATE_CHEMICAL)
				break

/obj/machinery/artifact/Bumped(M)
	. = ..()
	if(istype(M, /mob/living))
		var/mob/living/user = M
		Activation(user, ACTIVATE_MOB_BUMP)
		if(effect.toggled && effect.effect_type == EFFECT_TOUCH)
			DoEffect(user)

/obj/machinery/artifact/bullet_act(obj/item/projectile/P)
	. = ..()
	if(P.damage_type == BRUTE)
		Activation(P.firer, ACTIVATE_BULLET)
	else if(P.damage_type == BURN)
		Activation(P.firer, ACTIVATE_LASER)

/obj/machinery/artifact/ex_act(severity)
	if(Activation(null, ACTIVATE_BOMB))
		return
	switch(severity)
		if(1)
			qdel(src)
		if(2)
			if (prob(50))
				qdel(src)

/obj/machinery/artifact/Move()
	..()
	effect.UpdateMove()
	if(pulledby && (activation_method == ACTIVATE_TOUCH) && prob(10)) // Pulling it is safer than directly touching
		visible_message("[pulledby] accidentally touches \the [src] while pulling it.")
		Activation(pulledby, ACTIVATE_TOUCH)

/obj/machinery/artifact/water_act(depth)
	Activation(null, ACTIVATE_WATER)

/obj/machinery/artifact/hear_talk(mob/M as mob, text, verb, datum/language/speaking)
	Activation(M, ACTIVATE_SPEECH)
