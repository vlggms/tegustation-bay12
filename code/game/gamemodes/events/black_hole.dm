/obj/effect/bhole
	name = "black hole"
	desc = "A rift in space itself. It would be a good idea to stay away from it."
	icon = 'icons/obj/objects.dmi'
	icon_state = "bhole3"
	opacity = 1
	unacidable = TRUE
	density = FALSE
	anchored = TRUE
	var/destroy_mobs = TRUE
	var/destroy_objs = TRUE
	var/destroy_turfs = TRUE
	var/obj/effect/effect/warp/warp_type = /obj/effect/effect/warp
	// Currently spawned effect, so we don't have to create one every time
	var/obj/effect/effect/warp/warp_effect = null
	var/grav_range = 5

/obj/effect/bhole/Initialize()
	. = ..()
	spawn(4)
		controller()

/obj/effect/bhole/Destroy()
	QDEL_NULL(warp_effect)
	warp_effect = null
	return ..()

/obj/effect/bhole/proc/controller()
	while(src)
		if(!isturf(loc))
			qdel(src)
			return

		//DESTROYING STUFF AT THE EPICENTER
		if(destroy_mobs)
			for(var/mob/living/M in orange(1, src))
				qdel(M)
		if(destroy_objs)
			for(var/obj/O in orange(1, src))
				qdel(O)
		if(destroy_turfs)
			var/base_turf = get_base_turf_by_area(src)
			for(var/turf/simulated/ST in orange(1, src))
				if(ST.type == base_turf)
					continue
				ST.ChangeTurf(base_turf)

		for(var/i = 1 to 5)
			sleep(8)
			Grav(35 + (i * 10), i, prob(50)) // Gets progressively more dangerous

		//MOVEMENT
		var/list/pick_dirs = GLOB.alldirs.Copy()
		for(var/i = 1 to 4)
			var/new_dir = pick(pick_dirs)
			var/turf/simulated/T = get_step(src, new_dir)
			if(!istype(T) || T.density)
				pick_dirs -= new_dir
				continue
			forceMove(T)
			break

/obj/effect/bhole/proc/Grav(pull_chance = 90, throw_speed = 1, throw_dir = FALSE)
	var/turf/T = get_turf(src)
	if(!istype(warp_effect))
		warp_effect = new warp_type(T)
	warp_effect.forceMove(T)
	warp_effect.alpha = 255
	animate(warp_effect, alpha = 0, time = 6)
	for(var/atom/movable/A in view(T, grav_range))
		if(A.anchored || !A.simulated || !prob(pull_chance))
			continue
		var/dist = grav_range - get_dist(A, src)
		throw_dir = throw_dir ? get_dir(A, src) : get_dir(src, A)
		A.throw_at(get_edge_target_turf(A, throw_dir), dist, throw_speed, spin = FALSE)

/obj/effect/bhole/safe
	destroy_mobs = FALSE
	destroy_objs = FALSE
	destroy_turfs = FALSE
