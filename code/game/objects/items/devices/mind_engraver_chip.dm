/obj/item/mind_engraver_chip
	name = "mind engraver nanochip"
	desc = "A tiny chip that stores data used by mind engravers to imprint certain knowledge."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "rom2"
	item_state = "electronic"
	w_class = ITEM_SIZE_SMALL

	origin_tech = list(TECH_DATA = 8, TECH_DOMINION = 5)

	var/datum/engraver_data/stored_data = null

/obj/item/mind_engraver_chip/Initialize()
	. = ..()
	if(ispath(stored_data))
		stored_data = new stored_data()

/obj/item/mind_engraver_chip/Destroy()
	QDEL_NULL(stored_data)
	stored_data = null
	return ..()

/* Presets */
/obj/item/mind_engraver_chip/human_languages
	name = "mind engraver nanochip - \"Languages of the Humanity\""
	desc = "A relatively big chip with tiny label saying \"Languages of the Humanity\"."
	icon_state = "romos2"
	stored_data = /datum/engraver_data/language/humanity

/obj/item/mind_engraver_chip/diplomatic_languages
	name = "mind engraver nanochip - \"Dominion Diplomacy\""
	desc = "A bigger chip used by Terran Dominion to grant instant knowledge on all languages important to the Diplomatic \
			procedures in the universe."
	icon_state = "romos2"
	stored_data = /datum/engraver_data/language/diplomatic

/* Randomized spawns */
/obj/item/mind_engraver_chip/random_skills
	stored_data = /datum/engraver_data/skill/random

/obj/item/mind_engraver_chip/random_languages
	stored_data = /datum/engraver_data/language/random

///////////
/* Datum */
///////////
/datum/engraver_data
	var/chip_type = "UNKNOWN"
	var/value = 1500

/datum/engraver_data/proc/PrintFunction()
	return "UNKNOWN"

/datum/engraver_data/proc/ApplyEffect(mob/living/carbon/human/target)
	if(!istype(target))
		return FALSE
	return TRUE

/datum/engraver_data/proc/Value()
	return value

/* Skills */
/datum/engraver_data/skill
	chip_type = "Skill Imprint"
	var/max_skills_count = 3
	var/list/skills = list()

/datum/engraver_data/skill/PrintFunction()
	if(!LAZYLEN(skills))
		return SPAN_DANGER("MISSING SKILL DATA")
	var/func_text = "<br>"
	for(var/decl/hierarchy/skill/S in GLOB.skills)
		if(!(S.type in skills))
			continue
		func_text += "  - Improves knowledge in the field of [S.name] to the [S.levels[skills[S.type]]] level<br>"
	return func_text

/datum/engraver_data/skill/ApplyEffect(mob/living/carbon/human/target)
	if(!..())
		return FALSE

	if(!target.skillset)
		return FALSE

	for(var/decl/hierarchy/skill/S in GLOB.skills)
		if(!(S.type in skills))
			continue
		if(target.get_skill_value(S.type) >= skills[S.type])
			continue
		target.skillset.skill_list[S.type] = skills[S.type]
		to_chat(target, SPAN_NOTICE("You feel much more proficient in the field of [S.name]!"))

	target.skillset.on_levels_change()
	return TRUE

/datum/engraver_data/skill/Value()
	. = ..()
	for(var/decl/hierarchy/skill/S in GLOB.skills)
		if(!(S.type in skills))
			continue
		for(var/i = 1 to skills[S.type])
			. += S.get_cost(i) * 500

// Random
/datum/engraver_data/skill/random/New()
	. = ..()
	var/list/valid_skills = GLOB.skills.Copy()
	for(var/i = 1 to rand(1, max_skills_count))
		if(!LAZYLEN(valid_skills))
			return
		var/decl/hierarchy/skill/S = pick(valid_skills)
		valid_skills -= S
		skills[S.type] = rand(SKILL_BASIC, length(S.levels))

// Presets
/datum/engraver_data/skill/max_combat
	skills = list(
		SKILL_COMBAT = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX,
		)

/datum/engraver_data/skill/max_command
	skills = list(
		SKILL_BUREAUCRACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_PILOT = SKILL_MAX,
		)

/datum/engraver_data/skill/trained_medical
	skills = list(
		SKILL_MEDICAL = SKILL_TRAINED,
		SKILL_ANATOMY = SKILL_TRAINED,
		SKILL_CHEMISTRY = SKILL_TRAINED,
		)

/* Languages */
/datum/engraver_data/language
	chip_type = "Language Imprint"
	var/max_language_count = 3
	var/list/languages = list()

/datum/engraver_data/language/PrintFunction()
	if(!LAZYLEN(languages))
		return SPAN_DANGER("MISSING SKILL DATA")
	var/func_text = "<br>"
	for(var/lang in languages)
		if(!all_languages[lang])
			continue
		func_text += "  - Imprints professional level knowledge on [lowertext(lang)] language<br>"
	return func_text

/datum/engraver_data/language/ApplyEffect(mob/living/carbon/human/target)
	if(!..())
		return FALSE

	for(var/lang in languages)
		if(!target.add_language(lang))
			continue
		to_chat(target, SPAN_NOTICE("You gain professional understanding of [lowertext(lang)] language!"))

	return TRUE

/datum/engraver_data/language/Value()
	. = ..()
	for(var/lang in languages)
		switch(lang)
			if(LANGUAGE_CHANGELING_GLOBAL, LANGUAGE_CULT_GLOBAL)
				. += 22000
			if(LANGUAGE_BORER_GLOBAL)
				. += 16000
			if(LANGUAGE_ROBOT_GLOBAL)
				. += 12000
			if(LANGUAGE_DRONE_GLOBAL, LANGUAGE_MANTID_BROADCAST, LANGUAGE_ROOTGLOBAL)
				. += 10000
			if(LANGUAGE_CULT, LANGUAGE_MANTID_VOCAL, LANGUAGE_MANTID_NONVOCAL, LANGUAGE_ALIUM)
				. += 8000
			if(LANGUAGE_NABBER, LANGUAGE_ADHERENT, LANGUAGE_VOX, LANGUAGE_ROOTLOCAL, LANGUAGE_SKRELLIAN, LANGUAGE_UNATHI_SINTA, LANGUAGE_UNATHI_YEOSA)
				. += 6000
			if(LANGUAGE_EAL)
				. += 4000
			if(LANGUAGE_PRIMITIVE)
				. += 2000
			else
				. += 1000

// Random
/datum/engraver_data/language/random/New()
	. = ..()
	var/list/valid_languages = all_languages.Copy()
	for(var/i = 1 to rand(1, max_language_count))
		if(!LAZYLEN(valid_languages))
			return
		var/lang = pick(valid_languages)
		valid_languages -= lang
		languages |= lang

// Presets
/datum/engraver_data/language/humanity/New()
	. = ..()
	for(var/lang in subtypesof(/datum/language/human))
		var/datum/language/L = lang
		languages |= initial(L.name)

/datum/engraver_data/language/diplomatic
	languages = list(
		LANGUAGE_COMMON,
		LANGUAGE_SPACER,
		LANGUAGE_HUMAN_ENGLISH,
		LANGUAGE_SKRELLIAN,
		LANGUAGE_UNATHI_SINTA,
		)

/datum/engraver_data/language/english
	languages = list(LANGUAGE_HUMAN_ENGLISH)

/datum/engraver_data/language/skrell
	languages = list(LANGUAGE_SKRELLIAN)

/datum/engraver_data/language/adherent
	languages = list(LANGUAGE_ADHERENT)

/* Fluff */
/datum/engraver_data/memory
	chip_type = "Memory Imprint"
	value = 1000
	var/function_text = "UNKNOWN"

/datum/engraver_data/memory/PrintFunction()
	if(!function_text)
		return SPAN_DANGER("MISSING SKILL DATA")
	return "[function_text]<br>"

// Presets
/datum/engraver_data/memory/dominion_info_one
	function_text = "Imprints basic information about Terran Dominion, as of year 244, III e."
	// List of text that will be sent to the user some time after applying the nanochip
	var/list/after_thoughts = list(
		"Soldier" = list(
			"You feel like it might be good idea to join the Terran Navy...",
			"You think that Dominion's army could use a soldier like you...",
			"There's definitely a need for people like you in the Terran military!",
			"Why are you not in the Dominion's army...? You are missing out on so much...",
			"You could be a Lieutenant by now, and then aristocratic status is just a step away...",
			"The Terran Dominion needs you in its military... You are a great soldier!",
			),
		"Governor" = list(
			"You feel like Terran Dominion could use someone like you for their government apparatus...",
			"You think it'd be really nice if you were governing some planet out there...",
			"Maybe your skills would be incredibly useful if put to some use..?",
			"You start to wonder how high planet governor's salary is...",
			"The Terran Dominion definitely needs you as one of their governors... You are an excellent strategist and leader!",
			),
		"Scientist" = list(
			"You feel like you are a wonderful scientist...",
			"You wonder if Dominion's Ministry of Scientific Progress is where you belong...",
			"Terran Dominion rewards their scientist handsomely, doesn't it?",
			"Your mind is full of useful knowldge and ideas, the Dominion would certainly need you...",
			"Your place is with other great minds in the Terran Dominion... You are an absolute genius!",
			),
		"Doctor" = list(
			"You feel like you could save a lot more lives as a doctor in the Dominion's military...",
			"Terran Dominion has better medical equipment than the ones you are used to...",
			"How great would it be if you were a combat medic? Or a field surgeon for the Terran navy?",
			"You are an absolute master with surgical tools and medical equipment, after all...",
			"The Terran Dominion would not say \"no\" to a great doctor like you, you are the best one out there!",
			),
		// Lmao,
		"Useless" = list(
			"You try to think of how useful you'd be for the Terran Dominion...",
			"You feel like you are just not fit for society...",
			"Maybe you could be a... something...?",
			"Now you just feel like the most useless person in universe...",
			"You think it's a great idea to donate your brain to the Ministry of Scientific Progress...",
			"Maybe becoming a cyborg will make you more useful...",
			),
		)

/datum/engraver_data/memory/dominion_info_one/ApplyEffect(mob/living/target)
	if(!..())
		return FALSE

	var/list/dat = list()

	dat += "<h1><b>Terran Dominion - Basic Information</b></h1><br>"
	dat += "<i>This covers information about Terran Dominion as of year 244 of third era.<br>"
	dat += "The following memories are all a part of the educational program initiated by the Ministry of Scientific Progress.<br>"
	dat += "No other alterations will be present.</i><br>"
	dat += "<hr>"
	dat += "<b>Primary Language:</b> English<br>"
	dat += "<b>Capital City:</b> <u>\[DATA EXPUNGED\]</u> located on Earth, Sol system<br>"
	dat += "<b>Current Ruler:</b> Emperor Jang Seo-joon"
	dat += "<hr>"
	dat += "<b>Terran Dominion</b> is the official government of human species (homo-sapiens and its subtypes), \
			currently in control of over a hundred populated star systems and around 500 operational \
			space stations and motherships.<br>"
	dat += "Terran Dominion is governed by the Emperor, which is appointed by the previous ruler as they see fit. \
			Members of aristocracy fill in the positions of authority, such as sector administrators, \
			ministers, advisors and military generals.<br>"
	dat += "You, our dear citizen, is capable of joining the ranks of aristocracy by proving yourself to be a \
			valuable asset to the Dominion. Current data recommends that you seek employment in the following \
			fields if you are interested:<br>"
	dat += "- Military;<br>"
	dat += "- Planet Governor;<br>"
	dat += "- Research & Development;<br>"

	var/datum/browser/popup = new(target, "mind_engraver_chip_[type]", "New Memory", 360, 500)
	popup.set_content(JOINTEXT(dat))
	popup.open()

	to_chat(target, SPAN_WARNING("Your mind is flooded with batches of new information. You feel like you always knew it..."))
	// SIDE EFFECTS! You now want to serve the Terran Dominion! Kinda...
	var/chosen_type = "Useless"
	// Trying to be as on-point as possible
	if(target.get_skill_value(SKILL_HAULING) >= SKILL_EXPERIENCED || target.get_skill_value(SKILL_COMBAT) >= SKILL_TRAINED || target.get_skill_value(SKILL_WEAPONS) >= SKILL_TRAINED)
		chosen_type = "Soldier"
	else if(target.get_skill_value(SKILL_PILOT) >= SKILL_EXPERIENCED || target.get_skill_value(SKILL_BUREAUCRACY) >= SKILL_EXPERIENCED || target.get_skill_value(SKILL_FINANCE) >= SKILL_EXPERIENCED)
		chosen_type = "Governor"
	else if(target.get_skill_value(SKILL_SCIENCE) >= SKILL_EXPERIENCED || target.get_skill_value(SKILL_CHEMISTRY) >= SKILL_TRAINED || target.get_skill_value(SKILL_DEVICES) >= SKILL_EXPERIENCED)
		chosen_type = "Scientist"
	else if(target.get_skill_value(SKILL_MEDICAL) >= SKILL_TRAINED && target.get_skill_value(SKILL_ANATOMY) >= SKILL_TRAINED)
		chosen_type = "Doctor"

	if(chosen_type in after_thoughts)
		var/list/chosen_list = after_thoughts[chosen_type]
		var/message_delay = rand(30 SECONDS, 80 SECONDS)
		for(var/i = 1 to length(chosen_list))
			addtimer(CALLBACK(GLOBAL_PROC, /proc/to_chat, target, SPAN_SUBTLE(chosen_list[i])), (rand(90 SECONDS, 300 SECONDS) + (i * message_delay)))

	return TRUE
