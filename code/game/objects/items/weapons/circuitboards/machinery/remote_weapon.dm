/obj/item/stock_parts/circuitboard/remote_weapon
	name = T_BOARD("remote weapon")
	build_path = /obj/machinery/remote_weapon
	board_type = "machine"
	origin_tech = list(TECH_BLUESPACE = 5, TECH_POWER = 5, TECH_ENGINEERING = 5)
	req_components = list(
							/obj/item/stock_parts/manipulator = 10,
						  )

/obj/item/stock_parts/circuitboard/remote_weapon/explosive
	name = T_BOARD("explosive remote weapon")
	build_path = /obj/machinery/remote_weapon/explosive

/obj/item/stock_parts/circuitboard/remote_weapon/loadable
	name = T_BOARD("bluespace rocket launcher")
	build_path = /obj/machinery/remote_weapon/loadable
