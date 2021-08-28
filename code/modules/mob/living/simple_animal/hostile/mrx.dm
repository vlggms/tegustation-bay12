/mob/living/simple_animal/hostile/mrx
	name = "Mr. X"
	desc = "He gonna give it to ya"
	icon = 'icons/mob/simple_animal/xman.dmi'
	icon_state = "mrx-living"
	icon_living = "mrx-living"
	icon_dead = "mrdead"

	faction = "anti-erp"

	maxHealth = 500
	health = 500

	movement_cooldown = 0.5 SECONDS
	natural_weapon = /obj/item/natural_weapon/opm
	melee_attack_delay = 0.5 SECOND
	attacktext = list("Given it to")

	//Mr X aint affected by atmos.
	min_gas = null
	max_gas = null
	minbodytemp = 0

var/mrx_step_sound = 'sound/misc/mrxboots.ogg'
/mob/living/simple_animal/hostile/mrx/Move()
	. = ..()
	if(. && !istype(loc, /turf/space))
		playsound(src.loc, mrx_step_sound, 80, 1)
