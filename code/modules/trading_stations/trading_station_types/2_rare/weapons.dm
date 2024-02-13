/datum/trading_station/weapons_terra
	name_pool = list(
		"TTB \"Telum\"" = "Terran Trade Beacon \"Telum\": Surplus marine equipment sold to friends of humanity!",
		)
	uid = "weapons_terra"
	unlock_favor = 8000
	faction = FACTION_TERRAGOV
	spawn_probability = 30
	markup = 1.2
	inventory = list(
		TRADE_CAT_WEAPONS = list(
			/obj/item/gun/projectile/pistol/military/alt = CUSTOM_GOODS_NAME("service pistol"),
			/obj/item/gun/projectile/pistol/magnum_pistol = CUSTOM_GOODS_NAME("magnum pistol"),
			/obj/item/gun/projectile/automatic/machine_pistol = GOODS_DEFAULT,
			/obj/item/gun/projectile/automatic = GOODS_DEFAULT,
			),
		TRADE_CAT_AMMO = list(
			/obj/item/ammo_magazine/pistol/double = CUSTOM_GOODS_NAME("service pistol magazine"),
			/obj/item/ammo_magazine/magnum = CUSTOM_GOODS_NAME("magnum pistol magazine"),
			/obj/item/ammo_magazine/machine_pistol = GOODS_DEFAULT,
			/obj/item/ammo_magazine/proto_smg = GOODS_DEFAULT,
			),
		TRADE_CAT_ARMOR = list(
			/obj/item/clothing/suit/armor/pcarrier/merc = CUSTOM_GOODS_NAME("marine plate carrier"),
			/obj/item/clothing/head/helmet/merc = CUSTOM_GOODS_NAME("marine combat helmet"),
			),
		)
