/obj/machinery/remote_weapon
	name = "remote weapon"
	desc = "A heavy artillery piece. Must be connected to with a remote controller to be usable."
	icon = 'icons/obj/device.dmi'
	icon_state = "syndbeacon"

	density = TRUE
	anchored = TRUE
	idle_power_usage = 50
	base_type = /obj/machinery/remote_weapon
	construct_state = /decl/machine_construction/default/panel_closed

	machine_name = "remote weapon"
	machine_desc = "A remote weapon that can be activated with a remote controller."

/// Called by remote controller. If FALSE is returned - the controller will not be able to use ability
/obj/machinery/remote_weapon/proc/CanPerform(obj/item/device/remote_weapon_controller/controller, turf/target)
	return anchored && !(stat & (NOPOWER|BROKEN))

/// Called by remote controller at chosen coordinates
/obj/machinery/remote_weapon/proc/PerformAbility(obj/item/device/remote_weapon_controller/controller, turf/target)
	return

// Mostly a testing version
/obj/machinery/remote_weapon/explosive
	/// How much time passes after successful activation and explosion
	var/attack_delay = 5 SECONDS
	var/fire_cooldown

/obj/machinery/remote_weapon/explosive/CanPerform(obj/item/device/remote_weapon_controller/controller, turf/target)
	if(!AreConnectedZLevels(target.z, src.z))
		return FALSE
	if(fire_cooldown > world.time)
		return FALSE
	return ..()

/obj/machinery/remote_weapon/explosive/PerformAbility(obj/item/device/remote_weapon_controller/controller, turf/target)
	fire_cooldown = world.time + 10 SECONDS
	visible_message(SPAN_DANGER("\The [src] fired a rocket!"))
	playsound(src, 'sound/weapons/gunship_rocket.ogg', 200, TRUE, 4, ignore_pressure = TRUE)
	addtimer(CALLBACK(src, .proc/FireCharge, target), attack_delay)

/obj/machinery/remote_weapon/explosive/proc/FireCharge(turf/target)
	target.visible_message(SPAN_DANGER("A rocket is rapidly approaching your position!"))
	playsound(target, 'sound/weapons/mortar_long_whistle.ogg', 200, TRUE, 4, ignore_pressure = TRUE)
	sleep(7)
	explosion(target, 2, 6, 10, 10)
