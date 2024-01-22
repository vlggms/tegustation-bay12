/obj/machinery/computer/mind_engraver_control
	name = "mind engraver control console"
	density = TRUE
	anchored = TRUE
	icon_keyboard = "generic_key"
	icon_screen = "holocontrol"
	machine_name = "mind engraver control console"
	machine_desc = "A control console used to interface with the mind engraver."

	var/obj/machinery/mind_engraver/linked_engraver = null
	var/model_name = "Mind Engraver v1.3"
	var/model_producer = "Terran Dominion"

/obj/machinery/computer/mind_engraver_control/Initialize()
	. = ..()
	for(var/obj/machinery/mind_engraver/ME in range(src, 1))
		LinkEngraver(ME)
		break

/obj/machinery/computer/mind_engraver_control/Destroy()
	linked_engraver = null
	return ..()

/obj/machinery/computer/mind_engraver_control/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/mind_engraver_chip))
		to_chat(user, SPAN_WARNING("\The [I] must be inserted in the mind engraver, not the console!"))
		return TRUE
	if(istype(I, /obj/item/device/multitool))
		var/obj/item/device/multitool/M = I
		var/obj/machinery/mind_engraver/buffer = M.get_buffer(/obj/machinery/quantumpad)
		if(!istype(buffer))
			return TRUE
		linked_engraver = buffer
		to_chat(user, SPAN_NOTICE("You link [src] with the machine in [I]'s buffer."))
	return ..()

/obj/machinery/computer/mind_engraver_control/interface_interact(user)
	interact(user)
	return TRUE

/obj/machinery/computer/mind_engraver_control/interact(mob/living/user)
	//If the computer is being hacked or is emagged, display the reboot message.
	if(!istype(linked_engraver))
		to_chat(user, SPAN_WARNING("\The [src] is not linked to any machine!"))
		return

	var/list/dat = list()
	dat += "<h1><b>[model_name]</h1><br>"
	dat += "[model_producer], all rights reserved.</b><hr>"

	dat += "Lock status: <A href='?src=\ref[src];lock=1'>[linked_engraver.locked ? "Locked" : "Unlocked"]</A><br>"

	if(linked_engraver.occupant)
		dat += "Occupant: [linked_engraver.occupant.name]<br>"
		if(linked_engraver.currently_imprinting)
			dat += "<b>\The [linked_engraver] is currently operating!</b><br>"
			dat += "Approximate time remaining: [round((linked_engraver.imprint_end - world.time) / 10)] seconds<br>"
		else if(istype(linked_engraver.nanochip))
			dat += "<A href='?src=\ref[src];start=1'>Begin Imprinting Process</A><br>"

	if(!istype(linked_engraver.nanochip))
		dat += "<b>Nanochip missing!</b><br>"
	else if(!linked_engraver.nanochip.stored_data)
		dat += "<b>Nanochip data missing!</b><br>"
	else
		dat += "Currently installed nanochip:<br>"
		dat += "Type: [linked_engraver.nanochip.stored_data.chip_type]<br>"
		dat += "Function: [linked_engraver.nanochip.stored_data.PrintFunction()]<br>"

	var/datum/browser/popup = new(user, "mind_engraver", "Mind Engraver Control Console", 480, 600)
	popup.set_content(JOINTEXT(dat))
	popup.open()
	return

/obj/machinery/computer/mind_engraver_control/Topic(href, href_list)
	. = ..()
	if(.)
		return

	if(href_list["lock"])
		if(istype(linked_engraver))
			linked_engraver.ToggleLock()

	if(href_list["start"])
		if(istype(linked_engraver))
			if(linked_engraver.StartImprint())
				to_chat(usr, SPAN_NOTICE("\The [linked_engraver] has begun the imprinting process!"))
			else
				to_chat(usr, SPAN_WARNING("\The [linked_engraver] failed to start a new imprinting process!"))

	return interact(usr)

/obj/machinery/computer/mind_engraver_control/proc/LinkEngraver(obj/machinery/mind_engraver/ME)
	if(istype(linked_engraver))
		UnregisterSignal(linked_engraver, COMSIG_PARENT_QDELETING)
	if(!istype(ME))
		return

	linked_engraver = ME
	RegisterSignal(ME, COMSIG_PARENT_QDELETING, .proc/OnLinkDestroyed)

/obj/machinery/computer/mind_engraver_control/proc/OnLinkDestroyed()
	SIGNAL_HANDLER

	UnregisterSignal(linked_engraver, COMSIG_PARENT_QDELETING)
	linked_engraver = null
