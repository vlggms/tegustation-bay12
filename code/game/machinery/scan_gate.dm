#define SCANGATE_NONE 			"Off"
#define SCANGATE_MINDSHIELD 	"Mindshield"
#define SCANGATE_GUNS 			"Guns"
#define SCANGATE_WANTED			"Wanted"
#define SCANGATE_SPECIES		"Species"
#define SCANGATE_NUTRITION		"Nutrition"

#define SCANGATE_ALL_MODES		list(SCANGATE_NONE, SCANGATE_MINDSHIELD, SCANGATE_GUNS, SCANGATE_WANTED, \
								SCANGATE_SPECIES, SCANGATE_NUTRITION)

#define SCANGATE_HUMAN			"human"
#define SCANGATE_UNATHI			"unathi"
#define SCANGATE_SKRELL			"skrell"
#define SCANGATE_NABBER			"serpentid"
#define SCANGATE_ADHERENT		"adherent"
#define SCANGATE_VOX			"vox"
#define SCANGATE_IPC			"machine"
#define SCANGATE_DIONA			"diona"
#define SCANGATE_GOLEM			"golem"
#define SCANGATE_ZOMBIE			"zombie"

#define SCANGATE_ALL_SPECIES	list(SCANGATE_HUMAN, SCANGATE_UNATHI, SCANGATE_SKRELL, SCANGATE_NABBER, \
								SCANGATE_ADHERENT, SCANGATE_VOX, SCANGATE_IPC, SCANGATE_DIONA, \
								SCANGATE_GOLEM, SCANGATE_ZOMBIE)

/obj/machinery/scanner_gate
	name = "scanner gate"
	desc = "A gate able to perform mid-depth scans on any organisms who pass under it."
	icon = 'icons/obj/machines/scangate.dmi'
	icon_state = "scangate"
	active_power_usage = 10 KILOWATTS
	idle_power_usage = 10
	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null

	var/scanline_timer
	var/next_beep = 0 //avoids spam
	var/locked = FALSE
	var/reverse = FALSE //If TRUE, signals if the scan returns false
	var/scangate_mode = SCANGATE_NONE
	var/detect_species = SCANGATE_HUMAN
	/// If TRUE - will not trigger on subtypes of set species
	var/detect_species_strict = FALSE
	var/detect_nutrition = 450

/obj/machinery/scanner_gate/Initialize()
	. = ..()
	SetScanline("passive")

/obj/machinery/scanner_gate/examine(mob/user)
	. = ..()
	if(locked)
		to_chat(user, SPAN_NOTICE("The control panel is ID-locked. Swipe a valid ID to unlock it."))
	else
		to_chat(user, SPAN_NOTICE("The control panel is unlocked. Swipe an ID to lock it."))

/obj/machinery/scanner_gate/Crossed(atom/movable/AM)
	. = ..()
	AutoScan(AM)

/obj/machinery/scanner_gate/attackby(obj/item/W, mob/user, params)
	var/obj/item/card/id/card = W
	if(card)
		if(locked)
			if(allowed(user))
				locked = FALSE
				req_access = list()
				to_chat(user, SPAN_NOTICE("You unlock [src]."))
		else if(!emagged)
			to_chat(user, SPAN_NOTICE("You lock [src] with [W]."))
			var/list/access = W.GetAccess()
			req_access = access
			locked = TRUE
		else
			to_chat(user, SPAN_WARNING("You try to lock [src] with [W], but nothing happens."))
	else
		return ..()

/obj/machinery/scanner_gate/emag_act(mob/user)
	if(emagged)
		return
	locked = FALSE
	req_access = list()
	emagged = TRUE
	to_chat(user, SPAN_NOTICE("You fry the ID checking system."))
	return TRUE

/obj/machinery/scanner_gate/proc/AutoScan(atom/movable/AM)
	if(!(stat & (BROKEN|NOPOWER)) && isliving(AM))
		PerformScan(AM)

/obj/machinery/scanner_gate/proc/SetScanline(type, duration)
	cut_overlays()
	deltimer(scanline_timer)
	add_overlay(type)
	if(duration)
		scanline_timer = addtimer(CALLBACK(src, .proc/SetScanline, "passive"), duration, TIMER_STOPPABLE)

/obj/machinery/scanner_gate/proc/PerformScan(mob/living/M)
	var/beep = FALSE
	switch(scangate_mode)
		if(SCANGATE_NONE)
			return
		if(SCANGATE_WANTED)
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				var/perpname = H.get_face_name(H.get_id_name())
				var/datum/computer_file/report/crew_record/R = get_crewmember_record(perpname)
				var/datum/report_field/options/crew_record/criminalStatus/CS = locate() in R.fields
				if(!R || !CS || CS.value == "Arrest")
					beep = TRUE
		if(SCANGATE_MINDSHIELD)
			for(var/obj/item/implant/I in M)
				if(istype(I, /obj/item/implant/loyalty))
					beep = TRUE
					break
		if(SCANGATE_SPECIES)
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				var/datum/species/scan_species = /datum/species/human
				switch(detect_species)
					if(SCANGATE_UNATHI)
						scan_species = /datum/species/unathi
					if(SCANGATE_SKRELL)
						scan_species = /datum/species/skrell
					if(SCANGATE_NABBER)
						scan_species = /datum/species/nabber
					if(SCANGATE_ADHERENT)
						scan_species = /datum/species/adherent
					if(SCANGATE_VOX)
						scan_species = /datum/species/vox
					if(SCANGATE_IPC)
						scan_species = /datum/species/machine
					if(SCANGATE_DIONA)
						scan_species = /datum/species/diona
					if(SCANGATE_GOLEM)
						scan_species = /datum/species/golem
					if(SCANGATE_ZOMBIE)
						scan_species = /datum/species/zombie
				if(is_species(H, scan_species, detect_species_strict))
					beep = TRUE
		if(SCANGATE_GUNS)
			for(var/I in M.get_contents())
				if(istype(I, /obj/item/gun))
					beep = TRUE
					break
		if(SCANGATE_NUTRITION)
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				if(H.nutrition <= detect_nutrition && detect_nutrition == 150)
					beep = TRUE
				if(H.nutrition >= detect_nutrition && detect_nutrition == 450)
					beep = TRUE

	if(reverse)
		beep = !beep
	if(beep)
		AlarmBeep()
	else
		SetScanline("scanning", 10)

/obj/machinery/scanner_gate/proc/AlarmBeep()
	if(next_beep <= world.time)
		next_beep = world.time + 20
		playsound(src, 'sound/machines/scanbuzz.ogg', 100, FALSE)
	var/image/I = image(icon, src, "alarm_light", layer+1)
	flick_overlay_view(I, src, 20)
	SetScanline("alarm", 20)

/obj/machinery/scanner_gate/CanUseTopic(mob/user)
	if(locked)
		return FALSE
	return ..()

/obj/machinery/scanner_gate/interface_interact(mob/user)
	if(locked)
		to_chat(user, SPAN_WARNING("\The [src]'s control panel is locked!"))
		return FALSE

	usr.set_machine(src)
	var/dat
	dat += "<b>Current mode:</b> <A href='byond://?src=[REF(src)];set_mode=1'>[scangate_mode]</A><br>"
	switch(scangate_mode)
		if(SCANGATE_SPECIES)
			dat += "Target species: <A href='byond://?src=[REF(src)];set_target_species=1'>[detect_species]</A><br>"
			dat += "<A href='byond://?src=[REF(src)];set_strict_species=1'>[detect_species_strict ? "Ignoring sub-species" : "Scanning sub-species"]</A><br>"
		if(SCANGATE_NUTRITION) // We should make defines for nutrition values one day...
			dat += "Target nutrition: <A href='byond://?src=[REF(src)];set_target_nutrition=1'>[detect_nutrition == 150 ? "Starving" : "Full"]</A><br>"

	dat += "<A href='byond://?src=[REF(src)];toggle_reverse=1'>Reverse mode [reverse ? "enabled" : "disabled"]</A><br>"

	var/datum/browser/popup = new(user, "scan_gate", "Scanner Gate", 300, 400)
	popup.set_content(dat)
	popup.open()
	return TRUE

/obj/machinery/scanner_gate/Topic(href, href_list)
	if(..())
		return TRUE

	usr.set_machine(src)

	if(href_list["set_mode"])
		var/new_mode = input("Select target species") as null|anything in SCANGATE_ALL_MODES
		scangate_mode = new_mode

	if(href_list["toggle_reverse"])
		reverse = !reverse

	if(href_list["set_target_species"])
		var/new_species = input("Select target species") as null|anything in SCANGATE_ALL_SPECIES
		detect_species = new_species

	if(href_list["set_strict_species"])
		detect_species_strict = !detect_species_strict

	if(href_list["set_target_nutrition"])
		var/new_nutrition = alert("Select nutrition mode",, "Starving", "Full")
		if(new_nutrition)
			switch(new_nutrition)
				if("Starving")
					detect_nutrition = 150
				if("Full")
					detect_nutrition = 450

	add_fingerprint(usr)
	updateUsrDialog()
	return TRUE

#undef SCANGATE_NONE
#undef SCANGATE_MINDSHIELD
#undef SCANGATE_GUNS
#undef SCANGATE_WANTED
#undef SCANGATE_SPECIES
#undef SCANGATE_NUTRITION

#undef SCANGATE_ALL_MODES

#undef SCANGATE_HUMAN
#undef SCANGATE_UNATHI
#undef SCANGATE_SKRELL
#undef SCANGATE_NABBER
#undef SCANGATE_ADHERENT
#undef SCANGATE_VOX
#undef SCANGATE_IPC
#undef SCANGATE_DIONA
#undef SCANGATE_GOLEM
#undef SCANGATE_ZOMBIE

#undef SCANGATE_ALL_SPECIES
