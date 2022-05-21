// A random hostile mob that will receive equally random abiltiies(from a list)
/mob/living/simple_animal/hostile/random_monster
	name = "random monster" // Generated on Initialize
	desc = "Woah, a monster! So random..." // Same here

	icon = 'icons/mob/simple_animal/spider.dmi'
	icon_state = "green"
	icon_living = "green"
	icon_dead = "green_dead"

	faction = "hostile"
	maxHealth = 100
	health = 100

	movement_cooldown = 5

	special_attack_min_range = 0
	special_attack_max_range = 14
	special_attack_cooldown = 10

	natural_weapon = /obj/item/natural_weapon/bite/spider

	var/list/potential_abilities = list()
	var/list/abilities = list()
	/// How much abilities we can roll for
	var/abilities_amount = 2

/* Initializations */
/mob/living/simple_animal/hostile/random_monster/Initialize()
	. = ..()
	InitAbilities()
	InitName()
	InitStats()

/mob/living/simple_animal/hostile/random_monster/proc/InitAbilities()
	if(!LAZYLEN(potential_abilities))
		potential_abilities = subtypesof(/datum/random_ability)
	for(var/i=1 to abilities_amount)
		if(!LAZYLEN(potential_abilities))
			break
		var/datum/random_ability/choice = pick(potential_abilities)
		abilities += new choice
		potential_abilities -= choice

/mob/living/simple_animal/hostile/random_monster/proc/InitName()
	var/list/name_list = list()
	for(var/datum/random_ability/ra in abilities)
		if(ra.added_name)
			name_list += ra.added_name
	if(!LAZYLEN(name_list))
		name_list += "alien monster"
	name = pick(name_list)
	desc = "A rare kind of monster. So rare, that you, in fact, don't even know what it really does."

/mob/living/simple_animal/hostile/random_monster/proc/InitStats()
	for(var/datum/random_ability/ra in abilities)
		maxHealth += ra.health_mod
		speed += ra.speed_mod

/* Using abilities */
/mob/living/simple_animal/hostile/random_monster/do_special_attack(atom/A)
	. = ..()
	var/list/possible_abilities = list()
	for(var/datum/random_ability/ra in abilities)
		if(ra.CanUse(src))
			possible_abilities += ra
	if(LAZYLEN(possible_abilities))
		var/datum/random_ability/abil = pick(possible_abilities)
		abil.perform(src, A)
