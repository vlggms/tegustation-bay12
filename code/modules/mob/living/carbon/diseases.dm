/mob/living/carbon/handle_diseases()
	for(var/thing in diseases)
		var/datum/disease/D = thing
		if(prob(D.infectivity))
			D.Spread()

		if(stat != DEAD || D.process_dead)
			D.StageAct()
