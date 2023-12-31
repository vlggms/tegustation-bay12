/*//////////////////////////////////////////////////////////////////////////////////////////////////////
	Syllable list compiled in this file based on work by Stefan Trost, available at the following URL
						https://www.sttmedia.com/syllablefrequency-latin
*///////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/language/human/latin
	name = LANGUAGE_HUMAN_LATIN
	desc = "An archaic language used primarily during first era of humanity and beginning of the second one. \
			Nowadays it found itself being popular with Independent Sector colonists and wannabe imperials."
	colour = "latin"
	key = "l"
	shorthand = "Lat"
	partial_understanding = list(
		LANGUAGE_HUMAN_ENGLISH = 35,
		LANGUAGE_HUMAN_IBERIAN = 50,
		LANGUAGE_HUMAN_SELENIAN = 10,
		LANGUAGE_SPACER = 20,
	)
	syllables = list(
		"ae", "am", "an", "ar", "at", "ci", "co", "de", "di", "em", "en", "er",
		"es", "et", "ia", "in", "is", "it", "iu", "li", "ne", "ni", "nt", "on",
		"or", "os", "pe", "qu", "re", "ri", "ru", "se", "si", "st", "ta", "te",
		"ti", "tu", "ue", "ui", "um", "ur", "us",
		"ant", "ati", "bus", "con", "cum", "ent", "era", "ere", "eri",
		"est", "iam", "ibu", "ili", "iss", "ita", "itu", "ium", "ius",
		"nte", "nti", "oru", "per", "pro", "qua", "que", "qui", "quo",
		"rat", "rum", "sse", "tat", "ter", "tis", "tum", "tur", "unt",
	)
	has_written_form = TRUE
