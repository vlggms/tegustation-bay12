/obj/machinery/mind_engraver
	name = "mind engraver"
	desc = "A complicated scanner connected to even more complicated machinery."
	icon = 'icons/obj/machines/mind_engraver.dmi'
	icon_state = "engraver_0"
	density = FALSE
	anchored = TRUE
	construct_state = /decl/machine_construction/default/panel_closed

	idle_power_usage = 500
	active_power_usage = 90000

	machine_name = "mind engraver"
	machine_desc = "Mind Engravers are an ultra-tech device that was used by Terran Dominion during its power peak. \
		Allows to imprint knowledge, skills or new memories into the mind of its occupant."

	var/obj/item/mind_engraver_chip/nanochip = null
	var/mob/living/carbon/human/occupant = null
	var/currently_imprinting = FALSE
	/// How much time it takes to finish a single process
	var/imprint_time = 80 SECONDS
	/// World time when imprint process is finished
	var/imprint_end = 0
	/// If TRUE - prevents the user from leaving, unless resisted out of
	var/locked = FALSE
	/// When the next breakout attempt can be done
	var/breakout_cooldown = 0
	/// Base chance on every Process() tick to do random damage
	var/mistake_chance = 4

/obj/machinery/mind_engraver/Destroy()
	INVOKE_ASYNC(src, .proc/GoOut)
	RemoveChip()
	return ..()

/obj/machinery/mind_engraver/Process()
	if(stat & (NOPOWER|BROKEN))
		if(occupant)
			GoOutPowerLoss()
		return

	if(!currently_imprinting)
		return

	if(!occupant || !nanochip)
		StopImprint()
		return

	if(world.time < imprint_end)
		var/obj/item/organ/external/O_head = occupant.get_organ(BP_HEAD)
		if(prob(mistake_chance) && istype(O_head))
			var/choice = pick(1, 2, 3)
			switch(choice)
				if(1)
					O_head.take_external_damage(rand(5, 10), 0, DAM_SHARP|DAM_EDGE)
					to_chat(occupant, SPAN_DANGER("\The [src] misplaces a surgical incision, damaging your skin!"))
				if(2)
					occupant.adjustBrainLoss(rand(5, 15))
					to_chat(occupant, SPAN_DANGER("\The [src]'s laser accidentaly passes over the exposed sections of your head, damaging your brain!"))
				if(3)
					occupant.custom_pain(SPAN_WARNING("You feel sudden sharp pain in your head!"), 20, affecting = O_head)
		return

	FinishImprint()

	return

/obj/machinery/mind_engraver/examine(mob/user, distance)
	. = ..()
	if(distance <= 1 && istype(nanochip))
		to_chat(user, SPAN_NOTICE("It has a [nanochip] installed in it."))

/obj/machinery/mind_engraver/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/mind_engraver_chip))
		add_fingerprint(user)
		if(nanochip)
			to_chat(user, SPAN_WARNING("\The [src] has a nanochip already installed."))
			return
		if(!user.unEquip(I, src))
			return
		user.visible_message(
			SPAN_NOTICE("\The [user] inserts \a [I] into \the [src]."),
			SPAN_NOTICE("You insert \a [I] into \the [src]."),
		)
		nanochip = I
		return TRUE
	if(istype(I, /obj/item/device/multitool))
		var/obj/item/device/multitool/M = I
		M.set_buffer(src)
		to_chat(user, SPAN_NOTICE("You save the data in [M]'s buffer. It can now be used to link with the mind engraver console."))
		return TRUE
	return ..()

/obj/machinery/mind_engraver/AltClick(mob/user)
	if(CanDefaultInteract(user))
		RemoveChip(user)
		return
	return ..()

/obj/machinery/mind_engraver/relaymove(mob/user)
	. = ..()
	if(locked)
		to_chat(user, SPAN_WARNING("\The [src] is currently locked and will not let you out!"))
		return
	INVOKE_ASYNC(src, .proc/GoOut)

/obj/machinery/mind_engraver/mob_breakout(mob/living/escapee)
	. = ..()
	if(breakout_cooldown > world.time || escapee != occupant || !locked)
		return FALSE

	. = TRUE

	to_chat(escapee, SPAN_WARNING("You lean on the back of \the [src] and start pushing the door open."))
	visible_message(SPAN_DANGER("\The [src] begins to shake violently!"))

	for(var/i = 1 to 3)
		breakout_cooldown = world.time + 20 SECONDS
		if(!do_after(escapee, (10 SECONDS), incapacitation_flags = INCAPACITATION_DEFAULT & ~INCAPACITATION_RESTRAINED))
			return FALSE

		if(!locked)
			INVOKE_ASYNC(src, .proc/GoOut)
			return FALSE

		playsound(src, 'sound/effects/glassbash.ogg', i * 30, 1)
		shake_animation()
		add_fingerprint(escapee)

	ToggleLock(FALSE)
	INVOKE_ASYNC(src, .proc/GoOut)
	to_chat(escapee, SPAN_NOTICE("You successfully break out!"))
	visible_message(SPAN_DANGER("\The [escapee] successfully broke out of \the [src]!"))
	return TRUE

/obj/machinery/mind_engraver/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		return

	. = ..()

	if(prob(33))
		GoOutPowerLoss()
	return

/obj/machinery/mind_engraver/MouseDrop_T(mob/living/carbon/human/H, mob/user)
	if(!CanMouseDrop(H, user))
		return
	if(!istype(H))
		return
	if(H.buckled)
		to_chat(user, SPAN_WARNING("Unbuckle the subject before attempting to move them."))
		return
	GoIn(H, user)

/obj/machinery/mind_engraver/RefreshParts()
	. = ..()
	var/T = Clamp(total_component_rating_of_type(/obj/item/stock_parts/manipulator), 1, 12)
	imprint_time = initial(imprint_time) / (T * 0.5)

	T = Clamp(total_component_rating_of_type(/obj/item/stock_parts/capacitor), 1, 12)
	mistake_chance = max(0, 1 + initial(mistake_chance) - (T * 0.25))

/obj/machinery/mind_engraver/on_update_icon()
	overlays.Cut()

	if(!occupant)
		icon_state = "engraver_0"
		density = FALSE
		if(locked)
			icon_state = "engraver_1"
			density = TRUE
		else
			icon_state = "engraver_0"
			density = FALSE
	else
		icon_state = "engraver_2"
		density = TRUE

	if(locked)
		overlays += image(icon, "locked_overlay")

/obj/machinery/mind_engraver/proc/SetOccupant(mob/living/carbon/human/H)
	occupant = H
	update_icon()
	if(!occupant)
		update_use_power(POWER_USE_IDLE)
		return
	occupant.forceMove(src)
	occupant.stop_pulling()
	if(occupant.client)
		occupant.client.perspective = EYE_PERSPECTIVE
		occupant.client.eye = src

	update_use_power(POWER_USE_ACTIVE)

/obj/machinery/mind_engraver/proc/GoIn(mob/living/carbon/human/H, mob/user)
	if(!istype(H))
		return
	if(stat & (BROKEN|NOPOWER))
		return
	if(occupant)
		to_chat(user, SPAN_WARNING("\The [src] is already occupied."))
		return
	if(locked)
		to_chat(user, SPAN_WARNING("\The [src] is locked."))
		return

	if(H == user)
		visible_message(SPAN_NOTICE("\The [user] starts climbing into \the [src]."))
	else
		visible_message(SPAN_WARNING("\The [user] starts putting [H] into \the [src]."))

	if(do_after(user, 20, src))
		if(QDELETED(H))
			return
		if(get_dist(H, user) > 1)
			return
		if(occupant)
			to_chat(user, SPAN_WARNING("\The [src] is already occupied."))
			return
		if(locked)
			to_chat(user, SPAN_WARNING("\The [src] is locked."))
			return
		if(H.buckled)
			to_chat(user, SPAN_WARNING("Unbuckle the subject before attempting to move them."))
			return
		SetOccupant(H)

/obj/machinery/mind_engraver/proc/GoOut()
	if(!occupant)
		return

	if(locked)
		return

	if(currently_imprinting)
		StopImprint()
		var/obj/item/organ/external/O_head = occupant.get_organ(BP_HEAD)
		if(O_head)
			to_chat(occupant, SPAN_DANGER("\The [src]'s tools quickly disengage away from your brain, leaving a terrible tear!"))
			occupant.adjustBrainLoss(100)
			occupant.custom_pain(SPAN_WARNING("It feels as if your head burst open!"), 50, affecting = O_head)
			O_head.take_external_damage(35, 0, DAM_SHARP|DAM_EDGE)
		if(!(stat & (NOPOWER|BROKEN)))
			visible_message(SPAN_DANGER("\The [src] blares an alarm as its occupant leaves mid-procedure!"))
			playsound(src, 'sound/machines/warning-buzzer.ogg', 50, TRUE, 7)

	if(occupant.client)
		occupant.client.eye = occupant.client.mob
		occupant.client.perspective = MOB_PERSPECTIVE
	occupant.dropInto(loc)
	SetOccupant(null)

/obj/machinery/mind_engraver/proc/GoOutPowerLoss()
	if(!occupant)
		return

	visible_message(SPAN_DANGER("\The [src] blares an alarm as it loses power[locked ? "" : " and forcefuly ejects the occupant"]!"))
	playsound(src, 'sound/machines/warning-buzzer.ogg', 50, TRUE, 7)
	return INVOKE_ASYNC(src, .proc/GoOut)

/obj/machinery/mind_engraver/proc/RemoveChip(mob/user)
	if(!nanochip)
		return

	if(currently_imprinting)
		to_chat(user, SPAN_WARNING("\The [src] is currently imprinting the data from the nanochip!"))
		return

	nanochip.dropInto(loc)
	if(user)
		user.put_in_any_hand_if_possible(nanochip)
	nanochip = null

/obj/machinery/mind_engraver/proc/StartImprint()
	if(currently_imprinting)
		return FALSE

	if(!nanochip || !occupant)
		return FALSE

	update_use_power(POWER_USE_ACTIVE)
	currently_imprinting = TRUE
	imprint_end = world.time + imprint_time
	visible_message(SPAN_NOTICE("\The [src] chimes as it begins its operation!"))
	playsound(src, 'sound/machines/synth_yes.ogg', 50, TRUE, 7)
	return TRUE

/obj/machinery/mind_engraver/proc/StopImprint()
	currently_imprinting = FALSE
	update_use_power(POWER_USE_IDLE)

/obj/machinery/mind_engraver/proc/FinishImprint()
	StopImprint()

	if(!nanochip || !occupant)
		return

	if(nanochip.stored_data)
		nanochip.stored_data.ApplyEffect(occupant)

	ToggleLock(FALSE)
	INVOKE_ASYNC(src, .proc/GoOut)
	visible_message(SPAN_NOTICE("\The [src] produces a signal as it finishes its operation!"))
	playsound(src, 'sound/machines/ping.ogg', 50, TRUE, 7)

/obj/machinery/mind_engraver/proc/ToggleLock(force_set = null)
	if(force_set != null)
		locked = force_set
	else
		locked = !locked
	var/sound_path = locked ? 'sound/machines/bolts_down.ogg' : 'sound/machines/bolts_up.ogg'
	playsound(src, sound_path, 35, TRUE)
	update_icon()
