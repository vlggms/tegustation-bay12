/datum/spell/targeted/swap
	name = "Swap"
	desc = "This spell swaps the positions of the wizard and a target."

	charge_type = SPELL_HOLDVAR
	holder_var_type = "brainloss"
	holder_var_amount = 10

	invocation = "Joyo!"
	invocation_type = INVOKE_WHISPER

	level_max = list(UPGRADE_TOTAL = 2, UPGRADE_SPEED = 0, UPGRADE_POWER = 2)

	spell_flags = Z2NOCAST
	range = 6
	max_targets = 1
	compatible_mobs = list(/mob/living)

	hud_state = "wiz_swap"

	cast_sound = 'sound/magic/mandswap.ogg'

	spell_cost = 1
	mana_cost = 5

/datum/spell/targeted/swap/cast(var/list/targets, mob/user)
	for(var/mob/T in targets)
		var/turf/aT = get_turf(T)
		var/turf/bT = get_turf(user)

		T.forceMove(bT)
		user.forceMove(aT)

		apply_spell_damage(T)

/datum/spell/targeted/swap/empower_spell()
	if(!..())
		return 0

	amt_eye_blind += 2

	return "This spell will now blind the target."
