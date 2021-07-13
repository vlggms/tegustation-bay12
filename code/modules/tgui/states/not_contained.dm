/*!
 * Copyright (c) 2020 Aleksej Komarov
 * SPDX-License-Identifier: MIT
 */

/**
 * tgui state: notcontained_state
 *
 * Checks that the user is not inside src_object, and then makes the
 * default checks.
 */

GLOBAL_DATUM_INIT(not_contained_state, /datum/ui_state/not_contained_state, new)

/datum/ui_state/not_contained_state/can_use_topic(atom/src_object, mob/user)
	. = user.shared_ui_interaction(src_object)
	if(. > UI_CLOSE)
		return min(., user.not_contained_can_use_topic(src_object))

/mob/proc/not_contained_can_use_topic(src_object)
	return UI_CLOSE

/mob/living/not_contained_can_use_topic(atom/src_object)
	if(src_object.contains(src))
		return UI_CLOSE // Close if we're inside it.
	return default_can_use_topic(src_object)

/mob/living/silicon/not_contained_can_use_topic(src_object)
	return default_can_use_topic(src_object) // Silicons use default bevhavior.

/mob/living/simple_animal/drone/not_contained_can_use_topic(src_object)
	return default_can_use_topic(src_object) // Drones use default bevhavior.
