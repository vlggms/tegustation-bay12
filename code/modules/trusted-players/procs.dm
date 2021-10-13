/proc/load_trusted_players()
	var/list/trusted_list = file_to_list("config/trusted_players.txt")
	if(trusted_list)
		GLOB.trusted_players = trusted_list
