/obj/effect/overmap/visitable/sector/exoplanet/infested
	name = "infested exoplanet"
	icon_state = "globe_infested"
	desc = "Planet infested with dangerous alien life."
	scan_summary = "A lush world completely infested by abominable aliens."
	scan_assessment = "Use extreme caution when interacting with local life."
	color = "#9c3d51"
	water_color = null
	surface_color = "#94404e"
	planetary_area = /area/exoplanet/infested_forest
	rock_colors = list(COLOR_ASTEROID_ROCK, COLOR_GRAY80, COLOR_BROWN)
	plant_colors = list("#f5426f","#c72a51","#cc1d48","#99156f","#8c268b", "RANDOM")
	map_generators = list(/datum/random_map/noise/exoplanet/infested, /datum/random_map/noise/ore/rich)
	habitability_distribution = list(HABITABILITY_IDEAL = 10, HABITABILITY_OKAY = 80, HABITABILITY_BAD = 10)
	flora_diversity = 15
	fauna_types = list(
		/mob/living/simple_animal/hostile/infestation/broodling = 7,
		/mob/living/simple_animal/hostile/infestation/eviscerator = 5,
		/mob/living/simple_animal/hostile/infestation/spitter = 3,
		/mob/living/simple_animal/hostile/infestation/assembler = 3,
		/mob/living/simple_animal/hostile/infestation/rhino = 2,
		/mob/living/simple_animal/hostile/infestation/larva/implanter = 1,
		)

/obj/effect/overmap/visitable/sector/exoplanet/infested/generate_map()
	if(prob(50))
		lightlevel = pick(0.05, 0.1, 0.15)
	return ..()

/obj/effect/overmap/visitable/sector/exoplanet/infested/generate_atmosphere()
	..()
	if(atmosphere)
		atmosphere.temperature = T20C + rand(-40, 40)
		atmosphere.update_values()

/obj/effect/overmap/visitable/sector/exoplanet/infested/get_surface_color()
	return "#9c3d51"

/obj/effect/overmap/visitable/sector/exoplanet/infested/adapt_animal(mob/living/simple_animal/A, setname = TRUE)
	if(!istype(A, /mob/living/simple_animal/hostile/infestation))
		return ..()
	// Planet-spawned abominations do not evolve normally
	var/mob/living/simple_animal/hostile/infestation/abom = A
	abom.transformation_time = null

/obj/effect/overmap/visitable/sector/exoplanet/infested/adapt_seed(datum/seed/S)
	..()
	var/carnivore_prob = rand(100)
	if(carnivore_prob < 30)
		S.set_trait(TRAIT_CARNIVOROUS,2)
		if(prob(75))
			S.get_trait(TRAIT_STINGS, 1)
	else if(carnivore_prob < 60)
		S.set_trait(TRAIT_CARNIVOROUS,1)
		if(prob(50))
			S.get_trait(TRAIT_STINGS)
	if(prob(15) || (S.get_trait(TRAIT_CARNIVOROUS) && prob(40)))
		S.set_trait(TRAIT_BIOLUM,1)
		S.set_trait(TRAIT_BIOLUM_COLOUR,get_random_colour(0,75,190))

	if(prob(30))
		S.set_trait(TRAIT_PARASITE,1)
	if(!S.get_trait(TRAIT_LARGE))
		var/vine_prob = rand(100)
		if(vine_prob < 15)
			S.set_trait(TRAIT_SPREAD,2)
		else if(vine_prob < 30)
			S.set_trait(TRAIT_SPREAD,1)

/area/exoplanet/infested_forest
	base_turf = /turf/simulated/floor/exoplanet/grass

/area/exoplanet/infested_forest/play_ambience(mob/living/L)
	..()
	if(!L.ear_deaf && L.client && !L.client.ambience_playing)
		L.client.ambience_playing = TRUE
		L.playsound_local(get_turf(L),sound('sound/ambience/infested_forest.ogg', repeat = 1, wait = 0, volume = 25, channel = GLOB.ambience_sound_channel))

/datum/random_map/noise/exoplanet/infested
	descriptor = "infested exoplanet"
	smoothing_iterations = 2
	land_type = /turf/simulated/floor/exoplanet/flesh

	flora_prob = 10
	fauna_prob = 20
