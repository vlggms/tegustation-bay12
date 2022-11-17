#define ALIEN_ID_COLOR "#e3d8d3"

/obj/item/card/id/intrepid
	name = "identification card"
	desc = "An identification card issued to personnel aboard the TGLV Ion."
	color = "#d3e3e1"
	job_access_type = DEFAULT_JOB_TYPE

/obj/item/card/id/intrepid/silver
	desc = "A silver identification card belonging to heads of staff."
	item_state = "silver_id"
	job_access_type = /datum/job/hop
	extra_details = list("goldstripe")
	color = "#ccecff"

/obj/item/card/id/intrepid/gold
	desc = "A golden identification card belonging to the Commanding Officer."
	item_state = "gold_id"
	job_access_type = /datum/job/captain
	color = "#d4c780"
	extra_details = list("goldstripe")

// Passenger
/obj/item/card/id/intrepid/passenger
	desc = "A card issued to passengers aboard the TGLV Ion."
	job_access_type = DEFAULT_JOB_TYPE
	detail_color = COLOR_PAKISTAN_GREEN

/obj/item/card/id/intrepid/passenger/research
	desc = "A card issued to civilian personnel aboard the TGLV Ion."
	job_access_type = /datum/job/scientist_assistant
	detail_color = COLOR_BOTTLE_GREEN

/obj/item/card/id/intrepid/passenger/research/scientist
	job_access_type = /datum/job/scientist

//Merchant
/obj/item/card/id/intrepid/merchant
	desc = "An identification card issued to Merchants, indicating their right to sell and buy goods."
	job_access_type = /datum/job/merchant
	color = COLOR_OFF_WHITE
	detail_color = COLOR_BEIGE

// TerraGov Crew
/obj/item/card/id/intrepid/crew
	desc = "An identification card issued to TerraGov crewmembers aboard the TGLV Ion."
	job_access_type = /datum/job/crew

/obj/item/card/id/intrepid/crew/alien
	desc = "An identification card issued to the aliens that work within TerraGov."
	color = ALIEN_ID_COLOR

/obj/item/card/id/intrepid/crew/service //unused
	job_access_type = DEFAULT_JOB_TYPE
	detail_color = COLOR_CIVIE_GREEN

/obj/item/card/id/intrepid/crew/service/janitor
	job_access_type = /datum/job/janitor

/obj/item/card/id/intrepid/crew/service/janitor/alien
	desc = "An identification card issued to the aliens that work within TerraGov."
	color = ALIEN_ID_COLOR

/obj/item/card/id/intrepid/crew/service/chef
	job_access_type = /datum/job/chef

/obj/item/card/id/intrepid/crew/service/chef/alien
	desc = "An identification card issued to the aliens that work within TerraGov."
	color = ALIEN_ID_COLOR

// Security
/obj/item/card/id/intrepid/silver/security
	job_access_type = /datum/job/hos
	detail_color = "#e00000"

/obj/item/card/id/intrepid/crew/security
	job_access_type = /datum/job/officer
	detail_color = "#e00000"

/obj/item/card/id/intrepid/crew/security/brigchief
	job_access_type = /datum/job/warden
	extra_details = list("onegoldstripe")

/obj/item/card/id/intrepid/crew/security/forensic
	job_access_type = /datum/job/detective

// Command
/obj/item/card/id/intrepid/crew/representative
	job_access_type = /datum/job/representative
	detail_color = COLOR_COMMAND_BLUE

/obj/item/card/id/intrepid/crew/bridgeofficer
	job_access_type = /datum/job/bridgeofficer
	detail_color = COLOR_COMMAND_BLUE

/obj/item/card/id/intrepid/crew/psiadvisor
	job_access_type = /datum/job/psiadvisor
	detail_color = COLOR_COMMAND_BLUE

// Medical
/obj/item/card/id/intrepid/silver/medical
	job_access_type = /datum/job/cmo
	detail_color = COLOR_PALE_BLUE_GRAY

/obj/item/card/id/intrepid/crew/medical
	job_access_type = /datum/job/doctor
	detail_color = COLOR_PALE_BLUE_GRAY

/obj/item/card/id/intrepid/crew/medical/senior
	job_access_type = /datum/job/senior_doctor

/obj/item/card/id/intrepid/contractor/medical
	job_access_type = /datum/job/doctor
	detail_color = COLOR_PALE_BLUE_GRAY

/obj/item/card/id/intrepid/contractor/medical/senior
	job_access_type = /datum/job/senior_doctor

/obj/item/card/id/intrepid/contractor/chemist
	job_access_type = /datum/job/chemist
	detail_color = COLOR_PALE_BLUE_GRAY

/obj/item/card/id/intrepid/contractor/chemist/alien
	desc = "An identification card issued to the aliens that work within TerraGov."
	color = ALIEN_ID_COLOR

/obj/item/card/id/intrepid/contractor/medical/counselor
	job_access_type = /datum/job/psychiatrist

// Engineering
/obj/item/card/id/intrepid/silver/engineering
	job_access_type = /datum/job/chief_engineer
	detail_color = COLOR_SUN

/obj/item/card/id/intrepid/crew/engineering
	job_access_type = /datum/job/engineer
	detail_color = COLOR_SUN

/obj/item/card/id/intrepid/crew/engineering/alien
	desc = "An identification card issued to the aliens that work within TerraGov."
	color = ALIEN_ID_COLOR

/obj/item/card/id/intrepid/crew/engineering/senior
	job_access_type = /datum/job/senior_engineer
	extra_details = list("onegoldstripe")

/obj/item/card/id/intrepid/contractor/engineering
	job_access_type = /datum/job/engineer
	detail_color = COLOR_SUN

/obj/item/card/id/intrepid/contractor/engineering/roboticist
	job_access_type = /datum/job/roboticist

/obj/item/card/id/intrepid/contractor/engineering/roboticist/alien
	desc = "An identification card issued to the aliens that work within TerraGov."
	color = ALIEN_ID_COLOR

// Supply
/obj/item/card/id/intrepid/crew/supply
	job_access_type = /datum/job/cargo_tech
	detail_color = COLOR_BROWN

/obj/item/card/id/intrepid/crew/supply/alien
	desc = "An identification card issued to the aliens that work within TerraGov."
	color = ALIEN_ID_COLOR

/obj/item/card/id/intrepid/crew/supply/deckofficer
	job_access_type = /datum/job/qm
	detail_color = COLOR_BROWN
	extra_details = list("onegoldstripe")

/obj/item/card/id/intrepid/crew/supply/mining
	job_access_type = /datum/job/mining
	detail_color = COLOR_RESEARCH

/obj/item/card/id/intrepid/crew/supply/mining/alien
	desc = "An identification card issued to the aliens that work within TerraGov."
	color = ALIEN_ID_COLOR

// Research
/obj/item/card/id/intrepid/silver/research
	job_access_type = /datum/job/rd
	detail_color = COLOR_RESEARCH
	color = COLOR_WHITE

/obj/item/card/id/intrepid/crew/research
	desc = "A card issued to science personnel aboard the TGLV Intrepid."
	job_access_type = /datum/job/scientist_assistant
	detail_color = COLOR_RESEARCH

/obj/item/card/id/intrepid/crew/research/senior_scientist
	job_access_type = /datum/job/senior_scientist
	extra_details = list("onegoldstripe")

/obj/item/card/id/intrepid/crew/research/scientist
	job_access_type = /datum/job/scientist

// Marine Corps
/obj/item/card/id/intrepid/crew/squad_leader
	job_access_type = /datum/job/squad_leader
	detail_color = COLOR_RED
	extra_details = list("onegoldstripe")

/obj/item/card/id/intrepid/crew/combat_medic
	job_access_type = /datum/job/marine_medic
	detail_color = COLOR_RED
	extra_details = list("onebluestripe")

/obj/item/card/id/intrepid/crew/combat_engineer
	job_access_type = /datum/job/marine_engineer
	detail_color = COLOR_RED
	extra_details = list("oneorangestripe")

/obj/item/card/id/intrepid/crew/marine
	job_access_type = /datum/job/marine
	detail_color = COLOR_RED

#undef ALIEN_ID_COLOR
