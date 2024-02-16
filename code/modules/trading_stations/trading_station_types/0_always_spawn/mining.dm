/datum/trading_station/mining
	name_pool = list(
		"FTB \"Phoron Fever\"" = "Free Trade Beacon \"Phoron Fever\": Grab that drill and get the deal!",
		"FTB \"Drills & Ores\"" = "Free Trade Beacon \"Drills & Ores\": Mining equipment for all your dire ore needs.",
		)
	uid = "mining"
	unlock_favor = 8000
	random_factions = list(
		FACTION_INDEPENDENT,
		FACTION_NANOTRASEN,
		)
	spawn_always = TRUE
	markup = 1.2
	inventory = list(
		TRADE_CAT_TOOLS = list(
			/obj/item/pickaxe = GOODS_DEFAULT,
			/obj/item/shovel = GOODS_DEFAULT,
			/obj/item/pickaxe/drill = GOODS_DEFAULT,
			/obj/item/gun/energy/plasmacutter = GOODS_DEFAULT,
			),
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/clothing/glasses/material = GOODS_DEFAULT,
			/obj/item/clothing/glasses/meson = GOODS_DEFAULT,
			/obj/item/storage/ore = GOODS_DEFAULT,
			/obj/structure/largecrate = GOODS_DEFAULT,
			/obj/item/device/flashlight/lantern = GOODS_DEFAULT,
			/obj/item/device/flashlight/lamp/floodlamp = GOODS_DEFAULT,
			/obj/item/grenade/light = GOODS_DEFAULT,
			/obj/item/device/scanner/mining = GOODS_DEFAULT,
			/obj/item/device/scanner/gas = GOODS_DEFAULT,
			),
		TRADE_CAT_CLOTHING = list(
			/obj/item/clothing/under/rank/miner = GOODS_DEFAULT,
			/obj/item/clothing/accessory/storage/brown_vest = GOODS_DEFAULT,
			/obj/item/clothing/accessory/storage/webbing = GOODS_DEFAULT,
			),
		)
	hidden_inventory = list(
		TRADE_CAT_TOOLS = list(
			/obj/item/pickaxe/diamonddrill = GOODS_DEFAULT,
			/obj/item/pickaxe/jackhammer = GOODS_DEFAULT,
			),
		)
