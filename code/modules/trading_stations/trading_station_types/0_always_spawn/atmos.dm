/datum/trading_station/atmospherics
	name_pool = list(
		"FTB \"Deuterium Star\"" = "Free Trade Beacon \"Deuterium Star\": All the gases of the world in convenient packaging.",
		"FTB \"Breathe-Easy\"" = "Free Trade Beacon \"Breathe-Easy\": Fill those corridors with fresh-fresh air!",
		)
	uid = "atmospherics"
	unlock_favor = 9000
	random_factions = list(
		FACTION_INDEPENDENT,
		FACTION_ISC,
		)
	spawn_always = TRUE
	markup = 1.4
	inventory = list(
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/tank/oxygen = GOODS_DEFAULT,
			/obj/item/tank/nitrogen = GOODS_DEFAULT,
			/obj/item/tank/emergency/oxygen = GOODS_DEFAULT,
			/obj/item/tank/emergency/oxygen/double = GOODS_DEFAULT,
			/obj/item/tank/jetpack/carbondioxide = GOODS_DEFAULT,
			/obj/item/tank/jetpack/oxygen = GOODS_DEFAULT,
			),
		TRADE_CAT_CANISTERS = list(
			/obj/machinery/portable_atmospherics/canister/empty = CUSTOM_GOODS_NAME("empty canister"),
			/obj/machinery/portable_atmospherics/canister/oxygen = GOODS_DEFAULT,
			/obj/machinery/portable_atmospherics/canister/nitrogen = GOODS_DEFAULT,
			/obj/machinery/portable_atmospherics/canister/air = GOODS_DEFAULT,
			/obj/machinery/portable_atmospherics/canister/carbon_dioxide = GOODS_DEFAULT,
			/obj/machinery/portable_atmospherics/canister/phoron = GOODS_DEFAULT,
			),
		TRADE_CAT_MACHINES = list(
			/obj/machinery/portable_atmospherics/powered/pump = GOODS_DEFAULT,
			/obj/machinery/portable_atmospherics/powered/scrubber = GOODS_DEFAULT,
			),
		)
	hidden_inventory = list(
		TRADE_CAT_EQUIPMENT = list(
			/obj/item/tank/jetpack/ascent = CUSTOM_GOODS_NAME("unidentified alien jetpack"),
			),
		TRADE_CAT_CANISTERS = list(
			/obj/machinery/portable_atmospherics/canister/tritium = GOODS_DEFAULT,
			/obj/machinery/portable_atmospherics/canister/deuterium = GOODS_DEFAULT,
			),
		TRADE_CAT_MACHINES = list(
			/obj/machinery/portable_atmospherics/powered/scrubber/huge = GOODS_DEFAULT,
			),
		)
