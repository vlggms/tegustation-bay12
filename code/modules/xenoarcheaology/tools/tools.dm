/obj/item/device/gps
	name = "relay positioning device"
	desc = "Triangulates the approximate co-ordinates using a nearby satellite network."
	icon = 'icons/obj/device.dmi'
	icon_state = "locator"
	item_state = "locator"
	origin_tech = list(TECH_MATERIAL = 2, TECH_DATA = 2, TECH_BLUESPACE = 2)
	matter = list(MATERIAL_ALUMINIUM = 250, MATERIAL_STEEL = 250, MATERIAL_GLASS = 50)
	w_class = ITEM_SIZE_SMALL

/obj/item/device/gps/attack_self(var/mob/user as mob)
	to_chat(user, "<span class='notice'>[icon2html(src, user)] \The [src] flashes <i>[get_coordinates()]</i>.</span>")

/obj/item/device/gps/examine(mob/user)
	. = ..()
	to_chat(user, "<span class='notice'>\The [src]'s screen shows: <i>[get_coordinates()]</i>.</span>")

/obj/item/device/gps/proc/get_coordinates()
	var/turf/T = get_turf(src)
	return T ? "[T.x]:[T.y]:[T.z]" : "N/A"

/mob/living/carbon/human/Stat()
	. = ..()
	if(statpanel("Status"))
		var/obj/item/device/gps/L = locate() in src
		if(L)
			stat("Coordinates:", "[L.get_coordinates()]")

/mob/living/silicon/robot/Stat()
	. = ..()
	if(statpanel("Status") && (istype(module_state_1, /obj/item/device/gps) || istype(module_state_2, /obj/item/device/gps) || istype(module_state_3, /obj/item/device/gps)))
		var/obj/item/device/gps/L = locate() in src
		if(L)
			stat("Coordinates:", "[L.get_coordinates()]")

/obj/item/device/measuring_tape
	name = "measuring tape"
	desc = "A coiled metallic tape used to check dimensions and lengths."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "measuring"
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(MATERIAL_STEEL = 100)
	w_class = ITEM_SIZE_SMALL

/obj/item/storage/bag/fossils
	name = "fossil satchel"
	desc = "Transports delicate fossils in suspension so they don't break during transit."
	icon = 'icons/obj/mining.dmi'
	icon_state = "satchel"
	slot_flags = SLOT_BELT | SLOT_POCKET
	w_class = ITEM_SIZE_NORMAL
	storage_slots = 50
	max_storage_space = 200
	max_w_class = ITEM_SIZE_NORMAL
	can_hold = list(/obj/item/fossil)

/obj/item/storage/box/samplebags
	name = "sample bag box"
	desc = "A box claiming to contain sample bags."

/obj/item/storage/box/samplebags/New()
	..()
	for(var/i = 1 to 7)
		var/obj/item/evidencebag/S = new(src)
		S.SetName("sample bag")
		S.desc = "a bag for holding research samples."

//Radio beacon locator
/obj/item/pinpointer/radio
	name = "locator device"
	desc = "Used to scan and locate signals on a particular frequency."
	var/tracking_freq = PUB_FREQ
	matter = list(MATERIAL_ALUMINIUM = 1000, MATERIAL_GLASS = 500)

/obj/item/pinpointer/radio/acquire_target()
	var/turf/T = get_turf(src)
	var/zlevels = GetConnectedZlevels(T.z)
	var/cur_dist = world.maxx+world.maxy
	for(var/obj/machinery/tele_beacon/R in world)
		if(!R.functioning())
			continue
		if(R.z in zlevels)
			var/check_dist = get_dist(src,R)
			if(check_dist < cur_dist)
				cur_dist = check_dist
				. = weakref(R)

/obj/item/pinpointer/radio/attack_self(var/mob/user as mob)
	interact(user)

/obj/item/pinpointer/radio/interact(var/mob/user)
	var/dat = "<b>Radio frequency tracker</b><br>"
	dat += {"
				Tracking: <A href='byond://?src=\ref[src];toggle=1'>[active ? "Enabled" : "Disabled"]</A><BR>
				<A href='byond://?src=\ref[src];reset_tracking=1'>Reset tracker</A><BR>
				Frequency:
				<A href='byond://?src=\ref[src];freq=-10'>-</A>
				<A href='byond://?src=\ref[src];freq=-2'>-</A>
				[format_frequency(tracking_freq)]
				<A href='byond://?src=\ref[src];freq=2'>+</A>
				<A href='byond://?src=\ref[src];freq=10'>+</A><BR>
				"}
	show_browser(user, dat,"window=locater;size=300x150")
	onclose(user, "locater")

/obj/item/pinpointer/radio/OnTopic(user, href_list)
	if(href_list["toggle"])
		toggle(user)
		. = TOPIC_REFRESH

	if(href_list["reset_tracking"])
		target = acquire_target()
		. = TOPIC_REFRESH

	else if(href_list["freq"])
		var/new_frequency = (tracking_freq + text2num(href_list["freq"]))
		if (new_frequency < 1200 || new_frequency > 1600)
			new_frequency = sanitize_frequency(new_frequency, 1499)
		tracking_freq = new_frequency
		. = TOPIC_REFRESH

	if(. == TOPIC_REFRESH)
		interact(user)
