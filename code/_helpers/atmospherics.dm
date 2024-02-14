/obj/proc/analyze_gases(var/obj/A, var/mob/user, mode)
	user.visible_message("<span class='notice'>\The [user] has used \an [src] on \the [A].</span>")
	A.add_fingerprint(user)

	var/air_contents = A.return_air()
	if(!air_contents)
		to_chat(user, "<span class='warning'>Your [src] flashes a red light as it fails to analyze \the [A].</span>")
		return 0

	var/list/result = atmosanalyzer_scan(A, air_contents, mode)
	print_atmos_analysis(user, result)
	return 1

/proc/print_atmos_analysis(user, var/list/result)
	for(var/line in result)
		to_chat(user, "<span class='notice'>[line]</span>")

/proc/GetGasDatum(gas_id)
	if(!(gas_id in gas_data.gases))
		return null
	var/list/all_gases = decls_repository.get_decls_of_subtype(/decl/xgm_gas)
	for(var/decl/xgm_gas/gas in all_gases)
		if(gas_id != gas.id)
			continue
		return gas
	return null
