var/const/NETWORK_FIRST_DECK  = "First Deck"
var/const/NETWORK_SECOND_DECK = "Second Deck"
var/const/NETWORK_THIRD_DECK  = "Third Deck"
var/const/NETWORK_BRIDGE      = "Bridge"
var/const/NETWORK_SUPPLY      = "Supply"
var/const/NETWORK_HANGAR      = "Hangar"
var/const/NETWORK_EXPLO       = "Exploration"

/datum/map/intrepid/get_network_access(var/network)
	switch(network)
		if(NETWORK_BRIDGE)
			return access_heads
		if(NETWORK_SUPPLY)
			return access_mailsorting
		if(NETWORK_HANGAR)
			return access_hangar
		if(NETWORK_EXPLO)
			return access_marine
	return get_shared_network_access(network) || ..()

/datum/map/intrepid
	// Networks that will show up as options in the camera monitor program
	station_networks = list(
		NETWORK_ROBOTS,
		NETWORK_FIRST_DECK,
		NETWORK_SECOND_DECK,
		NETWORK_THIRD_DECK,
		NETWORK_BRIDGE,
		NETWORK_COMMAND,
		NETWORK_ENGINEERING,
		NETWORK_ENGINE,
		NETWORK_MEDICAL,
		NETWORK_RESEARCH,
		NETWORK_SECURITY,
		NETWORK_SUPPLY,
		NETWORK_EXPLO,
		NETWORK_HANGAR,
		NETWORK_ALARM_ATMOS,
		NETWORK_ALARM_CAMERA,
		NETWORK_ALARM_FIRE,
		NETWORK_ALARM_MOTION,
		NETWORK_ALARM_POWER,
		NETWORK_THUNDER,
	)

//
// Cameras
//

// Networks
/obj/machinery/camera/network/bridge
	network = list(NETWORK_BRIDGE)

/obj/machinery/camera/network/first_deck
	network = list(NETWORK_FIRST_DECK)

/obj/machinery/camera/network/second_deck
	network = list(NETWORK_SECOND_DECK)

/obj/machinery/camera/network/third_deck
	network = list(NETWORK_THIRD_DECK)

/obj/machinery/camera/network/supply
	network = list(NETWORK_SUPPLY)

/obj/machinery/camera/network/hangar
	network = list(NETWORK_HANGAR)

/obj/machinery/camera/network/exploration
	network = list(NETWORK_EXPLO)

/obj/machinery/camera/network/command
	network = list(NETWORK_COMMAND)

/obj/machinery/camera/network/crescent
	network = list(NETWORK_CRESCENT)

/obj/machinery/camera/network/engine
	network = list(NETWORK_ENGINE)

/obj/machinery/camera/network/engineering_outpost
	network = list(NETWORK_ENGINEERING_OUTPOST)

// Motion
/obj/machinery/camera/motion/engineering_outpost
	network = list(NETWORK_ENGINEERING_OUTPOST)

// All Upgrades
/obj/machinery/camera/all/command
	network = list(NETWORK_COMMAND)

//
// SMES units
//

// Substation SMES
/obj/machinery/power/smes/buildable/preset/torch/substation
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil = 1) // Note that it gets one more from construction
	_input_maxed = TRUE
	_output_maxed = TRUE

// Substation SMES (charged and with full I/O setting)
/obj/machinery/power/smes/buildable/preset/torch/substation_full
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil = 1)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

// Main Engine output SMES
/obj/machinery/power/smes/buildable/preset/torch/engine_main
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil/super_io = 2,
		/obj/item/stock_parts/smes_coil/super_capacity = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

// Shuttle SMES
/obj/machinery/power/smes/buildable/preset/torch/shuttle
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil/super_io = 1,
		/obj/item/stock_parts/smes_coil/super_capacity = 1)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

// Hangar SMES. Charges the shuttles so needs a pretty big throughput.
/obj/machinery/power/smes/buildable/preset/torch/hangar
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil/super_io = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

var/const/NETWORK_COMMAND = "Command"
var/const/NETWORK_ENGINE  = "Engine"
var/const/NETWORK_ENGINEERING_OUTPOST = "Engineering Outpost"

/datum/map/proc/get_shared_network_access(var/network)
	switch(network)
		if(NETWORK_COMMAND)
			return access_heads
		if(NETWORK_ENGINE, NETWORK_ENGINEERING_OUTPOST)
			return access_engine
