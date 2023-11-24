// As in - target faction is the protectorate of ours
#define FACTION_STATE_PROTECTORATE 4
#define FACTION_STATE_ALLY 3
#define FACTION_STATE_FRIEND 2
#define FACTION_STATE_WELCOMING 1
#define FACTION_STATE_NEUTRAL 0
#define FACTION_STATE_ANIMOSITY -1
#define FACTION_STATE_RIVAL -2
#define FACTION_STATE_ENEMY -3
#define FACTION_STATE_WAR -4

/datum/trade_faction
	var/name = "Tegu Station Developers"
	var/desc = "A bunch of people that decided it is upon them to modify this universe as they see fit."
	/// Associative list Faction = State
	var/relationship = list()

/datum/trade_faction/New()
	. = ..()
	// Factions that aren't set in relationship list of the datum are set to neutral.
	for(var/datum/trade_faction/TF in SSsupply.factions)
		if(TF.name in relationship)
			continue
		if(TF.name == name)
			continue
		relationship[TF.name] = FACTION_STATE_NEUTRAL

/datum/trade_faction/proc/ModifyRelationsWith(target = null, change = FACTION_STATE_NEUTRAL)
	if(istype(target, /datum/trade_faction))
		var/datum/trade_faction/faction = target
		target = faction.name
	relationship[target] = change
	return

/datum/trade_faction/independent
	name = FACTION_INDEPENDENT
	desc = "Belongs to no big players in the universe, all on their own in this cruel world."

// The big three

/datum/trade_faction/terragov
	name = FACTION_TERRAGOV
	desc = "A part of the Terran Government, a large authoritarian republic that rivals SolGov."
	relationship = list(
		FACTION_INDEPENDENT = FACTION_STATE_ANIMOSITY,
		FACTION_SOL_CENTRAL = FACTION_STATE_RIVAL,
		FACTION_ISC = FACTION_STATE_ENEMY,
		FACTION_NANOTRASEN = FACTION_STATE_ANIMOSITY,
		FACTION_CYBERSUN = FACTION_STATE_ANIMOSITY,
		)

/datum/trade_faction/solgov
	name = FACTION_SOL_CENTRAL
	desc = "A part of the Sol Central Government, a large democratic republic that rivals TerraGov."
	relationship = list(
		FACTION_INDEPENDENT = FACTION_STATE_ANIMOSITY,
		FACTION_TERRAGOV = FACTION_STATE_RIVAL,
		FACTION_ISC = FACTION_STATE_ENEMY,
		FACTION_NANOTRASEN = FACTION_STATE_WELCOMING,
		)

/datum/trade_faction/isc
	name = FACTION_ISC
	desc = "A part of the Independent Space Confederation, a military union of independent states opposing both SolGov and TerraGov."
	relationship = list(
		FACTION_TERRAGOV = FACTION_STATE_ENEMY,
		FACTION_SOL_CENTRAL = FACTION_STATE_ENEMY,
		FACTION_NANOTRASEN = FACTION_STATE_ALLY,
		FACTION_CYBERSUN = FACTION_STATE_ALLY,
		)

// Corpos

/datum/trade_faction/nanotrasen
	name = FACTION_NANOTRASEN
	desc = "A part of the mega-corporation that specializes in development of bluespace technology."
	relationship = list(
		FACTION_TERRAGOV = FACTION_STATE_ANIMOSITY,
		FACTION_SOL_CENTRAL = FACTION_STATE_WELCOMING,
		FACTION_ISC = FACTION_STATE_ALLY,
		FACTION_CYBERSUN = FACTION_STATE_ALLY,
		)

/datum/trade_faction/cybersun
	name = FACTION_CYBERSUN
	desc = "A part of the Cybersun mega-corporation which specializes in development of implants and artificial intelligence."
	relationship = list(
		FACTION_TERRAGOV = FACTION_STATE_ANIMOSITY,
		FACTION_SOL_CENTRAL = FACTION_STATE_WELCOMING,
		FACTION_ISC = FACTION_STATE_ALLY,
		FACTION_NANOTRASEN = FACTION_STATE_ALLY,
		)

// Member states of ISC

// Purely independent states
