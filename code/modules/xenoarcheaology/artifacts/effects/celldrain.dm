/datum/artifact_effect/celldrain
	name = "cell drain"
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_AURA, EFFECT_PULSE)
	value = 2000
	var/last_message

/datum/artifact_effect/celldrain/getDescription()
	return "The artifact absorbs electrical power."

/datum/artifact_effect/celldrain/DoEffect(var/mob/user)
	if(user)
		if(istype(user, /mob/living/silicon/robot))
			var/mob/living/silicon/robot/R = user
			for (var/obj/item/cell/D in R.contents)
				D.charge = max(D.charge - rand() * 100, 0)
				to_chat(R, "<span class='warning'>SYSTEM ALERT: Energy drain detected!</span>")
			return 1

		return 1

/datum/artifact_effect/celldrain/DoEffectAura()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/obj/machinery/power/apc/C in range(range, T))
			for (var/obj/item/cell/B in C.contents)
				B.charge = max(B.charge - 50,0)
		for (var/obj/machinery/power/smes/S in range(range, T))
			S.charge = max(S.charge - 100,0)
		for (var/mob/living/silicon/robot/M in range(range, T))
			for (var/obj/item/cell/D in M.contents)
				D.charge = max(D.charge - 50,0)
				if(world.time - last_message > 200)
					to_chat(M, "<span class='warning'>SYSTEM ALERT: Energy drain detected!</span>")
					last_message = world.time
	return 1

/datum/artifact_effect/celldrain/DoEffectPulse()
	if(holder)
		var/turf/T = get_turf(holder)
		for (var/obj/machinery/power/apc/C in range(range, T))
			for (var/obj/item/cell/B in C.contents)
				B.charge = max(B.charge - rand() * 150,0)
		for (var/obj/machinery/power/smes/S in range(range, T))
			S.charge = max(S.charge - 250,0)
		for (var/mob/living/silicon/robot/M in range(range, T))
			for (var/obj/item/cell/D in M.contents)
				D.charge = max(D.charge - rand() * 150,0)
				if(world.time - last_message > 200)
					to_chat(M, "<span class='warning'>SYSTEM ALERT: Energy drain detected!</span>")
					last_message = world.time
	return 1
