/datum/spell/hand/analyze_health
	name = "Analyze Health"
	desc = "Using your powers, you can detect the inner destructions of a persons body."

	range = 2
	level_max = list(UPGRADE_TOTAL = 2, UPGRADE_SPEED = 0, UPGRADE_POWER = 2)
	charge_max = 5
	invocation_type = INVOKE_WHISPER
	invocation = "Fu Yi Fim"
	compatible_targets = list(/mob/living/carbon/human)
	hud_state = "analyze"

	spell_cost = 1
	mana_cost = 3

/datum/spell/hand/analyze_health/cast_hand(mob/living/carbon/human/H, mob/user)
	new /obj/effect/temp_visual/temporary(get_turf(H), 5, 'icons/effects/effects.dmi', "repel_missiles")
	var/skill_level = SKILL_UNTRAINED
	switch(spell_levels[UPGRADE_POWER])
		if(1)
			skill_level = SKILL_TRAINED
		if(2)
			skill_level = SKILL_MAX
	var/datum/browser/popup = new(user, "analyze_health", "Health Scan")
	popup.set_content(display_medical_data(H.get_raw_medical_data(), skill_level))
	popup.open()
	return TRUE

/datum/spell/hand/analyze_health/empower_spell()
	if(!..())
		return FALSE

	return "[src] is now more precise."
