#define TRADE_FACTION_INDEPENDENT "Independent"
#define TRADE_FACTION_TERRAGOV "Terran Government"
#define TRADE_FACTION_SOLGOV "Sol Central Government"
#define TRADE_FACTION_NANOTRASEN "Nanotrasen"
#define TRADE_FACTION_SYNDICATE "Syndicate"

#define FACTION_STATE_PROTECTORATE 3 // As in - target faction is the protectorate of ours
#define FACTION_STATE_ALLY 2
#define FACTION_STATE_FRIEND 1
#define FACTION_STATE_NEUTRAL 0
#define FACTION_STATE_RIVAL -1
#define FACTION_STATE_ENEMY -2
#define FACTION_STATE_WAR -3

/datum/trade_faction
	var/name = "Tegu Station Developers"
	var/desc = "A bunch of people that decided it is upon them to modify this universe as they see fit."
	/// Whoever is the hypothetical leader of this faction, if any
	var/ruler = "EgorDinamit"
	/// Associative list Faction = State
	var/relationship = list()

/datum/trade_faction/New()
	. = ..()
	GLOB.trade_factions += src

/datum/trade_faction/proc/ModifyRelationsWith(target = null, change = FACTION_STATE_NEUTRAL)
	if(istype(target, /datum/trade_faction))
		var/datum/trade_faction/faction = target
		target = faction.name
	relationship[target] = change
	return

/datum/trade_faction/independent
	name = TRADE_FACTION_INDEPENDENT
	desc = "Belongs to no big players in the universe, all on their own in this cruel world."
	ruler = null
	relationship = list(
		TRADE_FACTION_TERRAGOV = FACTION_STATE_NEUTRAL,
		TRADE_FACTION_SOLGOV = FACTION_STATE_NEUTRAL,
		TRADE_FACTION_NANOTRASEN = FACTION_STATE_NEUTRAL,
		TRADE_FACTION_SYNDICATE = FACTION_STATE_NEUTRAL,
		)

/datum/trade_faction/terragov
	name = TRADE_FACTION_TERRAGOV
	desc = "A part of the Terran Government, a large authoritarian republic that rivals SolGov."
	ruler = "Terran Senate"
	relationship = list(
		TRADE_FACTION_INDEPENDENT = FACTION_STATE_NEUTRAL,
		TRADE_FACTION_SOLGOV = FACTION_STATE_RIVAL,
		TRADE_FACTION_NANOTRASEN = FACTION_STATE_RIVAL,
		TRADE_FACTION_SYNDICATE = FACTION_STATE_NEUTRAL,
		)

/datum/trade_faction/solgov
	name = TRADE_FACTION_SOLGOV
	desc = "A part of the Sol Central Government, a large democratic republic that rivals TerraGov."
	ruler = "Terran Senate"
	relationship = list(
		TRADE_FACTION_INDEPENDENT = FACTION_STATE_NEUTRAL,
		TRADE_FACTION_TERRAGOV = FACTION_STATE_RIVAL,
		TRADE_FACTION_NANOTRASEN = FACTION_STATE_FRIEND,
		TRADE_FACTION_SYNDICATE = FACTION_STATE_RIVAL,
		)

/datum/trade_faction/nanotrasen
	name = TRADE_FACTION_NANOTRASEN
	desc = "A part of the mega-corporation that specializes in developing bluespace technologies."
	ruler = "Joe Nanotrasen" // I don't care
	relationship = list(
		TRADE_FACTION_INDEPENDENT = FACTION_STATE_NEUTRAL,
		TRADE_FACTION_TERRAGOV = FACTION_STATE_RIVAL,
		TRADE_FACTION_SOLGOV = FACTION_STATE_FRIEND,
		TRADE_FACTION_SYNDICATE = FACTION_STATE_ENEMY,
		)

/datum/trade_faction/syndicate
	name = TRADE_FACTION_SYNDICATE
	desc = "A part of the big conglomerate of corporations that fight Nanotrasen at any opportunity."
	ruler = "John Syndicate" // Same here
	relationship = list(
		TRADE_FACTION_INDEPENDENT = FACTION_STATE_NEUTRAL,
		TRADE_FACTION_TERRAGOV = FACTION_STATE_NEUTRAL,
		TRADE_FACTION_SOLGOV = FACTION_STATE_RIVAL,
		TRADE_FACTION_NANOTRASEN = FACTION_STATE_ENEMY,
		)
