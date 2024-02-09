/datum/trade_faction
	var/name = "Tegu Station Developers"
	var/desc = "A bunch of people that decided it is upon them to modify this universe as they see fit."
	/// Associative list Faction = State
	var/list/relationship = list()
	/// List of factions who we will not trade with
	var/list/embargo = list()
	/// Associative list Faction = Additional markup; This is additional markup! Bad relations will have their own
	var/list/trade_markup = list()
	/// Access level required to set faction on supply program to this
	var/access_required = null

/datum/trade_faction/proc/ModifyRelationsWith(target = null, change = FACTION_STATE_NEUTRAL)
	if(istype(target, /datum/trade_faction))
		var/datum/trade_faction/faction = target
		target = faction.name
	relationship[target] = change
	return

/datum/trade_faction/independent
	name = FACTION_INDEPENDENT
	desc = "Belongs to no big players in the universe, all on their own in this cruel world."
	relationship = list(
		FACTION_TERRAGOV = FACTION_STATE_ANIMOSITY,
		FACTION_SOL_CENTRAL = FACTION_STATE_ANIMOSITY,
		FACTION_ISC = FACTION_STATE_RIVAL,
		FACTION_NANOTRASEN = FACTION_STATE_ANIMOSITY,
		FACTION_CYBERSUN = FACTION_STATE_ANIMOSITY,
		FACTION_REBORN_CHRISTIAN_CHURCH = FACTION_STATE_ENEMY,
		FACTION_TERRASENATE_OBS = FACTION_STATE_ENEMY,
		)

// The big three

/datum/trade_faction/terragov
	name = FACTION_TERRAGOV
	desc = "A part of the Terran Government, a large militaristic republic that rivals SolGov."
	relationship = list(
		FACTION_INDEPENDENT = FACTION_STATE_ANIMOSITY,
		FACTION_SOL_CENTRAL = FACTION_STATE_RIVAL,
		FACTION_ISC = FACTION_STATE_RIVAL,
		FACTION_NANOTRASEN = FACTION_STATE_ANIMOSITY,
		FACTION_CYBERSUN = FACTION_STATE_ANIMOSITY,
		FACTION_REBORN_CHRISTIAN_CHURCH = FACTION_STATE_ENEMY,
		FACTION_TERRASENATE_OBS = FACTION_STATE_ENEMY,
		)
	access_required = access_supplylink_terragov

/datum/trade_faction/solgov
	name = FACTION_SOL_CENTRAL
	desc = "A part of the Sol Central Government, a large democratic republic that rivals TerraGov."
	relationship = list(
		FACTION_INDEPENDENT = FACTION_STATE_ANIMOSITY,
		FACTION_TERRAGOV = FACTION_STATE_RIVAL,
		FACTION_ISC = FACTION_STATE_RIVAL,
		FACTION_NANOTRASEN = FACTION_STATE_WELCOMING,
		FACTION_REBORN_CHRISTIAN_CHURCH = FACTION_STATE_RIVAL,
		FACTION_TERRASENATE_OBS = FACTION_STATE_WAR,
		)
	access_required = access_supplylink_solgov

/datum/trade_faction/isc
	name = FACTION_ISC
	desc = "A part of the Independent Space Confederation, a military union of independent states opposing both SolGov and TerraGov."
	relationship = list(
		FACTION_TERRAGOV = FACTION_STATE_RIVAL,
		FACTION_SOL_CENTRAL = FACTION_STATE_RIVAL,
		FACTION_NANOTRASEN = FACTION_STATE_ALLY,
		FACTION_CYBERSUN = FACTION_STATE_ALLY,
		FACTION_REBORN_CHRISTIAN_CHURCH = FACTION_STATE_ALLY,
		FACTION_TERRASENATE_OBS = FACTION_STATE_ENEMY,
		)
	access_required = access_supplylink_isc

// Corpos

/datum/trade_faction/nanotrasen
	name = FACTION_NANOTRASEN
	desc = "A part of the mega-corporation that specializes in development of bluespace technology."
	relationship = list(
		FACTION_TERRAGOV = FACTION_STATE_ANIMOSITY,
		FACTION_SOL_CENTRAL = FACTION_STATE_WELCOMING,
		FACTION_ISC = FACTION_STATE_ALLY,
		FACTION_CYBERSUN = FACTION_STATE_ALLY,
		FACTION_REBORN_CHRISTIAN_CHURCH = FACTION_STATE_ALLY,
		FACTION_TERRASENATE_OBS = FACTION_STATE_RIVAL,
		)
	access_required = access_supplylink_nanotrasen

/datum/trade_faction/cybersun
	name = FACTION_CYBERSUN
	desc = "A part of the Cybersun mega-corporation which specializes in development of implants and artificial intelligence."
	relationship = list(
		FACTION_TERRAGOV = FACTION_STATE_ANIMOSITY,
		FACTION_SOL_CENTRAL = FACTION_STATE_WELCOMING,
		FACTION_ISC = FACTION_STATE_ALLY,
		FACTION_NANOTRASEN = FACTION_STATE_ALLY,
		FACTION_REBORN_CHRISTIAN_CHURCH = FACTION_STATE_ALLY,
		FACTION_TERRASENATE_OBS = FACTION_STATE_ANIMOSITY,
		)
	access_required = access_supplylink_cybersun

// Member states of ISC

/datum/trade_faction/reborcn_church
	name = FACTION_REBORN_CHRISTIAN_CHURCH
	desc = "A part of the Reborn Christian Church, a fanatical state focused on enforcing the will of Pontifex Maximus."
	relationship = list(
		FACTION_INDEPENDENT = FACTION_STATE_ANIMOSITY,
		FACTION_TERRAGOV = FACTION_STATE_ENEMY,
		FACTION_SOL_CENTRAL = FACTION_STATE_RIVAL,
		FACTION_ISC = FACTION_STATE_ALLY,
		FACTION_NANOTRASEN = FACTION_STATE_ALLY,
		FACTION_CYBERSUN = FACTION_STATE_ALLY,
		FACTION_TERRASENATE_OBS = FACTION_STATE_ENEMY,
		)
	access_required = access_supplylink_reborn_church

// Purely independent states

// Misc

/datum/trade_faction/obs
	name = FACTION_TERRASENATE_OBS
	desc = "A part of the Order of the Black Sun, a xenophobic ultra-nationalist terrorist group."
	relationship = list(
		FACTION_INDEPENDENT = FACTION_STATE_RIVAL,
		FACTION_TERRAGOV = FACTION_STATE_ENEMY,
		FACTION_SOL_CENTRAL = FACTION_STATE_WAR,
		FACTION_ISC = FACTION_STATE_ENEMY,
		FACTION_NANOTRASEN = FACTION_STATE_RIVAL,
		// OBS trades more with Cybersun,
		FACTION_CYBERSUN = FACTION_STATE_ANIMOSITY,
		FACTION_REBORN_CHRISTIAN_CHURCH = FACTION_STATE_ENEMY,
		)
	access_required = access_supplylink_obs
