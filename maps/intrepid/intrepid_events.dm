#define ASSIGNMENT_ENGINEER "Engineer"
#define ASSIGNMENT_SUPPLY "Supply"
#define ASSIGNMENT_SECURITY "Security"

/datum/map/intrepid/setup_events()
	map_event_container = list(
				num2text(EVENT_LEVEL_MODERATE)	= new/datum/event_container/moderate/intrepid,
				num2text(EVENT_LEVEL_MAJOR) 	= new/datum/event_container/major/intrepid
			)

/datum/event/prison_break/stardust
	eventDept = "Science"
	areaName = list("SRV Stardust")
	areaType = list(/area/shuttle/research)
	areaNotType = list()

/datum/event/prison_break/cargo
	eventDept = "Supply"
	areaName = list("Cargo Bay")
	areaType = list(/area/intrepid/department/cargo/cargobay)
	areaNotType = list()

/datum/event/prison_break/hardstorage
	eventDept = "Engineering"
	areaName = list("Engine Room")
	areaType = list(/area/intrepid/department/engineering/engine_room)

/datum/event/prison_break/armory
	eventDept = "Security"
	areaName = list("Armory", "Security Wing")
	areaType = list(/area/intrepid/department/security/armory, /area/intrepid/department/security/wing)
	areaNotType = list()

/datum/event/prison_break/eva
	eventDept = "Command"
	areaName = list("EVA Storage")
	areaType = list(/area/eva)
	areaNotType = list()

/datum/event_container/moderate/intrepid
	available_events = list(
		new/datum/event_meta(EVENT_LEVEL_MODERATE, "Stardust Breach",					/datum/event/prison_break/stardust,		0,		list(ASSIGNMENT_SCIENCE = 100)),
		new/datum/event_meta(EVENT_LEVEL_MODERATE, "Cargo Breach",						/datum/event/prison_break/cargo,		0,		list(ASSIGNMENT_SUPPLY = 100)),
		new/datum/event_meta(EVENT_LEVEL_MODERATE, "Engine Room Breach",				/datum/event/prison_break/hardstorage,	0,		list(ASSIGNMENT_ENGINEER = 100)),
		new/datum/event_meta(EVENT_LEVEL_MODERATE, "Armory Breach",						/datum/event/prison_break/armory,		0,		list(ASSIGNMENT_SECURITY = 100)),
		new/datum/event_meta(EVENT_LEVEL_MODERATE, "EVA Storage Breach",				/datum/event/prison_break/eva,			0,		list(ASSIGNMENT_ANY = 5))
		)

/datum/event/prison_break/station
	eventDept = "Local"
	areaName = list("Armory", "Security Wing", "Engine Room", "SRV Stardust")
	areaType = list(
		/area/intrepid/department/security/armory, /area/intrepid/department/security/wing,
		/area/intrepid/department/engineering/engine_room,
		/area/shuttle/research
		)
	areaNotType = list()

/datum/event_container/major/intrepid
	available_events = list(
		new/datum/event_meta(EVENT_LEVEL_MAJOR, "Containment Breach",				/datum/event/prison_break/station,	0,	list(ASSIGNMENT_ANY = 5))
		)

// Blob
/datum/event/blob
	allowed_areas = list(/area/intrepid/misc/maint, /area/intrepid/department/civillian/janitor)

#undef ASSIGNMENT_ENGINEER
#undef ASSIGNMENT_SUPPLY
#undef ASSIGNMENT_SECURITY
