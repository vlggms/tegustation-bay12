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
	var/check = "Current Players: [GLOB.clients.len], Active Players: [GLOB.player_list.len]. "
	check += "\nGamemode: [SSticker.master_mode], Round Time: [roundduration2text()]."
	return check

/// Displays player count, REAL gamemode and ckeys of admins online.
/datum/tgs_chat_command/status
	name = "status"
	help_text = "Displays extensive information about the current round, including actual gamemode and admins online."
	admin_only = TRUE

/datum/tgs_chat_command/status/Run(datum/tgs_chat_user/sender, params)
	var/status = "Current Players: [GLOB.clients.len], Active Players: [GLOB.player_list.len]."
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
	return status
