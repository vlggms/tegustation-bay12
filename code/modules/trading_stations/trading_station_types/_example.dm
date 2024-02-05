/datum/trading_station/example
	name_pool = list(
		"Example Trader" = "An example trading outpost selling some stuff. Cool!.",
		"Example Trader" = "An example trading outpost, but with different description. Wow!",
		)
	uid = "example"
	unlock_favor = 500
	faction = FACTION_INDEPENDENT
	spawn_always = TRUE
	spawn_probability = 50
	start_hidden = FALSE
	inventory = list(
		TRADE_CAT_WEAPONS = list(
			/obj/item/gun/projectile/automatic/ak47 = GOODS_DATA("Surplus Rifle", list(5, 10), 2500),
			/obj/item/gun/projectile/pistol/military = CUSTOM_GOODS_PRICE(500),
			),
		)
	hidden_inventory = list(
		TRADE_CAT_WEAPONS = list(
			/obj/item/gun/projectile/automatic/t12 = GOODS_DATA("Advanced Terran Rifle", list(1, 3), 10000),
			),
		)
