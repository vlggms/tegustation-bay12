/datum/trading_station
	var/name = "Unknown Trading Station"
	var/description = "What is it?"
	/// From -100 to 100: Dictates availability of certain wares and the prices.
	var/favor = 0
	/// Amount of favor required to unlock hidden inventory
	var/unlock_favor = 50
	/// Its parent faction. Factions have relations with other factions, but it is usually outside of player's control
	/// Has to be a string: See defines in trading_stations/_faction.dm
	var/faction = TRADE_FACTION_INDEPENDENT
	var/start_hidden = FALSE
	/// What we sell
	/// A very big assoc list of Category = list(Type = Cost, ...)
	var/list/inventory = list()
	/// A big assoc list, similar to inventory.
	/// All items here are available after passing the favor threshold
	var/list/hidden_inventory = list()

/// Returns the datum of our faction
/datum/trading_station/proc/GetFaction()
	var/datum/trade_faction/TF = SSsupply.factions[faction]
	if(!istype(TF))
		return null
	return TF
