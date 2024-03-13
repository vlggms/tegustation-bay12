/*
 * Exploration Division
 */

/decl/closet_appearance/secure_closet/intrepid/exploration
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_RED_ORANGE,
		"exped" = COLOR_RED_ORANGE
	)

/decl/closet_appearance/secure_closet/intrepid/exploration/pilot
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_RED_ORANGE,
		"stripe_vertical_right_full" = COLOR_RED_ORANGE,
		"exped" = COLOR_RED_ORANGE
	)

/decl/closet_appearance/secure_closet/intrepid/exploration/medic
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_RED_ORANGE,
		"stripe_vertical_mid_full" = COLOR_BABY_BLUE,
		"stripe_vertical_right_full" = COLOR_RED_ORANGE,
		"exped" = COLOR_BABY_BLUE
	)

/decl/closet_appearance/secure_closet/intrepid/exploration/engi
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_RED_ORANGE,
		"stripe_vertical_mid_full" = COLOR_WARM_YELLOW,
		"stripe_vertical_right_full" = COLOR_RED_ORANGE,
		"exped" = COLOR_WARM_YELLOW
	)

/decl/closet_appearance/secure_closet/intrepid/exploration/squad_leader
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_RED_ORANGE,
		"stripe_vertical_mid_full" = COLOR_CLOSET_GOLD,
		"stripe_vertical_right_full" = COLOR_RED_ORANGE,
		"exped" = COLOR_CLOSET_GOLD
	)

/obj/structure/closet/secure_closet/squad_leader
	name = "squad leader's locker"
	req_access = list(access_squad_leader)
	closet_appearance = /decl/closet_appearance/secure_closet/intrepid/exploration/squad_leader
	storage_capacity = 60
	health_min_damage = 40

/obj/structure/closet/secure_closet/squad_leader/WillContain()
	return list(
		/obj/item/device/remote_weapon_controller,
		/obj/item/gun/projectile/automatic/t18,
		/obj/item/ammo_magazine/t18 = 3,
		/obj/item/gun/projectile/pistol/military/alt,
		/obj/item/ammo_magazine/pistol/double = 3,
		/obj/item/grenade/frag,
		/obj/item/storage/belt/holster/security/tactical,
		/obj/item/clothing/suit/space/void/marine/leader/prepared,
		/obj/item/tank/oxygen,
		/obj/item/device/radio,
		/obj/item/device/tape/random,
		/obj/item/device/gps,
		/obj/item/pinpointer/radio,
		/obj/item/taperoll/research,
		/obj/item/material/hatchet/machete/deluxe,
		/obj/item/storage/belt/holster/machete,
		/obj/item/device/spaceflare,
		/obj/item/clothing/mask/gas/terran,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/taperecorder,
		/obj/item/device/scanner/gas,
		/obj/item/device/flash,
		/obj/item/device/radio/headset/squad_leader,
		/obj/item/device/radio/headset/squad_leader/alt,
		/obj/item/storage/box/encryptionkey/exploration,
		/obj/item/device/binoculars,
		/obj/item/material/knife/folding/swiss/explorer,
		/obj/item/clothing/accessory/buddytag,
		/obj/item/storage/firstaid/light,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/marine
	name = "marine's locker"
	req_access = list(access_marine)
	closet_appearance = /decl/closet_appearance/secure_closet/intrepid/exploration
	storage_capacity = 60
	health_min_damage = 40

/obj/structure/closet/secure_closet/marine/WillContain()
	return list(
		/obj/item/gun/projectile/automatic/t18,
		/obj/item/ammo_magazine/t18 = 3,
		/obj/item/grenade/frag,
		/obj/item/storage/belt/holster/security/tactical,
		/obj/item/clothing/suit/space/void/marine/prepared,
		/obj/item/tank/oxygen,
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/taperoll/research,
		/obj/item/material/hatchet/machete,
		/obj/item/storage/belt/holster/machete,
		/obj/item/device/spaceflare,
		/obj/item/clothing/mask/gas/terran,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/exploration,
		/obj/item/device/radio/headset/exploration/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/accessory/buddytag,
		/obj/item/storage/firstaid/light,
		/obj/item/material/knife/folding/swiss/explorer,
		/obj/item/device/camera,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/marine, /obj/item/storage/backpack/satchel/marine)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger/marine)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/combat_medic
	name = "combat medic's locker"
	req_access = list(access_combat_medic)
	closet_appearance = /decl/closet_appearance/secure_closet/intrepid/exploration/medic
	storage_capacity = 60
	health_min_damage = 40

/obj/structure/closet/secure_closet/combat_medic/WillContain()
	return list(
		/obj/item/gun/projectile/automatic/t18,
		/obj/item/ammo_magazine/t18 = 3,
		/obj/item/grenade/frag,
		/obj/item/storage/belt/holster/security/tactical,
		/obj/item/clothing/suit/space/void/marine/prepared,
		/obj/item/tank/oxygen,
		/obj/item/storage/firstaid/combat,
		/obj/item/storage/firstaid/adv,
		/obj/item/bodybag/cryobag,
		/obj/item/storage/belt/medical,
		/obj/item/device/scanner/health,
		/obj/item/storage/firstaid/surgery,
		/obj/item/defibrillator/compact/loaded,
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/taperoll/research,
		/obj/item/material/hatchet/machete,
		/obj/item/storage/belt/holster/machete,
		/obj/item/device/spaceflare,
		/obj/item/clothing/mask/gas/terran,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/exploration,
		/obj/item/device/radio/headset/exploration/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/accessory/buddytag,
		/obj/item/storage/firstaid/light,
		/obj/item/material/knife/folding/swiss/explorer,
		/obj/item/device/camera,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/marine, /obj/item/storage/backpack/satchel/marine)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger/marine)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/combat_engi
	name = "combat engineer's locker"
	req_access = list(access_combat_engineer)
	closet_appearance = /decl/closet_appearance/secure_closet/intrepid/exploration/engi
	storage_capacity = 60
	health_min_damage = 40

/obj/structure/closet/secure_closet/combat_engi/WillContain()
	return list(
		/obj/item/gun/projectile/automatic/t18,
		/obj/item/ammo_magazine/t18 = 3,
		/obj/item/grenade/frag,
		/obj/item/storage/belt/holster/security/tactical,
		/obj/item/clothing/suit/space/void/marine/prepared,
		/obj/item/tank/oxygen,
		/obj/item/storage/belt/utility/full,
		/obj/item/rcd,
		/obj/item/rcd_ammo/large,
		/obj/item/rcd_ammo/large,
		/obj/item/rcd_ammo/large,
		/obj/item/rcd_ammo/large,
		/obj/item/gun/energy/plasmacutter,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/taperoll/research,
		/obj/item/material/hatchet/machete,
		/obj/item/storage/belt/holster/machete,
		/obj/item/device/spaceflare,
		/obj/item/clothing/mask/gas/terran,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/exploration,
		/obj/item/device/radio/headset/exploration/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/accessory/buddytag,
		/obj/item/storage/firstaid/light,
		/obj/item/material/knife/folding/swiss/explorer,
		/obj/item/device/camera,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/marine, /obj/item/storage/backpack/satchel/marine)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger/marine)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

// PILOTS DON'T EXIST!
/obj/structure/closet/secure_closet/pilot
	name = "pilot's locker"
	req_access = list(access_marine)
	closet_appearance = /decl/closet_appearance/secure_closet/intrepid/exploration/pilot

/obj/structure/closet/secure_closet/pilot/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/gps,
		/obj/item/storage/belt/utility/full,
		/obj/item/device/spaceflare,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio/headset/headset_pilot,
		/obj/item/device/radio/headset/headset_pilot/alt,
		/obj/item/device/binoculars,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/suit/storage/hazardvest/blue,
		/obj/item/clothing/head/helmet/terragov/pilot,
		/obj/item/clothing/head/helmet/terragov/pilot/fleet,
		/obj/item/clothing/head/helmet/nt/pilot,
		/obj/item/storage/firstaid/light,
		/obj/item/material/knife/folding/swiss/explorer,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)
