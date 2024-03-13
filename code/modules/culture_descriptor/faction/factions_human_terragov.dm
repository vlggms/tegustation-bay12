/decl/cultural_info/faction/terragov
	name = FACTION_TERRAGOV
	description = "The Terran Government, commonly referred to as TerraGov or TG, is the second most powerful human government in the universe. \
	As opposed to SolGov, TerraGov's ideals are those of progressing humanity at any cost, especially at the cost of alien civilizations. \
	Terran Government prohibits any political parties that oppose the Terran Constitution, and as such there is only so many factions within the senate \
	and each would rephrase 'progress of humanity' as they see fit, ranging from a more peaceful approach of co-existence with non-hostile alien \
	civilizations to much more extreme sides of eternal war with everyone who isn't a part of TerraGov. Despite this, the senate is considered a stable \
	entity due to every faction being somewhat restricted by the constitution. "
	subversive_potential = 10

// Senate Factions

/decl/cultural_info/faction/terragov/up
	name = FACTION_TERRASENATE_UP
	description = "The most liberal group within the Terran Senate. Its supporters are aiming for \
	the full integration of most alien species as Terran citizens and advocate for peaceful relations with SolGov."
	subversive_potential = 0 // They are for peace, bro

/decl/cultural_info/faction/terragov/pcoh
	name = FACTION_TERRASENATE_PCOH
	description = "A liberal group of pragmatists within the Terran Senate. Its supporters believe that it \
	would be only beneficial to allow aliens to work for the humans in more positions, except for the \
	command roles. \
	They see any war with other human states as avoidable and would prefer diplomatic actions instead."
	subversive_potential = 15

/decl/cultural_info/faction/terragov/tcg
	name = FACTION_TERRASENATE_TCG
	description = "Current majority in the Terran Senate. This faction advocates for continuing the old way \
	of running government as it was for more than 3 centuries already and denies most attempts at making \
	significant progress in any sphere as it may \"shatter stability\". Aliens are allowed to only work in \
	service jobs and can't live in the Terran core systems."
	subversive_potential = 0 // Current majority faction - no reasons to be angry

/decl/cultural_info/faction/terragov/tdc
	name = FACTION_TERRASENATE_TDC
	description = "A more radical group within Terran Senate that believes in complete human supremacy and \
	wishes to deport or enslave most alien species and harsh diplomacy with existing alien states. \
	For them, war with SolGov is seen as highly likely, but certainly not on the priority list."
	subversive_potential = 20 // Angry people

/decl/cultural_info/faction/terragov/erc
	name = FACTION_TERRASENATE_ERC
	description = "A militarist faction within the senate that mostly consists of war veterans and other \
	military personnel. They claim that Earth must \"return\" to the rightful government of humanity and \
	advocate for immediate war with SG and any other human government. \
	For them, war with SolGov is inevitable and it is one of their main goals. \
	Alien policies are not much different from Terran Defense Council."
	subversive_potential = 40 // VERY angry people

// Not a part of senate

/decl/cultural_info/faction/terragov/obs
	name = FACTION_TERRASENATE_OBS
	description = "An illegal organization that was once a part of a more radical wing within the \
	Earth Reclamation Committee. They believe that not only should SolGov be destroyed, but so must be all of \
	the citizens within the Solar System as they are, supposedly, tainted by alien influence and are no longer \
	considered human. Their ultimate goal is to cause the Sun to go supernova and destroy the entire solar \
	system in the process."
	subversive_potential = 100 // Literal terrorists
