/datum/trading_station/dominion
	name_pool = list(
		"TDASRTB-S9-149" = "Terran Dominion Automated Short Range Trade Beacon | Sector 9 | Unit 149.",
		)
	uid = "dominion"
	unlock_favor = 20000
	faction = FACTION_TERRAN_DOMINION
	spawn_probability = 15
	start_hidden = TRUE
	markup = 2.0 // Note: Markup doesn't apply to goods with custom prices, so keep that in mind
	inventory = list(
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/mind_engraver_chip = GOODS_DATA("empty mind engraver chip", list(1, 2), 15000),
			/obj/item/mind_engraver_chip/random_languages = GOODS_DATA("language engraver chip", list(1, 2), 30000),
			/obj/item/mind_engraver_chip/random_skills = GOODS_DATA("skill engraver chip", list(1, 2), 60000),
			),
		)
	// If someone manages to get two millions of disposable income - let them have it
	hidden_inventory = list(
		TRADE_CAT_WEAPONS = list(
			/obj/item/gun/magnetic/railgun/automatic/dominion = GOODS_DATA("ST-410 railgun", list(1, 2), 1864000),
			),
		)
