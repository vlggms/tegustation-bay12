/obj/item/organ/internal/brain
	name = "brain"
	desc = "A piece of juicy meat found in a person's head."
	organ_tag = BP_BRAIN
	parent_organ = BP_HEAD
	vital = 1
	icon_state = "brain2"
	force = 1.0
	w_class = ITEM_SIZE_SMALL
	throwforce = 1.0
	throw_speed = 3
	throw_range = 5
	origin_tech = list(TECH_BIO = 3)
	attack_verb = list("attacked", "slapped", "whacked")
	relative_size = 85
	damage_reduction = 0.25
	can_be_printed = FALSE

	var/can_use_mmi = TRUE
	var/mob/living/carbon/brain/brainmob = null
	var/const/damage_threshold_count = 10
	var/damage_threshold_value
	// When TRUE - next Life() tick will trigger severe damage effects. Basically exists as a sort of a cooldown.
	var/healed_threshold = TRUE
	var/oxygen_reserve = 6

/obj/item/organ/internal/brain/New(mob/living/carbon/holder)
	..()
	if(species)
		set_max_damage(species.total_health)
	else
		set_max_damage(200)

	spawn(5)
		if(brainmob && brainmob.client)
			brainmob.client.screen.len = null //clear the hud

/obj/item/organ/internal/brain/Destroy()
	QDEL_NULL(brainmob)
	return ..()

/obj/item/organ/internal/brain/Process()
	if(owner)
		if(damage > max_damage / 2 && healed_threshold)
			handle_severe_brain_damage()

		if(damage < (max_damage / 4))
			healed_threshold = TRUE

		handle_disabilities()
		handle_damage_effects()

		// Brain damage from low oxygenation or lack of blood.
		if(owner.should_have_organ(BP_HEART))
			// No heart? You are going to have a very bad time. Not 100% lethal because heart transplants should be a thing.
			var/blood_volume = owner.get_blood_oxygenation()
			if(blood_volume < BLOOD_VOLUME_SURVIVE)
				if(!owner.chem_effects[CE_STABLE] || prob(60))
					oxygen_reserve = max(0, oxygen_reserve-1)
			else
				oxygen_reserve = min(initial(oxygen_reserve), oxygen_reserve+1)
			if(!oxygen_reserve) //(hardcrit)
				owner.Paralyse(3)
			var/can_heal = damage && damage < max_damage && (!past_damage_threshold(6) || owner.chem_effects[CE_BRAIN_REGEN])
			var/damprob
			//Effects of bloodloss
			switch(blood_volume)
				if(BLOOD_VOLUME_SAFE to INFINITY)
					if(can_heal)
						heal_damage(1)
				if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
					if(prob(1))
						to_chat(owner, SPAN_WARNING("You feel [pick("dizzy","woozy","faint")]..."))
					damprob = owner.chem_effects[CE_STABLE] ? 15 : 60
					if(!past_damage_threshold(2) && prob(damprob))
						take_internal_damage(0.25)
				if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_OKAY)
					owner.eye_blurry = max(owner.eye_blurry,6)
					damprob = owner.chem_effects[CE_STABLE] ? 20 : 80
					if(!past_damage_threshold(4) && prob(damprob))
						take_internal_damage(0.5)
					if(!owner.paralysis && prob(10))
						owner.Paralyse(rand(1,3))
						to_chat(owner, SPAN_WARNING("You feel extremely [pick("dizzy","woozy","faint")]..."))
				if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
					owner.eye_blurry = max(owner.eye_blurry,6)
					damprob = owner.chem_effects[CE_STABLE] ? 22 : 90
					if(!past_damage_threshold(6) && prob(damprob))
						take_internal_damage(1)
					if(!owner.paralysis && prob(15))
						owner.Paralyse(3,5)
						to_chat(owner, SPAN_DANGER("You feel extremely [pick("dizzy","woozy","faint")]..."))
				if(-(INFINITY) to BLOOD_VOLUME_SURVIVE) // Also see heart.dm, being below this point puts you into cardiac arrest.
					owner.eye_blurry = max(owner.eye_blurry,6)
					damprob = owner.chem_effects[CE_STABLE] ? 25 : 100
					if(prob(damprob))
						take_internal_damage(2)
		// Alkysine and the like passively heal brain damage below certain threshold
		var/brain_heal_effect = owner.chem_effects[CE_BRAIN_REGEN]
		if(brain_heal_effect && !past_damage_threshold(7 + brain_heal_effect))
			heal_damage(brain_heal_effect)
	return ..()

/obj/item/organ/internal/brain/examine(mob/user)
	. = ..()
	if(brainmob && brainmob.client)//if thar be a brain inside... the brain.
		to_chat(user, SPAN_NOTICE(SPAN_BOLD("You can feel the small spark of life still left in this one.")))
	else
		to_chat(user, SPAN_DEADSAY("This one seems particularly lifeless. Perhaps it will regain some of its luster later.."))

/obj/item/organ/internal/brain/removed(mob/living/user)
	if(!istype(owner))
		return ..()

	if(name == initial(name))
		name = "\the [owner.real_name]'s [initial(name)]"

	var/mob/living/simple_animal/borer/borer = owner.has_brain_worms()
	if(borer)
		borer.detatch() //Should remove borer if the brain is removed - RR

	transfer_identity(owner)
	return..()

/obj/item/organ/internal/brain/replaced(mob/living/target)
	if(!..())
		return FALSE

	if(target.key)
		target.ghostize()

	if(brainmob)
		if(brainmob.mind)
			brainmob.mind.transfer_to(target)
		else
			target.key = brainmob.key

	return TRUE

/obj/item/organ/internal/brain/surgical_fix(mob/user)
	var/blood_volume = owner.get_blood_oxygenation()
	if(blood_volume < BLOOD_VOLUME_SURVIVE)
		to_chat(user, SPAN_DANGER("Parts of [src] didn't survive the procedure due to lack of air supply!"))
		set_max_damage(Floor(max_damage - 0.25*damage))
	heal_damage(damage)

/obj/item/organ/internal/brain/get_scarring_level()
	. = (species.total_health - max_damage)/species.total_health

/obj/item/organ/internal/brain/get_mechanical_assisted_descriptor()
	return "machine-interface [name]"

/obj/item/organ/internal/brain/take_internal_damage(damage, silent = FALSE)
	set waitfor = FALSE
	..()
	if(damage >= 10) //This probably won't be triggered by oxyloss or mercury. Probably.
		var/damage_secondary = damage * 0.20
		owner.flash_eyes()
		owner.eye_blurry += damage_secondary
		owner.confused += damage_secondary
		if(damage >= 25)
			owner.Weaken(round(damage_secondary*0.5, 1))
		if(prob(30))
			addtimer(CALLBACK(src, .proc/brain_damage_callback, damage), rand(6, 20) SECONDS, TIMER_UNIQUE)

/obj/item/organ/internal/brain/can_recover()
	return ~status & ORGAN_DEAD

/obj/item/organ/internal/brain/robotize()
	replace_self_with(/obj/item/organ/internal/posibrain)

/obj/item/organ/internal/brain/mechassist()
	replace_self_with(/obj/item/organ/internal/mmi_holder)

/obj/item/organ/internal/brain/getToxLoss()
	return FALSE

/obj/item/organ/internal/brain/set_max_damage(ndamage)
	..()
	damage_threshold_value = round(max_damage / damage_threshold_count)

/obj/item/organ/internal/brain/proc/replace_self_with(replace_path)
	var/mob/living/carbon/human/tmp_owner = owner
	qdel(src)
	if(tmp_owner)
		tmp_owner.internal_organs_by_name[organ_tag] = new replace_path(tmp_owner, 1)
		tmp_owner = null

/obj/item/organ/internal/brain/proc/transfer_identity(mob/living/carbon/H)
	if(!brainmob)
		brainmob = new(src)
		brainmob.SetName(H.real_name)
		brainmob.real_name = H.real_name
		brainmob.dna = H.dna.Clone()
		brainmob.timeofhostdeath = H.timeofdeath

	if(H.mind)
		H.mind.transfer_to(brainmob)

	to_chat(brainmob, SPAN_NOTICE("You feel slightly disoriented. That's normal when you're just \a [initial(src.name)]."))
	callHook("debrain", list(brainmob))

/obj/item/organ/internal/brain/proc/get_current_damage_threshold()
	return round(damage / damage_threshold_value)

/obj/item/organ/internal/brain/proc/past_damage_threshold(threshold)
	return (get_current_damage_threshold() > threshold)

/obj/item/organ/internal/brain/proc/handle_severe_brain_damage()
	set waitfor = FALSE
	healed_threshold = FALSE
	to_chat(owner, "<span class = 'notice' font size='10'><B>Where am I...?</B></span>")
	sleep(5 SECONDS)
	if(!owner)
		return
	to_chat(owner, "<span class = 'notice' font size='10'><B>What's going on...?</B></span>")
	sleep(10 SECONDS)
	if(!owner)
		return
	to_chat(owner, "<span class = 'notice' font size='10'><B>What happened...?</B></span>")
	if(owner.psi)
		owner.psi.check_latency_trigger(40, "physical trauma")

/obj/item/organ/internal/brain/proc/brain_damage_callback(damage) //Confuse them as a somewhat uncommon aftershock. Side note: Only here so a spawn isn't used. Also, for the sake of a unique timer.
	if (!owner)
		return
	to_chat(owner, "<span class = 'notice' font size='10'><B>I can't remember which way is forward...</B></span>")
	owner.confused += damage

/obj/item/organ/internal/brain/proc/handle_disabilities()
	if(owner.stat)
		return
	if((owner.disabilities & EPILEPSY) && prob(1))
		owner.seizure()
	else if((owner.disabilities & TOURETTES) && prob(10))
		switch(rand(1, 3))
			if(1)
				owner.emote("twitch")
			if(2 to 3)
				owner.say("[prob(50) ? ";" : ""][pick("SHIT", "PISS", "FUCK", "CUNT", "COCKSUCKER", "MOTHERFUCKER", "TITS")]")
		owner.make_jittery(10)
	else if((owner.disabilities & NERVOUS) && prob(10))
		owner.stuttering = max(10, owner.stuttering)

/obj/item/organ/internal/brain/proc/handle_damage_effects()
	if(owner.stat)
		return
	if(damage > 5 && prob(1))
		owner.custom_pain("Your head feels numb and painful.",10)
	if(is_bruised() && prob(1) && owner.eye_blurry <= 0)
		to_chat(owner, SPAN_WARNING("It becomes hard to see for some reason."))
		owner.eye_blurry = 5
	if(damage >= 0.5 * max_damage && prob(1) && owner.get_active_hand())
		to_chat(owner, SPAN_DANGER("Your hand won't respond properly, and you drop what you are holding!"))
		owner.unequip_item()
	if(damage >= 0.75 * max_damage)
		owner.slurring = max(owner.slurring, 2)
	if(is_broken())
		if(!owner.lying)
			to_chat(owner, SPAN_DANGER("You black out!"))
		owner.Paralyse(10)
