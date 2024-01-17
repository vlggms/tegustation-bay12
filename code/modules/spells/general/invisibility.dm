/datum/spell/invisibility
	name = "invisibility"
	desc = "A simple spell of invisibility, for when you really just can't afford a paper bag."
	spell_flags = 0
	charge_max = 100
	invocation = "Ror Rim Or!"
	invocation_type = INVOKE_SHOUT
	hud_state = "invisibility"

	spell_cost = 1
	mana_cost = 5

	var/on = FALSE
	var/duration = 30 SECONDS

/datum/spell/invisibility/choose_targets(mob/user = usr)
	if(istype(holder, /mob/living/carbon/human))
		perform(user, holder)

/datum/spell/invisibility/cast(mob/living/carbon/human/H, mob/user)
	on = !on
	if(on)
		if(H.add_cloaking_source(src))
			playsound(get_turf(H), 'sound/effects/teleport.ogg', 90, 1)
			H.mutations |= MUTATION_CLUMSY
			addtimer(CALLBACK(src, .proc/ToggleOffTimed, H), duration * 0.9)
		return
	ToggleOff(H)

/datum/spell/invisibility/proc/ToggleOffTimed(mob/living/carbon/human/H)
	if(!on)
		return
	to_chat(H, SPAN_DANGER("You are about to turn visible again!"))
	addtimer(CALLBACK(src, .proc/ToggleOff, H), duration * 0.1)

/datum/spell/invisibility/proc/ToggleOff(mob/living/carbon/human/H)
	if(H.remove_cloaking_source(src))
		playsound(get_turf(H), 'sound/effects/stealthoff.ogg', 90, 1)
		H.mutations -= MUTATION_CLUMSY
