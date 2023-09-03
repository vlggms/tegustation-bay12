/mob/living/simple_animal/hostile/megafauna/all_around_helper
	name = "All-Around Helper"
	desc = "A tiny spherical robot with blades attached in place of its \"legs\". It does looks helpful though."
	icon = 'icons/mob/simple_animal/all_around_helper.dmi'
	icon_state = "helper"
	icon_living = "helper"
	icon_dead = "helper"
	speak_emote = list("states")
	response_harm = "kicks"
	faction = "abnormality"

	default_pixel_x = -16
	default_pixel_y = -16
	pixel_x = -16
	pixel_y = -16

	health = 2000
	maxHealth = 2000

	natural_weapon = /obj/item/natural_weapon/all_around_helper
	melee_attack_delay = 0
	ranged = TRUE

	movement_cooldown = 3.5

	status_flags = NO_ANTAG

	see_invisible = SEE_INVISIBLE_NOLIGHTING
	see_in_dark = 7

	natural_armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		energy = ARMOR_ENERGY_SHIELDED,
		laser = ARMOR_LASER_MAJOR,
		)

	mob_actions = list(
		/datum/action/megafauna/toggle/helper_dash,
		)

	var/charging = FALSE
	/// Maximum dash distance. After reaching that amount - forcibly stops without hitting a wall
	var/dash_num = 50
	var/dash_cooldown = 0
	var/dash_cooldown_time = 8 SECONDS
	var/dash_speed = 1
	/// Damage done to humans hit during the dash. Non-human mobs receive twice the damage
	var/dash_damage = 60
	var/list/been_hit = list() // Don't get hit twice.

/obj/item/natural_weapon/all_around_helper
	name = "blades"
	attack_verb = list("cut", "sliced", "stabbed")
	force = 12
	armor_penetration = 25
	sharp = TRUE
	hitsound = 'sound/simple_mob/abnormality/all_around_helper/attack.ogg'
	attack_cooldown = 3

/datum/action/megafauna/toggle/helper_dash
	name = "Toggle Dash"
	chosen_attack_num = 1
	chosen_message = "You will now dash in that direction."
	deactivate_message = "You won't dash anymore."
	button_icon_state = "helper_toggle0"
	button_icon_state_deactivated = "helper_toggle1"

/mob/living/simple_animal/hostile/megafauna/all_around_helper/SelfMove()
	if(charging)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/megafauna/all_around_helper/IMove(turf/newloc, safety = TRUE)
	if(charging)
		return MOVEMENT_ON_COOLDOWN
	return ..()

// Remind me to remove NPC and player differing controls...
/mob/living/simple_animal/hostile/megafauna/all_around_helper/shoot_target(atom/A)
	return RangedAttack(A)

/mob/living/simple_animal/hostile/megafauna/all_around_helper/RangedAttack(atom/A)
	if(client && !A.Adjacent(src))
		switch(chosen_attack)
			if(1)
				HelperDash(A)
		return

	if(dash_cooldown <= world.time)
		var/chance_to_dash = 25
		var/dir_to_target = get_dir(get_turf(src), get_turf(A))
		if(dir_to_target in list(NORTH, SOUTH, WEST, EAST))
			chance_to_dash = 100
		if(prob(chance_to_dash))
			HelperDash(A)

/mob/living/simple_animal/hostile/megafauna/all_around_helper/proc/HelperDash(atom/A)
	if(charging || dash_cooldown > world.time)
		return
	dash_cooldown = world.time + dash_cooldown_time
	charging = TRUE
	var/dir_to_target = get_dir(get_turf(src), get_turf(A))
	var/para = TRUE
	if(dir_to_target in list(WEST, NORTHWEST, SOUTHWEST))
		para = FALSE
	been_hit = list()
	SpinAnimation(1.8 SECONDS, 1, para)
	addtimer(CALLBACK(src, .proc/DoDash, dir_to_target, 0), 1.5 SECONDS)
	playsound(src, 'sound/simple_mob/abnormality/all_around_helper/rise.ogg', 100, 1)

/mob/living/simple_animal/hostile/megafauna/all_around_helper/proc/DoDash(move_dir, times_ran)
	var/stop_charge = FALSE
	if(times_ran >= dash_num)
		stop_charge = TRUE
	var/turf/T = get_step(get_turf(src), move_dir)
	if(!T)
		charging = FALSE
		return
	if(istype(T, /turf/simulated/mineral))
		var/turf/simulated/mineral/M = T
		M.GetDrilled()
	if(T.density)
		stop_charge = TRUE
	for(var/obj/structure/window/W in T)
		W.shatter()
	for(var/obj/machinery/door/D in T.contents)
		if(D.density)
			if(istype(D, /obj/machinery/door/blast))
				var/obj/machinery/door/blast/B = D
				B.force_open()
				continue
			D.open(TRUE)
	if(stop_charge)
		playsound(src, 'sound/simple_mob/abnormality/all_around_helper/disable.ogg', 75, TRUE)
		SLEEP_CHECK_DEATH(5 SECONDS)
		charging = FALSE
		return
	forceMove(T)
	var/para = TRUE
	if(move_dir in list(WEST, NORTHWEST, SOUTHWEST))
		para = FALSE
	SpinAnimation(3, 1, para)
	playsound(src,"sound/simple_mob/abnormality/all_around_helper/move0[pick(1,2,3)].ogg", rand(50, 70), TRUE)
	for(var/mob/living/L in range(1, T))
		if(L.faction != faction)
			if(L in been_hit)
				continue
			visible_message("<span class='boldwarning'>[src] runs through [L]!</span>")
			to_chat(L, "<span class='userdanger'>[src] pierces you with their spinning blades!</span>")
			playsound(L, attack_sound, 75, 1)
			var/turf/LT = get_turf(L)
			new /obj/effect/temp_visual/smash(LT)
			if(ishuman(L))
				var/mob/living/carbon/human/H = L
				// Ugly code
				var/affecting = pick(BP_HEAD, BP_CHEST, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)
				H.apply_damage(dash_damage, BRUTE, affecting, DAM_SHARP | DAM_EDGE, null, 25)
			else
				L.adjustBruteLoss(dash_damage * 2)
			if(L.stat >= DEAD)
				L.gib()
				continue
			been_hit |= L
	addtimer(CALLBACK(src, .proc/DoDash, move_dir, (times_ran + 1)), dash_speed)
