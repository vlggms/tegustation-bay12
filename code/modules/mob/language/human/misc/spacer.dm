/datum/language/spacer
	name = LANGUAGE_SPACER
	desc = "A rough, informal language used infrequently by humans as a last resort when attempts to establish dialogue in more proper languages fail and no autotranslators are available."
	warning = "Automatically given if spawning with no languages."
	key = "j"
	shorthand = "Spc"
	partial_understanding = list(
		LANGUAGE_HUMAN_ENGLISH = 35,
		LANGUAGE_HUMAN_CHINESE = 15,
		LANGUAGE_HUMAN_ARABIC = 15,
		LANGUAGE_HUMAN_INDIAN = 15,
		LANGUAGE_HUMAN_IBERIAN = 25,
		LANGUAGE_HUMAN_RUSSIAN = 25,
		LANGUAGE_HUMAN_SELENIAN = 25,
		LANGUAGE_GUTTER = 35,
	)
	syllables = list(
		"ada", "zir", "bian", "ach", "usk", "ado", "ich", "cuan", "iga", "qing", "le", "que", "ki", "qaf", "dei", "eta"
	)
	colour = "spacer"
	has_written_form = TRUE
