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

// TODO: We might want to make it so it injects reagents instead of directly affecting the "chem_effects" list.
/datum/symptom/painkiller
	name = "Pain Inhibitor"
	desc = "The virus causes a delay in activation of certain parts of host's nerves responsible for pain, acting as painkillers as a result."
	stealth = -3
	resistance = -1
	stage_speed = -1
	transmittable = 1
	level = 4
	threshold_descs = list(
		"Resistance 6" = "Increases the limit of painkilling effects.",
		"Resistance 12" = "Further increases the limit of painkilling effects.",
		"Stage Speed 6" = "Increases painkilling properties.",
		"Stage Speed 12" = "Further increases painkilling properties."
	)
	/// Amount of painkiller chem effect applied to the host on each activation. Multiplied by stage.
	var/painkiller_count = 5
	/// Maximum amount of painkilling effect, which we will not exceed.
	var/painkiller_limit = 50

/datum/symptom/painkiller/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.properties["resistance"] >= 6) // Higher limit
		painkiller_limit = 100
	if(A.properties["resistance"] >= 12) // Even higher
		painkiller_limit = 200
	if(A.properties["stage_rate"] >= 6)
		painkiller_count = 10
	if(A.properties["stage_rate"] >= 12)
		painkiller_count = 20

/datum/symptom/painkiller/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/carbon/C = A.affected_mob
	if(C.chem_effects[CE_PAINKILLER] > painkiller_limit)
		return
	C.add_chemical_effect(CE_PAINKILLER, painkiller_count * A.stage)
