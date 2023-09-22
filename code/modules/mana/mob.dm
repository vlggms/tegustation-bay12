/mob/living
	var/datum/mana/mana = /datum/mana

/mob/living/Initialize()
	. = ..()
	if(ispath(mana))
		mana = new mana()

/mob/living/Destroy()
	QDEL_NULL(mana)
	. = ..()
