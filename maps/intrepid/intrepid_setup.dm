/datum/map/intrepid/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/intrepid/get_map_info()
	. = list()
	. +=  "You're aboard the " + replacetext("<b>[station_name]</b>", "\improper", "") + ", a starship that belongs to the exploration division of Terran Government. Its primary mission is exploration and potential colonization of unconquered space."
	. +=  "The vessel is primarily staffed with human TerraGov personnel and lower-ranking alien workers."
	. +=  "This area of space is contested by SCG, but they do not pose any threat as of now. You might encounter remote outposts and other fleets."
	return jointext(., "<br>")

/datum/map/intrepid/send_welcome()
	var/obj/effect/overmap/visitable/ship/intrepid = SSshuttle.ship_by_type(/obj/effect/overmap/visitable/ship/intrepid)

	var/welcome_text = "<center><img src = sollogo.png /><br /><font size = 3><b>[station_short]</b> Sensor Readings:</font><br>"
	welcome_text += "Report generated on [stationdate2text()] at [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Current system:<br /><b>[intrepid ? system_name : "Unknown"]</b><br /><br>"

	if (intrepid) //If the overmap is disabled, it's possible for there to be no ship.
		var/list/space_things = list()
		welcome_text += "Current Coordinates:<br /><b>[intrepid.x]:[intrepid.y]</b><br /><br>"
		welcome_text += "Next system targeted for jump:<br /><b>[generate_system_name()]</b><br /><br>"
		welcome_text += "Travel time to Terra:<br /><b>[rand(7,18)] days</b><br /><br>"
		welcome_text += "Time since last port visit:<br /><b>[rand(20,60)] days</b><br /><hr>"
		welcome_text += "Scan results show the following points of interest:<br />"

		for(var/zlevel in map_sectors)
			var/obj/effect/overmap/visitable/O = map_sectors[zlevel]
			if(O.name == intrepid.name)
				continue
			if(istype(O, /obj/effect/overmap/visitable/ship/landable)) //Don't show shuttles
				continue
			if (O.hide_from_reports)
				continue
			space_things |= O

		var/list/distress_calls
		for(var/obj/effect/overmap/visitable/O in space_things)
			var/location_desc = " at present co-ordinates."
			if(O.loc != intrepid.loc)
				var/bearing = round(90 - Atan2(O.x - intrepid.x, O.y - intrepid.y),5) //fucking triangles how do they work
				if(bearing < 0)
					bearing += 360
				location_desc = ", bearing [bearing]."
			if(O.has_distress_beacon)
				LAZYADD(distress_calls, "[O.has_distress_beacon][location_desc]")
			welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

		if(LAZYLEN(distress_calls))
			welcome_text += "<br><b>Distress calls logged:</b><br>[jointext(distress_calls, "<br>")]<br>"
		else
			welcome_text += "<br>No distress calls logged.<br />"

		if(SSstation.station_traits.len)
			welcome_text += "<hr><b>Identified shift divergencies:</b><BR>"
			for(var/i in SSstation.station_traits)
				var/datum/station_trait/station_trait_iterator = i
				if(!station_trait_iterator.show_in_report)
					return
				welcome_text += "[station_trait_iterator.get_report()]<BR>"

		welcome_text += "<hr>"

	post_comm_message("[station_short] Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
