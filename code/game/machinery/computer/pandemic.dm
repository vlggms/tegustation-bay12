#define MAIN_SCREEN 1
#define SYMPTOM_DETAILS 2

/obj/machinery/computer/pandemic
	name = "PanD.E.M.I.C 2200"
	desc = "Used to work with viruses."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "mixer0"
	machine_name = "PanD.E.M.I.C 2200 console"
	machine_desc = "PanD.E.M.I.C 2200 console is used to display ."

	var/wait
	var/selected_symptom
	var/obj/item/reagent_containers/beaker

/obj/machinery/computer/pandemic/Destroy()
	QDEL_NULL(beaker)
	return ..()

/obj/machinery/computer/pandemic/examine(mob/user)
	. = ..()
	if(beaker)
		var/is_close
		if(Adjacent(user)) // Don't reveal exactly what's inside unless they're close enough to see the UI anyway.
			to_chat(user, "It contains \a [beaker].")
			is_close = TRUE
		else
			to_chat(user, "It has a beaker inside it.")
		to_chat(user, SPAN_INFO("Alt-click to eject [is_close ? beaker : "the beaker"]."))

/obj/machinery/computer/pandemic/AltClick(mob/user)
	. = ..()
	if(Adjacent(user))
		EjectBeaker()

/obj/machinery/computer/pandemic/dismantle()
	EjectBeaker()
	. = ..()

/obj/machinery/computer/pandemic/on_update_icon()
	if(stat & BROKEN)
		icon_state = (beaker ? "mixer1_b" : "mixer0_b")
	else
		icon_state = "mixer[(beaker) ? "1" : "0"][powered() ? "" : "_nopower"]"

/obj/machinery/computer/pandemic/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers) && I.is_open_container())
		. = TRUE //no afterattack
		if(stat & (NOPOWER|BROKEN))
			return
		if(beaker)
			to_chat(user, "<span class='warning'>A container is already loaded into [src]!</span>")
			return
		if(!user.unEquip(I, src))
			return

		beaker = I
		to_chat(user, "<span class='notice'>You insert [I] into [src].</span>")
		update_icon()
	else
		return ..()

/obj/machinery/computer/pandemic/interface_interact(user)
	interact(user)
	return TRUE

/obj/machinery/computer/pandemic/interact(mob/user)
	user.set_machine(src)
	if(!istype(beaker))
		to_chat(user, SPAN_WARNING("\The [src] does not have a beaker installed!"))
		return
	var/datum/reagent/blood/B = locate() in beaker.reagents.reagent_list
	var/dat
	if(B)
		var/list/disease_data = GetVirusesData(B)
		if(LAZYLEN(disease_data))
			for(var/list/D in disease_data)
				dat += "<b>Disease #[D["index"]]: [D["name"]]</b><br>"
				dat += "[D["desc"]]"
				dat += "Spread: [D["spread"]]<br>"
				dat += "Cure: [D["cure"]]<br>"
				dat += "<hr>"
				if(D["is_adv"])
					dat += "Symptoms:<br>"
					for(var/list/S in D["symptoms"])
						if(S["name"] == selected_symptom)
							dat += "<b>[S["name"]][S["neutered"] ? " (NEUTERED)" : ""]</b><br>"
							dat += "[S["desc"]]<br>"
							dat += "- Level: [S["level"]]<br>"
							dat += "- Stealth: [S["stealth"]]<br>"
							dat += "- Resistance: [S["resistance"]]<br>"
							dat += "- Stage Speed: [S["stage_speed"]]<br>"
							dat += "- Transmission: [S["transmission"]]<br>"
							if(LAZYLEN(S["threshold_desc"]))
								dat += "Thresholds:<br>"
								for(var/threshold in S["threshold_desc"])
									dat += "[threshold] - [S["threshold_desc"][threshold]]<br>"

						dat += "<A href='byond://?src=[REF(src)];choose_symptom=[S["name"]]'>[S["name"]]</a>[S["neutered"] ? " (NEUTERED)" : ""]<br>"
		else
			dat += "<span style='color: #FF7777>\The [src] cannot detect any visible diseases.</span>"
	else
		dat += "<span style='color: #FF0000>The beaker does not contain blood!</span>"
	var/datum/browser/popup = new(user, "pandemic_computer", "Pan.D.E.M.I.C. 2200 console", 400, 600)
	popup.set_content(dat)
	popup.open()
	onclose(user, "pandemic_computer")
	return

/obj/machinery/computer/pandemic/OnTopic(href, href_list)
	if(href_list["choose_symptom"])
		selected_symptom = href_list["choose_symptom"]
		updateDialog()
		return TOPIC_HANDLED

/obj/machinery/computer/pandemic/proc/GetByIndex(thing, index)
	if(!beaker || !beaker.reagents)
		return
	var/datum/reagent/blood/B = locate() in beaker.reagents.reagent_list
	if(B?.data[thing])
		return B.data[thing][index]

/obj/machinery/computer/pandemic/proc/GetVirusIdByIndex(index)
	var/datum/disease/D = GetByIndex("viruses", index)
	if(D)
		return D.GetDiseaseID()

/obj/machinery/computer/pandemic/proc/GetVirusesData(datum/reagent/blood/B)
	. = list()
	var/list/V = B.GetDiseases()
	var/index = 1
	for(var/virus in V)
		var/datum/disease/D = virus
		if(!istype(D) || D.visibility_flags & HIDDEN_PANDEMIC)
			continue

		var/list/this = list()
		this["name"] = D.name
		if(istype(D, /datum/disease/advance))
			var/datum/disease/advance/A = D
			var/disease_name = SSdisease.get_disease_name(A.GetDiseaseID())
			this["can_rename"] = ((disease_name == "Unknown") && A.mutable)
			this["name"] = disease_name
			this["is_adv"] = TRUE
			this["symptoms"] = list()
			for(var/symptom in A.symptoms)
				var/datum/symptom/S = symptom
				var/list/this_symptom = list()
				this_symptom = GetSymptomData(S)
				this["symptoms"] += list(this_symptom)
			this["resistance"] = A.TotalResistance()
			this["stealth"] = A.TotalStealth()
			this["stage_speed"] = A.TotalStageSpeed()
			this["transmission"] = A.TotalTransmittable()
		this["index"] = index++
		this["agent"] = D.agent
		this["description"] = D.desc || "none"
		this["spread"] = D.spread_text || "none"
		this["cure"] = D.cure_text || "none"

		. += list(this)

/obj/machinery/computer/pandemic/proc/GetSymptomData(datum/symptom/S)
	. = list()
	var/list/this = list()
	this["name"] = S.name
	this["desc"] = S.desc
	this["stealth"] = S.stealth
	this["resistance"] = S.resistance
	this["stage_speed"] = S.stage_speed
	this["transmission"] = S.transmittable
	this["level"] = S.level
	this["neutered"] = S.neutered
	this["threshold_desc"] = S.threshold_descs
	. += this

/obj/machinery/computer/pandemic/proc/GetResistanceData(datum/reagent/blood/B)
	. = list()
	if(!islist(B.data["resistances"]))
		return
	var/list/resistances = B.data["resistances"]
	for(var/id in resistances)
		var/list/this = list()
		var/datum/disease/D = SSdisease.archive_diseases[id]
		if(D)
			this["id"] = id
			this["name"] = D.name

		. += list(this)

/obj/machinery/computer/pandemic/proc/ResetReplicatorCooldown()
	wait = FALSE
	update_icon()
	playsound(src, 'sound/machines/ping.ogg', 30, TRUE)

/obj/machinery/computer/pandemic/proc/EjectBeaker()
	if(beaker)
		if(!usr.put_in_any_hand_if_possible(beaker))
			beaker.dropInto(get_turf(src))
		beaker = null
		update_icon()
