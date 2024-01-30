/obj/infestation_structure/pike_burrow
	name = "pike burrow"
	desc = "A meaty structure with multiple sharp spikes protruding out and into the ground."
	icon = 'icons/mob/simple_animal/abominable_infestation/48x48.dmi'
	icon_state = "pike_burrow"

	pixel_x = -8

	light_max_bright = 0.5
	light_inner_range = 2
	light_outer_range = 5
	light_color = COLOR_MAROON

	health_max = 200
	health_min_damage = 10

	var/attack_cooldown
	var/attack_cooldown_time = 1.5 SECONDS

/obj/infestation_structure/pike_burrow/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	for(var/turf/simulated/floor/T in dview(1, src))
		if(istype(T, /turf/simulated/floor/exoplanet))
			T.ChangeTurf(/turf/simulated/floor/exoplanet/flesh)
			continue
		T.set_flooring(decls_repository.get_decl(/decl/flooring/flesh/infested))

/obj/infestation_structure/pike_burrow/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/infestation_structure/pike_burrow/Process()
	. = ..()
	if(world.time < attack_cooldown)
		return

	PerformAttack()

/obj/infestation_structure/pike_burrow/handle_death_change(new_death_state)
	. = ..()
	if(new_death_state)
		new /obj/effect/gibspawner/human(get_turf(src))
		playsound(src, 'sound/simple_mob/abominable_infestation/heart_death.ogg', 75, TRUE)
		visible_message(SPAN_DANGER("\The [src] explodes in a shower of gore!"))
		QDEL_NULL(src)

/obj/infestation_structure/pike_burrow/proc/PerformAttack()
	var/list/nearby_targets = list()
	for(var/mob/living/L in dview(7, src))
		if(L.stat)
			continue
		if(L.faction == faction)
			continue
		// Too close, kill them
		if(get_dist(src, L) <= 1)
			nearby_targets = list(L)
			break
		nearby_targets += L

	if(!LAZYLEN(nearby_targets))
		return FALSE

	var/mob/living/chosen_target = get_atom_closest_to_atom(src, nearby_targets)
	var/turf/T = get_turf(chosen_target)
	var/obj/effect/temp_visual/decoy/D = new(T, 0, T, 6)
	D.transform = matrix()*1.5
	D.alpha = 125
	animate(D, transform = matrix(), color = COLOR_RED, alpha = 0, time = 5)
	addtimer(CALLBACK(src, .proc/SpikeTurf, T), 5)

	return TRUE

/obj/infestation_structure/pike_burrow/proc/SpikeTurf(turf/T)
	if(QDELETED(src))
		return FALSE

	new /obj/effect/temp_visual/infestation_spike(T, pick(GLOB.alldirs))


// The spike itself
/obj/effect/temp_visual/infestation_spike
	name = "bloody spike"
	icon = 'icons/mob/simple_animal/abominable_infestation/32x48.dmi'
	icon_state = "spike"
	duration = 8
	layer = ABOVE_HUMAN_LAYER

	var/damage = 50

/obj/effect/temp_visual/infestation_spike/Initialize()
	. = ..()
	playsound(src, 'sound/effects/spike_attack.ogg', 75, TRUE, 4)
	for(var/mob/living/L in get_turf(src))
		if(L.stat)
			continue
		L.visible_message(
			SPAN_DANGER("\The [L] is pierced by \the [src]!"),
			SPAN_USERDANGER("\The [src] pierces you!"),
			)
		var/affecting = pick(BP_HEAD, BP_CHEST, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)
		L.apply_damage(damage, BRUTE, affecting, DAM_SHARP | DAM_EDGE, null, 25)
