/obj/machinery/radio_beacon
	name = "transmission beacon"
	desc = "A bulky hyperspace transmitter, capable of continuously broadcasting a signal that can be picked up by ship sensors."
	icon = 'icons/obj/structures/beacon.dmi'
	icon_state = "inactive"
	density = TRUE
	anchored = TRUE
	idle_power_usage = 0
	health_max = 100
	active_power_usage = 1 KILOWATTS
	construct_state = /decl/machine_construction/default/panel_closed
	var/obj/effect/overmap/radio/signal
	var/obj/effect/overmap/radio/distress/emergency_signal
	/// World time at which it can be used again
	var/activation_cooldown = 0
	var/activation_cooldown_time = 1 MINUTES

/obj/item/stock_parts/circuitboard/radio_beacon
	name = T_BOARD("transmission beacon")
	board_type = "machine"
	icon_state = "mcontroller"
	build_path = /obj/machinery/radio_beacon
	origin_tech = list(TECH_POWER = 3, TECH_ENGINEERING = 5, TECH_BLUESPACE = 3)
	req_components = list(
							/obj/item/stock_parts/subspace/ansible = 1,
							/obj/item/stock_parts/subspace/filter = 1,
							/obj/item/stock_parts/subspace/amplifier = 1,
						)
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/battery/buildable/stock = 1,
		/obj/item/cell/high = 1
	)

/obj/machinery/radio_beacon/Destroy()
	QDEL_NULL(signal)
	QDEL_NULL(emergency_signal)
	. = ..()

/obj/machinery/radio_beacon/power_change()
	. = ..()
	if(!. || !use_power)
		return

	if(!is_powered())
		Deactivate()

/obj/machinery/radio_beacon/on_update_icon()
	overlays.Cut()
	icon_state = signal ? "active" : "inactive"
	if(emergency_signal)
		overlays += "distress"
	if(panel_open)
		overlays += "panel"
	. = ..()

/obj/machinery/radio_beacon/interface_interact(mob/user, skip_time_check = FALSE)
	if(!CanInteract(user, DefaultTopicState()))
		return

	if(inoperable())
		to_chat(user, SPAN_WARNING("A small red light flashes on \the [src]."))
		return

	var/obj/effect/overmap/visitable/O = map_sectors["[get_z(src)]"]
	if(!O)
		to_chat(user, SPAN_WARNING("You cannot deploy \the [src] here."))
		return

	if(activation_cooldown > world.time)
		to_chat(usr, SPAN_WARNING("\The [src] cannot be used yet!"))
		return

	var/toggle_prompt = alert(user, "Turn the beacon...", "[src] Options", "[signal || emergency_signal ? "Off" : "On"]", "Distress", "Cancel")
	if(toggle_prompt == "Cancel")
		return

	if(QDELETED(src) || stat)
		return

	if(!Adjacent(user) || user.stat)
		to_chat(user, SPAN_WARNING("You're not able to do that to \the [src] right now."))
		return

	switch(toggle_prompt)
		if("On")
			if(emergency_signal)
				to_chat(user, SPAN_WARNING("Turn off the distress signal first!"))
				return
			Activate()
		if("Off")
			Deactivate()
		if("Distress")
			if(signal)
				to_chat(user, SPAN_WARNING("Turn off the radio broadcast first!"))
				return
			if(emergency_signal)
				to_chat(user, SPAN_WARNING("This beacon is already broadcasting a distress signal!"))
				return
			ActivateDistress()

/obj/machinery/radio_beacon/proc/Activate()
	if(activation_cooldown > world.time)
		to_chat(usr, SPAN_WARNING("\The [src] cannot be used yet!"))
		return

	var/obj/effect/overmap/visitable/O = map_sectors["[get_z(src)]"]
	var/message = sanitize(input("What should it broadcast?") as message|null)
	if(!message)
		return

	if(activation_cooldown > world.time)
		to_chat(usr, SPAN_WARNING("\The [src] cannot be used yet!"))
		return

	visible_message(SPAN_NOTICE("\The [src] whirrs to life, starting its radio broadcast."))
	playsound(src, 'sound/machines/sensors/newcontact.ogg', 50, 3, 3)

	signal = new()

	activation_cooldown = world.time + activation_cooldown_time

	signal.message = message
	signal.SetOrigin(O)

	update_use_power(POWER_USE_ACTIVE)
	update_icon()

/obj/machinery/radio_beacon/proc/ActivateDistress()
	if(activation_cooldown > world.time)
		to_chat(usr, SPAN_WARNING("\The [src] cannot be used yet!"))
		return

	var/obj/effect/overmap/visitable/O = map_sectors["[get_z(src)]"]

	visible_message(SPAN_WARNING("\The [src] beeps urgently as it whirrs to life, sending out intermittent tones."))
	playsound(src, 'sound/machines/sensors/newcontact.ogg', 50, TRUE)

	log_and_message_admins("A distress beacon was activated in [get_area(src)] of [O.name].", usr, get_turf(src))

	emergency_signal = new()

	activation_cooldown = world.time + activation_cooldown_time

	emergency_signal.SetOrigin(O)

	update_use_power(POWER_USE_ACTIVE)
	update_icon()

/obj/machinery/radio_beacon/proc/Deactivate()
	if(activation_cooldown > world.time)
		to_chat(usr, SPAN_WARNING("\The [src] cannot be used yet!"))
		return

	visible_message(SPAN_NOTICE("\The [src] winds down to a halt, cutting short it's radio broadcast."))
	playsound(src, 'sound/machines/sensors/newcontact.ogg', 50, TRUE)

	QDEL_NULL(signal)
	QDEL_NULL(emergency_signal)

	activation_cooldown = world.time + activation_cooldown_time

	update_use_power(POWER_USE_OFF)
	update_icon()

// Overmap radio signals
/obj/effect/overmap/radio
	name = "radio signal"
	icon_state = "radio"
	scannable = TRUE
	color = COLOR_DEEP_SKY_BLUE
	var/message
	var/obj/effect/overmap/source

/obj/effect/overmap/radio/Destroy()
	GLOB.destroyed_event.unregister(source, src)
	GLOB.moved_event.unregister(source, src)
	source = null
	. = ..()

/obj/effect/overmap/radio/get_scan_data(mob/user)
	return "A radio signal originating at \the [source].<br><br> \
	---BEGINNING OF TRANSMISSION---<br><br> \
	[message] \
	<br><br>---END OF TRANSMISSION---"

/obj/effect/overmap/radio/proc/SetOrigin(obj/effect/overmap/origin)
	GLOB.moved_event.register(origin, src, /obj/effect/overmap/radio/proc/Follow)
	GLOB.destroyed_event.register(origin, src, /datum/proc/qdel_self)
	forceMove(origin.loc)
	source = origin
	pixel_x = -(origin.bound_width - 6)
	pixel_y = origin.bound_height - 6

/obj/effect/overmap/radio/proc/Follow(atom/movable/am, old_loc, new_loc)
	forceMove(new_loc)

/obj/effect/overmap/radio/distress
	name = "distress dataspike"
	color = COLOR_NT_RED

// Not on Initialize() because we need its coordinates
/obj/effect/overmap/radio/distress/SetOrigin(obj/effect/overmap/origin)
	. = ..()
	for(var/obj/machinery/computer/ship/helm/H in SSmachines.machinery)
		H.visible_message(SPAN_WARNING("\The [H] pings uneasily as it detects a distress signal at [x]:[y]!"))
		playsound(H, 'sound/machines/sensors/newcontact.ogg', 50, 3, 3)

/obj/effect/overmap/radio/distress/get_scan_data(mob/user)
	return "A unilateral, broadband data broadcast originating at \the [source] carrying only an emergency code sequence."
