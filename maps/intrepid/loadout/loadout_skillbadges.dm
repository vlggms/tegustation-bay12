/datum/gear/skill
	sort_category = "Skill Badges"
	category = /datum/gear/skill
	slot = slot_tie

// Medical
/datum/gear/skill/medical_basic
	display_name = "Basic First Aid Training badge"
	path = /obj/item/clothing/accessory/terragov/skillbadge/medical
	allowed_skills = list(SKILL_MEDICAL = SKILL_BASIC)

/datum/gear/skill/medical_trained
	display_name = "Advanced First Aid Training badge"
	path = /obj/item/clothing/accessory/terragov/skillbadge/medical/advanced
	allowed_skills = list(SKILL_MEDICAL = SKILL_BASIC)

// Misc
/datum/gear/skill/mech
	display_name = "Exosuit Training badge"
	path = /obj/item/clothing/accessory/terragov/skillbadge/mech
	allowed_skills = list(SKILL_MECH = HAS_PERK)
