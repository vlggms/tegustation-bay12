/decl/hierarchy/supply_pack/marine
	name = "Marine Corps"

// Weapons and ammo
/decl/hierarchy/supply_pack/marine/assault_rifle
	name = "Weapons - Assault rifle"
	contains = list(/obj/item/gun/projectile/automatic/assault_rifle = 1)
	cost = 200
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "assault rifle crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/assault_ammo
	name = "Ammunition - Assault rifle"
	contains = list(/obj/item/ammo_magazine/rifle = 4)
	cost = 80
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "assault rifle ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/t18_rifle
	name = "Weapons - T18 scout rifle"
	contains = list(/obj/item/gun/projectile/automatic/t18 = 1)
	cost = 120
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "T18 scout rifle crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/t18_ammo
	name = "Ammunition - T18 scout rifle"
	contains = list(/obj/item/ammo_magazine/t18 = 4)
	cost = 50
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "T18 scout rifle ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/bullpup_rifle
	name = "Weapons - Bullpup assault rifle"
	contains = list(/obj/item/gun/projectile/automatic/bullpup_rifle = 1)
	cost = 100
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "bullpup assault rifle crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/bullpup_ammo
	name = "Ammunition - Bullpup assault rifle"
	contains = list(/obj/item/ammo_magazine/mil_rifle = 4)
	cost = 40
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "bullpup assault rifle ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/ak47_rifle
	name = "Weapons - AK47 rifle"
	contains = list(/obj/item/gun/projectile/automatic/ak47 = 1)
	cost = 80
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "AK47 rifle crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/ak47_ammo
	name = "Ammunition - AK47 rifle"
	contains = list(/obj/item/ammo_magazine/ak47 = 4)
	cost = 30
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "AK47 rifle ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/ak47_ammo_extended
	name = "Ammunition - AK47 rifle (extended)"
	contains = list(/obj/item/ammo_magazine/ak47/extended = 4)
	cost = 40
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "AK47 rifle extended ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/pistol
	name = "Weapons - Military pistol"
	contains = list(/obj/item/gun/projectile/pistol/military/alt = 1)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "military pistol crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/pistol_ammo
	name = "Ammunition - Military pistol"
	contains = list(/obj/item/ammo_magazine/pistol/double = 4)
	cost = 10
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "military pistol ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/frags
	name = "Weapons - Frag grenades (x3)"
	contains = list(/obj/item/grenade/frag = 3)
	cost = 30
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "explosive weaponry crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/frag_bombs
	name = "Weapons - Frag bombs (x3)"
	contains = list(/obj/item/grenade/frag/high_yield = 3)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "explosive weaponry crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/bluespace_he
	name = "Ammunition - Bluespace HE rockets (x3)"
	contains = list(/obj/item/remote_weapon_ammo/explosive = 3)
	cost = 90
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "bluespace ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/bluespace_le
	name = "Ammunition - Bluespace LE rockets (x3)"
	contains = list(/obj/item/remote_weapon_ammo/explosive/low = 3)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "bluespace ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/bluespace_fire
	name = "Ammunition - Bluespace fire rockets (x3)"
	contains = list(/obj/item/remote_weapon_ammo/bluespace_fire = 3)
	cost = 60
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "bluespace ammunition crate"
	access = access_marine

/decl/hierarchy/supply_pack/marine/bluespace_infernum
	name = "Ammunition - Bluespace infernum rockets (x3)"
	contains = list(/obj/item/remote_weapon_ammo/bluespace_fire/infernum = 3)
	cost = 300
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "bluespace ammunition crate"
	access = access_marine
	hidden = TRUE

// Colony building stuff
/decl/hierarchy/supply_pack/marine/colony_kit
	name = "Equipment - Colonization kit"
	contains = list(
		/obj/item/stock_parts/circuitboard/smes,
		/obj/item/stock_parts/smes_coil,
		/obj/item/rcd = 2,
		/obj/item/rcd_ammo/large = 10,
		/obj/item/storage/belt/utility/full = 3,
		/obj/item/storage/toolbox/electrical = 2,
		/obj/item/clothing/gloves/insulated = 2,
		/obj/item/cell/high = 5,
		/obj/item/solar_assembly = 14,
		/obj/item/stock_parts/circuitboard/solar_control,
		/obj/item/tracker_electronics,
		/obj/item/stock_parts/circuitboard/telecomms/receiver,
		/obj/item/stock_parts/circuitboard/telecomms/hub,
		/obj/item/stock_parts/circuitboard/telecomms/bus,
		/obj/item/stock_parts/circuitboard/telecomms/processor,
		/obj/item/stock_parts/circuitboard/telecomms/server,
		/obj/item/stock_parts/circuitboard/telecomms/broadcaster,
		/obj/item/stack/material/steel/fifty = 6,
		/obj/item/stack/material/aluminium/fifty = 6,
		/obj/item/stack/material/glass/reinforced/fifty = 6,
		)
	cost = 300
	containertype = /obj/structure/largecrate
	containername = "colonization kit"
