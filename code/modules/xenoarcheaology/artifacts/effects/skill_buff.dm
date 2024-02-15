/datum/artifact_effect/skill_buff
	name = "skill buff"
	possible_effect_types = list(EFFECT_TOUCH)
	acceptable_methods = list(ACTIVATE_TOUCH, ACTIVATE_SPEECH)
	cooldown_time = 5 SECONDS
	time_min_range = 5 SECONDS
	time_max_range = 20 SECONDS
	value = 500
	var/datum/skill_buff/buff_type = /datum/skill_buff/artifact
	var/decl/hierarchy/skill/buff_skill
	var/buff_amount = 1
	var/buff_duration = 2 MINUTES

/datum/skill_buff/artifact
	limit = 1

/datum/artifact_effect/skill_buff/getDescription()
	var/buff_text = "tiny"
	switch(buff_amount)
		if(2)
			buff_text = "reasonable"
		if(3)
			buff_text = "significant"
		if(4)
			buff_text = "colossal"
	return "The artifact contains [buff_text] amount of [lowertext(buff_skill.name)] knowledge."

/datum/artifact_effect/skill_buff/New()
	..()
	buff_skill = pick(GLOB.skills)
	buff_duration = rand(1 MINUTES, 4 MINUTES)
	if(prob(20)) // Rare
		buff_amount = 2
	else if(prob(5)) // Ultra rare
		buff_amount = 3
	else if(prob(1)) // LEGENDARY
		buff_amount = 4

/datum/artifact_effect/skill_buff/Value()
	. = ..()
	. += buff_amount * 10000
	. += buff_duration * 2

/datum/artifact_effect/skill_buff/proc/BuffMob(mob/living/carbon/human/H)
	if(ishuman(H))
		if(H.buff_skill(list(buff_skill.type = buff_amount), buff_duration, buff_type))
			to_chat(H, "<span class='notice'>You suddenly feel better at [buff_skill]!</span>")

/datum/artifact_effect/skill_buff/DoEffect(mob/toucher)
	if(toucher && ishuman(toucher))
		var/weakness = GetAnomalySusceptibility(toucher)
		if(prob(weakness * 100))
			BuffMob(toucher)
			return 1
