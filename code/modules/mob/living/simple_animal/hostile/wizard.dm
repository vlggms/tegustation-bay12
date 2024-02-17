/mob/living/simple_animal/hostile/wizard
	name = "wizard"
	desc = "A wizard in blue robes."
	icon = 'icons/mob/simple_animal/human_enemies.dmi'
	icon_state = "wizard_blue"
	icon_living = "wizard_blue"
	icon_dead = "wizard_blue"
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	movement_cooldown = 2.5
	maxHealth = 70
	health = 70
	harm_intent_damage = 5
	can_escape = TRUE
	a_intent = I_HURT
	natural_weapon = /obj/item/natural_weapon/punch
	unsuitable_atmos_damage = 15
	faction = "wizard"
	status_flags = CANPUSH

	ai_holder_type = /datum/ai_holder/simple_animal/humanoid/hostile

	loot_list = list(/obj/effect/landmark/corpse/wizard_blue = 1)

	// Mostly for stuff like mana steal and anti-magic stuff
	var/datum/mana/mana = new()

/mob/living/simple_animal/hostile/wizard/Initialize()
	. = ..()
	mana.mana_level_max = 100
	mana.mana_level = mana.mana_level_max
	mana.mana_recharge_speed = 2
	mana.spell_points = 0

/mob/living/simple_animal/hostile/wizard/fireball
	ranged = TRUE
	ranged_attack_cooldown = DEFAULT_ATTACK_COOLDOWN * 5
	projectiletype = /obj/item/projectile/fireball
	projectilesound = 'sound/magic/fireball.ogg'
	projectile_dispersion = 1

/mob/living/simple_animal/hostile/wizard/fireball/shoot_target(atom/A)
	if(!mana.UseMana(15))
		return
	. = ..()
	if(!.)
		return

	var/say_text = "ONI SOMA![prob(50 ? "!" : "")]"
	if(prob(50))
		say_text = replacetext(say_text," ","`")
	say(say_text)
