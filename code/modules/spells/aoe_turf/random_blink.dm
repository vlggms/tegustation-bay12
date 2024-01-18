/datum/spell/aoe_turf/random_blink
	name = "Random blink"
	desc = "This spell randomly teleports you a short distance."
	charge_max = 20
	spell_flags = Z2NOCAST | IGNOREDENSE | IGNORESPACE
	invocation = "none"
	invocation_type = INVOKE_NONE
	range = 7
	inner_radius = 1

	level_max = list(UPGRADE_TOTAL = 4, UPGRADE_SPEED = 4, UPGRADE_POWER = 4)
	cooldown_min = 5 //4 deciseconds reduction per rank
	hud_state = "wiz_blink"
	cast_sound = 'sound/magic/blink.ogg'

	categories = list(SPELL_CATEGORY_MOBILITY)
	spell_cost = 1
	mana_cost = 1

/datum/spell/aoe_turf/random_blink/cast(list/targets, mob/user)
	if(!targets.len)
		return

	var/turf/T = pick(targets)
	if(!istype(T))
		return

	if(user.buckled)
		user.buckled = null

	var/turf/starting = get_turf(user)
	user.forceMove(T)
	var/list/line_list = getline(starting, T)
	for(var/i = 1 to length(line_list))
		var/turf/TT = line_list[i]
		var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(TT, user.dir, user)
		D.alpha = min(150 + i*15, 255)
		animate(D, alpha = 0, time = 2 + i*2)

	return

/datum/spell/aoe_turf/random_blink/empower_spell()
	if(!..())
		return 0
	inner_radius += 1

	return "You've increased the inner range of [src]."
