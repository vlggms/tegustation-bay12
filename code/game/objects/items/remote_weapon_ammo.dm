/obj/item/remote_weapon_ammo
	name = "bluespace rocket"
	desc = "A rocket used by remote bluespace rocket launchers."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "bpshell_he"
	w_class = ITEM_SIZE_NORMAL
	/// Sound played when fired
	var/fire_sound = 'sound/weapons/gunship_rocketpod.ogg'
	/// Time it takes for the rocket to actually arrive
	var/attack_delay = 5 SECONDS

/// Called by remote weapon when firing the shell
/obj/item/remote_weapon_ammo/proc/FireSelf(turf/target)
	qdel(src)
	return

// Explosives
/obj/item/remote_weapon_ammo/explosive
	name = "bluespace HE rocket"
	desc = "A rocket used by remote bluespace rocket launchers. This one produces a potent explosion upon landing."
	var/explosion_high = 2
	var/explosion_medium = 4
	var/explosion_light = 6
	var/explosion_flash = 8

/obj/item/remote_weapon_ammo/explosive/FireSelf(turf/target)
	target.visible_message(SPAN_DANGER("A rocket is rapidly approaching your position!"))
	playsound(target, 'sound/weapons/mortar_long_whistle.ogg', 100, TRUE, 4)
	sleep(7)
	explosion(target, explosion_high, explosion_medium, explosion_light, explosion_flash)
	return ..()

/obj/item/remote_weapon_ammo/explosive/low
	name = "bluespace LE rocket"
	desc = "A rocket used by remote bluespace rocket launchers. This one produces a relatively weak explosion upon landing."
	explosion_high = -1
	explosion_medium = 2
	explosion_light = 5
	explosion_flash = 6

// "Bluespace fire" - Basically produces an AOE pseudo-fire that deals damage directly
/obj/item/remote_weapon_ammo/bluespace_fire
	name = "bluespace fire rocket"
	desc = "A rocket used by remote bluespace rocket launchers. This one sets a large area on bluespace fire upon landing."
	icon_state = "bpshell_laser"
	fire_sound = 'sound/weapons/gunship_laser.ogg'
	var/fire_range = 12
	var/fire_duration = 5 SECONDS
	var/fire_damage = 25

/obj/item/remote_weapon_ammo/bluespace_fire/FireSelf(turf/target)
	target.visible_message(SPAN_DANGER("A rocket is rapidly approaching your position!"))
	playsound(target, 'sound/weapons/mortar_long_whistle.ogg', 100, TRUE, 4)
	sleep(7)
	playsound(target, 'sound/weapons/gunship_laser.ogg', 200, TRUE, 12, ignore_pressure = TRUE)
	var/list/prev_range = list()
	for(var/i = 1 to fire_range)
		var/list/curr_range = spiral_range_turfs(i, target) - prev_range
		for(var/turf/T in curr_range)
			var/obj/effect/fake_fire/bluespace/bfire = new(T)
			bfire.lifetime = fire_duration
			bfire.firelevel = fire_damage
		prev_range = curr_range
		sleep(0.5)
	return ..()

/obj/item/remote_weapon_ammo/bluespace_fire/infernum
	name = "bluespace infernum rocket"
	desc = "A rather infamous ammunition type used by remote bluespace rocket launchers. By even looking at it you probably violated several conventions on use of dangerous and inhumane weaponry."
	fire_range = 48
	fire_duration = 120 SECONDS
	fire_damage = 150
