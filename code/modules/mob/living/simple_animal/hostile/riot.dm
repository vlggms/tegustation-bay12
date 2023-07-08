/mob/living/simple_animal/hostile/riot_officer
	name = "riot officer"
	desc = "A human in heavy riot armor."
	icon = 'icons/mob/simple_animal/human_enemies.dmi'
	icon_state = "riot"
	icon_living = "riot"
	icon_dead = "riot"
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	movement_cooldown = 4
	maxHealth = 200
	health = 200
	harm_intent_damage = 5
	can_escape = TRUE
	a_intent = I_HURT
	natural_weapon = /obj/item/natural_weapon/punch
	unsuitable_atmos_damage = 15
	faction = "riot_officer"
	status_flags = CANPUSH

	ai_holder_type = /datum/ai_holder/simple_animal/humanoid/hostile/violent

	loot_list = list(/obj/effect/landmark/corpse/riot_officer = 1)

/mob/living/simple_animal/hostile/riot_officer/death()
	. = ..()
	check_delete()

/mob/living/simple_animal/hostile/riot_officer/baton
	icon_state = "riot_baton"
	icon_living = "riot_baton"
	desc = "A human in heavy riot armor. They are wielding a stun baton."
	natural_weapon = /obj/item/melee/baton
	loot_list = list(
		/obj/effect/landmark/corpse/riot_officer = 1,
		/obj/item/melee/baton = 1,
		)

/mob/living/simple_animal/hostile/riot_officer/baton/shield
	icon_state = "riot_baton_shield"
	icon_living = "riot_baton_shield"
	desc = "A human in heavy riot armor. They are wielding a stun baton and a riot shield."
	maxHealth = 400
	health = 400
	loot_list = list(
		/obj/effect/landmark/corpse/riot_officer = 1,
		/obj/item/melee/baton = 1,
		/obj/item/shield/riot = 1,
		)

/mob/living/simple_animal/hostile/riot_officer/ranged
	desc = "A human in heavy riot armor. They are wielding an assault rifle."
	icon_state = "riot_rifle_wielded"
	icon_living = "riot_rifle_wielded"
	ranged = TRUE
	ranged_attack_cooldown = DEFAULT_ATTACK_COOLDOWN * 2
	ranged_burst_count = 4
	ranged_burst_delay = 1.5
	projectiletype = /obj/item/projectile/bullet/rifle/m16
	projectilesound = 'sound/weapons/gunshot/m16.ogg'
	projectile_dispersion = 5

	needs_reload = TRUE
	reload_max = 25
	reload_time = 3 SECONDS
	reload_sound = 'sound/weapons/guns/interaction/batrifle_magin.ogg'
	casingtype = /obj/item/ammo_casing/rifle
	casing_disappears = 5 SECONDS
	loot_list = list(
		/obj/effect/landmark/corpse/riot_officer = 1,
		/obj/item/gun/projectile/automatic/assault_rifle = 1,
		)

	/// Icon state when attempting to reload
	var/icon_reload = "riot_rifle"

/mob/living/simple_animal/hostile/riot_officer/ranged/try_reload()
	icon_state = icon_reload
	. = ..()
	if(!.)
		return
	visible_message(SPAN_WARNING("[src] inserts new magazine into the rifle."))
	icon_state = icon_living
