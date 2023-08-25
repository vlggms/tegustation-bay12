/datum/symptom/bloodvommiting
	name = "Bloody Vomitting"
	desc = "The virus irritates the digestive system, adding blood into the stomach, thus causing vomitting."
	stealth = 1
	resistance = 2
	stage_speed = 3
	transmittable = 1
	level = 3
	severity = 1
	symptom_delay_min = 5
	symptom_delay_max = 25
	var/canblood = FALSE
	var/bloodamount = 2
	threshold_descs = list(
		"Stage Speed 6" = "Increases the amount of blood expelled into the vomit.",
		"Stage Speed 12" = "Further increases the amount of blood expelled into the vomit.",
		"Stage Speed 20" = "Puts a ludicrous amount of blood into the vomit stream."
	)

/datum/symptom/bloodvommiting/Start(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/carbon/human/H = A.affected_mob
	if(A.properties["stage_rate"] >= 6)
		bloodamount = 15
	if(A.properties["stage_rate"] >= 12)
		bloodamount = 20
	if(A.properties["stage_rate"] >= 20)
		bloodamount = 40
	switch(A.stage)
		if(1, 2, 3)
			if(prob(base_message_chance) && !suppress_warning)
				to_chat(H, SPAN_WARNING("[pick("You feel the taste of blood...", "You gag a little.")]"))
			else
				H.empty_stomach(TRUE, bloodamount)
