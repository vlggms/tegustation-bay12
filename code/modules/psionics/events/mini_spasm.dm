/datum/event/minispasm
	startWhen = 60
	endWhen = 90
	var/static/list/psi_operancy_messages = list(
		"There's something in your skull!",
		"Something is eating your thoughts!",
		"You can feel your brain being rewritten!",
		"Something is crawling over your frontal lobe!",
		"<b>THE SIGNAL THE SIGNAL THE SIGNAL THE SIGNAL THE...</b>"
		)

/datum/event/minispasm/announce()
	priority_announcement.Announce( \
		"PRIORITY ALERT: SIGMA-[rand(50,80)] PSIONIC SIGNAL LOCAL TRAMISSION DETECTED (97% MATCH, NONVARIANT) \
		(SIGNAL SOURCE TRIANGULATED ADJACENT LOCAL SITE): All personnel are advised to avoid \
		exposure to active audio transmission equipment including radio headsets and intercoms \
		for the duration of the signal broadcast.",
		"[GLOB.using_map.psionic_short] Sensor Array Automated Message",
		zlevels = affecting_z,
		)

/datum/event/minispasm/start()
	for(var/obj/item/device/radio/radio in GLOB.listening_objects)
		if(!(radio.z in affecting_z))
			continue
		if(radio.on)
			for(var/mob/living/victim in range(radio.canhear_range, radio.loc))
				if(victim.stat == CONSCIOUS && !victim.ear_deaf)
					do_spasm(victim, radio)

/datum/event/minispasm/get_skybox_image()
	var/image/res = overlay_image('icons/skybox/electrobox.dmi', "lightning", COLOR_PURPLE, RESET_COLOR)
	res.blend_mode = BLEND_ADD
	return res

/datum/event/minispasm/end()
	priority_announcement.Announce( \
		"PRIORITY ALERT: SIGNAL BROADCAST HAS CEASED. Personnel are cleared to resume use of non-hardened radio transmission equipment. Have a nice day.",
		"[GLOB.using_map.psionic_short] Sensor Array Automated Message",
		zlevels = affecting_z,
		)

/datum/event/minispasm/proc/do_spasm(mob/living/victim, obj/item/device/radio/source)
	if(victim.psi)
		if(victim.psi.suppressed)
			return
		to_chat(victim, SPAN_DANGER("A hauntingly familiar sound hisses from [icon2html(source, victim)] \the [source], and your vision flickers!"))
		victim.psi.backblast(rand(5,15))
		victim.Paralyse(5)
		victim.make_jittery(100)
		return

	to_chat(victim, SPAN_DANGER("An indescribable, brain-tearing sound hisses from [icon2html(source, victim)] \the [source], and you collapse in a seizure!"))
	victim.seizure()
	var/new_latency = pick(PSI_COERCION, PSI_REDACTION, PSI_ENERGISTICS, PSI_PSYCHOKINESIS)
	to_chat(victim, SPAN_USERDANGER("[pick(psi_operancy_messages)]"))
	victim.adjustBrainLoss(rand(10,20))
	victim.set_psi_rank(new_latency)
	victim.psi.update()

	if(prob(33))
		addtimer(CALLBACK(victim.psi, /datum/psi_complexus/proc/check_latency_trigger, 100, "a psionic scream", TRUE), rand(5 SECONDS, 30 SECONDS))
