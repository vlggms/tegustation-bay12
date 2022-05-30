/decl/hierarchy/supply_pack/marine
	name = "Marine Corps"

/decl/hierarchy/supply_pack/marine/bullpupammo
	name = "Ammunition - military rifle"
	contains = list(/obj/item/ammo_magazine/mil_rifle = 4)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "military rifle ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/frags
	name = "Weapons - Frag grenades (x3)"
	contains = list(/obj/item/grenade/frag = 3)
	cost = 30
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "explosive weaponry crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/frags
	name = "Weapons - Frag bombs (x3)"
	contains = list(/obj/item/grenade/frag/high_yield = 3)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "explosive weaponry crate"
	access = access_marine
