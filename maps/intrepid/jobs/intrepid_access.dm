/************
* TGLV Intrepid *
************/

// Marine access

/var/const/access_marine = "ACCESS_INTREPID_MARINE"
/datum/access/marine
	id = access_marine
	desc = "Marine"
	region = ACCESS_REGION_MILITARY

/var/const/access_squad_leader = "ACCESS_INTREPID_SQUAD_LEADER"
/datum/access/squad_leader
	id = access_squad_leader
	desc = "Squad Leader"
	region = ACCESS_REGION_MILITARY

/var/const/access_combat_medic = "ACCESS_INTREPID_COMBAT_MEDIC"
/datum/access/combat_medic
	id = access_combat_medic
	desc = "Combat Medic"
	region = ACCESS_REGION_MILITARY

/var/const/access_combat_engineer = "ACCESS_INTREPID_COMBAT_ENGINEER"
/datum/access/combat_engineer
	id = access_combat_engineer
	desc = "Combat Engineer"
	region = ACCESS_REGION_MILITARY

/var/const/access_hangar = "ACCESS_INTREPID_HANGAR"
/datum/access/hangar
	id = access_hangar
	desc = "Pandora Hangar Deck"
	region = ACCESS_REGION_MILITARY

/var/const/access_expedition_shuttle_helm = "ACCESS_EXPLO_HELM"
/datum/access/exploration_shuttle_helm
	id = access_expedition_shuttle_helm
	desc = "Pandora Helm"
	region = ACCESS_REGION_MILITARY

// Other

/var/const/access_terragov_crew = "ACCESS_TERRAGOV_CREW" //80
/datum/access/terragov_crew
	id = access_terragov_crew
	desc = "TerraGov Crew"
	region = ACCESS_REGION_GENERAL

/var/const/access_emergency_armory = "ACCESS_INTREPID_ARMORY" //83
/datum/access/emergency_armory
	id = access_emergency_armory
	desc = "Emergency Armory"
	region = ACCESS_REGION_COMMAND

/var/const/access_representative = "ACCESS_INTREPID_REPRESENTATIVE" //85
/datum/access/representative
	id = access_representative
	desc = "TerraGov Senator"
	region = ACCESS_REGION_COMMAND
	access_type = ACCESS_TYPE_NONE //Ruler of their own domain, CO cannot enter

/var/const/access_gun = "ACCESS_INTREPID_CANNON" //87
/datum/access/gun
	id = access_gun
	desc = "Gunnery"
	region = ACCESS_REGION_COMMAND

/var/const/access_seneng = "ACCESS_INTREPID_SENIOR_ENG" //90
/datum/access/seneng
	id = access_seneng
	desc = "Senior Engineer"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_senmed = "ACCESS_INTREPID_SENIOR_MED" //91
/datum/access/senmed
	id = access_senmed
	desc = "Physician"
	region = ACCESS_REGION_MEDBAY

/var/const/access_commissary = "ACCESS_INTREPID_SHOP" //98
/datum/access/commissary
	id = access_commissary
	desc = "Commissary"
	region = ACCESS_REGION_GENERAL

/datum/access/psychiatrist
	desc = "Mental Health"

/datum/access/hos
	desc = "Chief of Security"

/datum/access/hop
	desc = "Executive Officer"

/datum/access/qm
	desc = "Deck Chief"

/var/const/access_terra_fax = "ACCESS_INTREPID_FAX"
/datum/access/terra_fax
	id = access_terra_fax
	desc = "Fax Machines"
	region = ACCESS_REGION_COMMAND

/datum/access/robotics
	region = ACCESS_REGION_ENGINEERING

/datum/access/network
	region = ACCESS_REGION_COMMAND

/datum/access/chapel_office
	region = ACCESS_REGION_SERVICE

/datum/access/bar
	region = ACCESS_REGION_SERVICE

/datum/access/kitchen
	region = ACCESS_REGION_SERVICE

/datum/access/eva
	region = ACCESS_REGION_GENERAL

/datum/access/crematorium
	region = ACCESS_REGION_MEDBAY

/datum/access/janitor
	region = ACCESS_REGION_SERVICE

/datum/access/ai_upload
	desc = "Cyborg Upload"

/*************
* NRV Petrov *
*************/
/var/const/access_stardust = "ACCESS_INTREPID_STARDUST" //200
/datum/access/stardust
	id = access_stardust
	desc = "Stardust"
	region = ACCESS_REGION_GENERAL

/var/const/access_stardust_helm = "ACCESS_INTREPID_STARDUST_HELM" //201
/datum/access/stardust_helm
	id = access_stardust_helm
	desc = "Stardust Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_intrepid_helm = "ACCESS_INTREPID_HELM"
/datum/access/intrepid_helm
	id = access_intrepid_helm
	desc = "Intrepid Helm"
	region = ACCESS_REGION_COMMAND

// Intrepid Radio Access

/var/const/access_radio_comm = "ACCESS_RADIO_COMM"
/datum/access/access_radio_comm
	id = access_radio_comm
	desc = "Command Radio"
	region = ACCESS_REGION_COMMAND

/var/const/access_radio_eng = "ACCESS_RADIO_ENG"
/datum/access/access_radio_eng
	id = access_radio_eng
	desc = "Engineering Radio"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_radio_med = "ACCESS_RADIO_MED"
/datum/access/access_radio_med
	id = access_radio_med
	desc = "Medical Radio"
	region = ACCESS_REGION_MEDBAY

/var/const/access_radio_sec = "ACCESS_RADIO_SEC"
/datum/access/access_radio_sec
	id = access_radio_sec
	desc = "Security Radio"
	region = ACCESS_REGION_SECURITY

/var/const/access_radio_sci = "ACCESS_RADIO_SCI"
/datum/access/access_radio_sic
	id = access_radio_sci
	desc = "Science Radio"
	region = ACCESS_REGION_RESEARCH

/var/const/access_radio_sup = "ACCESS_RADIO_SUP"
/datum/access/access_radio_sup
	id = access_radio_sup
	desc = "Supply Radio"
	region = ACCESS_REGION_SUPPLY

/var/const/access_radio_serv = "ACCESS_RADIO_SERV"
/datum/access/access_radio_serv
	id = access_radio_serv
	desc = "Service Radio"
	region = ACCESS_REGION_SERVICE

/var/const/access_radio_exp = "ACCESS_RADIO_EXP"
/datum/access/access_radio_exp
	id = access_radio_exp
	desc = "Exploration Radio"
	region = ACCESS_REGION_MILITARY
