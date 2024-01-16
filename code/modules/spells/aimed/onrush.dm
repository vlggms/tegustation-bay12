/datum/spell/aimed/onrush
	name = "Onrush"
	desc = "This spell allows its user to quickly teleport towards their target, perfoming an attack with \
			currently held item. If the target dies or gets destroyed after the attack - spell is cast again \
			freely, until there's no living creatures left."
	deactive_msg = "You discharge the onrush spell..."
	active_msg = "You charge the onrush spell!"

	charge_max = 20 SECONDS
	cooldown_reduc = 5 SECONDS

	invocation = "Irruere!"
	invocation_type = INVOKE_SHOUT
	level_max = list(UPGRADE_TOTAL = 2, UPGRADE_SPEED = 2, UPGRADE_POWER = 0)

	range = 8
	hud_state = "wiz_onrush"
	cast_sound = 'sound/magic/magic_spell.ogg'
	spell_cost = 2
	mana_cost = 10

	// List of mobs that were already attacked in this cast
	var/list/already_attacked = list()

/datum/spell/aimed/onrush/TargetCastCheck(mob/living/user, mob/living/target)
	if(get_dist(user, target) > range)
		to_chat(user, SPAN_WARNING("The target is too far away!"))
		return FALSE
	if(target.stat)
		to_chat(user, SPAN_WARNING("[target] is already dead or unconscious!"))
		return FALSE
	return ..()

/datum/spell/aimed/onrush/fire_projectile(mob/living/user, mob/living/target)
	. = ..()
	already_attacked = list()
	RushTarget(user, target)

/datum/spell/aimed/onrush/proc/RushTarget(mob/living/user, mob/living/target)
	var/turf/target_turf = get_step(get_turf(target), pick(GLOB.alldirs))
	var/list/line_list = getline(user, target_turf)
	for(var/i = 1 to length(line_list))
		var/turf/T = line_list[i]
		var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(T, user)
		D.alpha = min(150 + i*15, 255)
		animate(D, alpha = 0, time = 2 + i*2)
	user.forceMove(target_turf)
	playsound(get_turf(user), 'sound/simple_mob/abnormality/white_night/spear_dash.ogg', 50, TRUE)
	OnrushAttack(user, target)
	if(target.stat || QDELETED(target))
		if(!QDELETED(target))
			already_attacked |= target
		addtimer(CALLBACK(src, .proc/CheckAndRepeat, user), rand(3, 6))
		return
	already_attacked = list()

/datum/spell/aimed/onrush/proc/OnrushAttack(mob/living/user, mob/living/target)
	user.next_move = 0
	user.a_intent = I_HURT
	user.ClickOn(target)

// Looks for valid mobs in view and attacks one
/datum/spell/aimed/onrush/proc/CheckAndRepeat(mob/living/user)
	var/list/valid_mobs = list()
	for(var/mob/living/L in view(user))
		if(L in already_attacked)
			continue
		if(L.stat)
			continue
	if(!LAZYLEN(valid_mobs))
		already_attacked = list()
		return
	var/mob/living/new_target = pick(valid_mobs)
	RushTarget(user, new_target)
