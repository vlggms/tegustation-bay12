/datum/spell/aimed/spark_bolt
	name = "Spark Bolt"
	desc = "This spell fires a few weak spark bolts."
	charge_max = 16 SECONDS
	cooldown_reduc = 2 SECONDS
	spell_flags = 0
	invocation_type = INVOKE_NONE
	range = 20
	projectile_type = /obj/item/projectile/spark_bolt
	projectile_amount = 5
	ranged_clickcd = 4 // Pew-pew
	hud_state = "wiz_sparkbolt"
	cast_sound = 'sound/magic/shot.ogg'
	active_msg = "You prepare to cast spark bolt!"
	deactive_msg = "You dissipate the spark bolt."

	level_max = list(UPGRADE_TOTAL = 2, UPGRADE_SPEED = 2, UPGRADE_POWER = 0)

	categories = list()
	spell_cost = 2
	mana_cost = 0.5 // Per projectile, mind you

/datum/spell/aimed/spark_bolt/quicken_spell()
	if(!..())
		return FALSE

	return "The spell [src] now has lower cooldown."

// Projectile
/obj/item/projectile/spark_bolt
	name = "spark bolt"
	icon_state = "sparkbolt"
	fire_sound = 'sound/magic/shot.ogg'
	damage = 15
	damage_type = BURN
