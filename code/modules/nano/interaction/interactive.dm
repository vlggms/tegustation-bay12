/*
	This state always returns UI_INTERACTIVE
*/
GLOBAL_DATUM_INIT(interactive_state, /datum/topic_state/interactive, new)

/datum/topic_state/interactive/can_use_topic(var/src_object, var/mob/user)
	return UI_INTERACTIVE
