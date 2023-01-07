/datum/map/intrepid
	branch_types = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/terragov,
		/datum/mil_branch/army,
		/datum/mil_branch/military_police,
		/datum/mil_branch/marine_corps,
		/datum/mil_branch/worker,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet
	)

	spawn_branch_types = list(
		/datum/mil_branch/exploration_division,
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/terragov,
		/datum/mil_branch/army,
		/datum/mil_branch/military_police,
		/datum/mil_branch/marine_corps,
		/datum/mil_branch/worker,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet
	)

	species_to_branch_blacklist = list(
		/datum/species/human   = list(/datum/mil_branch/worker, /datum/mil_branch/alien, /datum/mil_branch/skrell_fleet),
		/datum/species/machine = list(/datum/mil_branch/terragov, /datum/mil_branch/army, /datum/mil_branch/military_police, /datum/mil_branch/marine_corps, /datum/mil_branch/worker, /datum/mil_branch/alien, /datum/mil_branch/skrell_fleet),
		/datum/species/vox     = list(
			/datum/mil_branch/exploration_division,
			/datum/mil_branch/fleet,
			/datum/mil_branch/civilian,
			/datum/mil_branch/terragov,
			/datum/mil_branch/army,
			/datum/mil_branch/military_police,
			/datum/mil_branch/marine_corps,
			/datum/mil_branch/skrell_fleet
		)
	)

	species_to_branch_whitelist = list(
		/datum/species/diona        = list(/datum/mil_branch/alien, /datum/mil_branch/worker),
		/datum/species/nabber       = list(/datum/mil_branch/alien, /datum/mil_branch/worker),
		/datum/species/skrell       = list(/datum/mil_branch/alien, /datum/mil_branch/civilian, /datum/mil_branch/worker, /datum/mil_branch/skrell_fleet),
		/datum/species/unathi       = list(/datum/mil_branch/alien, /datum/mil_branch/worker),
		/datum/species/unathi/yeosa = list(/datum/mil_branch/alien, /datum/mil_branch/worker),
		/datum/species/adherent     = list(/datum/mil_branch/alien, /datum/mil_branch/worker)
	)

	species_to_rank_whitelist = list(
		/datum/species/machine = list(
			/datum/mil_branch/exploration_division = list(
				/datum/mil_rank/ed/e3,
				/datum/mil_rank/ed/e5,
				/datum/mil_rank/ed/e7,
				/datum/mil_rank/ed/o1,
				/datum/mil_rank/ed/o3
			),
			/datum/mil_branch/fleet = list(
				/datum/mil_rank/fleet/e1,
				/datum/mil_rank/fleet/e2,
				/datum/mil_rank/fleet/e3,
				/datum/mil_rank/fleet/e4,
				/datum/mil_rank/fleet/e5,
				/datum/mil_rank/fleet/e6,
				/datum/mil_rank/fleet/e7,
				/datum/mil_rank/fleet/o1,
				/datum/mil_rank/fleet/o2,
				/datum/mil_rank/fleet/o3,
				/datum/mil_rank/fleet/o4,
			)
		),
		/datum/species/vox = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien,
				/datum/mil_rank/worker/trained,
				/datum/mil_rank/worker/professional
			)
		)
	)

/*
 *  Branches
 *  ========
 */

/datum/mil_branch/exploration_division
	name = "Exploration Division"
	name_short = "TGED"
	email_domain = "terra.ed.tg"

	rank_types = list(
		/datum/mil_rank/ed/e3,
		/datum/mil_rank/ed/e5,
		/datum/mil_rank/ed/e7,
		/datum/mil_rank/ed/o1,
		/datum/mil_rank/ed/o3,
		/datum/mil_rank/ed/o5,
		/datum/mil_rank/ed/o6
	)

	spawn_rank_types = list(
		/datum/mil_rank/ed/e3,
		/datum/mil_rank/ed/e5,
		/datum/mil_rank/ed/e7,
		/datum/mil_rank/ed/o1,
		/datum/mil_rank/ed/o3,
		/datum/mil_rank/ed/o5,
		/datum/mil_rank/ed/o6
	)

	assistant_job = /datum/job/crew

	min_skill = list(	SKILL_HAULING = SKILL_BASIC,
						SKILL_SCIENCE = SKILL_BASIC,
						SKILL_EVA     = SKILL_BASIC)

/datum/mil_branch/fleet
	name = "Fleet"
	name_short = "TGF"
	email_domain = "fleet.tg"

	rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/e9_alt2,
		/datum/mil_rank/fleet/e9_alt3,
		/datum/mil_rank/fleet/e9_alt4,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5,
		/datum/mil_rank/fleet/o6,
		/datum/mil_rank/fleet/o7,
		/datum/mil_rank/fleet/o8,
		/datum/mil_rank/fleet/o9,
		/datum/mil_rank/fleet/o10,
		/datum/mil_rank/fleet/o10_alt
	)

	spawn_rank_types = list(
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5,
		/datum/mil_rank/fleet/o6,
		/datum/mil_rank/fleet/o7
	)

	assistant_job = /datum/job/crew
	min_skill = list(	SKILL_HAULING = SKILL_BASIC,
						SKILL_WEAPONS = SKILL_BASIC,
						SKILL_EVA     = SKILL_BASIC)

/datum/mil_branch/army
	name = "Army"
	name_short = "TGA"
	email_domain = "army.tg"

	rank_types = list(
		/datum/mil_rank/army/e1,
		/datum/mil_rank/army/e2,
		/datum/mil_rank/army/e3,
		/datum/mil_rank/army/e4,
		/datum/mil_rank/army/e5,
		/datum/mil_rank/army/e6,
		/datum/mil_rank/army/e7,
		/datum/mil_rank/army/e8,
		/datum/mil_rank/army/e8_alt,
		/datum/mil_rank/army/e9,
		/datum/mil_rank/army/e9_alt1,
		/datum/mil_rank/army/e9_alt2,
		/datum/mil_rank/army/o1,
		/datum/mil_rank/army/o2,
		/datum/mil_rank/army/o3,
		/datum/mil_rank/army/o4,
		/datum/mil_rank/army/o5,
		/datum/mil_rank/army/o6,
		/datum/mil_rank/army/o7,
		/datum/mil_rank/army/o8,
		/datum/mil_rank/army/o9,
		/datum/mil_rank/army/o10,
		/datum/mil_rank/army/o10_alt
	)

	spawn_rank_types = list(
		/datum/mil_rank/army/e2,
		/datum/mil_rank/army/e3,
		/datum/mil_rank/army/e4,
		/datum/mil_rank/army/e5,
		/datum/mil_rank/army/e6,
		/datum/mil_rank/army/e7,
		/datum/mil_rank/army/e8,
		/datum/mil_rank/army/e9,
		/datum/mil_rank/army/e9_alt1,
		/datum/mil_rank/army/o1,
		/datum/mil_rank/army/o2,
		/datum/mil_rank/army/o3,
		/datum/mil_rank/army/o4,
		/datum/mil_rank/army/o5
	)

	assistant_job = /datum/job/crew
	min_skill = list(	SKILL_HAULING = SKILL_TRAINED,
	                    SKILL_WEAPONS = SKILL_BASIC,
	                    SKILL_COMBAT  = SKILL_BASIC)

/datum/mil_branch/military_police
	name = "Military Police"
	name_short = "TGMP"
	email_domain = "terra.mp.tg"

	rank_types = list(
		/datum/mil_rank/military_police/e1,
		/datum/mil_rank/military_police/e2,
		/datum/mil_rank/military_police/e3,
		/datum/mil_rank/military_police/e3_alt,
		/datum/mil_rank/military_police/e4,
		/datum/mil_rank/military_police/e5,
		/datum/mil_rank/military_police/o1,
		/datum/mil_rank/military_police/o2,
		/datum/mil_rank/military_police/o3,
		/datum/mil_rank/military_police/o4,
		/datum/mil_rank/military_police/o5,
		/datum/mil_rank/military_police/o6,
	)

	spawn_rank_types = list(
		/datum/mil_rank/military_police/e1,
		/datum/mil_rank/military_police/e2,
		/datum/mil_rank/military_police/e3,
		/datum/mil_rank/military_police/e3_alt,
		/datum/mil_rank/military_police/e4,
		/datum/mil_rank/military_police/e5,
		/datum/mil_rank/military_police/o1,
		/datum/mil_rank/military_police/o2,
		/datum/mil_rank/military_police/o3,
		/datum/mil_rank/military_police/o4,
		/datum/mil_rank/military_police/o5,
	)

	assistant_job = /datum/job/crew
	min_skill = list(	SKILL_HAULING = SKILL_TRAINED,
	                    SKILL_WEAPONS = SKILL_BASIC,
	                    SKILL_COMBAT  = SKILL_BASIC)

/datum/mil_branch/marine_corps
	name = "Marine Corps"
	name_short = "TGMC" // IS IT A TGMC REFERENCE??????
	email_domain = "mc.tg"

	rank_types = list(
		/datum/mil_rank/mc/e1,
		/datum/mil_rank/mc/e2,
		/datum/mil_rank/mc/e3,
		/datum/mil_rank/mc/e4,
		/datum/mil_rank/mc/e5,
		/datum/mil_rank/mc/e6,
		/datum/mil_rank/mc/e7,
		/datum/mil_rank/mc/e8,
		/datum/mil_rank/mc/e9,
		/datum/mil_rank/mc/o1,
		/datum/mil_rank/mc/o2,
		/datum/mil_rank/mc/o3,
		/datum/mil_rank/mc/o4,
		/datum/mil_rank/mc/o5,
		/datum/mil_rank/mc/o6,
		/datum/mil_rank/mc/o7,
		/datum/mil_rank/mc/o8,
		/datum/mil_rank/mc/o9,
		/datum/mil_rank/mc/o10
	)

	spawn_rank_types = list(
		/datum/mil_rank/mc/e1,
		/datum/mil_rank/mc/e2,
		/datum/mil_rank/mc/e3,
		/datum/mil_rank/mc/e4,
		/datum/mil_rank/mc/e5,
		/datum/mil_rank/mc/e6,
		/datum/mil_rank/mc/e7,
		/datum/mil_rank/mc/e8,
		/datum/mil_rank/mc/e9,
		/datum/mil_rank/mc/o1,
		/datum/mil_rank/mc/o2,
		/datum/mil_rank/mc/o3,
		/datum/mil_rank/mc/o4,
		/datum/mil_rank/mc/o5,
		/datum/mil_rank/mc/o6,
		/datum/mil_rank/mc/o7
	)

	assistant_job = /datum/job/crew
	min_skill = list(	SKILL_HAULING = SKILL_TRAINED,
	                    SKILL_WEAPONS = SKILL_TRAINED,
	                    SKILL_COMBAT  = SKILL_BASIC)

/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "Civ"
	email_domain = "freemail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/synthetic
	)

/datum/mil_branch/terragov
	name = "TerraGov Official"
	name_short = "TGO"
	email_domain = "terra.tg"

	rank_types = list(
		/datum/mil_rank/terragov/gov,
		/datum/mil_rank/terragov/agent,
		/datum/mil_rank/terragov/inspector,
		/datum/mil_rank/terragov/scientist,
		/datum/mil_rank/terragov/psiadvisor
	)

	spawn_rank_types = list(
		/datum/mil_rank/terragov/gov,
		/datum/mil_rank/terragov/agent,
		/datum/mil_rank/terragov/inspector,
		/datum/mil_rank/terragov/scientist,
		/datum/mil_rank/terragov/psiadvisor
	)

/datum/mil_rank/grade()
	. = ..()
	if(!sort_order)
		return ""
	if(sort_order <= 10)
		return "E[sort_order]"
	return "O[sort_order - 10]"

/*
 *  Fleet
 *  =====
 */

/datum/mil_rank/fleet/e1
	name = "Crewman Recruit"
	name_short = "CR"
	accessory = list()
	sort_order = 1

/datum/mil_rank/fleet/e2
	name = "Crewman Apprentice"
	name_short = "CA"
	accessory = list()
	sort_order = 2

/datum/mil_rank/fleet/e3
	name = "Crewman"
	name_short = "CN"
	accessory = list()
	sort_order = 3

/datum/mil_rank/fleet/e4
	name = "Petty Officer Third Class"
	name_short = "PO3"
	accessory = list()
	sort_order = 4

/datum/mil_rank/fleet/e5
	name = "Petty Officer Second Class"
	name_short = "PO2"
	accessory = list()
	sort_order = 5

/datum/mil_rank/fleet/e6
	name = "Petty Officer First Class"
	name_short = "PO1"
	accessory = list()
	sort_order = 6

/datum/mil_rank/fleet/e7
	name = "Chief Petty Officer"
	name_short = "CPO"
	accessory = list()
	sort_order = 7

/datum/mil_rank/fleet/e8
	name = "Senior Chief Petty Officer"
	name_short = "SCPO"
	accessory = list()
	sort_order = 8

/datum/mil_rank/fleet/e9
	name = "Master Chief Petty Officer"
	name_short = "MCPO"
	accessory = list()
	sort_order = 9

/datum/mil_rank/fleet/e9_alt1
	name = "Command Master Chief Petty Officer"
	name_short = "CMCPO"
	accessory = list()
	sort_order = 9

/datum/mil_rank/fleet/e9_alt2
	name = "Fleet Master Chief Petty Officer"
	name_short = "FLTCM"
	accessory = list()
	sort_order = 9

/datum/mil_rank/fleet/e9_alt3
	name = "Force Master Chief Petty Officer"
	name_short = "FORCM"
	accessory = list()
	sort_order = 9

/datum/mil_rank/fleet/e9_alt4
	name = "Master Chief Petty Officer of the Fleet"
	name_short = "MCPOF"
	accessory = list()
	sort_order = 9

/datum/mil_rank/fleet/o1
	name = "Ensign"
	name_short = "ENS"
	accessory = list()
	sort_order = 11

/datum/mil_rank/fleet/o2
	name = "Sub-lieutenant"
	name_short = "SLT"
	accessory = list()
	sort_order = 12

/datum/mil_rank/fleet/o3
	name = "Lieutenant"
	name_short = "LT"
	accessory = list()
	sort_order = 13

/datum/mil_rank/fleet/o4
	name = "Lieutenant Commander"
	name_short = "LCDR"
	accessory = list()
	sort_order = 14

/datum/mil_rank/fleet/o5
	name = "Commander"
	name_short = "CDR"
	accessory = list()
	sort_order = 15

/datum/mil_rank/fleet/o6
	name = "Captain"
	name_short = "CAPT"
	accessory = list()
	sort_order = 16

/datum/mil_rank/fleet/o7
	name = "Commodore"
	name_short = "CDRE"
	accessory = list()
	sort_order = 17

/datum/mil_rank/fleet/o8
	name = "Rear Admiral"
	name_short = "RADM"
	accessory = list()
	sort_order = 18

/datum/mil_rank/fleet/o9
	name = "Vice Admiral"
	name_short = "VADM"
	accessory = list()
	sort_order = 19

/datum/mil_rank/fleet/o10
	name = "Admiral"
	name_short = "ADM"
	accessory = list()
	sort_order = 20

/datum/mil_rank/fleet/o10_alt
	name = "Fleet Admiral"
	name_short = "FADM"
	accessory = list()
	sort_order = 20


/*
 *  ED
 *  ==
 */
/datum/mil_rank/ed/e1
	name = "Apprentice Explorer"
	name_short = "AXPL"
	accessory = list()
	sort_order = 1

/datum/mil_rank/ed/e3
	name = "Explorer"
	name_short = "XPL"
	accessory = list()
	sort_order = 3

/datum/mil_rank/ed/e5
	name = "Senior Explorer"
	name_short = "SXPL"
	accessory = list()
	sort_order = 5

/datum/mil_rank/ed/e7
	name = "Chief Explorer"
	name_short = "CXPL"
	accessory = list()
	sort_order = 7

/datum/mil_rank/ed/o1
	name = "Ensign"
	name_short = "ENS"
	accessory = list()
	sort_order = 11

/datum/mil_rank/ed/o3
	name = "Lieutenant"
	name_short = "LT"
	accessory = list()
	sort_order = 13

/datum/mil_rank/ed/o5
	name = "Commander"
	name_short = "CDR"
	accessory = list()
	sort_order = 15

/datum/mil_rank/ed/o6
	name = "Captain"
	name_short = "CAPT"
	accessory = list()
	sort_order = 16

/datum/mil_rank/ed/o8
	name = "Admiral"
	name_short = "ADM"
	accessory = list()
	sort_order = 18

/*
 *  Army
 *  ====
 */
/datum/mil_rank/army/e1
	name = "Private"
	name_short = "PVT"
	accessory = list()
	sort_order = 1

/datum/mil_rank/army/e2
	name = "Private Second Class"
	name_short = "PV2"
	accessory = list()
	sort_order = 2

/datum/mil_rank/army/e3
	name = "Private First Class"
	name_short = "PV1"
	accessory = list()
	sort_order = 3

/datum/mil_rank/army/e4
	name = "Corporal"
	name_short = "CPL"
	accessory = list()
	sort_order = 4

/datum/mil_rank/army/e5
	name = "Sergeant"
	name_short = "SGT"
	accessory = list()
	sort_order = 5

/datum/mil_rank/army/e6
	name = "Staff Sergeant"
	name_short = "SSG"
	accessory = list()
	sort_order = 6

/datum/mil_rank/army/e7
	name = "Sergeant First Class"
	name_short = "SFC"
	accessory = list()
	sort_order = 7

/datum/mil_rank/army/e8
	name = "Master Sergeant"
	name_short = "MSG"
	accessory = list()
	sort_order = 8

/datum/mil_rank/army/e8_alt
	name = "First Sergeant"
	name_short = "1SG"
	accessory = list()
	sort_order = 8

/datum/mil_rank/army/e9
	name = "Sergeant Major"
	name_short = "SGM"
	accessory = list()
	sort_order = 9

/datum/mil_rank/army/e9_alt1
	name = "Command Sergeant Major"
	name_short = "CSM"
	accessory = list()
	sort_order = 9

/datum/mil_rank/army/e9_alt2
	name = "Sergeant Major of the Army"
	name_short = "SMA"
	accessory = list()
	sort_order = 9

/datum/mil_rank/army/o1
	name = "Second Lieutenant"
	name_short = "2LT"
	accessory = list()
	sort_order = 11

/datum/mil_rank/army/o2
	name = "First Lieutenant"
	name_short = "1LT"
	accessory = list()
	sort_order = 12

/datum/mil_rank/army/o3
	name = "Captain"
	name_short = "CPT"
	accessory = list()
	sort_order = 13

/datum/mil_rank/army/o4
	name = "Major"
	name_short = "MAJ"
	accessory = list()
	sort_order = 14

/datum/mil_rank/army/o5
	name = "Lieutenant Colonel"
	name_short = "LTC"
	accessory = list()
	sort_order = 15

/datum/mil_rank/army/o6
	name = "Colonel"
	name_short = "COL"
	accessory = list()
	sort_order = 16

/datum/mil_rank/army/o7
	name = "Brigadier General"
	name_short = "BG"
	accessory = list()
	sort_order = 17

/datum/mil_rank/army/o8
	name = "Major General"
	name_short = "MG"
	accessory = list()
	sort_order = 18

/datum/mil_rank/army/o9
	name = "Lieutenant General"
	name_short = "LTG"
	accessory = list()
	sort_order = 19

/datum/mil_rank/army/o10
	name = "General"
	name_short = "GEN"
	accessory = list()
	sort_order = 20

/datum/mil_rank/army/o10_alt
	name = "General of the Army"
	name_short = "GA"
	accessory = list()
	sort_order = 20

/*
 *  Military Police
 *  ====
 */
/datum/mil_rank/military_police/e1
	name = "Recruit"
	name_short = "RCT"
	accessory = list()
	sort_order = 1

/datum/mil_rank/military_police/e2
	name = "Trooper"
	name_short = "TPR"
	accessory = list()
	sort_order = 2

/datum/mil_rank/military_police/e3
	name = "Corporal"
	name_short = "CPL"
	accessory = list()
	sort_order = 3

/datum/mil_rank/military_police/e3_alt
	name = "Inspector"
	name_short = "INS"
	accessory = list()
	sort_order = 3

/datum/mil_rank/military_police/e4
	name = "Sergeant"
	name_short = "SGT"
	accessory = list()
	sort_order = 4

/datum/mil_rank/military_police/e5
	name = "First Sergeant"
	name_short = "FSGT"
	accessory = list()
	sort_order = 5

/datum/mil_rank/military_police/o1
	name = "Lieutenant"
	name_short = "LT"
	accessory = list()
	sort_order = 11

/datum/mil_rank/military_police/o2
	name = "Captain"
	name_short = "CPT"
	accessory = list()
	sort_order = 12

/datum/mil_rank/military_police/o3
	name = "Major"
	name_short = "MAJ"
	accessory = list()
	sort_order = 13

/datum/mil_rank/military_police/o4
	name = "Lieutenant Colonel"
	name_short = "LTC"
	accessory = list()
	sort_order = 14

/datum/mil_rank/military_police/o5
	name = "Colonel"
	name_short = "COL"
	accessory = list()
	sort_order = 15

/datum/mil_rank/military_police/o6
	name = "Superintendent"
	name_short = "SI"
	accessory = list()
	sort_order = 16

/*
 *  Marine Corps
 *  ============
 */
/datum/mil_rank/mc/e1
	name = "Private"
	name_short = "PVT"
	accessory = list()
	sort_order = 1

/datum/mil_rank/mc/e2
	name = "Private First Class"
	name_short = "PFC"
	accessory = list()
	sort_order = 2

/datum/mil_rank/mc/e3
	name = "Lance Corporal"
	name_short = "LCPL"
	accessory = list()
	sort_order = 3

/datum/mil_rank/mc/e4
	name = "Corporal"
	name_short = "CPL"
	accessory = list()
	sort_order = 4

/datum/mil_rank/mc/e5
	name = "Sergeant"
	name_short = "SGT"
	accessory = list()
	sort_order = 5

/datum/mil_rank/mc/e6
	name = "Staff Sergeant"
	name_short = "SSG"
	accessory = list()
	sort_order = 6

/datum/mil_rank/mc/e7
	name = "Gunnery Sergeant"
	name_short = "GSGT"
	accessory = list()
	sort_order = 7

/datum/mil_rank/mc/e8
	name = "Master Sergeant"
	name_short = "MSG"
	accessory = list()
	sort_order = 8

/datum/mil_rank/mc/e9
	name = "Master Gunnery Sergeant"
	name_short = "MGSGT"
	accessory = list()
	sort_order = 9

/datum/mil_rank/mc/o1
	name = "Second Lieutenant"
	name_short = "2LT"
	accessory = list()
	sort_order = 11

/datum/mil_rank/mc/o2
	name = "First Lieutenant"
	name_short = "1LT"
	accessory = list()
	sort_order = 12

/datum/mil_rank/mc/o3
	name = "Captain"
	name_short = "CPT"
	accessory = list()
	sort_order = 13

/datum/mil_rank/mc/o4
	name = "Major"
	name_short = "MAJ"
	accessory = list()
	sort_order = 14

/datum/mil_rank/mc/o5
	name = "Lieutenant Colonel"
	name_short = "LTC"
	accessory = list()
	sort_order = 15

/datum/mil_rank/mc/o6
	name = "Colonel"
	name_short = "COL"
	accessory = list()
	sort_order = 16

/datum/mil_rank/mc/o7
	name = "Brigadier General"
	name_short = "BG"
	accessory = list()
	sort_order = 17

/datum/mil_rank/mc/o8
	name = "Major General"
	name_short = "MG"
	accessory = list()
	sort_order = 18

/datum/mil_rank/mc/o9
	name = "Lieutenant General"
	name_short = "LTG"
	accessory = list()
	sort_order = 19

/datum/mil_rank/mc/o10
	name = "General"
	name_short = "GEN"
	accessory = list()
	sort_order = 20

/*
 *  Civilians
 *  =========
 */

/datum/mil_rank/civ/civ
	name = "Civilian"

/datum/mil_rank/civ/synthetic
	name = "Synthetic"

/*
 *  TerraGov Employees
 *  ======== =========
 */

/datum/mil_rank/terragov/gov
	name = "TerraGov Representative"
	name_short = "TGR"
	accessory = list()

/datum/mil_rank/terragov/agent
	name = "TerraGov Agent"
	name_short = "AGT"
	accessory = list()

/datum/mil_rank/terragov/inspector
	name = "TerraGov Inspector"
	name_short = "TGISP"

/datum/mil_rank/terragov/scientist
	name = "TerraGov Scientist"
	name_short = "GOVT"

/datum/mil_rank/terragov/psiadvisor
	name = "Psionic Advisor"
	name_short = "PADV"

/*
 *  Alien Workers
 *  ===== =======
 */

/datum/mil_branch/worker
	name = "Alien Worker"
	name_short = "AW"
	email_domain = "aw.worker.tg"

	rank_types = list(
		/datum/mil_rank/worker/recruit,
		/datum/mil_rank/worker/trained,
		/datum/mil_rank/worker/professional
	)

	spawn_rank_types = list(
		/datum/mil_rank/worker/recruit,
		/datum/mil_rank/worker/trained,
		/datum/mil_rank/worker/professional
	)

/datum/mil_rank/worker/recruit
	name = "Third-Class Worker"

/datum/mil_rank/worker/trained
	name = "Second-Class Worker"

/datum/mil_rank/worker/professional
	name = "First-Class Worker"

// Vox/foreign alien branch.
/datum/mil_branch/alien
	name = "Alien"
	name_short = "Alien"
	rank_types = list(/datum/mil_rank/alien)
	spawn_rank_types = list(/datum/mil_rank/alien)

/datum/mil_rank/alien
	name = "Alien"
