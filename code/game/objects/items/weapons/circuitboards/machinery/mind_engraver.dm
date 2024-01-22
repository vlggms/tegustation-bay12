/obj/item/stock_parts/circuitboard/mind_engraver
	name = T_BOARD("mind engraver")
	build_path = /obj/machinery/mind_engraver
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 7, TECH_DATA = 5, TECH_DOMINION = 2)
	req_components = list(
		/obj/item/stock_parts/capacitor = 4,
		/obj/item/stock_parts/scanning_module = 2,
		/obj/item/stock_parts/manipulator = 2
		)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
		)
