/datum/grab/nab/aggressive
	state_name = NAB_AGGRESSIVE

	upgrab_name = NAB_KILL
	downgrab_name = NAB_PASSIVE

	shift = -10

	icon_state = "kill"

	break_chance_table = list(3, 18, 45, 100)

/datum/grab/nab/aggressive/upgrade_effect(obj/item/grab/G)
	process_effect(G)

/datum/grab/nab/aggressive/process_effect(obj/item/grab/G)
	var/mob/living/carbon/human/affecting = G.affecting
	var/mob/living/carbon/human/assailant = G.assailant

	if(assailant.incapacitated(INCAPACITATION_ALL))
		affecting.visible_message(SPAN_WARNING("[assailant] lets go of \his grab!"))
		qdel(G)
		return

	affecting.Stun(3)
