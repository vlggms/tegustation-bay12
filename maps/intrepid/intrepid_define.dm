/datum/map/intrepid
	name = "\improper Intrepid"
	full_name = "\improper TGLV Intrepid"
	path = "intrepid"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/intrepid_config.txt"

	admin_levels  = list(3)
	escape_levels = list(4)
	empty_levels  = list(5)
	accessible_z_levels = list("1"=1, "2"=2, "9"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("freemail.net", "aw.worker.tg", "terra.tg", "terra.ed.tg", "fleet.tg", "army.tg")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "\improper TGLV Intrepid"
	station_short = "\improper Intrepid"
	dock_name     = "TBD"
	boss_name     = "Exploration Division Command"
	boss_short    = "Command"
	company_name  = "Terran Government"
	company_short = "TerraGov"

	map_admin_faxes = list(
		"Terran Government",
		"Terran Government Military Command",
		"Exploration Division Command",
		"Bureau of Diplomatic Affairs",
		"Ministry of Alien Affairs", // Diplomatic Affairs, but less diplomatic.
		"Emergency Management Bureau"
	)

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/terragov

	use_overmap = 1
	num_exoplanets = 1

	away_site_budget = 3
	min_offmap_players = 12

	id_hud_icons = 'maps/intrepid/icons/assignment_hud.dmi'

	available_cultural_info = list(
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_VENUS,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_HELIOS,
			HOME_SYSTEM_TERRA,
			HOME_SYSTEM_NEW_EARTH,
			HOME_SYSTEM_TERSTEN,
			HOME_SYSTEM_LORRIMAN,
			HOME_SYSTEM_CINU,
			HOME_SYSTEM_YUKLID,
			HOME_SYSTEM_LORDANIA,
			HOME_SYSTEM_KINGSTON,
			HOME_SYSTEM_GAIA,
			HOME_SYSTEM_MAGNITKA,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_TERRAGOV, // Just a part of TerraGov with no particular ideology
			FACTION_TERRASENATE_UP, // Factions of the senate start here
			FACTION_TERRASENATE_PCOH,
			FACTION_TERRASENATE_TCG,
			FACTION_TERRASENATE_TDC,
			FACTION_TERRASENATE_ERC
		),
		TAG_CULTURE = list(
			CULTURE_HUMAN_MARTIAN,
			CULTURE_HUMAN_MARSTUN,
			CULTURE_HUMAN_LUNAPOOR,
			CULTURE_HUMAN_LUNARICH,
			CULTURE_HUMAN_VENUSIAN,
			CULTURE_HUMAN_VENUSLOW,
			CULTURE_HUMAN_BELTER,
			CULTURE_HUMAN_PLUTO,
			CULTURE_HUMAN_EARTH,
			CULTURE_HUMAN_CETI,
			CULTURE_HUMAN_SPACER,
			CULTURE_HUMAN_SPAFRO,
			CULTURE_HUMAN_TERRAN,
			CULTURE_HUMAN_OTHER,
			CULTURE_OTHER
		),
		TAG_RELIGION = list(
			RELIGION_OTHER,
			RELIGION_JUDAISM,
			RELIGION_HINDUISM,
			RELIGION_BUDDHISM,
			RELIGION_SIKHISM,
			RELIGION_JAINISM,
			RELIGION_ISLAM,
			RELIGION_CHRISTIANITY,
			RELIGION_BAHAI_FAITH,
			RELIGION_AGNOSTICISM,
			RELIGION_DEISM,
			RELIGION_ATHEISM,
			RELIGION_THELEMA,
			RELIGION_SPIRITUALISM,
			RELIGION_SHINTO,
			RELIGION_TAOISM
		)
	)

	default_cultural_info = list(
		TAG_HOMEWORLD = HOME_SYSTEM_TERRA,
		TAG_FACTION =   FACTION_TERRAGOV,
		TAG_CULTURE =   CULTURE_HUMAN_TERRAN,
		TAG_RELIGION =  RELIGION_AGNOSTICISM
	)

	loadout_blacklist = list(
		/datum/gear/passport,
		/datum/gear/travelvisa,
		/datum/gear/workvisa,
		)
