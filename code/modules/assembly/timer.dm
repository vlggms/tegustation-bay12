/obj/item/device/assembly/timer
	name = "timer"
	desc = "Used to time things. Works well with contraptions which have to count down. Tick tock."
	icon_state = "timer"
	origin_tech = list(TECH_MAGNET = 1)
	matter = list(MATERIAL_STEEL = 500, MATERIAL_GLASS = 50, MATERIAL_WASTE = 10)

	wires = WIRE_PULSE

	secured = 0

	var/timing = 0
	var/time = 10
	var/last_set_time = 10
	var/repeating = FALSE

/obj/item/device/assembly/timer/activate()
	if(!..())
		return 0//Cooldown check

	timing = !timing

	update_icon()
	return 0


/obj/item/device/assembly/timer/toggle_secure()
	secured = !secured
	if(secured)
		START_PROCESSING(SSobj, src)
	else
		timing = 0
		STOP_PROCESSING(SSobj, src)
	update_icon()
	return secured


/obj/item/device/assembly/timer/proc/timer_end()
	if(!secured)
		return FALSE
	update_icon()
	pulse(0)
	if(!holder)
		visible_message("[icon2html(src, viewers(get_turf(src)))] *beep* *beep*", "*beep* *beep*")
	cooldown = 2
	spawn(10)
		process_cooldown()
	return

/obj/item/device/assembly/timer/process_cooldown()
	. = ..()
	if(!.) // Cooldown ended
		if(repeating && !timing)
			activate()

/obj/item/device/assembly/timer/Process()
	if(timing && (time > 0))
		time--
		playsound(loc, 'sound/items/timer.ogg', time < 10 ? 50 : 25)
	if(timing && time <= 0)
		timing = 0
		timer_end()
		time = last_set_time
	return


/obj/item/device/assembly/timer/on_update_icon()
	overlays.Cut()
	attached_overlays = list()
	if(timing)
		overlays += "timer_timing"
		attached_overlays += "timer_timing"
	if(holder)
		holder.update_icon()
	return


/obj/item/device/assembly/timer/interact(mob/user as mob)//TODO: Have this use the wires
	if(!secured)
		user.show_message("<span class='warning'>\The [name] is unsecured!</span>")
		return 0
	var/second = time % 60
	var/minute = (time - second) / 60
	var/dat = text("<TT><B>Timing Unit</B>\n \
		[] []:[]\n<A href='?src=\ref[];tp=-30'>-</A> <A href='?src=\ref[];tp=-1'>-</A> <A href='?src=\ref[];tp=1'>+</A> <A href='?src=\ref[];tp=30'>+</A>\n</TT>", (timing ? text("<A href='?src=\ref[];time=0'>Timing</A>", src) : text("<A href='?src=\ref[];time=1'>Not Timing</A>", src)), minute, second, src, src, src, src)
	dat += "<BR><A href='?src=\ref[src];repeating=1'>[repeating ? "Repeating" : "Not repeating"]</A>"
	dat += "<BR><BR><A href='?src=\ref[src];refresh=1'>Refresh</A>"
	dat += "<BR><BR><A href='?src=\ref[src];close=1'>Close</A>"
	show_browser(user, dat, "window=timer")
	onclose(user, "timer")
	return


/obj/item/device/assembly/timer/Topic(href, href_list, state = GLOB.physical_state)
	if((. = ..()))
		close_browser(usr, "window=timer")
		onclose(usr, "timer")
		return

	if(href_list["time"])
		timing = text2num(href_list["time"])
		update_icon()

	if(href_list["tp"])
		var/tp = text2num(href_list["tp"])
		time += tp
		time = min(max(round(time), 0), 600)
		last_set_time = time

	if(href_list["repeating"])
		repeating = !repeating

	if(href_list["close"])
		close_browser(usr, "window=timer")
		return

	if(usr)
		attack_self(usr)

	return
