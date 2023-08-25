/obj/machinery/remote_weapon
	name = "testing remote weapon"
	desc = "A heavy artillery piece. Must be connected to with a remote controller to be usable."
	icon = 'icons/obj/device.dmi'
	icon_state = "syndbeacon"

	density = TRUE
	anchored = TRUE
	idle_power_usage = 50
	construct_state = /decl/machine_construction/default/panel_closed

	machine_name = "remote weapon"
	machine_desc = "A remote weapon that can be activated with a remote controller."

	/// If TRUE - will not fire if z-levels aren't connected
	var/requires_connected_zlevel = TRUE

/// Called by remote controller. If FALSE is returned - the controller will not be able to use ability
/obj/machinery/remote_weapon/proc/CanPerform(obj/item/device/remote_weapon_controller/controller, turf/target)
	if(requires_connected_zlevel && !AreConnectedZLevels(target.z, src.z))
		return FALSE
	return anchored && !(stat & (NOPOWER|BROKEN))

/// Called by remote controller at chosen coordinates
/obj/machinery/remote_weapon/proc/PerformAbility(obj/item/device/remote_weapon_controller/controller, turf/target)
	return

/* This one has to be loaded with ammo to fire */
/obj/machinery/remote_weapon/loadable
	name = "bluespace rocket launcher"
	desc = "An artillery piece that utilizes bluespace technology to launch rockets towards its targets. Must be manually loaded with ammunition."
	/// List of loaded items
	var/list/ammunition = list()
	var/max_ammo = 3

/obj/machinery/remote_weapon/loadable/Destroy()
	ammunition = null
	return ..()

/obj/machinery/remote_weapon/loadable/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/remote_weapon_ammo))
		if(length(ammunition) >= max_ammo)
			to_chat(user, SPAN_WARNING("Maximum capacity already achieved!"))
			return
		visible_message(SPAN_NOTICE("\The [user] is trying to load \the [src] with [I]."))
		if(!do_after(user, 2 SECONDS, src))
			return
		if(length(ammunition) >= max_ammo) // Checking twice in case we have two people loading it at once
			to_chat(user, SPAN_WARNING("Maximum capacity already achieved!"))
			return
		if(!user.unEquip(I, src))
			return
		ammunition += I
		playsound(src, 'sound/weapons/mortar_reload.ogg', 75, TRUE)
		visible_message(SPAN_NOTICE("\The [user] has loaded \the [src] with [I]."))
		return
	return ..()

/obj/machinery/remote_weapon/loadable/examine(mob/user, distance)
	. = ..()
	for(var/obj/item/remote_weapon_ammo/ammo in ammunition)
		to_chat(user, SPAN_NOTICE("It is loaded with [ammo]."))

/obj/machinery/remote_weapon/loadable/PerformAbility(obj/item/device/remote_weapon_controller/controller, turf/target)
	if(!LAZYLEN(ammunition))
		return
	var/obj/item/remote_weapon_ammo/ammo = ammunition[1]
	ammunition -= ammo
	visible_message(SPAN_DANGER("\The [src] fired a [ammo]!"))
	playsound(src, ammo.fire_sound, 200, TRUE, 4, ignore_pressure = TRUE)
	for(var/mob/M in view(7, src))
		shake_camera(M, 15)
	addtimer(CALLBACK(ammo, /obj/item/remote_weapon_ammo/proc/FireSelf, target), ammo.attack_delay)

/* Mostly testing/admin versions */
/obj/machinery/remote_weapon/explosive
	/// How much time passes after successful activation and explosion
	var/attack_delay = 5 SECONDS
	var/fire_cooldown
	var/fire_cooldown_time = 20 SECONDS

/obj/machinery/remote_weapon/explosive/CanPerform(obj/item/device/remote_weapon_controller/controller, turf/target)
	if(fire_cooldown > world.time)
		return FALSE
	return ..()

/obj/machinery/remote_weapon/explosive/PerformAbility(obj/item/device/remote_weapon_controller/controller, turf/target)
	fire_cooldown = world.time + fire_cooldown_time
	visible_message(SPAN_DANGER("\The [src] fired a rocket!"))
	playsound(src, 'sound/weapons/gunship_rocket.ogg', 200, TRUE, 4, ignore_pressure = TRUE)
	addtimer(CALLBACK(src, .proc/FireCharge, target), attack_delay)

/obj/machinery/remote_weapon/explosive/proc/FireCharge(turf/target)
	target.visible_message(SPAN_DANGER("A rocket is rapidly approaching your position!"))
	playsound(target, 'sound/weapons/mortar_long_whistle.ogg', 200, TRUE, 4, ignore_pressure = TRUE)
	sleep(7)
	explosion(target, 2, 6, 10, 10)
