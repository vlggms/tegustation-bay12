/datum/trading_station/science
	name_pool = list(
		"CTB \"Absotech\"" = "Corporate Trade Beacon \"Absotech\": For when your tech has to be absolute!",
		"CTB \"Know-how\"" = "Corporate Trade Beacon \"Know-how\": Learn the secrets of the universe for a small fee!",
		)
	uid = "science"
	unlock_favor = 5000
	random_factions = list(
		FACTION_INDEPENDENT,
		FACTION_NANOTRASEN,
		FACTION_CYBERSUN,
		)
	spawn_always = TRUE
	markup = 1.2
	inventory = list(
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/device/scanner/xenobio = GOODS_DEFAULT,
			/obj/item/device/scanner/spectrometer = GOODS_DEFAULT,
			/obj/item/portable_destructive_analyzer = GOODS_DEFAULT,
			/obj/item/aicard = GOODS_DEFAULT,
			/obj/structure/anomaly_container = GOODS_DEFAULT,
			),
		)
	hidden_inventory = list(
		TRADE_CAT_ARTIFACT = list(
			/obj/machinery/artifact = GOODS_DATA("artifact", list(1, 2), 20000)
			),
		)
