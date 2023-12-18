/*//////////////////////////////////////////////////////////////////////////////////////////////////////
	Syllable list compiled in this file based on work by Stefan Trost, available at the following URLs
						https://www.sttmedia.com/syllablefrequency-english
*///////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/language/human/english
	name = LANGUAGE_HUMAN_ENGLISH
	desc = "Primary language of the humanity and Terran Dominion, following the Earth's unification in \
			January of 1994, II e."
	speech_verb = "says"
	whisper_verb = "whispers"
	colour = ""
	key = "1"
	flags = WHITELISTED
	shorthand = "Eng"
	partial_understanding = list(
		LANGUAGE_HUMAN_CHINESE = 5,
		LANGUAGE_HUMAN_ARABIC = 5,
		LANGUAGE_HUMAN_INDIAN = 5,
		LANGUAGE_HUMAN_IBERIAN = 30,
		LANGUAGE_HUMAN_RUSSIAN = 5,
		LANGUAGE_HUMAN_SELENIAN = 25,
		LANGUAGE_COMMON = 25,
		LANGUAGE_SPACER = 35,
		LANGUAGE_GUTTER = 75,
	)
	syllables = list(
		"al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it",
		"le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to",
		"all", "and", "are", "but", "ent", "ara", "eve", "ere", "for", "had", "hat", "hen", "her", "hin",
		"the", "our", "oul", "thi", "tio", "uld", "ter", "ver", "was", "wit", "you",
	)
	has_written_form = TRUE
