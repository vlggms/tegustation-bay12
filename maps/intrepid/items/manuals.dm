/obj/item/folder/envelope/consul_orders
	desc = "A thick envelope. The TerraGov crest is stamped in the corner, along with 'TOP SECRET - MILITARY CONSUL OFFICE' mark."

/obj/item/folder/envelope/consul_orders/Initialize()
	. = ..()
	var/paper_type = pick(subtypesof(/obj/item/paper/consul_orders))
	new paper_type(src)

/obj/item/paper/consul_orders/Initialize()
	. = ..()
	name = "\The [GLOB.using_map.station_name] mission"
	info = {"
	<tt><center><b><font color='red'>TOP SECRET - \The [GLOB.using_map.station_name]</font></b>
	<h3>TERRAN GOVERNMENT MILITARY HIGH COMMAND</h3>
	<img src = terralogo.png>
	</center>
	<b>FROM:</b> Military Consul Elliot Neville<br>
	<b>TO:</b> Commanding Officer of [GLOB.using_map.station_name]<br>
	<b>SUBJECT:</b> Standing Orders<br>
	<hr>
	Good day Officer. This document is an addendum to your magistrate appointment.<br>
	"}

#define DEFAULT_CONSUL_ORDERS_END {"<br>\
	In addition to priority orders, your mission remains the same as is outlined by magistrate appointment:<br>\
	<li>Ensure total security of the border zone: Eliminate any alien threats and arrest hostile humans, if possible</li>\
	<li>Rescue stranded or independent-aligned humans that are willing to cooperate, capture & arrest the rest</li>\
	<li>Lay and enforce claims to uninhabited exoplanets, colonize worlds that are suitable for human habitation</li>\
	<li>Maintain crew cohesion and weed out dissidents</li>\
	<br>\
	Priority targets that may be located in this sector include technology and equipment that was utilized by \
	Terran Dominion. Any such findings should be reported to the High Command immediately.<br>\
	Keep in mind that you are most likely the only vessel assigned to this sector: In case of distress calls \
	you are expected to investigate and assist the source of the signal.<br>\
	In case of hostile encounters do not hesitate to retaliate, but remember that safety of the human crew comes first.<br>\
	<br>\
	<i>This paper has been stamped with the stamp of Terran Government Military Consul's Office.</i>\
	"}

/obj/item/paper/consul_orders/exploration_focus/Initialize()
	. = ..()
	info += {"
	Following recent events in the [GLOB.using_map.system_name]'s vicinity your priority orders will be the following:<br>
	<li>Salvage technology and resources from abandoned or independent structures</li>
	<li>Scan and categorize the flora and fauna found on the planets and moons in your system</li>
	<li>If possible, reclaim any abandoned space vessels</li>
	"}
	info += DEFAULT_CONSUL_ORDERS_END

#undef DEFAULT_CONSUL_ORDERS_END
