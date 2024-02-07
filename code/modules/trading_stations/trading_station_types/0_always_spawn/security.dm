/datum/trading_station/security
	name_pool = list(
		"CTB \"Enforcer\"" = "Corporate Trade Beacon \"Enforcer\": Law and Order! Guns and batons!",
		"CTB \"Law Squad\"" = "Corporate Trade Beacon \"Law Squad\": Making sure those freaks behave!",
		)
	uid = "security"
	unlock_favor = 5000
	random_factions = list(
		FACTION_NANOTRASEN,
		FACTION_CYBERSUN,
		)
	spawn_always = TRUE
	markup = 1.2
	inventory = list(
		TRADE_CAT_WEAPONS = list(
			/obj/item/melee/baton/loaded = GOODS_DEFAULT,
			/obj/item/shield/riot = GOODS_DEFAULT,
			/obj/item/gun/energy/taser = GOODS_DEFAULT,
			/obj/item/gun/energy/stunrevolver = GOODS_DEFAULT,
			/obj/item/gun/energy/gun/small = GOODS_DEFAULT,
			),
		TRADE_CAT_ARMOR = list(
			/obj/item/clothing/suit/armor/pcarrier = GOODS_DEFAULT,
			/obj/item/clothing/head/helmet = GOODS_DEFAULT,
			/obj/item/clothing/suit/armor/vest/nt = GOODS_DEFAULT,
			/obj/item/clothing/head/helmet/nt/guard = GOODS_DEFAULT,
			/obj/item/clothing/suit/armor/bulletproof = GOODS_DEFAULT,
			/obj/item/clothing/head/helmet/ballistic = GOODS_DEFAULT,
			/obj/item/clothing/suit/armor/laserproof = GOODS_DEFAULT,
			/obj/item/clothing/head/helmet/ablative = GOODS_DEFAULT,
			/obj/item/clothing/suit/armor/riot = GOODS_DEFAULT,
			/obj/item/clothing/head/helmet/riot = GOODS_DEFAULT,
			),
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/device/flash = GOODS_DEFAULT,
			/obj/item/storage/belt/holster/security = GOODS_DEFAULT,
			/obj/item/clothing/accessory/storage/holster = GOODS_DEFAULT,
			),
		TRADE_CAT_CLOTHING = list(
			/obj/item/clothing/under/rank/security = GOODS_DEFAULT,
			/obj/item/clothing/under/rank/security2 = GOODS_DEFAULT,
			/obj/item/clothing/under/rank/security/corp = CUSTOM_GOODS_NAME("security officer's jumpsuit (corporate)"),
			/obj/item/clothing/under/rank/security/navyblue = CUSTOM_GOODS_NAME("security officer's jumpsuit (navy blue)"),
			/obj/item/clothing/under/rank/dispatch = GOODS_DEFAULT,
			/obj/item/clothing/under/tactical = GOODS_DEFAULT,
			/obj/item/clothing/under/det = GOODS_DEFAULT,
			/obj/item/clothing/under/det/grey = CUSTOM_GOODS_NAME("detective's suit (grey)"),
			/obj/item/clothing/under/det/black = CUSTOM_GOODS_NAME("detective's suit (black)"),
			),
		)
	hidden_inventory = list(
		TRADE_CAT_WEAPONS = list(
			/obj/item/gun/energy/laser = GOODS_DEFAULT,
			/obj/item/gun/energy/gun = GOODS_DEFAULT,
			/obj/item/gun/projectile/automatic/merc_smg = GOODS_DATA("NanoTrasen submachine gun", list(1, 2), 4500),
			),
		TRADE_CAT_AMMO = list(
			/obj/item/ammo_magazine/smg = GOODS_DATA("NanoTrasen submachine gun magazine", list(5, 6), null),
			),
		)
