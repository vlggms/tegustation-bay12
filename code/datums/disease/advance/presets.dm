// Cold
/datum/disease/advance/cold
	copy_type = /datum/disease/advance

/datum/disease/advance/cold/New()
	name = "Cold"
	symptoms += new /datum/symptom/sneeze
	..()

// Flu
/datum/disease/advance/flu
	copy_type = /datum/disease/advance

/datum/disease/advance/flu/New()
	name = "Flu"
	symptoms += new /datum/symptom/cough
	..()
