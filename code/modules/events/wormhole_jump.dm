// Event that is called by overmap wormhole objects when passed through with a ship.
// Moves ship to random position on overmap,
// Causes minor instability in the ship's operations by spawning weak temporary wormhole & blackhole anomalies.
/datum/event/wormhole_jump
	startWhen = 1
	announceWhen = 1
	var/obj/effect/overmap/visitable/ship/victim
	var/black_hole_count = 10

/datum/event/wormhole_jump/Destroy()
	victim = null
	return ..()

/datum/event/wormhole_jump/start()
	if(!istype(victim))
		end()
		kill()
		return
	// Move the ship
	var/list/candidate_turfs = block(locate(OVERMAP_EDGE, OVERMAP_EDGE, GLOB.using_map.overmap_z), locate(GLOB.using_map.overmap_size - OVERMAP_EDGE, GLOB.using_map.overmap_size - OVERMAP_EDGE, GLOB.using_map.overmap_z))
	var/turf/T = pick(candidate_turfs)
	new /obj/effect/temp_visual/ftl(get_turf(victim))
	new /obj/effect/temp_visual/ftl(T)
	victim.forceMove(T)
	victim.pixel_x = rand(-14, 14)
	victim.pixel_y = rand(-14, 14)

	// Spawn black holes
	for(var/i = 1 to black_hole_count)
		var/turf/TT = pick_area_turf_in_single_z_level(
			list(/proc/is_not_space_area),
			z_level = pick(affecting_z),
			)
		var/obj/effect/bhole/safe/B = new(TT)
		B.alpha = 0
		animate(B, alpha = 255, time = 3)
