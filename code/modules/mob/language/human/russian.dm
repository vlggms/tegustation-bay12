/*//////////////////////////////////////////////////////////////////////////////////////////////////////
	Syllable list compiled in this file based on work by Stefan Trost, available at the following URL
						https://www.sttmedia.com/syllablefrequency-russian
*///////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/language/human/russian
	name = LANGUAGE_HUMAN_RUSSIAN
	desc = "An East Slavic language originating from Earthm, in latin script. Rarely used in this era."
	colour = "russian"
	key = "r"
	shorthand = "Rus"
	partial_understanding = list(
		LANGUAGE_HUMAN_ENGLISH = 5,
		LANGUAGE_HUMAN_SELENIAN = 10,
		LANGUAGE_SPACER = 20,
	)
	syllables = list(
		"al", "an", "bi", "ve", "vo", "go", "de", "el", "en", "er", "et", "ka", "ko", "la", "li", "lo",
		"ll", "na", "ne", "ni", "no", "ov", "ol", "on", "or", "os", "ot", "ot", "po", "pr", "ra", "re",
		"ro", "st", "ta", "te", "to", "t'",
		"at'", "ver", "ego", "eni", "enn", "est", "kak", "l'n", "ova", "ogo", "ol'", "oro", "ost",
		"pri", "pro", "sta", "stv", "tor", "eto",
		"byil", "chto",
	)
	has_written_form = TRUE
