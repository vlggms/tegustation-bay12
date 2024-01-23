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

/datum/engraver_data/proc/PrintFunction()
	return "UNKNOWN"

/datum/engraver_data/proc/ApplyEffect(mob/living/carbon/human/target)
	if(!istype(target))
		return FALSE
	return TRUE

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

// Random
/datum/engraver_data/skill/random/New()
	. = ..()
	var/list/valid_skills = GLOB.skills.Copy()
	for(var/i = 1 to rand(1, max_skills_count))
		if(!LAZYLEN(valid_skills))
			return
		var/decl/hierarchy/skill/S = pick(valid_skills)
		valid_skills -= S
		skills[S.type] = rand(SKILL_BASIC, S.default_max)

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
