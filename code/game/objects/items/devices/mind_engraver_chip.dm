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
		func_text += "  - Improves knowledge in the field of [S.name] to the [S.levels[skills[S.type]]] level"
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
