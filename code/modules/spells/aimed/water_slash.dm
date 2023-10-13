/datum/spell/aimed/water_slash
	name = "Water Slash"
	desc = "This spell manifests a sharp stream of water that slices everyone in its way."
	deactive_msg = "You discharge the slash spell..."
	active_msg = "You charge the slash spell!"

	charge_max = 20 SECONDS
	cooldown_reduc = 5 SECONDS

	invocation = "Wa Sli!"
	invocation_type = INVOKE_SHOUT
	level_max = list(UPGRADE_TOTAL = 3, UPGRADE_SPEED = 2, UPGRADE_POWER = 2)

	range = 8
	hud_state = "slash"
	cast_sound = 'sound/magic/water.ogg'
	spell_cost = 2
	mana_cost = 10

	var/slash_damage = 30
	var/slash_distance = 4

/datum/spell/aimed/water_slash/TargetCastCheck(mob/living/user, mob/living/target)
	if(get_dist(user, target) > range)
		to_chat(user, SPAN_WARNING("The target is too far away!"))
		return FALSE
	return ..()

/datum/spell/aimed/water_slash/fire_projectile(mob/living/user, mob/living/target)
	. = ..()
	var/turf/start_turf = get_step(get_turf(user), get_dir(user, target))
	var/turf/target_turf = get_ranged_target_turf_direct(start_turf, target, slash_distance)
	var/list/attack_line = list()
	for(var/turf/T in getline(start_turf, target_turf))
		if(T.density)
			break
		attack_line += T
		target_turf = T

	var/obj/effect/temp_visual/slash/water/S = new(start_turf)
	var/matrix/M = matrix(S.transform)
	M.Turn(Get_Angle(start_turf, target_turf))
	S.transform = M
	animate(S, pixel_x = (target_turf.x - start_turf.x) * world.icon_size, pixel_y = (target_turf.y - start_turf.y) * world.icon_size, transform = M*3, time = 5)
	var/list/already_hit = list()
	for(var/turf/T in attack_line)
		for(var/turf/TT in view(1, T))
			for(var/mob/living/L in TT)
				if(L == user)
					continue
				if(L in already_hit)
					continue
				already_hit |= L
				L.apply_damage(slash_damage, BRUTE, null, DAM_EDGE|DAM_SHARP)
				var/turf/simulated/LT = get_turf(L)
				var/blood_col = COLOR_RED
				if(isanimal(L))
					var/mob/living/simple_animal/SA = L
					blood_col = SA.bleed_colour
				else if(ishuman(L))
					var/mob/living/carbon/human/H = L
					blood_col = H.species.blood_color
				new /obj/effect/temp_visual/bloodsplatter(LT, get_dir(LT, start_turf), blood_col)
				if(!istype(LT))
					continue
				LT.add_blood(L)

/datum/spell/aimed/water_slash/empower_spell()
	if(!..())
		return FALSE

	slash_damage += 25
	return "The [src] spell now deals [slash_damage] damage."
