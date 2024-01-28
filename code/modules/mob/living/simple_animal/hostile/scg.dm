/mob/living/simple_animal/hostile/scg_explorer
	name = "\improper SCG explorer"
	desc = "An SCG explorer."
	icon = 'icons/mob/simple_animal/human_enemies.dmi'
	icon_state = "scg_explorer"
	icon_living = "scg_explorer"
	icon_dead = "scg_explorer"
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	movement_cooldown = 2.6
	maxHealth = 140
	health = 140
	harm_intent_damage = 5
	can_escape = TRUE
	a_intent = I_HURT
	natural_weapon = /obj/item/natural_weapon/punch
	min_gas = list()
	max_gas = list()
	unsuitable_atmos_damage = 0
	faction = "scg"
	status_flags = CANPUSH

	say_list_type = /datum/say_list/scg_explorer
	ai_holder_type = /datum/ai_holder/simple_animal/humanoid/hostile/threaten

	//loot_list = list(/obj/effect/landmark/corpse/scg_explorer = 1)

/datum/say_list/scg_explorer
	speak = list(
				"Hope we're not going to run into Terrans here...",
				"Wonder if there's more stuff around here...",
				"Guys? Did you find anything cool yet?",
				"Uhhh, ETD? When are we going back?",
				"Anyone seen some rechargers around here?",
				"Found anything?",
				)
	emote_see = list("whistles", "coughs", "looks around")

	say_understood = list("Alright.", "Yes.", "Got it.")
	say_cannot = list("No can do.", "No.", "Nope.")
	say_maybe_target = list("Hey, someone is here!", "Watch out, there's some movement.")
	say_got_target = list("Contact!", "In trouble!", "Attacking hostiles!")
	say_threaten = list("Hey-hey, you better leave.", "SCG operations. Better leave this place.", "That's no place for civilians, leave now.")
	say_stand_down = list("That's right, go.", "Uh-huh, no need to fight.")
	say_escalate = list("I take it you're here for a fight then!", "Well, don't say I didn't warn you!")

	say_help = list("Need help!", "I require assistance!")

	speak_sounds = list('sound/effects/radio_chatter.ogg' = 100)
	threaten_sound = 'sound/weapons/TargetOn.ogg'
	stand_down_sound = 'sound/weapons/TargetOff.ogg'

// This one starts with laser rifle. When out of "ammo" - discards it and uses machette
/mob/living/simple_animal/hostile/scg_explorer/armed
	desc = "An SCG explorer armed with basic laser rifle."
	icon_state = "scg_explorer_laser_wielded"
	icon_living = "scg_explorer_laser_wielded"

	ranged = TRUE
	ranged_attack_cooldown = DEFAULT_ATTACK_COOLDOWN
	projectiletype = /obj/item/projectile/beam/midlaser
	projectile_dispersion = 0.5

	needs_reload = TRUE
	reload_max = 10
	reload_time = 2 SECONDS
	reload_sound = 'sound/weapons/guns/selector.ogg'

	loot_list = list(
		/obj/item/gun/energy/laser = 1,
		/obj/item/material/hatchet/machete = 1,
		)

	/// Icon state when discarding the rifle
	var/icon_discard = "scg_explorer_laser"
	/// Icon state for "melee stance"
	var/icon_melee = "scg_explorer_sword"

/mob/living/simple_animal/hostile/scg_explorer/armed/try_reload()
	visible_message(SPAN_WARNING("[src] reaches for their backpack!"))
	icon_state = icon_discard
	. = ..()
	if(!.)
		return
	ranged = FALSE
	natural_weapon = /obj/item/material/hatchet/machete/unbreakable

	visible_message(SPAN_WARNING("\The [src] discards their rifle and pulls out a machette!"))
	icon_state = icon_melee
	icon_living = icon_melee

// Epic combat
/mob/living/simple_animal/hostile/scg_explorer/armed/hit_with_weapon(obj/item/O, mob/living/user, effective_force, hit_zone)
	if(O.force && !prob(user.get_skill_value(SKILL_COMBAT) * 15))
		visible_message(SPAN_DANGER("\The [src] parries [user]'s attack!"))
		attack_target(user)
		return
	return ..()

/mob/living/simple_animal/hostile/scg_explorer/armed/attack_hand(mob/living/carbon/human/user)
	if(prob(80) && icon_state == icon_melee)
		visible_message(SPAN_DANGER("\The [src] parries [user]'s attack!"))
		attack_target(user)
		return
	return ..()

/mob/living/simple_animal/hostile/scg_explorer/armed/DisarmEffect(mob/living/carbon/human/user)
	if(icon_state != initial(icon_state))
		return
	if(user.get_skill_value(SKILL_COMBAT) < SKILL_EXPERIENCED || prob(50))
		return
	reload_count = reload_max
	visible_message(SPAN_WARNING("\The [src] fumbles with their rifle!"))
