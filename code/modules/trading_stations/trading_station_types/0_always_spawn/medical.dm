/datum/trading_station/medical
	name_pool = list(
		"ZHTB \"Pill\"" = "Zeng-Hu Trade Beacon \"Pill\": Wares for your wounds and more!",
		"ZHTB \"Medicus\"" = "Zeng-Hu Trade Beacon \"Medicus\": Bruise packs, surgery tools, chemicals!",
		)
	uid = "medical"
	unlock_favor = 5000
	faction = FACTION_INDEPENDENT // Should be under Zeng Hu, potentially
	spawn_always = TRUE
	markup = 1.2
	inventory = list(
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/defibrillator = GOODS_DEFAULT,
			/obj/item/auto_cpr = GOODS_DEFAULT,
			/obj/item/storage/firstaid/surgery = GOODS_DEFAULT,
			/obj/item/clothing/glasses/hud/health = GOODS_DEFAULT,
			/obj/item/device/scanner/health = GOODS_DEFAULT,
			/obj/item/autopsy_scanner = GOODS_DEFAULT,
			/obj/item/storage/box/pillbottles = GOODS_DEFAULT,
			/obj/item/storage/box/syringes = GOODS_DEFAULT,
			/obj/item/storage/box/masks = GOODS_DEFAULT,
			/obj/item/storage/box/gloves = GOODS_DEFAULT,
			/obj/item/storage/box/freezer = GOODS_DEFAULT,
			),
		TRADE_CAT_MEDICAL = list(
			/obj/item/stack/medical/advanced/bruise_pack = GOODS_DEFAULT,
			/obj/item/stack/medical/advanced/ointment = GOODS_DEFAULT,
			/obj/item/reagent_containers/glass/bottle/inaprovaline = GOODS_DEFAULT,
			/obj/item/reagent_containers/glass/bottle/antitoxin = GOODS_DEFAULT,
			/obj/item/reagent_containers/ivbag/nanoblood = GOODS_DEFAULT,
			/obj/item/bodybag/rescue = GOODS_DEFAULT,
			),
		TRADE_CAT_MEDKIT = list(
			/obj/item/storage/firstaid/trauma = GOODS_DEFAULT,
			/obj/item/storage/firstaid/fire = GOODS_DEFAULT,
			/obj/item/storage/firstaid/toxin = GOODS_DEFAULT,
			/obj/item/storage/firstaid/o2 = GOODS_DEFAULT,
			/obj/item/storage/firstaid/adv = GOODS_DEFAULT,
			),
		TRADE_CAT_CHEMICAL = list(
			/obj/item/reagent_containers/glass/bottle/carpotoxin = GOODS_DEFAULT,
			/obj/item/reagent_containers/glass/bottle/spider_venom = GOODS_DEFAULT,
			),
		)
	hidden_inventory = list(
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/defibrillator/compact = GOODS_DEFAULT,
			),
		TRADE_CAT_MEDICAL = list(
			/obj/item/reagent_containers/hypospray/vial = GOODS_DEFAULT,
			),
		TRADE_CAT_MEDKIT = list(
			/obj/item/storage/firstaid/combat = GOODS_DEFAULT,
			),
		)
