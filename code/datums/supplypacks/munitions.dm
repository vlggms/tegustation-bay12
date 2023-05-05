/decl/hierarchy/supply_pack/munition
	name = "Ship Munitions"
	containertype = /obj/structure/largecrate
	containername = "field disperser munition crate"

/decl/hierarchy/supply_pack/munition/fire
	name = "Ammo - disperser-FR1-ENFER charge"
	contains = list(/obj/structure/ship_munition/disperser_charge/fire)
	cost = 40

/decl/hierarchy/supply_pack/munition/emp
	name = "Ammo - disperser-EM2-QUASAR charge"
	contains = list(/obj/structure/ship_munition/disperser_charge/emp)
	cost = 40

/decl/hierarchy/supply_pack/munition/mining
	name = "Ammo - disperser-MN3-BERGBAU charge"
	contains = list(/obj/structure/ship_munition/disperser_charge/mining)
	cost = 40

/decl/hierarchy/supply_pack/munition/explosive
	name = "Ammo - disperser-XP4-INDARRA charge"
	contains = list(/obj/structure/ship_munition/disperser_charge/explosive)
	cost = 40

/decl/hierarchy/supply_pack/munition/explosive_high
	name = "Ammo - disperser-XP5-ANNIR charge"
	contains = list(/obj/structure/ship_munition/disperser_charge/explosive/high)
	cost = 60

/decl/hierarchy/supply_pack/munition/orbital_bombardment
	name = "Ammo - disperser-OB6-TERRA charge"
	contains = list(/obj/structure/ship_munition/disperser_charge/orbital_bombardment)
	cost = 80

/decl/hierarchy/supply_pack/munition/orbital_bombardment_high
	name = "Ammo - disperser-OB7-DOOM charge"
	contains = list(/obj/structure/ship_munition/disperser_charge/orbital_bombardment/high)
	cost = 160
