// The tiny and fast annoying enemies spawned by aggregate
/mob/living/simple_animal/hostile/infestation/meatchip
	name = "meatchip"
	desc = "A tiny, digusting creature."
	icon_state = "meatchip"
	icon_living = "meatchip"
	icon_dead = "meatchip_dead"
	mob_size = MOB_TINY
	movement_cooldown = 1.2

	natural_weapon = /obj/item/natural_weapon/claws/meatchip
	melee_attack_delay = 0

	health = 30
	maxHealth = 30

	meat_type = /obj/item/reagent_containers/food/snacks/abominationmeat
	meat_amount = 1
	skin_material = MATERIAL_SKIN_CHITIN
	skin_amount = 1
	bone_material = MATERIAL_BONE_CARTILAGE
	bone_amount = 1

	death_sounds = list('sound/simple_mob/abominable_infestation/meatchip/death.ogg')

/obj/item/natural_weapon/claws/meatchip
	force = 5
	armor_penetration = 15
	hitsound = 'sound/weapons/slashmiss.ogg'
	attack_cooldown = 1
