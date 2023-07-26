/obj/item/device/remote_weapon_controller
	name = "remote weapon controller"
	desc = "A handheld device used to send signals to a linked heavy artillery pieces."
	icon_state = "locator"
	item_state = "locator"
	w_class = ITEM_SIZE_SMALL

	var/obj/machinery/remote_weapon/linked_weapon = null
	/// Time of do_after done at the target before actually attempting to fire
	var/delay = 15

/obj/item/device/remote_weapon_controller/resolve_attackby(atom/A, mob/user)
	if(!istype(A, /obj/machinery/remote_weapon))
		return ..()
	linked_weapon = A
	to_chat(user, SPAN_NOTICE("\The [src] has been successfuly linked to [linked_weapon]."))

/obj/item/device/remote_weapon_controller/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!istype(target, /obj/machinery/remote_weapon)) // Resolve attackby handles this part
		return
	if(!istype(linked_weapon))
		to_chat(user, SPAN_WARNING("\The [src] is not linked to any machine."))
		return
	var/turf/T = get_turf(target)
	if(!linked_weapon.CanPerform(src, T))
		to_chat(user, SPAN_WARNING("\The [src] received negative code from the activation attempt."))
		return
	if(delay)
		to_chat(user, SPAN_NOTICE("\The [src] is calibrating..."))
		if(!do_after(user, delay, T))
			return
	linked_weapon.PerformAbility(src, T)
	to_chat(user, SPAN_NOTICE("\The [src] received positive code from the activation attempt."))
