/*
//////////////////////////////////////

Pain Inhibitor

	Very Noticable.
	Decreases resistance.
	Reduces stage speed.
	Increases transmittability.
	High Level.

Bonus
	Increases amount of pain done
	Stuns the host

//////////////////////////////////////
*/

/datum/symptom/painkiller
	name = "Pain Inhibitor"
	desc = "The virus causes a delay in activation of certain parts of host's nerves responsible for pain, acting as painkillers as a result."
	stealth = -3
	resistance = -1
	stage_speed = -1
	transmittable = 1
	level = 4
	symptom_delay_min = 10
	symptom_delay_max = 30
	threshold_descs = list(
		"Resistance 6" = "Increases the limit of painkilling effects.",
		"Resistance 12" = "Further increases the limit of painkilling effects.",
		"Stage Speed 10" = "Speeds up the activation of symptom."
	)
	/// Amount of painkiller chem effect applied to the host on each activation. Multiplied by stage.
	var/painkiller_count = 2
	/// Maximum amount of painkilling effect, which we will not exceed.
	var/painkiller_limit = 100

/datum/symptom/painkiller/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.properties["resistance"] >= 6) // Higher limit
		painkiller_limit = 200
	if(A.properties["resistance"] >= 12) // Even higher
		painkiller_limit = 300
	if(A.properties["stage_rate"] >= 10) // Reduces max activation delay, thus speeding up the painkilling effects
		symptom_delay_max = 20

/datum/symptom/painkiller/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/carbon/C = A.affected_mob
	if(C.chem_effects[CE_PAINKILLER] < painkiller_limit)
		C.add_chemical_effect(CE_PAINKILLER, painkiller_count)
