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

/obj/item/remote_weapon_ammo/explosive/FireSelf(turf/target)
	target.visible_message(SPAN_DANGER("A rocket is rapidly approaching your position!"))
	playsound(target, 'sound/weapons/mortar_long_whistle.ogg', 100, TRUE, 4)
	sleep(7)
	explosion(target, 2, 4, 6, 8)

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
	for(var/i = 1 to fire_range)
		for(var/turf/T in spiral_range_turfs(i, target) - spiral_range_turfs(i-1, target))
			var/obj/effect/fake_fire/bluespace/bfire = new(T)
			bfire.lifetime = fire_duration
			bfire.firelevel = fire_damage
		sleep(0.5)
