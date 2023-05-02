/obj/structure/ship_munition
	name = "munitions"
	icon = 'icons/obj/munitions.dmi'
	w_class = ITEM_SIZE_GARGANTUAN
	density = TRUE

/obj/structure/ship_munition/Initialize()
	. = ..()
	set_extension(src, /datum/extension/play_sound_on_moved)

/obj/structure/ship_munition/disperser_charge
	name = "unknown disperser charge"
	desc = "A charge to power the obstruction field disperser with. It looks impossibly round and shiny. This charge does not have a defined purpose."
	icon_state = "slug"
	atom_flags =  ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CLIMBABLE
	var/chargetype
	var/chargedesc

/obj/structure/ship_munition/disperser_charge/ex_act(severity)
	if(severity == 1)
		var/turf/target = get_turf(src)
		QDEL_NULL(src)
		explosion(target, 1, 2, 3)
	return

/obj/structure/ship_munition/disperser_charge/proc/fire(turf/target, strength = 1, range = 1)
	CRASH("OFD charge firing logic not set!")

/obj/structure/ship_munition/disperser_charge/fire
	name = "FR1-ENFER charge"
	color = "#b95a00"
	desc = "A charge to power the obstruction field disperser with. It looks impossibly round and shiny. This charge is designed to release a localised fire on impact."
	chargetype = OVERMAP_WEAKNESS_FIRE
	chargedesc = "ENFER"

/obj/structure/ship_munition/disperser_charge/fire/fire(turf/target, strength = 1, range = 1)
	for(var/turf/T in range(range, target))
		var/obj/effect/fake_fire/bluespace/disperserf = new(T)
		disperserf.lifetime = strength * 20

/obj/effect/fake_fire/bluespace
	name = "bluespace fire"
	color = COLOR_BLUE
	pressure = 1500

/obj/structure/ship_munition/disperser_charge/emp
	name = "EM2-QUASAR charge"
	color = "#6a97b0"
	desc = "A charge to power the obstruction field disperser with. It looks impossibly round and shiny. This charge is designed to release a blast of electromagnetic pulse on impact."
	chargetype = OVERMAP_WEAKNESS_EMP
	chargedesc = "QUASAR"

/obj/structure/ship_munition/disperser_charge/emp/fire(turf/target, strength = 1, range = 1)
	empulse(target, strength * range / 3, strength * range)

/obj/structure/ship_munition/disperser_charge/mining
	name = "MN3-BERGBAU charge"
	color = "#cfcf55"
	desc = "A charge to power the obstruction field disperser with. It looks impossibly round and shiny. This charge is designed to mine ores on impact."
	chargetype = OVERMAP_WEAKNESS_MINING
	chargedesc = "BERGBAU"

/obj/structure/ship_munition/disperser_charge/mining/fire(turf/target, strength = 1, range = 1)
	var/list/victims = range(range * 3, target)
	for(var/turf/simulated/mineral/M in victims)
		if(prob(strength * 100 / 6)) //6 instead of 5 so there are always leftovers
			M.GetDrilled(TRUE) //no artifacts survive this
	for(var/mob/living/L in victims)
		to_chat(L, SPAN_DANGER("You feel an incredible force ripping and tearing at you."))
		L.ex_act(3) //no artif- I mean idiot/unfortunate bystanders survive this... much

/obj/structure/ship_munition/disperser_charge/explosive
	name = "XP4-INDARRA charge"
	color = "#aa5f61"
	desc = "A charge to power the obstruction field disperser with. It looks impossibly round and shiny. This charge is designed to explode on impact."
	chargetype = OVERMAP_WEAKNESS_EXPLOSIVE
	chargedesc = "INDARRA"
	var/devastation_modifier = 0.1
	var/heavy_modifier = 0.15
	var/light_modifier = 0.5

/obj/structure/ship_munition/disperser_charge/explosive/fire(turf/target, strength = 1, range = 1)
	explosion(target, strength * range * devastation_modifier, strength * range * heavy_modifier, strength * range * light_modifier)

/obj/structure/ship_munition/disperser_charge/explosive/high
	name = "XP5-ANNIR charge"
	color = "#a85255"
	chargedesc = "ANNIR"
	devastation_modifier = 0.25
	heavy_modifier = 0.5
	light_modifier = 1

/obj/structure/ship_munition/disperser_charge/orbital_bombardment
	name = "OB6-TERRA charge"
	desc = "A charge to power the obstruction field disperser with. This charge is designed to bombard the target with large amount of tiny explosions. \
			It is usually used by Terran navy as a tool for orbital bombardment."
	icon_state = "ob_ammo"
	chargetype = OVERMAP_WEAKNESS_EXPLOSIVE
	chargedesc = "TERRA"
	var/fire_at_connected_levels = FALSE
	var/bomb_number = 50
	var/devastation_modifier = 0.05
	var/heavy_modifier = 0.07
	var/light_modifier = 0.2

/obj/structure/ship_munition/disperser_charge/orbital_bombardment/fire(turf/target, strength = 1, range = 1)
	var/sound_z = target.z
	if(fire_at_connected_levels)
		sound_z = GetConnectedZlevels(sound_z)
	sound_to_playing_players_on_level('sound/effects/orbital_bombardment.ogg', 50, ignore_pressure = TRUE, zlevel = sound_z)
	addtimer(CALLBACK(GLOBAL_PROC, .proc/bombard_z, bomb_number, 0.3, max(0,strength * range * devastation_modifier), strength * range * heavy_modifier, strength * range * light_modifier, FALSE, fire_at_connected_levels, target.z), 10 SECONDS)

/obj/structure/ship_munition/disperser_charge/orbital_bombardment/high
	name = "OB7-DOOM charge"
	desc = "A charge to power the obstruction field disperser with. This charge is designed to utterly destroy planets and their population. \
			In this era, it is rarely used outside of shows of power or clearing infested worlds."
	icon_state = "ob_ammo_high"
	chargedesc = "DOOM"
	bomb_number = 200
	devastation_modifier = 0.1
	heavy_modifier = 0.2
	light_modifier = 0.4
