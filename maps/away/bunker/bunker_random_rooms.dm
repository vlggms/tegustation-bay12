/* Bunker Security Rooms */
/obj/effect/spawner/room/bunker_sec_dorm
	room_width = 5
	room_height = 6
	room_type = "abandoned_bunker_sec_dorm"

/datum/map_template/ruin/random_room/bunker_sec_dorm
	name = "Abandoned Bunker - Security Dorm Room"
	template_width = 5
	template_height = 6
	stock = 4 // There will be exactly one warden room among them
	room_type = "abandoned_bunker_sec_dorm"
	id = "abandoned_bunker_sec_dorm_normal"
	prefix = "maps/away/bunker/random/"
	suffixes = list("bunker_sec_dorm_normal.dmm")

/datum/map_template/ruin/random_room/bunker_sec_dorm/warden
	name = "Abandoned Bunker - Security Dorm Room Warden"
	stock = 1
	id = "abandoned_bunker_sec_dorm_warden"
	suffixes = list("bunker_sec_dorm_warden.dmm")

/* Bunker Security Cafeteria */
/obj/effect/spawner/room/bunker_sec_cafe
	room_width = 9
	room_height = 6
	room_type = "abandoned_bunker_sec_cafe"

/datum/map_template/ruin/random_room/bunker_sec_cafe
	name = "Abandoned Bunker - Security Cafeteria Normal"
	template_width = 9
	template_height = 6
	room_type = "abandoned_bunker_sec_cafe"
	id = "abandoned_bunker_sec_cafe_normal"
	prefix = "maps/away/bunker/random/"
	suffixes = list("bunker_sec_cafe_normal.dmm")

/datum/map_template/ruin/random_room/bunker_sec_cafe/battle
	name = "Abandoned Bunker - Security Cafeteria Battle"
	id = "abandoned_bunker_sec_cafe_battle"
	suffixes = list("bunker_sec_cafe_battle.dmm")

/datum/map_template/ruin/random_room/bunker_sec_cafe/bloody
	name = "Abandoned Bunker - Security Cafeteria Bloody"
	id = "abandoned_bunker_sec_cafe_bloody"
	suffixes = list("bunker_sec_cafe_bloody.dmm")

/datum/map_template/ruin/random_room/bunker_sec_cafe/feast
	name = "Abandoned Bunker - Security Cafeteria Feast"
	id = "abandoned_bunker_sec_cafe_feast"
	suffixes = list("bunker_sec_cafe_feast.dmm")

/* Bunker Storage */
/obj/effect/spawner/room/bunker_storage
	room_width = 9
	room_height = 9
	room_type = "abandoned_bunker_storage"

/datum/map_template/ruin/random_room/bunker_storage
	name = "Abandoned Bunker - Storage Normal"
	template_width = 9
	template_height = 9
	room_type = "abandoned_bunker_storage"
	id = "abandoned_bunker_storage_normal"
	prefix = "maps/away/bunker/random/"
	suffixes = list("bunker_storage_normal.dmm")

/datum/map_template/ruin/random_room/bunker_storage/poor
	name = "Abandoned Bunker - Storage Poor"
	id = "abandoned_bunker_storage_poor"
	suffixes = list("bunker_storage_poor.dmm")

/datum/map_template/ruin/random_room/bunker_storage/rich
	name = "Abandoned Bunker - Storage Rich"
	id = "abandoned_bunker_storage_rich"
	suffixes = list("bunker_storage_rich.dmm")

/* Bunker Dorms Room */
// The rooms at north side
/obj/effect/spawner/room/bunker_dorm_room_north
	room_width = 5
	room_height = 6
	room_type = "abandoned_bunker_room_north"

/datum/map_template/ruin/random_room/bunker_dorm_room_north
	name = "Abandoned Bunker - North Room 1"
	template_width = 5
	template_height = 6
	stock = 10
	room_type = "abandoned_bunker_room_north"
	id = "abandoned_bunker_room_north_one"
	prefix = "maps/away/bunker/random/"
	suffixes = list("bunker_room_north_1.dmm")

/datum/map_template/ruin/random_room/bunker_dorm_room_north/two
	name = "Abandoned Bunker - North Room 2"
	id = "abandoned_bunker_room_north_two"
	suffixes = list("bunker_room_north_2.dmm")

/datum/map_template/ruin/random_room/bunker_dorm_room_north/three
	name = "Abandoned Bunker - North Room 3"
	id = "abandoned_bunker_room_north_three"
	suffixes = list("bunker_room_north_3.dmm")

// The rooms at south side
/obj/effect/spawner/room/bunker_dorm_room_south
	room_width = 5
	room_height = 6
	room_type = "abandoned_bunker_room_south"

/datum/map_template/ruin/random_room/bunker_dorm_room_south
	name = "Abandoned Bunker - South Room 1"
	template_width = 5
	template_height = 6
	weight = 10
	stock = 10
	room_type = "abandoned_bunker_room_south"
	id = "abandoned_bunker_room_south_one"
	prefix = "maps/away/bunker/random/"
	suffixes = list("bunker_room_south_1.dmm")

/datum/map_template/ruin/random_room/bunker_dorm_room_south/two
	name = "Abandoned Bunker - South Room 2"
	id = "abandoned_bunker_room_south_two"
	suffixes = list("bunker_room_south_2.dmm")

/datum/map_template/ruin/random_room/bunker_dorm_room_south/three
	name = "Abandoned Bunker - South Room 3"
	id = "abandoned_bunker_room_south_three"
	suffixes = list("bunker_room_south_3.dmm")

/* Mining Large Zone */
/obj/effect/spawner/room/bunker_mining_zone
	room_width = 20
	room_height = 14
	room_type = "abandoned_bunker_mining_zone"

/datum/map_template/ruin/random_room/bunker_mining_zone
	name = "Abandoned Bunker - Mining Zone Antlions"
	template_width = 20
	template_height = 14
	room_type = "abandoned_bunker_mining_zone"
	id = "abandoned_bunker_mining_zone_antlion"
	prefix = "maps/away/bunker/random/"
	suffixes = list("bunker_mining_zone_antlion.dmm")

// Basically successful bunker. This allows players to enter the facility "located on another planet".
/datum/map_template/ruin/random_room/bunker_mining_zone/quantum_entry
	name = "Abandoned Bunker - Mining Zone Quantum Entry"
	id = "abandoned_bunker_mining_zone_quantum"
	suffixes = list("bunker_mining_zone_quantum.dmm")

/datum/map_template/ruin/random_room/bunker_mining_zone/abominable_infestation
	name = "Abandoned Bunker - Mining Zone Abominable Infestation"
	id = "abandoned_bunker_mining_zone_infestation"
	suffixes = list("bunker_mining_zone_infestation.dmm")
