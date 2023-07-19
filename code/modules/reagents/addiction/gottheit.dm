// Gottheit
// Essentially makes you fall apart if you got addicted to it.
/datum/addiction/gottheit
	name = "gottheit"
	withdrawal_stage_messages = list("I need to feel it again...", "The gottheit... The divine essense... I NEED IT NOW!!", "I AM ABOUT TO DIE, I NEED GOTTHEIT!!!")
	// Might as well make sure you don't die if you have enough of it
	addiction_relief_treshold = 0.1

/datum/addiction/gottheit/WithdrawalStage1Process(mob/living/carbon/victim, delta_time)
	. = ..()
	victim.take_organ_damage(2, 2)
	victim.adjustToxLoss(1)

/datum/addiction/gottheit/WithdrawalStage2Process(mob/living/carbon/victim, delta_time)
	. = ..()
	victim.take_organ_damage(6, 6)
	victim.adjustToxLoss(2)
	victim.adjustCloneLoss(1)

/datum/addiction/gottheit/WithdrawalStage3Process(mob/living/carbon/victim, delta_time)
	. = ..()
	victim.take_organ_damage(12, 12)
	victim.adjustToxLoss(6)
	victim.adjustCloneLoss(3)
