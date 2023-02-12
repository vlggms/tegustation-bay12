/obj/item/stock_parts/circuitboard/quantumpad
	name = T_BOARD("quantum pad")
	build_path = /obj/machinery/quantumpad
	board_type = "machine"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_ENGINEERING = 5)
	req_components = list(
		/obj/item/stock_parts/capacitor = 5,
		/obj/item/stock_parts/micro_laser = 5)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/battery/buildable/stock,
		/obj/item/cell/standard = 1
	)

/obj/item/stock_parts/circuitboard/quantumpad/mining
	name = T_BOARD("mining quantum pad")
	build_path = /obj/machinery/quantumpad/mining
	origin_tech = list(TECH_BLUESPACE = 4, TECH_ENGINEERING = 4)
	req_components = list(
		/obj/item/stock_parts/capacitor = 3,
		/obj/item/stock_parts/micro_laser = 5)
