// Psionics
/datum/addiction/psionics
	name = "psionics"
	withdrawal_stage_messages = list("My mind aches.", "My mind wants more power...", "My head will explode! I need more power!")

/datum/addiction/psionics/WithdrawalStage1Process(mob/living/carbon/victim, delta_time)
	. = ..()
	// Deplete the psi stamina
	if(victim.psi && victim.psi.stamina > 5)
		victim.psi.spend_power(0.5 * delta_time)

/datum/addiction/psionics/WithdrawalStage2Process(mob/living/carbon/victim, delta_time)
	. = ..()
	if(victim.psi && victim.psi.stamina > 5)
		victim.psi.spend_power(1 * delta_time)
	victim.adjustBrainLoss(1 * delta_time)
	victim.hallucination(10, 50)

/datum/addiction/psionics/WithdrawalStage3Process(mob/living/carbon/victim, delta_time)
	. = ..()
	if(victim.psi && victim.psi.stamina > 5)
		victim.psi.spend_power(2 * delta_time)
	victim.adjustBrainLoss(2 * delta_time)
	victim.hallucination(30, 100)

/datum/addiction/psionics/LoseAddiction(mob/living/carbon/victim)
	// BLAST THEM!!!
	if(victim.psi)
		victim.psi.spend_power(victim.psi.stamina)
	return ..()
