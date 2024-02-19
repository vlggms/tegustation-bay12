/**
 *
 *	This file handles custom TGS bot commands.
 *
 */

/// Displays the player count and related information about the round.
/datum/tgs_chat_command/check
	name = "check"
	help_text = "Displays information about the current round."
	admin_only = FALSE

/datum/tgs_chat_command/check/Run(datum/tgs_chat_user/sender, params)
	var/active_players = GLOB.clients.len
	for(var/client/C in GLOB.clients)
		if(C.is_afk())
			active_players -= 1
	var/check = "Current Players: [GLOB.clients.len], Active Players: [active_players]. "
	check += "\nGamemode: [SSticker.master_mode], Round Time: [roundduration2text()]."
	var/decl/security_state/sec_state = decls_repository.get_decl(GLOB.using_map.security_state)
	if(istype(sec_state))
		var/decl/security_level/sec_level = sec_state.current_security_level
		check += "\nCurrent Security Level: [capitalize(sec_level.name)]."
	if(evacuation_controller.has_evacuated())
		check += "\n\The [station_name()] has been evacuated!"
	else if(evacuation_controller.is_evacuating())
		if(evacuation_controller.emergency_evacuation)
			check += "\n\The [station_name()] is undergoing emergency evacuation!"
		else
			check += "\n\The [station_name()] is undergoing crew transfer!"
	return check

/// Displays player count, REAL gamemode and ckeys of admins online.
/datum/tgs_chat_command/status
	name = "status"
	help_text = "Displays extensive information about the current round, including actual gamemode and admins online."
	admin_only = TRUE

/datum/tgs_chat_command/status/Run(datum/tgs_chat_user/sender, params)
	var/active_players = GLOB.clients.len
	for(var/client/C in GLOB.clients)
		if(C.is_afk())
			active_players -= 1
	var/status = "Current Players: [GLOB.clients.len], Active Players: [active_players]."
	var/adminwho
	for(var/client/C in GLOB.admins) // Copy-paste from functions.dm
		if(!adminwho)
			adminwho = "[C]"
		else
			adminwho += ", [C]"

		if(C.is_afk())
			adminwho += "(AFK - [C.inactivity2text()])"
	if(!adminwho) //If empty
		adminwho = "None"
	status += "\nAdmins Online: [adminwho]."
	var/gamemode
	if(!SSticker.mode) // That'd mean round didn't start yet, usually.
		gamemode = "[SSticker.master_mode] (Lobby)"
	else
		gamemode = SSticker.mode.name
	status += "\nGamemode: [gamemode]. Round Time: [roundduration2text()]."
	var/decl/security_state/sec_state = decls_repository.get_decl(GLOB.using_map.security_state)
	if(istype(sec_state))
		var/decl/security_level/sec_level = sec_state.current_security_level
		status += "\nCurrent Security Level: [capitalize(sec_level.name)]."
	if(evacuation_controller.has_evacuated())
		status += "\n\The [station_name()] has been evacuated!"
	else if(evacuation_controller.is_evacuating())
		if(evacuation_controller.emergency_evacuation)
			status += "\n\The [station_name()] is undergoing emergency evacuation!"
		else
			status += "\n\The [station_name()] is undergoing crew transfer!"
	return status

/// Displays the crew manifest in text form.
/datum/tgs_chat_command/manifest
	name = "manifest"
	help_text = "Displays crew manifest."
	admin_only = FALSE

/datum/tgs_chat_command/manifest/Run(datum/tgs_chat_user/sender, params)
	var/list/manifest_data = list()
	for(var/datum/computer_file/report/crew_record/CR in GLOB.all_crew_records)
		var/name = CR.get_formal_name()
		var/rank = CR.get_job()
		var/datum/job/job = SSjobs.get_by_title(rank)
		if(job && job.department)
			if(!manifest_data[job.department])
				manifest_data[job.department] = list()
			manifest_data[job.department] += "[rank] [name]"
		else
			if(!manifest_data["Unknown"])
				manifest_data["Unknown"] = list()
			manifest_data["Unknown"] += "[rank] [name]"

	var/manifest
	if(LAZYLEN(manifest_data))
		manifest = "__**Crew Manifest:**__"
		for(var/dept in manifest_data)
			manifest += "\n**[dept]:** [english_list(manifest_data[dept])]."
	else
		manifest = "Crew Manifest is empty!"
	return manifest

