/datum/disease/rage
	name = "Rage"
	desc = "The victim will quickly show signs of uncontrollable rage. Immediate treatment recommended!"
	max_stages = 3
	spread_text = "Fluids"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Rezadone"
	cures = list(/datum/reagent/medicine/rezadone)
	agent = "VMD4-Rage"
	viable_mobtypes = list(/mob/living/carbon/human)
	severity = DISEASE_SEVERITY_BIOHAZARD
	var/first_message_shown = FALSE

/datum/disease/rage/StageAct()
	. = ..()
	if(!.)
		return

	switch(stage)
		if(1)
			if(!first_message_shown)
				first_message_shown = TRUE
				to_chat(affected_mob, SPAN_DANGER("Your muscles start tensing up, and you can feel your pulse rising, throbbing at the back of your head. Your breathing increases, and you feel... angry. An urge wells up inside you. Everything is making you angry, and you want it to <i>pay</i> for it."))
				return // As with the old virus nothing really happens at first giving you a chance to adjust your roleplay. Since this is a roleplay server after all.

		if(2)
			if(prob(2))
				affected_mob.emote("mumble")
			else if(prob(2))
				affected_mob.emote("cry")
			else if(prob(1))
				affected_mob.visible_message(SPAN_WARNING("[affected_mob] trembles violently!"))
			else if(prob(1))
				affected_mob.visible_message(SPAN_WARNING("[affected_mob] breathes heavily!"))

		if(3)
			if(prob(25))
				affected_mob.a_intent_change(I_HURT)

			if(prob(15) && affected_mob.can_eat(null, FALSE) && !affected_mob.restrained() && !affected_mob.stat && !affected_mob.paralysis && !affected_mob.stunned && !affected_mob.sleeping)
				var/list/potential_targets = list()
				for(var/mob/living/L in view(1, affected_mob))
					if(L == affected_mob)
						continue
					if(L.stat == DEAD)
						continue
					potential_targets += L
				if(LAZYLEN(potential_targets))
					var/mob/living/target = pick(potential_targets)
					affected_mob.do_attack_animation(target)
					affected_mob.visible_message(SPAN_DANGER("[affected_mob] violently bites [target]!"))
					playsound(affected_mob, 'sound/weapons/bite.ogg', 50, TRUE)
					target.adjustBruteLoss(rand(8, 16))
					if(prob(50))
						target.ForceContractDisease(src)

			if(prob(5))
				to_chat(affected_mob, SPAN_DANGER("You feel uncontrollable rage filling you! You want to hurt and destroy!"))
				affected_mob.visible_message(SPAN_WARNING("[affected_mob] is completely filled with rage!"))
				if(affected_mob.reagents.get_reagent_amount(/datum/reagent/medicine/stimulant/hyperzine) < 1)
					affected_mob.reagents.add_reagent(/datum/reagent/medicine/stimulant/hyperzine, 4)
