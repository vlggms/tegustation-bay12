/datum/artifact_effect/forcefield
	name = "force field"
	effect_type = EFFECT_TOUCH
	cooldown_time = 50
	possible_effect_types = list(EFFECT_TOUCH, EFFECT_PULSE)
	value = 6000
	var/list/created_field = list()
	var/field_range = 4
	var/field_color

/datum/artifact_effect/forcefield/getDescription()
	return "The artifact emits [effect_type == EFFECT_PULSE ? "pulsating" : ""] defensive aura."

/datum/artifact_effect/forcefield/New()
	..()
	field_color = get_random_colour(1)

/datum/artifact_effect/forcefield/Destroy()
	for(var/obj/effect/energy_field/F in created_field)
		created_field.Remove(F)
		qdel(F)
	. = ..()

/datum/artifact_effect/forcefield/DoEffect(mob/toucher)
	..()
	SpawnFields()

/datum/artifact_effect/forcefield/DoEffectPulse()
	..()
	SpawnFields()

/datum/artifact_effect/forcefield/toggle_off()
	..()
	if(created_field.len)
		DeleteFields()

/datum/artifact_effect/forcefield/process()
	..()
	for(var/obj/effect/energy_field/E in created_field)
		if(E.strength < 20)
			E.Strengthen(0.5)

/datum/artifact_effect/forcefield/proc/SpawnFields()
	if(created_field.len)
		DeleteFields()
	if(holder)
		var/turf/start_turf = get_turf(holder)
		var/list/field_zone = list()
		if(!istype(start_turf))
			return
		field_zone = spiral_range_turfs(field_range, start_turf) - spiral_range_turfs(field_range-1, start_turf)
		for(var/turf/T in field_zone)
			var/obj/effect/energy_field/E = new(T)
			created_field += E
			E.strength = 15
			E.set_density(1)
			E.anchored = TRUE
			E.color = field_color
			E.set_invisibility(0)

/datum/artifact_effect/forcefield/proc/DeleteFields()
	if(!created_field.len)
		return
	for(var/obj/effect/energy_field/F in created_field)
		created_field -= F
		qdel(F)
