/*//////////////////////////////////////////////////////////////////////////////////////////////////////
	Syllable list compiled in this file based on work by Stefan Trost, available at the following URLs
						https://www.sttmedia.com/syllablefrequency-english
						https://www.sttmedia.com/syllablefrequency-french
						https://www.sttmedia.com/syllablefrequency-german
*///////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/language/common
	name = LANGUAGE_COMMON
	desc = "A constructed language established by a united effort between scholars of Terran Dominion and Skrell. \
			Used for formal communication by humans with alien states. Sol Central Government has come to adopt it \
			As secondary language within its territories."
	speech_verb = "says"
	whisper_verb = "whispers"
	colour = ""
	key = "1"
	flags = WHITELISTED
	shorthand = "COM"
	partial_understanding = list(
		LANGUAGE_HUMAN_ENGLISH = 35,
		LANGUAGE_HUMAN_CHINESE = 5,
		LANGUAGE_HUMAN_ARABIC = 5,
		LANGUAGE_HUMAN_HINDI = 5,
		LANGUAGE_HUMAN_IBERIAN = 35,
		LANGUAGE_HUMAN_RUSSIAN = 5,
		LANGUAGE_HUMAN_SELENIAN = 15,
		LANGUAGE_SPACER = 20,
		// Alien languages,
		LANGUAGE_SKRELLIAN = 35,
		LANGUAGE_UNATHI_SINTA = 10,
		LANGUAGE_UNATHI_YEOSA = 10,
	)
	syllables = list(
		// Human syllables,
		"al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it",
		"le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to",
		"ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin",
		"ch", "de", "ge", "be", "ach", "abe", "ich", "ein", "die", "sch", "auf", "aus", "ber", "che", "ent", "que",
		"ait", "les", "lle", "men", "ais", "ans", "ait", "ave", "con", "com", "des", "tre", "eta", "eur", "est",
		"ing", "the", "ver", "was", "ith", "hin",
		// Skrell syllables,
		"qr", "qrr", "xuq", "qil", "quum", "xuqm", "vol", "xrim", "zaoo", "qu-uu", "qix", "qoo", "zix",
		// Unathi syllables,
		"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us", "ss", "ss",
		"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur", "rs", "sr",
		"azs","zis","zau","azua","skiu","zuakz","izo","aei","ki","kut","zo",
		"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz", "zs", "sz",
	)
	has_written_form = TRUE
