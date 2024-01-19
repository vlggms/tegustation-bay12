/datum/spell/aimed/spell_steal
	name = "Spell Steal"
	desc = "Temporarily grants you a perfect copy of the spell that was last cast by the target creature."
	deactive_msg = "You discharge the spell steal..."
	active_msg = "You charge the spell steal!"

	charge_max = 35 SECONDS
	cooldown_reduc = 10 SECONDS

	invocation = "Furtum!"
	invocation_type = INVOKE_SHOUT

	level_max = list(UPGRADE_TOTAL = 3, UPGRADE_SPEED = 2, UPGRADE_POWER = 2)

	range = 5

	hud_state = "wiz_spell_steal"

	cast_sound = 'sound/magic/spell_steal.ogg'

	spell_cost = 8
	mana_cost = 20

	var/stolen_spell_duration = 30 SECONDS
	var/list/blacklisted_spell_types = list(
		/datum/spell/aimed/spell_steal,

		)
	var/list/stolen_spells = list()

/datum/spell/aimed/spell_steal/Destroy()
	for(var/datum/spell/S in stolen_spells)
		QDEL_NULL(S)
	stolen_spells = null
	return ..()

/datum/spell/aimed/spell_steal/TargetCastCheck(mob/living/user, mob/living/target)
	if(!isliving(target) || !target.mind)
		to_chat(user, SPAN_WARNING("The target must be a living creature!"))
		return FALSE
	if(!istype(target.mind.last_used_spell))
		to_chat(user, SPAN_WARNING("The target hasn't cast any spells recently!"))
		return FALSE
	if(target.mind.last_used_spell.type in blacklisted_spell_types)
		to_chat(user, SPAN_WARNING("The target's last spell is impossible to steal!"))
		return FALSE
	if(get_dist(user, target) > range)
		to_chat(user, SPAN_WARNING("The target is too far away!"))
		return FALSE
	return ..()

/datum/spell/aimed/spell_steal/fire_projectile(mob/living/user, mob/living/target)
	. = ..()
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(get_turf(target), target.dir, target)
	D.alpha = 125
	D.color = COLOR_GREEN
	animate(D, pixel_x = user.pixel_x, pixel_y = user.pixel_y, alpha = 55, time = 2)
	animate(alpha = 0, time = 2)
	var/datum/spell/S = new target.mind.last_used_spell.type
	// Do the upgrades!
	for(var/up_type in S.spell_levels)
		if(S.spell_levels[up_type])
			for(var/i = 1 to S.spell_levels[up_type])
				if(up_type == UPGRADE_POWER)
					S.empower_spell()
				else if(up_type == UPGRADE_SPEED)
					S.quicken_spell()
	// To prevent shenanigans with "Consume Magic"
	S.total_points_used = 0
	user.add_spell(S)
	addtimer(CALLBACK(src, .proc/ForgetSpell, S), stolen_spell_duration)

/datum/spell/aimed/spell_steal/empower_spell()
	if(!..())
		return FALSE

	stolen_spell_duration += 30 SECONDS

	return "The stolen spells now remain under your control for [stolen_spell_duration / 1 SECONDS] seconds!"

/datum/spell/aimed/spell_steal/proc/ForgetSpell(datum/spell/S)
	if(QDELETED(S))
		return

	to_chat(holder, SPAN_WARNING(SPAN_BOLD("You forget how to use [S.name] spell!")))
	stolen_spells -= S
	qdel(S)
