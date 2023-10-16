/* Slavers Base Rooms */
/obj/effect/spawner/room/slavers_base_mining
	room_width = 5
	room_height = 6
	room_type = "abandoned_bunker_sec_dorm"

/datum/map_template/ruin/random_room/slavers_base_mining
	name = "Slavers Base - Mining Normal"
	template_width = 16
	template_height = 16
	room_type = "slavers_base_mining"
	id = "slavers_base_mining_normal"
	prefix = "maps/away/slavers/random/"
	suffixes = list("slavers_base_mining_normal.dmm")

/datum/map_template/ruin/random_room/slavers_base_mining/infested
	name = "Slavers Base - Mining Infested"
	id = "slavers_base_mining_infested"
	suffixes = list("slavers_base_mining_infested.dmm")
