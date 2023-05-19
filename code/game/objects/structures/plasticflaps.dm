/obj/structure/plasticflaps //HOW DO YOU CALL THOSE THINGS ANYWAY
	name = "\improper plastic flaps"
	desc = "Completely impassable - or are they?"
	icon = 'icons/obj/stationobjs.dmi' //Change this.
	icon_state = "plasticflaps"
	density = FALSE
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER
	explosion_resistance = 5

	obj_flags = OBJ_FLAG_ANCHORABLE

	var/list/mobs_can_pass = list(
		/mob/living/bot,
		/mob/living/carbon/slime,
		/mob/living/simple_animal/friendly/mouse,
		/mob/living/silicon/robot/drone
		)

/obj/structure/plasticflaps/CanPass(atom/A, turf/T)
	if(istype(A) && A.checkpass(PASS_FLAG_GLASS))
		return prob(60)

	var/obj/structure/bed/B = A
	if (istype(A, /obj/structure/bed) && B.buckled_mob)//if it's a bed/chair and someone is buckled, it will not pass
		return 0

	if(istype(A, /obj/vehicle))	//no vehicles
		return 0

	var/mob/living/M = A
	if(istype(M))
		if(M.lying)
			return ..()
		for(var/mob_type in mobs_can_pass)
			if(istype(A, mob_type))
				return ..()
		return issmall(M)

	return ..()

/obj/structure/plasticflaps/attackby(obj/item/W, mob/user)
	if(isCrowbar(W) && !anchored)
		user.visible_message(SPAN_NOTICE("\The [user] begins deconstructing \the [src]."), SPAN_NOTICE("You start deconstructing \the [src]."))
		if(user.do_skilled(3 SECONDS, SKILL_CONSTRUCTION, src))
			user.visible_message(SPAN_WARNING("\The [user] deconstructs \the [src]."), SPAN_WARNING("You deconstruct \the [src]."))
			qdel(src)
	if(isScrewdriver(W) && anchored)
		user.visible_message(SPAN_NOTICE("\The [user] begins adjusting \the [src]."), SPAN_NOTICE("You start adjusting \the [src]."))
		if(user.do_skilled(3 SECONDS, SKILL_CONSTRUCTION, src))
			atmos_canpass = (atmos_canpass == CANPASS_ALWAYS ? CANPASS_NEVER : CANPASS_ALWAYS)
			user.visible_message(SPAN_WARNING("\The [user] adjusts \the [src], [atmos_canpass == CANPASS_NEVER ? "preventing" : "allowing"] air flow."))
	else ..()

/obj/structure/plasticflaps/ex_act(severity)
	switch(severity)
		if (1)
			qdel(src)
		if (2)
			if (prob(50))
				qdel(src)
		if (3)
			if (prob(5))
				qdel(src)

/obj/structure/plasticflaps/airtight
	atmos_canpass = CANPASS_NEVER
