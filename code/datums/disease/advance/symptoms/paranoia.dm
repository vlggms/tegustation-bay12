// List of item types that may be used in activation of the symptom
GLOBAL_LIST_INIT(paranoia_items, list(
	/obj/item/card/union,
	/obj/item/card/data,
	/obj/item/card/emag,
	/obj/item/plastique,
	/obj/item/aiModule/syndicate,
	/obj/item/aiModule/freeform,
	/obj/item/shield/energy,
	/obj/item/melee/baton,
	/obj/item/melee/baton/cattleprod,
	/obj/item/melee/energy/sword,
	/obj/item/implantcase/adrenalin,
	/obj/item/implantcase/explosive,
	/obj/item/implanter/uplink,
	/obj/item/gun/energy/gun,
	/obj/item/gun/energy/gun/nuclear,
	/obj/item/gun/energy/captain,
	/obj/item/gun/energy/ionrifle/small,
	/obj/item/gun/energy/toxgun,
	/obj/item/gun/projectile/pistol/military,
	/obj/item/gun/projectile/pistol/sec,
	/obj/item/gun/projectile/automatic,
	/obj/item/pen,
	/obj/item/grenade/anti_photon,
	/obj/item/grenade/smokebomb,
	/obj/item/grenade/empgrenade,
	/obj/item/grenade/frag,
	/obj/item/grenade/frag/high_yield,
	/obj/item/device/uplink_service/fake_ion_storm,
	/obj/item/device/powersink,
	))

// List of random spooky sounds to play to paranoid people
// The associated list is: list(maximum repeats, minimum delay, maximum delay)
// If no list is associated - treated as single sound instance
GLOBAL_LIST_INIT(paranoia_sounds, list(
	"button" = list(3, 1 SECONDS, 3 SECONDS),
	'sound/machines/airlock_open.ogg',
	'sound/machines/airlock_open_force.ogg',
	'sound/machines/airlock_close.ogg',
	'sound/machines/airlock_close_force.ogg',
	'sound/machines/bolts_up.ogg',
	'sound/machines/bolts_down.ogg',
	'sound/machines/deniedboop.ogg' = list(5, 1.5 SECONDS, 3 SECONDS),
	'sound/effects/walkieon.ogg' = list(2, 2 SECONDS, 4 SECONDS),
	'sound/effects/walkietalkie.ogg' = list(12, 0.5 SECONDS, 4 SECONDS),
	'sound/weapons/Laser.ogg' = list(6, 1 SECONDS, 4 SECONDS),
	'sound/weapons/lasercannonfire.ogg' = list(3, 2 SECONDS, 6 SECONDS),
	'sound/weapons/pulse.ogg' = list(5, 1.5 SECONDS, 5 SECONDS),
	'sound/weapons/gunshot/gunshot_strong.ogg' = list(7, 0.7 SECONDS, 2 SECONDS),
	'sound/weapons/gunshot/gunshot_pistol.ogg' = list(7, 0.7 SECONDS, 2 SECONDS),
	'sound/weapons/gunshot/revolver.ogg' = list(6, 1 SECONDS, 3 SECONDS),
	'sound/weapons/gunshot/gunshot2.ogg' = list(10, 0.2 SECONDS, 1 SECONDS),
	'sound/weapons/gunshot/gunshot3.ogg' = list(10, 0.2 SECONDS, 1 SECONDS),
	'sound/weapons/guns/miss1.ogg' = list(3, 0.2 SECONDS, 1 SECONDS),
	'sound/weapons/guns/miss2.ogg' = list(3, 0.2 SECONDS, 1 SECONDS),
	'sound/weapons/guns/ricochet1.ogg' = list(3, 0.2 SECONDS, 1 SECONDS),
	'sound/weapons/guns/ricochet2.ogg' = list(3, 0.2 SECONDS, 1 SECONDS),
	// If you don't have infestation PTSD - you aren't a real human,
	'sound/weapons/rapidslice.ogg' = list(3, 1 SECONDS, 2 SECONDS),
	'sound/weapons/slashmiss.ogg' = list(7, 0.5 SECONDS, 1 SECONDS),
	'sound/weapons/alien_claw_flesh1.ogg' = list(5, 0.8 SECONDS, 1.4 SECONDS),
	'sound/simple_mob/abominable_infestation/assembler/ambient_1.ogg' = list(3, 2 SECONDS, 4 SECONDS),
	'sound/simple_mob/abominable_infestation/broodling/ambient_1.ogg' = list(2, 1 SECONDS, 3 SECONDS),
	'sound/simple_mob/abominable_infestation/broodling/ambient_2.ogg' = list(2, 1 SECONDS, 3 SECONDS),
	'sound/simple_mob/abominable_infestation/broodling/death.ogg',
	'sound/simple_mob/abominable_infestation/eviscerator/attack.ogg' = list(3, 1 SECONDS, 3 SECONDS),
	'sound/simple_mob/abominable_infestation/eviscerator/step.ogg' = list(4, 1 SECONDS, 3 SECONDS),
	'sound/simple_mob/abominable_infestation/eviscerator/aggro_1.ogg',
	'sound/simple_mob/abominable_infestation/eviscerator/aggro_2.ogg',
	'sound/simple_mob/abominable_infestation/eviscerator/aggro_3.ogg',
	'sound/simple_mob/abominable_infestation/eviscerator/death_1.ogg',
	'sound/simple_mob/abominable_infestation/floatfly/fly.ogg',
	'sound/simple_mob/abominable_infestation/floatfly/death.ogg',
	'sound/simple_mob/abominable_infestation/rhino/step.ogg' = list(3, 2 SECONDS, 4 SECONDS),
	'sound/simple_mob/abominable_infestation/rhino/roar.ogg',
	))

/*
//////////////////////////////////////

Paranoia

	Very stealthy.
	Reduces resistance.
	Increases stage speed.
	Reduces transmissibility.
	Medium Level.

BONUS
	Displays an annoying message!
	Should be used for buffing your disease.

//////////////////////////////////////
*/

/datum/symptom/paranoia
	name = "Paranoia"
	desc = "The virus causes delusional and distrustful behavior in the host."
	stealth = 2
	resistance = -2
	stage_speed = 1
	transmittable = -2
	level = 5
	severity = 1
	symptom_delay_min = 2
	symptom_delay_max = 90 // They will never know what to trust :)

/datum/symptom/paranoia/Activate(datum/disease/advance/A)
	if(!..())
		return
	if(A.stage <= 3)
		return
	else
		var/mob/living/M = A.affected_mob
		var/rand_effect = pick(1, 2, 3)
		switch(rand_effect)
			// Fake examine message
			if(1)
				if(M.is_blind())
					return
				var/list/potential_people = list()
				for(var/mob/living/carbon/human/H in view(4, M))
					if(H == M)
						continue
					if(!H.client)
						continue
					if(H.stat)
						continue
					if(H.is_invisible_to(M))
						continue
					potential_people += H
				if(!LAZYLEN(potential_people))
					return
				var/mob/living/carbon/human/H = pick(potential_people)
				var/fake_message = "at the void"
				if(prob(25) && istype(H.back, /obj/item/storage))
					fake_message = "inside \the [H.back.name]"
				else
					var/obj/item/fake_item = pick(GLOB.paranoia_items)
					fake_message = "at \the [initial(fake_item.name)]"
				to_chat(M, "<span class='subtle'><b>\The [H]</b> looks [fake_message].</span>")
			// Fake sound
			if(2)
				var/turf/T = get_random_turf_in_range(M, 6, 2)
				var/S = pick(GLOB.paranoia_sounds)
				M.playsound_local(T, S, rand(10, 65), prob(50))
				if(!islist(GLOB.paranoia_sounds[S]))
					return
				// Epic paranoidal sounds
				var/list/params = GLOB.paranoia_sounds[S]
				var/repeats = rand(1, params[1])
				for(var/i = 1 to repeats)
					var/delay = rand(params[2], params[3])
					addtimer(CALLBACK(src, .proc/PlayDelayedSound, M, T, S), delay)

/datum/symptom/paranoia/proc/PlayDelayedSound(mob/living/M, turf/T, S)
	if(QDELETED(M) || QDELETED(T))
		return
	var/turf/TT = get_random_turf_in_range(T, 2) // Sound is coming from slightly different place now
	M.playsound_local(TT, S, rand(10, 65), prob(50))
