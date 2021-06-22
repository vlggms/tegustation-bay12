/**
 *
 *	This file handles custom TGS bot commands.
 *
 */

/// Displays the player count and related information about the round.
/datum/tgs_chat_command/status
	name = "status"
	help_text = "Displays information about the current round."
	admin_only = FALSE

/datum/tgs_chat_command/status/Run(datum/tgs_chat_user/sender, params)
	var/status = "Current Players: [GLOB.clients], Active Players: [GLOB.player_list.len], Gamemode: [SSticker.master_mode]. Station Time: [stationtime2text()]."
	return status
