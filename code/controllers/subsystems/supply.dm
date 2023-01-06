// Subsystem for station/ship trade via supply program. Not to be mistaked with trade.dm, which is for merchant.
SUBSYSTEM_DEF(supply)
	name = "Supply"
	wait = 20 SECONDS
	priority = SS_PRIORITY_SUPPLY
	//Initializes at default time
	flags = SS_NO_TICK_CHECK

	/// All available trading stations - visible, hidden, doesn't matter
	var/list/all_trading_stations = list()
	/// All visible and available stations
	var/list/visible_trading_stations = list()
	/// All hidden/unavailable stations
	var/list/hidden_trading_stations = list()
	/// All factions in the world; Assoc list Name = Datum.
	/// Trading stations get the datums from here
	var/list/factions = list()
	// Lists of available sending/receiving beacons
	var/list/beacons_sending = list()
	var/list/beacons_receiving = list()

/datum/controller/subsystem/supply/Initialize()
	. = ..()
	for(var/trade_type in subtypesof(/datum/trading_station))
		var/datum/trading_station/TS = new trade_type
		all_trading_stations += TS
		if(TS.start_hidden)
			hidden_trading_stations += TS
			continue
		visible_trading_stations += TS
	for(var/faction_type in typesof(/datum/trade_faction))
		var/datum/trade_faction/TF = new faction_type
		factions[TF.name] = TF
