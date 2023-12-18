/datum/language/gutter
	name = LANGUAGE_GUTTER
	desc = "This crude pidgin tongue developed on Pluto during its busier days. \
			It is common among the lower classes of Pluto. It is a common language among Plutonians. \
			It is considered a crude language by many that are 'upper class'."
	speech_verb = "growls"
	colour = "rough"
	key = "t"
	space_chance = 70
	partial_understanding = list(
		LANGUAGE_HUMAN_ENGLISH = 75,
		LANGUAGE_HUMAN_CHINESE = 20,
		LANGUAGE_HUMAN_ARABIC = 10,
		LANGUAGE_HUMAN_INDIAN = 10,
		LANGUAGE_HUMAN_IBERIAN = 30,
		LANGUAGE_HUMAN_RUSSIAN = 30,
		LANGUAGE_HUMAN_SELENIAN = 15,
		LANGUAGE_SPACER = 35,
	)
	syllables = list (
		"oi", "yo", "bo", "ga", "lo",
		"ken", "zat", "gad",
		"yayo", "aiya", "meit", "grok", "berk",
		"tikat", "bazar", "cohon",
		"pendeo", "chiksa",
	)
	shorthand = "Gut"
	has_written_form = TRUE
