// Zergling.
// Small, weak and fast. Usually found in large groups.
/mob/living/simple_animal/hostile/zerg
	name = "zergling"
	desc = "A weird insect-like creature."
	icon = 'icons/mob/simple_animal/zerg.dmi'
	icon_state = "zergling"
	icon_living = "zergling"
	icon_dead = "zergling_dead"
	mob_size = MOB_SMALL
	speak_emote = list("hisses")
	response_harm = "slashes"
	faction = "zerg"
	bleed_colour = COLOR_RED_LIGHT
	see_in_dark = 5
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GRILLE

	health = 30
	maxHealth = 30
	natural_weapon = /obj/item/natural_weapon/claws/zergling
	melee_attack_delay = 0

	meat_type = /obj/item/reagent_containers/food/snacks/xenomeat
	meat_amount = 2
	skin_material = MATERIAL_SKIN_CHITIN
	skin_amount = 4
	bone_material = MATERIAL_BONE_CARTILAGE
	bone_amount = 4

	ai_holder_type = /datum/ai_holder/simple_animal/melee/evasive/zerg
	say_list = /datum/say_list/zerg

/datum/say_list/zerg
	emote_hear = list("hisses")
	emote_see = list("jumps all around the place")

// Hydralisk.
// The ranged go-to type of zergs.
/mob/living/simple_animal/hostile/zerg/hydralisk
	name = "hydralisk"
	desc = "A weird insect-like creature. This one has large acid sacs."
	icon_state = "hydralisk"
	icon_living = "hydralisk"
	icon_dead = "hydralisk_dead"
	fire_desc = "spits acid"
	ranged = 1
	projectiletype = /obj/item/projectile/energy/zerg
	pass_flags = PASS_FLAG_TABLE
	health = 60
	maxHealth = 60
	mob_size = MOB_MEDIUM
	speed = 2

	meat_amount = 4
	skin_amount = 8
	bone_amount = 8

	ai_holder_type = /datum/ai_holder/simple_animal/ranged/aggressive
