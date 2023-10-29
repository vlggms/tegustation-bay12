/datum/spell/end_of_everything
	name = "End of Everything"
	desc = "Forbidden art of summoning darkest energies from within the veil of magic itself. You are a part of \"everything\", so it might be a bad idea to do it..."
	invocation_type = INVOKE_SHOUT
	invocation = "Arcesso!"
	spell_flags = NEEDSCLOTHES
	charge_max = 2 MINUTES
	categories = list(SPELL_CATEGORY_FORBIDDEN)
	level_max = list(UPGRADE_TOTAL = 0, UPGRADE_SPEED = 0, UPGRADE_POWER = 0)
	cast_sound = 'sound/magic/churchbell.ogg'
	hud_state = "wiz_endall"

	spell_cost = 100
	mana_cost = 200

	var/list/active_effects = list()

/datum/spell/end_of_everything/Destroy()
	ClearEffects()
	return ..()

/datum/spell/end_of_everything/cast(list/targets, mob/user)
	if(!do_after(user, 10 SECONDS))
		to_chat(user, SPAN_NOTICE("You cancel the ritual!"))
		ClearEffects()
		return
	if(!CastCheck(user))
		to_chat(user, SPAN_NOTICE("You cancel the ritual!"))
		ClearEffects()
		return

	user.say("Interitus!")

	if(!do_after(user, 10 SECONDS))
		to_chat(user, SPAN_NOTICE("You cancel the ritual!"))
		ClearEffects()
		return
	if(!CastCheck(user))
		to_chat(user, SPAN_NOTICE("You cancel the ritual!"))
		ClearEffects()
		return

	user.say("Annihilatio!")

	if(!do_after(user, 10 SECONDS))
		to_chat(user, SPAN_NOTICE("You cancel the ritual!"))
		ClearEffects()
		return
	if(!CastCheck(user))
		to_chat(user, SPAN_NOTICE("You cancel the ritual!"))
		ClearEffects()
		return

	user.say("Mors et aegritudo!")

	if(!do_after(user, 10 SECONDS))
		to_chat(user, SPAN_NOTICE("You cancel the ritual!"))
		ClearEffects()
		return
	if(!CastCheck(user))
		to_chat(user, SPAN_NOTICE("You cancel the ritual!"))
		ClearEffects()
		return

	user.say("Cruel gods, end it all!!")
	to_chat(user, SPAN_WARNING("You feel like you should run..."))
	log_and_message_admins("finished casting [src] spell!", user)

	new /obj/effect/end_of_everything(get_turf(user))

/datum/spell/end_of_everything/proc/CastCheck(mob/user)
	if(!user || QDELETED(user))
		return FALSE
	if(user.stat)
		return FALSE
	return TRUE

/datum/spell/end_of_everything/proc/ClearEffects()
	for(var/datum/D in active_effects)
		qdel(D)
	active_effects = null

/obj/effect/end_of_everything
