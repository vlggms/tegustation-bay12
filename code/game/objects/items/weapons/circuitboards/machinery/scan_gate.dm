/obj/item/stock_parts/circuitboard/scanner_gate
	name = T_BOARD("scanner gate")
	build_path = /obj/machinery/scanner_gate
	board_type = "machine"
	origin_tech = list(TECH_DATA = 2)
	req_components = list(/obj/item/stock_parts/scanning_module = 3)
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)
