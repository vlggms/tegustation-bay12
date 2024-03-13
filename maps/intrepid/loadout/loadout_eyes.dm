/datum/gear/eyes/eyepatch
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/eyes/fashionglasses
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/eyes/sciencegoggles
	allowed_roles = RESEARCH_ROLES

/datum/gear/eyes/security
	allowed_roles = SECURITY_ROLES

/datum/gear/eyes/medical
	allowed_roles = MEDICAL_ROLES

/datum/gear/eyes/meson/New()
	. = ..()
	allowed_roles = ENGINEERING_ROLES | RESEARCH_ROLES | EXPLORATION_ROLES

/datum/gear/eyes/welding/New()
	. = ..()
	allowed_roles = ENGINEERING_ROLES | RESEARCH_ROLES

/datum/gear/eyes/material/New()
	. = ..()
	allowed_roles = ENGINEERING_ROLES | EXPLORATION_ROLES
