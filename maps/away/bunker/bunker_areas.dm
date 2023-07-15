/area/abandoned_bunker
	icon = 'maps/away/bunker/bunker.dmi'

/area/abandoned_bunker/ground
	name = "\improper Arctic Planet Surface"
	icon_state = "ground"
	ambience = list('sound/effects/wind/tundra0.ogg','sound/effects/wind/tundra1.ogg','sound/effects/wind/tundra2.ogg','sound/effects/wind/spooky0.ogg','sound/effects/wind/spooky1.ogg')
	sound_env = ASTEROID
	planetary_surface = TRUE
	base_turf = /turf/simulated/floor/exoplanet/snow

/area/abandoned_bunker/underground
	name = "\improper Arctic Planet Underground"
	icon_state = "underground"
	forced_ambience = list('sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg')
	sound_env = TUNNEL_ENCLOSED
	base_turf = /turf/simulated/floor/asteroid

/area/abandoned_bunker/bunker
	name = "\improper Abandoned Bunker"
	icon_state = "bunker"
	req_access = list(access_bunker)
	base_turf = /turf/simulated/floor/asteroid
	forced_ambience = list('sound/ambience/ambigen4.ogg', 'sound/ambience/ambigen5.ogg', 'sound/ambience/ambigen6.ogg')
	sound_env = LARGE_ENCLOSED

/area/abandoned_bunker/bunker/entrance
	name = "\improper Abandoned Bunker Entrance"
	icon_state = "entry"
	sound_env = SMALL_ENCLOSED

/area/abandoned_bunker/bunker/entrance_security
	name = "\improper Abandoned Bunker Entrance Security"
	req_access = list(access_bunker_security)
	icon_state = "entry_security"
	sound_env = LARGE_ENCLOSED

/area/abandoned_bunker/bunker/storage
	name = "\improper Abandoned Bunker Storage"
	icon_state = "storage"
	sound_env = SMALL_ENCLOSED

/area/abandoned_bunker/bunker/dormitories
	name = "\improper Abandoned Bunker Dormitory"
	icon_state = "dorms"
	sound_env = MEDIUM_SOFTFLOOR

/area/abandoned_bunker/bunker/canteen
	name = "\improper Abandoned Bunker Canteen"
	icon_state = "canteen"
	sound_env = MEDIUM_SOFTFLOOR

/area/abandoned_bunker/bunker/engine
	name = "\improper Abandoned Bunker Engineering"
	icon_state = "engine"
	forced_ambience = list('sound/ambience/ambigen10.ogg')
	sound_env = SMALL_ENCLOSED

/area/abandoned_bunker/bunker/mining
	name = "\improper Abandoned Bunker Mining Entrance"
	icon_state = "mining"
	sound_env = SMALL_ENCLOSED

/area/abandoned_bunker/bunker/security
	name = "\improper Abandoned Bunker Security"
	req_access = list(access_bunker_security)
	icon_state = "security"
	sound_env = LARGE_ENCLOSED

/area/abandoned_bunker/bunker/armory
	name = "\improper Abandoned Bunker Armory"
	req_access = list(access_bunker_armory)
	icon_state = "security"
	sound_env = LARGE_ENCLOSED

/* Quantum pad accessible areas */
/area/abandoned_bunker/bunker/quantum_entry
	name = "\improper Abandoned Bunker Quantum Entry"
	icon_state = "tele"
	forced_ambience = list('sound/ambience/ambispace5.ogg')
	sound_env = LARGE_ENCLOSED

/area/abandoned_bunker/bunker/quantum_facility
	name = "\improper ISC Facility"
	icon_state = "tele2"
	forced_ambience = list('sound/ambience/ambispace2.ogg')
	sound_env = LARGE_ENCLOSED
