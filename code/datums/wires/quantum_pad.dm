/datum/wires/quantumpad
	holder_type = /obj/machinery/quantumpad
	wire_count = 1
	descriptions = list(
		new /datum/wire_description(WIRE_TRIGGER, "This wire seems to be activating the teleportation mechanism.")
		)

var/const/WIRE_TRIGGER = 1

/datum/wires/quantumpad/proc/trigger()
	var/obj/machinery/quantumpad/QP = holder
	QP.physical_attack_hand()
	return

/datum/wires/quantumpad/UpdatePulsed(index)
	switch(index)
		if(WIRE_TRIGGER)
			trigger()

/datum/wires/quantumpad/CanUse(mob/living/L)
	var/obj/machinery/quantumpad/QP = holder
	if(QP.panel_open)
		return TRUE
	return FALSE
