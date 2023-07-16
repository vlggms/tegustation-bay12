///Alcohol
/datum/addiction/alcohol
	name = "alcohol"
	withdrawal_stage_messages = list("I could use a drink...", "Maybe the bar is still open?..", "God I need a drink!")

/datum/addiction/alcohol/WithdrawalStage1Process(mob/living/carbon/victim, delta_time)
	. = ..()
	victim.jitteriness = clamp(victim.jitteriness + 5 * delta_time, victim.jitteriness, 250)

/datum/addiction/alcohol/WithdrawalStage2Process(mob/living/carbon/victim, delta_time)
	. = ..()
	victim.jitteriness = clamp(victim.jitteriness + 10 * delta_time, victim.jitteriness, 250)
	victim.adjust_hallucination(3, 3)

/datum/addiction/alcohol/WithdrawalStage3Process(mob/living/carbon/victim, delta_time)
	. = ..()
	victim.jitteriness = clamp(victim.jitteriness + 15 * delta_time, victim.jitteriness, 250)
	victim.adjust_hallucination(5, 5)
