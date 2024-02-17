/obj/machinery/trade_beacon
	icon = 'icons/obj/machines/trade_beacon.dmi'
	icon_state = "beacon"
	anchored = TRUE
	density = TRUE
	var/beacon_range = 2

/obj/machinery/trade_beacon/attackby(obj/item/W, mob/user)
	if(isMultitool(W))
		beacon_range = beacon_range >= 2 ? 1 : 2
		anchored = !anchored
		user.visible_message(
			SPAN_NOTICE("\The [user] pulses some circuitry within [src]."),
			SPAN_NOTICE("You set [src]'s effective range to [beacon_range].")
			)
		playsound(src.loc, "sound/effects/pop.ogg", 50)
		return
	return ..()

/obj/machinery/trade_beacon/proc/Activate()
	flick("[icon_state]_active", src)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, get_turf(src))
	s.start()
	playsound(get_turf(src), "sparks", 50, 1)

/obj/machinery/trade_beacon/proc/GetId()
	var/area/A = get_area(src)
	return "[A.name] ([x], [y], [z])"

/* Sending */
/obj/machinery/trade_beacon/sending
	name = "sending trade beacon"
	icon_state = "beacon_sending"
	construct_state = /decl/machine_construction/default/panel_closed
	var/export_cooldown
	var/export_cooldown_time = 90 SECONDS

/obj/machinery/trade_beacon/sending/Initialize()
	. = ..()
	SSsupply.beacons_sending += src

/obj/machinery/trade_beacon/sending/Destroy()
	SSsupply.beacons_sending -= src
	return ..()

/obj/machinery/trade_beacon/sending/proc/GetObjects()
	var/list/objects = list()
	for(var/atom/movable/A in range(beacon_range, src))
		if(A.anchored)
			continue
		if(A == src)
			continue
		if(A.loc == src)
			continue
		if(A.invisibility)
			continue
		if(istype(A, /obj/screen))
			continue
		objects += A
	return objects

/obj/machinery/trade_beacon/sending/proc/StartExport()
	if(export_cooldown > world.time)
		return FALSE
	Activate()
	export_cooldown = world.time + export_cooldown_time
	return TRUE

/* Receiving */
/obj/machinery/trade_beacon/receiving
	name = "receiving trade beacon"
	construct_state = /decl/machine_construction/default/panel_closed

/obj/machinery/trade_beacon/receiving/Initialize()
	. = ..()
	SSsupply.beacons_receiving += src

/obj/machinery/trade_beacon/receiving/Destroy()
	SSsupply.beacons_receiving -= src
	return ..()

/obj/machinery/trade_beacon/receiving/proc/DropItem(drop_type)
	var/list/valid_turfs = list()
	for(var/turf/simulated/floor/F in range(beacon_range, src))
		if(F.contains_dense_objects(TRUE))
			continue
		valid_turfs += F
	if(!LAZYLEN(valid_turfs))
		return FALSE
	Activate()
	var/turf/simulated/floor/pickfloor = pick(valid_turfs)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, pickfloor)
	s.start()
	return new drop_type(pickfloor)
