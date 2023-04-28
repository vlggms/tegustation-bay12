/area/bluespaceriver
	icon = 'maps/away/blueriver/blueriver.dmi'

/area/bluespaceriver/underground
	name = "\improper Bluespace River Underground"
	icon_state = "underground"
	forced_ambience = list('sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg')
	sound_env = ASTEROID
	base_turf = /turf/simulated/floor/asteroid

/area/bluespaceriver/ground
	name = "\improper Arctic Planet Surface"
	icon_state = "ground"
	ambience = list('sound/effects/wind/tundra0.ogg','sound/effects/wind/tundra1.ogg','sound/effects/wind/tundra2.ogg','sound/effects/wind/spooky0.ogg','sound/effects/wind/spooky1.ogg')
	sound_env = ASTEROID
	planetary_surface = TRUE
	base_turf = /turf/simulated/floor/exoplanet/snow

/area/bluespaceriver/ship
	name = "\improper NSV Horizon"
	icon_state = "ship"
	base_turf = /turf/simulated/floor/exoplanet/snow
