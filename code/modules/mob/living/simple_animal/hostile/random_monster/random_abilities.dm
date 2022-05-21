/datum/random_ability
	var/name = "random ability"
	/// If it isn't empty - the random monster will have a chance to pick this name
	var/added_name = null
	/// Cooldown time for that ability
	var/cooldown_time = 0
	/// Current cooldown...
	var/current_cooldown = 0

	/// Added/Removed health from this ability
	var/health_mod = 0
	/// Added/Removed speed
	var/speed_mod = 0

/datum/random_ability/proc/perform(mob/living/user, atom/target)
	current_cooldown = world.time + cooldown_time

/datum/random_ability/proc/CanUse(mob/living/user)
	if(current_cooldown > world.time)
		return FALSE
	return TRUE

/datum/random_ability/leap
	name = "leap"
	added_name = "jumping alien"
	cooldown_time = 5 SECONDS
	var/leap_delay = 5
	var/leap_range = 5
	var/leap_sound = 'sound/weapons/spiderlunge.ogg'

/datum/random_ability/leap/perform(mob/living/user, atom/target)
	..()
	user.do_windup_animation(target, leap_delay)
	addtimer(CALLBACK(src, .proc/do_leap, user, target), leap_delay)

/datum/random_ability/leap/proc/do_leap(mob/living/user, atom/target)
	// Do the actual leap.
	user.status_flags |= LEAPING // Lets us pass over everything.
	user.visible_message(SPAN_DANGER("\The [user] leaps at \the [target]!"))
	user.throw_at(get_step(get_turf(target), get_turf(user)), leap_range, 1, user)
	playsound(user, leap_sound, 75, 1)

	addtimer(CALLBACK(src, .proc/end_leap, user, target), 5)

/datum/random_ability/leap/proc/end_leap(mob/living/user, atom/target)
	if(user.status_flags & LEAPING)
		user.status_flags &= ~LEAPING // Revert special passage ability.

	var/turf/T = get_turf(user)

	// Now for the stun.
	var/mob/living/victim = null
	for(var/mob/living/L in T) // So player-controlled spiders only need to click the tile to stun them.
		if(L == user)
			continue

		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.check_shields(damage = 0, damage_source = user, attacker = user, def_zone = null, attack_text = "the leap"))
				continue // We were blocked.

		victim = L
		break

	if(victim)
		victim.Weaken(2)
		victim.visible_message(SPAN_DANGER("\The [user] knocks down \the [victim]!"))
		to_chat(victim, "<span class='critical'>\The [user] jumps on you!</span>")

/datum/random_ability/leap/CanUse(mob/living/user)
	. = ..()
	if(.)
		return user.check_solid_ground()
	return FALSE

/datum/random_ability/spit
	name = "spit"
	added_name = "venomous alien"
	speed_mod = 1 // Slightly slower
	cooldown_time = 6 SECONDS
	var/spit_amount = 3
	var/spit_delay = 2
	var/spit_sound = 'sound/effects/splat.ogg'
	var/obj/item/projectile/spit_type = /obj/item/projectile/energy/plasmastun/weak

/datum/random_ability/spit/New()
	spit_amount = rand(2,6)
	spit_delay = spit_amount * pick(0.75, 1, 1.25)
	cooldown_time = rand(4 SECONDS, 8 SECONDS)

/datum/random_ability/spit/perform(mob/living/user, atom/target)
	..()
	user.visible_message(SPAN_DANGER("\The [user] spits at \the [target]!"))
	for(var/i=0 to spit_amount)
		addtimer(CALLBACK(src, .proc/do_spit, user, target), i*spit_delay)

/datum/random_ability/spit/proc/do_spit(mob/living/user, atom/target)
	playsound(user, spit_sound, 75, 1)
	var/obj/item/projectile/P = new spit_type(user.loc)
	var/turf/T = get_turf(target)
	if(istype(P) && T && user)
		var/selected_zone = pick(BP_ALL_LIMBS)
		P.launch(T, selected_zone, user)

/datum/random_ability/teleport
	name = "teleport"
	added_name = "unstable alien"
	cooldown_time = 5 SECONDS

/datum/random_ability/teleport/New()
	cooldown_time = rand(3 SECONDS, 8 SECONDS)

/datum/random_ability/teleport/perform(mob/living/user, atom/target)
	..()
	user.visible_message(SPAN_DANGER("\The [user] suddenly teleports!"))
	var/turf/current = get_turf(user)
	new /obj/effect/sparks(current)
	var/turf/T = get_turf(target)
	new /obj/effect/sparks(T)
	user.forceMove(T)
