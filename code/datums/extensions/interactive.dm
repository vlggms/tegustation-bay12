//Extensions that can be interacted with via Topic
/datum/extension/interactive
	base_type = /datum/extension/interactive
	var/list/host_predicates
	var/list/user_predicates

/datum/extension/interactive/New(var/datum/holder, var/host_predicates = list(), var/user_predicates = list())
	..()

	src.host_predicates = host_predicates ? host_predicates : list()
	src.user_predicates = user_predicates ? user_predicates : list()

/datum/extension/interactive/Destroy()
	host_predicates.Cut()
	user_predicates.Cut()
	return ..()

/datum/extension/interactive/proc/extension_status(var/mob/user)
	if(!holder || !user)
		return UI_CLOSE
	if(!all_predicates_true(list(holder), host_predicates))
		return UI_CLOSE
	if(!all_predicates_true(list(user), user_predicates))
		return UI_CLOSE
	if(holder.CanUseTopic(user, GLOB.default_state) != UI_INTERACTIVE)
		return UI_CLOSE

	return UI_INTERACTIVE

/datum/extension/interactive/proc/extension_act(var/href, var/list/href_list, var/mob/user)
	return extension_status(user) == UI_CLOSE

/datum/extension/interactive/Topic(var/href, var/list/href_list)
	if(..())
		return TRUE
	return extension_act(href, href_list, usr)
