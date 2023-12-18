/*//////////////////////////////////////////////////////////////////////////////////////////////////////
	Syllable list compiled in this file based on work by Stefan Trost, available at the following URL
						https://www.sttmedia.com/syllablefrequency-hindi
*///////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/language/human/hindi
	name = LANGUAGE_HUMAN_HINDI
	desc = "An indo-aryan language originating from Earth's North India, in latin script. Rarely used in this era."
	colour = "indian"
	key = "3"
	shorthand = "Dehv"
	space_chance = 30
	partial_understanding = list(
		LANGUAGE_HUMAN_ENGLISH = 5,
		LANGUAGE_HUMAN_CHINESE = 5,
		LANGUAGE_HUMAN_ARABIC = 10,
		LANGUAGE_HUMAN_SELENIAN = 5,
		LANGUAGE_SPACER = 20,
	)
	syllables = list(
		"ek", "aur", "ki", "ki", "ke", "de", "thaa", "ne", "me", "yaa", "se", "haa",
		"hai", "aar", "en", "ain", "y", "ke", "hai", "yaa", "en", "me", "aur", "se",
		"ki", "ne", "ek", "aar", "ain", "ki", "haa", "y", "thaa", "de", "usk", "use",
		"khaa", "kin", "kiy", "ky", "dei", "dekh", "nhi", "pne", "pr", "baar", "yon",
		"men", "iyaa", "main", "apn"
	)
	has_written_form = TRUE
