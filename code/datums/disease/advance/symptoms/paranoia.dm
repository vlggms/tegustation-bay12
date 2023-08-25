/*
//////////////////////////////////////

Paranoia

	Very stealthy.
	Reduces resistance.
	Increases stage speed.
	Reduces transmissibility.
	Medium Level.

BONUS
	Displays an annoying message!
	Should be used for buffing your disease.

//////////////////////////////////////
*/

/datum/symptom/paranoia
	name = "Paranoia"
	desc = "The virus causes delusional and distrustful behavior in the host."
	stealth = 2
	resistance = -2
	stage_speed = 1
	transmittable = -2
	level = 5
	severity = 1
	symptom_delay_min = 5
	symptom_delay_max = 90 // They will never know what to trust :)
