/datum/spell/aimed/heal_target
	name = "Cure Light Wounds"
	desc = "A rudimentary spell used mainly by wizards to heal papercuts. Does not require wizard garb."
	charge_max = 20 SECONDS
	invocation = "Di'Nath!"
	invocation_type = INVOKE_SHOUT
	level_max = list(UPGRADE_TOTAL = 2, UPGRADE_SPEED = 1, UPGRADE_POWER = 2)

	cooldown_reduc = 50
	hud_state = "heal_minor"
	cast_sound = 'sound/magic/staff_healing.ogg'

	/// Maximum distance between user and target
	var/use_range = 3
	var/brute_damage = -15
	var/burn_damage = -5
	var/tox_damage = 0
	var/oxy_damage = 0
	var/rad_damage = 0
	var/robo_damage = -4
	var/organ_heal = 0
	var/blood_heal = 0
	var/brain_damage = 0
	var/effect_state = "green_sparkles"
	var/effect_duration = 5
	var/effect_color = "#ffffff"

	// Vars expect a constant at compile time, so we can't use macros for spans here
	message = "<span class='notice'><b>You feel a pleasant rush of heat move through your body.</b></span>"

	categories = list(SPELL_CATEGORY_HEALING)
	spell_cost = 1
	mana_cost = 3

/datum/spell/aimed/heal_target/TargetCastCheck(mob/living/user, mob/living/target)
	if(!isliving(target))
		to_chat(user, SPAN_WARNING("The target must be a living creature!"))
		return FALSE
	if(get_dist(user, target) > use_range)
		to_chat(user, SPAN_WARNING("The target is too far away!"))
		return FALSE
	return ..()

/datum/spell/aimed/heal_target/fire_projectile(mob/living/user, mob/living/target)
	target.adjustBruteLoss(brute_damage)
	target.adjustFireLoss(burn_damage)
	target.adjustToxLoss(tox_damage)
	target.adjustOxyLoss(oxy_damage)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		for(var/obj/item/organ/internal/affecting in H.internal_organs)
			if(affecting && istype(affecting))
				affecting.heal_damage(organ_heal, organ_heal)
		for(var/obj/item/organ/external/affecting in H.organs)
			if(affecting && istype(affecting))
				var/dam = BP_IS_ROBOTIC(affecting) ? -robo_damage : organ_heal
				affecting.heal_damage(dam, dam, robo_repair = BP_IS_ROBOTIC(affecting))
		H.vessel.add_reagent(/datum/reagent/blood, blood_heal)
		H.adjustBrainLoss(brain_damage)
		H.radiation += min(H.radiation, rad_damage)
		H.fixblood()
	target.regenerate_icons()

	if(effect_state)
		var/obj/o = new /obj/effect/temp_visual/temporary(get_turf(target), effect_duration, 'icons/effects/effects.dmi', effect_state)
		o.color = effect_color

	return TRUE

/datum/spell/aimed/heal_target/empower_spell()
	if(!..())
		return FALSE
	brute_damage -= 15
	burn_damage -= 15
	robo_damage -= 7
	return "[src] will now heal more."

// Admin subtype
/datum/spell/aimed/heal_target/tower
	name = "Instant Cure Light Wounds"
	charge_max = 2
	spell_book_visible = FALSE

/datum/spell/aimed/heal_target/touch
	name = "Healing Touch"
	desc = "Heals an adjacent target for a reasonable amount of health."
	use_range = 1
	brute_damage = -7
	burn_damage = -7
	robo_damage = -3
	charge_max = 10 SECONDS
	invocation = "Di'Na!"

	hud_state = "heal_touch"

/datum/spell/aimed/heal_target/major
	name = "Cure Major Wounds"
	desc = "A spell used to fix others that cannot be fixed with regular medicine."
	charge_max = 30 SECONDS
	spell_flags = NEEDSCLOTHES
	invocation = "Borv Di'Nath!"
	use_range = 1
	level_max = list(UPGRADE_TOTAL = 2, UPGRADE_SPEED = 1, UPGRADE_POWER = 1)
	cooldown_reduc = 100
	hud_state = "heal_major"

	brute_damage = -75
	burn_damage  = -50
	robo_damage = -10
	blood_heal = 28

	message = "<span class='notice'><b>Your body feels like a warm, cozy fire.</b></span>"

	spell_cost = 2
	mana_cost = 12

/datum/spell/aimed/heal_target/major/empower_spell()
	if(!..())
		return FALSE

	brute_damage = -35
	burn_damage = -35
	robo_damage = -15
	blood_heal = 28
	organ_heal = 5
	brain_damage = -5
	rad_damage  = -25
	tox_damage = -20
	oxy_damage = -14

	return "[src] heals more, and heals organ damage and radiation."

// Admin subtype
/datum/spell/aimed/heal_target/major/tower
	charge_max = 1
	spell_flags = 0
	spell_book_visible = FALSE

/datum/spell/aimed/heal_target/sacrifice
	name = "Sacrifice"
	desc = "This spell heals immensily. For a price. Does not require wizard garb."
	invocation = "Ei'Nath Borv Di'Nath!"
	charge_type = SPELL_HOLDVAR
	holder_var_type = "fireloss"
	holder_var_amount = 100
	level_max = list(UPGRADE_TOTAL = 1, UPGRADE_SPEED = 0, UPGRADE_POWER = 1)

	use_range = 1
	brute_damage = -1000
	burn_damage = -1000
	robo_damage = -1000
	oxy_damage = -100
	tox_damage = -100
	blood_heal  = 280
	effect_color = "#ff0000"

	hud_state = "gen_dissolve"
	cast_sound = 'sound/magic/disintegrate.ogg'

	spell_cost = 3
	mana_cost = 20

/datum/spell/aimed/heal_target/sacrifice/empower_spell()
	if(!..())
		return 0

	organ_heal = 50
	brain_damage  = -50
	rad_damage  = -1000

	return "You will now heal organ and brain damage, as well as virtually purge all radiation."

/datum/spell/aimed/heal_target/trance
	name = "Trance"
	desc = "A mighty spell of restoration that briefly forces its target into a deep, dreamless sleep, rapidly repairing their body and soul as their senses are dulled. The users of this mighty art are known for being short lived, slowly devolving into raving madness as the power they once relied on fails them with excessive use."
	invocation = "Di' Dae Nath!"
	charge_max = 2 MINUTES

	use_range = 1
	brute_damage = -1000
	burn_damage = -1000
	oxy_damage = -100
	tox_damage = -100
	robo_damage = -1000
	hud_state = "trance"
	var/obj/effect/effect

	spell_cost = 4
	mana_cost = 30

/datum/spell/aimed/heal_target/trance/fire_projectile(mob/living/user, mob/living/target)
	var/time = min(30 SECONDS, (target.getBruteLoss() + target.getFireLoss()) * 20)
	. = ..()
	var/turf/T = get_turf(target)
	effect = new /obj/effect/rift(T)
	effect.color = "f0e68c"
	target.forceMove(effect)
	target.status_flags &= GODMODE
	to_chat(target, SPAN_NOTICE("You will be in stasis for [time/10] second\s."))
	addtimer(CALLBACK(src, .proc/CancelRift), time)

/datum/spell/aimed/heal_target/trance/Destroy()
	CancelRift()
	return ..()

/datum/spell/aimed/heal_target/trance/proc/CancelRift()
	if(effect)
		var/mob/living/L = locate() in effect
		L.status_flags &= ~GODMODE
		L.forceMove(get_turf(L))
		charge_max += 300
		QDEL_NULL(effect)

/obj/effect/rift
	name = "rift"
	desc = "a tear in space and time."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "rift"
	unacidable = TRUE
	anchored = TRUE
	density = FALSE

/obj/effect/rift/Destroy()
	for(var/o in contents)
		var/atom/movable/M = o
		M.dropInto(loc)
	. = ..()

/datum/spell/aimed/revoke_death
	name = "Revoke Death"
	desc = "Revoke that of death itself. Comes at a cost that may be hard to manage for some."

	charge_type = SPELL_CHARGES
	charge_max = 1
	invocation = "Di Le Nal Yen Nath!"
	invocation_type = INVOKE_SHOUT
	hud_state = "heal_revoke"

	categories = list(SPELL_CATEGORY_HEALING, SPELL_CATEGORY_FORBIDDEN)
	spell_cost = 5
	mana_cost = 25

	var/use_range = 1

/datum/spell/aimed/revoke_death/TargetCastCheck(mob/living/user, mob/living/target)
	if(!isliving(target))
		to_chat(user, SPAN_WARNING("The target must be a living creature!"))
		return FALSE
	if(get_dist(user, target) > use_range)
		to_chat(user, SPAN_WARNING("The target is too far away!"))
		return FALSE
	if(!alert(user, "Are you sure?", "Alert", "Yes", "No") == "Yes" || !alert(user, "Are you ABSOLUTELY SURE?", "Alert", "Absolutely!", "No") == "Absolutely!")
		return FALSE
	if(QDELETED(target))
		return FALSE
	if(target.stat != DEAD)
		to_chat(user, SPAN_NOTICE("\The [target] is not dead..."))
		return FALSE
	return ..()

/datum/spell/aimed/revoke_death/fire_projectile(mob/living/user, mob/living/target)
	target.rejuvenate()
	if(!target.client)
		addtimer(CALLBACK(src,.proc/CheckForRevoke, target), 30 SECONDS)
	else
		RevokeSpells()

/datum/spell/aimed/revoke_death/proc/CheckForRevoke(mob/living/target)
	if(target.client)
		RevokeSpells()
		return
	target.death()
	charge_counter = charge_max
	to_chat(holder, SPAN_NOTICE("\The [src] refreshes as it seems it could not bring back the soul of [target.real_name]."))

/datum/spell/aimed/revoke_death/proc/RevokeSpells()
	if(!istype(holder, /mob/living))
		return
	var/mob/living/M = holder
	to_chat(M, SPAN_USERDANGER("The burden of twisting the fate itself is too heavy for you. You lose your magic powers!"))
	if(M.mind)
		for(var/s in M.mind.learned_spells)
			if(istype(s, /datum/spell/toggle_armor)) //Can keep the armor n junk.
				continue
			M.remove_spell(s)
	for(var/a in M.auras)
		M.remove_aura(a)
