/obj/item/quantum_keycard
	name = "quantum keycard"
	desc = "A keycard able to link to a quantum pad's particle signature, allowing other quantum pads to travel there instead of their linked pad."
	icon = 'icons/obj/device.dmi'
	icon_state = "quantum_keycard"
	item_state = "card-id"
	w_class = ITEM_SIZE_TINY
	origin_tech = list(TECH_BLUESPACE = 6, TECH_ENGINEERING = 5, TECH_DATA = 5)
	var/obj/machinery/quantumpad/qpad = null

/obj/item/quantum_keycard/examine(mob/user)
	. = ..()
	if(qpad)
		to_chat(user, "It's currently linked to a [qpad.name].")
		to_chat(user, SPAN_NOTICE("Alt-click to unlink the keycard."))
	else
		to_chat(user, SPAN_NOTICE("Insert [src] into an active quantum pad to link it."))

/obj/item/quantum_keycard/AltClick(mob/living/user)
	if(!istype(user) || user.incapacitated() || !Adjacent(user))
		return
	to_chat(user, SPAN_NOTICE("You start pressing [src]'s unlink button..."))
	if(do_after(user, 40, target = src))
		to_chat(user, SPAN_NOTICE("The keycard beeps twice and disconnects the quantum link."))
		UnlinkPad()

/obj/item/quantum_keycard/on_update_icon()
	if(qpad)
		icon_state = "quantum_keycard_on"
	else
		icon_state = initial(icon_state)

/obj/item/quantum_keycard/proc/LinkPad(obj/machinery/quantumpad/pad)
	if(!istype(pad))
		return

	qpad = pad
	update_icon()
	RegisterSignal(pad, COMSIG_PARENT_QDELETING, .proc/PadDeleted)

/obj/item/quantum_keycard/proc/UnlinkPad()
	UnregisterSignal(qpad, COMSIG_PARENT_QDELETING)
	qpad = null
	update_icon()

/obj/item/quantum_keycard/proc/PadDeleted()
	SIGNAL_HANDLER
	visible_message(SPAN_WARNING("\The [src] beeps as it loses connection to its pad!"))
	UnlinkPad()
