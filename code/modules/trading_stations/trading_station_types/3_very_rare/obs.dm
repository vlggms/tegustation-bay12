// Sells stolen shit;
// Unlocked inventory contains their own unique items
/datum/trading_station/obs
	name_pool = list(
		"FTB \"Eclipse\"" = "Free Trade Beacon \"Eclipse\": DATA MISSING | CONTACT SUP-#*@$! <b>Glory to the Order and the new humanity!</b>",
		)
	uid = "obs"
	unlock_favor = 10000
	faction = FACTION_TERRASENATE_OBS
	spawn_probability = 15
	start_hidden = TRUE
	markup = 1.5
	inventory = list(
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/device/personal_shield = GOODS_DEFAULT,
			/obj/item/silencer = GOODS_DEFAULT,
			/obj/item/clothing/glasses/tacgoggles = GOODS_DEFAULT,
			/obj/item/clothing/glasses/thermal = GOODS_DEFAULT,
			/obj/item/clothing/glasses/night = GOODS_DEFAULT,
			/obj/item/contraband/poster/order_black_of_sun = CUSTOM_GOODS_NAME("OBS poster"),
			),
		TRADE_CAT_CLOTHING = list(
			/obj/item/clothing/gloves/thick/combat = GOODS_DEFAULT,
			),
		TRADE_CAT_WEAPONS = list(
			/obj/item/gun/projectile/automatic/ak47 = GOODS_DEFAULT,
			/obj/item/tank/phoron/onetankbomb = GOODS_DEFAULT,
			/obj/item/grenade/frag = GOODS_DEFAULT,
			),
		TRADE_CAT_AMMO = list(
			/obj/item/ammo_magazine/ak47 = GOODS_DEFAULT,
			/obj/item/ammo_magazine/ak47/extended = GOODS_DEFAULT,
			),
		)
	hidden_inventory = list(
		TRADE_CAT_VOIDSUIT = list(
			/obj/item/clothing/suit/space/void/merc/obs = GOODS_DATA("eclipse void suit", list(1, 3), 4000),
			/obj/item/clothing/head/helmet/space/void/merc/obs = GOODS_DATA("eclipse void suit helmet", list(1, 3), 3000),
			),
		)
