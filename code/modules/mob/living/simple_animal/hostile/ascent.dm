/mob/living/simple_animal/hostile/ascent_alate
	name = "alate"
	desc = "A mantid creature in light armor."
	icon = 'icons/mob/simple_animal/ascent_enemies.dmi'
	icon_state = "alate_armor"
	icon_living = "alate_armor"
	icon_dead = "alate_armor"
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	movement_cooldown = 2.5
	maxHealth = 500
	health = 500
	harm_intent_damage = 5
	can_escape = TRUE
	a_intent = I_HURT
	natural_weapon = /obj/item/natural_weapon/claws/strong
	unsuitable_atmos_damage = 0
	faction = "ascent"
	status_flags = CANPUSH

	ai_holder_type = /datum/ai_holder/simple_animal/humanoid/hostile/violent

	loot_list = list(/obj/effect/landmark/corpse/ascent_alate/armor = 1)

/mob/living/simple_animal/hostile/ascent_alate/death()
	. = ..()
	check_delete()

/mob/living/simple_animal/hostile/ascent_alate/ranged
	desc = "A mantid creature in light armor. They have a weird weapon in their \"hands\"."
	icon_state = "alate_armor_rifle"
	icon_living = "alate_armor_rifle"
	movement_cooldown = 4

	ranged = TRUE
	ranged_attack_cooldown = DEFAULT_ATTACK_COOLDOWN * 3
	ranged_burst_count = 3
	ranged_burst_delay = 2.5
	projectiletype = /obj/item/projectile/beam/particle
	projectile_dispersion = 1

	loot_list = list(
		/obj/effect/landmark/corpse/ascent_alate/armor = 1,
		/obj/item/gun/energy/particle = 1,
		)
