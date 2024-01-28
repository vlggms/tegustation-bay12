/datum/map/intrepid
	maintenance_area = /area/intrepid/misc/maint

	base_floor_type = /turf/simulated/floor/reinforced/airless
	base_floor_area = /area/space

	post_round_safe_areas = list (
		/area/centcom,
		/area/shuttle/escape/centcom,
		/area/shuttle/transport1/centcom,
		/area/shuttle/specops/centcom,
		/area/shuttle/escape_pod1,
		/area/shuttle/escape_pod2,
		/area/shuttle/escape_pod3,
	)

//Intrepid Maintaince
/area/intrepid/misc/maint
	icon_state = "hallF"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/intrepid/misc/maint/internalportside
	name = "\improper Portside Internal Maintenance Tunnel"

/area/intrepid/misc/maint/internalstarboard
	name = "\improper Starboard Internal Maintenance Tunnel"

/area/intrepid/misc/maint/portside
	name = "\improper Portside Maintenance Tunnel"

/area/intrepid/misc/maint/starboard
	name = "\improper Starboard Maintenance Tunnel"

/area/intrepid/misc/maint/aft
	name = "\improper Aft Maintenance Tunnel"

//Upper Maintaince Tunnels
/area/intrepid/misc/maint/upper/central
	name = "\improper Upper Central Maintenance Tunnel"

/area/intrepid/misc/maint/upper/portside
	name = "\improper Upper Portside Maintenance Tunnel"

/area/intrepid/misc/maint/upper/starboard
	name = "\improper Upper Starboard Maintenance Tunnel"

/area/intrepid/misc/maint/superstructure
	name = "\improper Intrepid Superstructure"
	sound_env = LARGE_ENCLOSED
	icon_state = "dk_yellow"


//Intrepid Hallways
/area/intrepid/misc/hallway
	icon_state = "hallF"
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS

/area/intrepid/misc/hallway/portside
	name = "\improper Portside Hallway"

/area/intrepid/misc/hallway/starboard
	name = "\improper Starboard Hallway"

/area/intrepid/misc/hallway/center
	name = "\improper Center Hallway"

//Intrepid Medical
/area/intrepid/department/medical
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/area/intrepid/department/medical/treatment
	name = "\improper Medical Treatment Center"
	icon_state = "exam_room"
	req_access = list(access_medical)

/area/intrepid/department/medical/operatingroom
	name = "\improper Operating Room"
	icon_state = "surgery"
	req_access = list(access_surgery)

/area/intrepid/department/medical/therapy
	name = "\improper Therapy"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')
	req_access = list(access_psychiatrist)
	sound_env = SMALL_SOFTFLOOR

/area/intrepid/department/medical/equipment
	name = "\improper Medical Locker Room"
	icon_state = "locker"
	req_access = list(access_medical_equip)

/area/intrepid/department/medical/chemistry
	name = "\improper Chemistry"
	icon_state = "chem"
	req_access = list(access_chemistry)

/area/intrepid/department/medical/morgue
	name = "\improper Morgue"
	icon_state = "intrepid_morgue"

//Intrepid Research (SRV Stardust)
/area/shuttle/research
	req_access = list(access_stardust)
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
	requires_power = TRUE

/area/shuttle/research/cockpit
	name = "\improper SRV Stardust Cockpit"
	icon_state = "stardust"
	req_access = list(access_stardust_helm)

/area/shuttle/research/anomalyresearch
	name = "\improper SRV Stardust Anomaly Laboratory"
	icon_state = "stardust"

/area/shuttle/research/xenoarchlab
	name = "\improper SRV Stardust Xenoarchology Laboratory"
	icon_state = "stardust"

/area/shuttle/research/xenobiolab
	name = "\improper SRV Stardust Xenobiology Laboratory"
	icon_state = "stardust"

/area/shuttle/research/xenofloralab
	name = "\improper SRV Stardust Xenoflora Laboratory"
	icon_state = "stardust"

/area/shuttle/research/fabricator
	name = "\improper SRV Stardust Fabrication Laboratory"
	icon_state = "stardust"

/area/shuttle/research/virology
	name = "\improper SRV Stardust Virology Laboratory"
	icon_state = "stardust"
	req_access = list(access_stardust, access_virology)

/area/shuttle/research/maint
	name = "\improper SRV Stardust Maintenance Bay"
	icon_state = "stardust"

/area/shuttle/research/hallway
	name = "\improper SRV Stardust Hallway"
	icon_state = "stardust"

//Intrepid Command
/area/intrepid/department/command
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/intrepid/department/command/computerlab
	name = "\improper Command Computer Lab"
	icon_state = "conference"
	req_access = list(access_bridge)

/area/intrepid/department/command/bridge
	name = "\improper TGLV Intrepid Bridge"
	icon_state = "bridge"
	req_access = list(access_bridge)

/area/intrepid/department/command/meetingroom
	name = "\improper Meeting Room"
	icon_state = "bridge_meeting"
	req_access = list(access_bridge)

/area/intrepid/department/command/obstructionfielddisperser
	name = "\improper Obstruction Field Disperser"
	icon_state = "disperser"
	req_access = list(access_bridge)

/area/intrepid/department/command/bridgeofficer
	name = "\improper Bridge Storage Compartment"
	icon_state = "bridge"
	req_access = list(access_bridge)

/area/intrepid/department/command/AI/AICore
	name = "\improper AI Core Chamber"
	icon_state = "aicore"

/area/intrepid/department/command/AI/AIFoyer
	name = "\improper AI Core Foyer"
	icon_state = "aifoyer"

/area/intrepid/department/command/selfdestruct
	name = "\improper Self Destruct Terminal"
	icon_state = "selfdestruct"
	req_access = list(access_heads_vault)

/area/intrepid/department/command/commandquarters
	icon_state = "heads"
	req_access = list(access_heads)

/area/intrepid/department/command/commandquarters/co
	icon_state = "heads_cap"
	name = "\improper Command - CO's Office"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_captain)

/area/intrepid/department/command/commandquarters/xo
	icon_state = "heads_hop"
	name = "\improper Command - XO's Office"
	req_access = list(access_hop)

/area/intrepid/department/command/commandquarters/rd
	icon_state = "heads_rd"
	name = "\improper Command - CSO's Office"
	req_access = list(access_rd)
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/intrepid/department/command/commandquarters/cmo
	icon_state = "heads_cmo"
	name = "\improper Command - CMO's Office"
	req_access = list(access_cmo)
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/area/intrepid/department/command/commandquarters/ce
	icon_state = "heads_ce"
	name = "\improper Engineering - CE's Office"
	req_access = list(access_ce)
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/intrepid/department/command/commandquarters/cos
	icon_state = "heads_hos"
	name = "\improper Command - CoS' Office"
	req_access = list(access_hos)
	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/area/intrepid/department/command/commandquarters/tgs
	icon_state = "heads_sr"
	name = "\improper Command - TGS's Office" // TGS, kek
	req_access = list(access_representative)

/area/intrepid/department/command/commandquarters/psiadvisor
	name = "\improper Psionic Advisor Office"
	req_access = list(access_psiadvisor)

/area/intrepid/department/command/commandquarters/squadleader
	name = "\improper Squad Leader's Office"
	req_access = list(access_squad_leader)

/area/intrepid/department/command/teleporter
	icon_state = "intrepid_teleporter"
	name = "improper Teleporter Room"

// Engineering
/area/intrepid/department/engineering
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/intrepid/department/engineering/lockerroom
	name = "\improper Engineering Locker Room"
	icon_state = "engineeringlockerroom"

/area/intrepid/department/engineering/monitoring
	name = "\improper Engineering Monitoring Room"
	icon_state = "enginemonitoring"

/area/intrepid/department/engineering/lounge
	name = "\improper Engineering Lounge"
	icon_state = "engineeringlounge"

/area/intrepid/department/engineering/bluespacedrive
	name = "\improper Bluespace Drive"
	icon_state = "bluespacedrive"

/area/intrepid/department/engineering/shieldcontrol
	name = "\improper Shield Control"
	icon_state = "shieldcontrol"

/area/intrepid/department/engineering/primarythruster
	name = "\improper Primary Thruster Compartment"
	icon_state = "primarythruster"

/area/intrepid/department/engineering/starboardthruster
	name = "\improper Starboard Thruster Compartment"
	icon_state = "primarythruster"

/area/intrepid/department/engineering/portthruster
	name = "\improper Port Thruster Compartment"
	icon_state = "primarythruster"

/area/intrepid/department/engineering/drone_fabrication
	name = "\improper Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_robotics)

/area/intrepid/department/engineering/assembly
	req_access = list(access_robotics)

/area/intrepid/department/engineering/assembly/robotics
	name = "\improper Robotics Workshop"
	icon_state = "robotics"

/area/intrepid/department/engineering/assembly/chargebay
	name = "\improper Mech Bay"
	icon_state = "mechbay"

/area/intrepid/department/engineering/atmos
	name = "\improper Atmospherics"
	icon_state = "atmos"
	sound_env = LARGE_ENCLOSED

/area/intrepid/department/engineering/engine_room
	name = "\improper Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
	req_access = list(access_engine, access_engine_equip)

/area/intrepid/department/engineering/engine_room/aux
	name = "\improper Auxilary Engine Room"

/area/intrepid/department/engineering/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/intrepid/department/engineering/construction
	name = "\improper Construction Zone"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
	req_access = list(access_construction)

//Exploration
/area/intrepid/department/exploration
	holomap_color = HOLOMAP_AREACOLOR_EXPLORATION

/area/intrepid/department/exploration/hangar/pandora
	name = "\improper Pandora Hangar"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED

/area/intrepid/department/exploration/hangar/pithos
	name = "\improper Pithos Hangar"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED

/area/intrepid/department/exploration/storage
	name = "\improper Exploration Storage"
	icon_state = "intrepid_storage"

//Cargo
/area/intrepid/department/cargo
	holomap_color = HOLOMAP_AREACOLOR_CARGO

/area/intrepid/department/cargo/cargobay
	name = "\improper Cargo Bay"
	icon_state = "cargo"
	sound_env = LARGE_ENCLOSED

/area/intrepid/department/cargo/cargostorage
	name = "\improper Cargo Warehouse"
	icon_state = "cargostorage"

//Civillian
/area/intrepid/department/civillian
	holomap_color = HOLOMAP_AREACOLOR_CREW

/area/intrepid/department/civillian/dockbayone
	name = "\improper Docking Bay One"
	icon_state = "dock1"

/area/intrepid/department/civillian/dockbaytwo
	name = "\improper Docking Bay Two"
	icon_state = "dock2"

/area/intrepid/department/civillian/dockbaythree
	name = "\improper Docking Bay Three"
	icon_state = "dock3"

/area/intrepid/department/civillian/dockbayfour
	name = "\improper Docking Bay Four"
	icon_state = "dock4"

/area/intrepid/department/civillian/dockbayfive
	name = "\improper Docking Bay Five"
	icon_state = "dock5"

/area/intrepid/department/civillian/dockbaysix
	name = "\improper Docking Bay Six"
	icon_state = "dock6"

/area/intrepid/department/civillian/mess
	name = "\improper Mess Hall"
	icon_state = "cafeteria"

/area/intrepid/department/civillian/bar
	name = "\improper Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR
	req_access = list(access_bar)

/area/intrepid/department/civillian/galley
	name = "\improper Galley"
	icon_state = "kitchen"
	req_access = list(access_kitchen)

/area/intrepid/department/civillian/galleybackroom
	name = "\improper Galley Cold Storage"
	icon_state = "kitchen"
	req_access = list(access_kitchen)

/area/intrepid/department/civillian/hydroponics
	name = "\improper Hydroponics"
	icon_state = "hydro"

/area/intrepid/department/civillian/janitor
	name = "\improper Custodial Closet"
	icon_state = "janitor"
	req_access = list(access_janitor)

/area/intrepid/department/civillian/computerlab
	name = "\improper Computer Lab"
	icon_state = "crew_quarters"

/area/intrepid/department/civillian/adherent
	name = "\improper Adherent Maintenence"
	icon_state = "robotics"

/area/intrepid/department/civillian/archive
	name = "\improper Archive"
	icon_state = "purple"

/area/intrepid/department/civillian/safe_room/port
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/intrepid/department/civillian/safe_room/port
	name = "\improper Second Deck Port Safe Room"
	icon_state = "crew_quarters"

/area/intrepid/department/civillian/safe_room/starboard
	name = "\improper Second Deck Port Safe Room"
	icon_state = "crew_quarters"

// Shuttles
/area/shuttle/transport1/centcom
	icon_state = "shuttle"
	name = "\improper Transport Shuttle Centcom"

// Pandora
/area/shuttle/pandora
	name = "\improper Pandora"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED
	holomap_color = HOLOMAP_AREACOLOR_EXPLORATION
	requires_power = TRUE

/area/shuttle/pandora/cockpit
	name = "\improper Pandora - Cockpit"
	icon_state = "shuttlered"

/area/shuttle/pandora/electrical
	name = "\improper Pandora - Electrical Compartment"
	icon_state = "shuttlered"

/area/shuttle/pandora/lifesupport
	name = "\improper Pandora - Atmospheric Compartment"
	icon_state = "shuttlered"

/area/shuttle/pandora/cargo
	name = "\improper Pandora - Cargo Compartment"
	icon_state = "shuttlered"

// Cargo Drone
/area/shuttle/cargodrone
	name = "\improper Cargo Drone"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

// Pithos
/area/shuttle/pithos
	name = "\improper Pithos"
	icon_state = "shuttlered"
	base_turf = /turf/simulated/floor/plating
	area_flags = AREA_FLAG_RAD_SHIELDED
	holomap_color = HOLOMAP_AREACOLOR_CARGO
	requires_power = TRUE

/area/shuttle/pithos/cockpit
	name = "\improper Pithos - Cockpit"
	icon_state = "shuttlered"

/area/shuttle/pithos/cargo
	name = "\improper Pithos - Cargo Compartment"
	icon_state = "shuttlered"

// Caduceus
/area/shuttle/ambulance
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
	requires_power = TRUE

/area/shuttle/ambulance/home
	name = "\improper APV Caduceus"
	icon_state = "shuttlegrn"
	req_access = list(access_medical)

// Merchant
/area/shuttle/merchant/home
	name = "\improper Merchant Vessel"
	icon_state = "shuttlegrn"
	req_access = list(access_merchant)
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/merchant_station
	name = "\improper Merchant Station"
	icon_state = "LP"
	req_access = list(access_merchant)

// Turbolift
/area/turbolift
	name = "\improper Turbolift"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_maint_tunnels)

/area/turbolift/port/lift
	name = "\improper Portside Amidships Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/open

/area/turbolift/starboard/lift
	name = "\improper Starboardside Amidships Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/open

/area/turbolift/intrepidcargo/lift
	name = "\improper Cargo Bay Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/open

/area/turbolift/marine/lift
	name = "\improper Pandora Hangar Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/floor

// Holodecks

/area/holodeck
	name = "\improper Holodeck"
	icon_state = "Holodeck"
	dynamic_lighting = 0
	sound_env = LARGE_ENCLOSED
	area_flags = AREA_FLAG_NO_MODIFY

/area/holodeck/alphadeck
	name = "\improper Holodeck Alpha"

/area/holodeck/source_plating
	name = "\improper Holodeck - Off"

/area/holodeck/source_emptycourt
	name = "\improper Holodeck - Empty Court"
	sound_env = ARENA

/area/holodeck/source_boxingcourt
	name = "\improper Holodeck - Boxing Court"
	sound_env = ARENA

/area/holodeck/source_basketball
	name = "\improper Holodeck - Basketball Court"
	sound_env = ARENA

/area/holodeck/source_thunderdomecourt
	name = "\improper Holodeck - Thunderdome Court"
	sound_env = ARENA

/area/holodeck/source_courtroom
	name = "\improper Holodeck - Courtroom"
	sound_env = AUDITORIUM

/area/holodeck/source_beach
	name = "\improper Holodeck - Beach"
	sound_env = PLAIN

/area/holodeck/source_wildlife
	name = "\improper Holodeck - Wildlife Simulation"

/area/holodeck/source_meetinghall
	name = "\improper Holodeck - Meeting Hall"
	sound_env = AUDITORIUM

/area/holodeck/source_theatre
	name = "\improper Holodeck - Theatre"
	sound_env = CONCERT_HALL

/area/holodeck/source_picnicarea
	name = "\improper Holodeck - Picnic Area"
	sound_env = PLAIN

/area/holodeck/source_snowfield
	name = "\improper Holodeck - Snow Field"
	sound_env = FOREST

/area/holodeck/source_desert
	name = "\improper Holodeck - Desert"
	sound_env = PLAIN

/area/holodeck/source_space
	name = "\improper Holodeck - Space"
	has_gravity = 0
	sound_env = SPACE

/area/holodeck/source_cafe
	name = "\improper Holodeck - Cafe"
	sound_env = PLAIN

/area/holodeck/source_volleyball
	name = "\improper Holodeck - Volleyball"
	sound_env = PLAIN

/area/holodeck/source_temple
	name = "\improper Holodeck - Temple"
	sound_env = SMALL_ENCLOSED

/area/holodeck/source_plaza
	name = "\improper Holodeck - Plaza"
	sound_env = SMALL_ENCLOSED

/* Crew */
/area/crew_quarters/sleep
	holomap_color = HOLOMAP_AREACOLOR_CREW

/area/crew_quarters/sleep/bunk
	name = "\improper Bunk Room"
	icon_state = "Sleep"
	sound_env = SMALL_SOFTFLOOR
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/crew_quarters/sleep/cryo
	name = "\improper Cryogenic Storage"
	icon_state = "Sleep"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/* Security */
/area/intrepid/department/security
	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/area/intrepid/department/security/armory
	name = "\improper Security - Armory"
	icon_state = "Warden"
	req_access = list(access_armory)

/area/intrepid/department/security/armory_tactical
	name = "\improper Security - Tactical Armory"
	icon_state = "Warden"
	req_access = list(access_armory)

/area/intrepid/department/security/bo
	name = "\improper Security - Brig Chief"
	icon_state = "Warden"
	req_access = list(access_armory)

/area/intrepid/department/security/storage
	name = "\improper Security - Equipment Storage"
	icon_state = "security"
	req_access = list(access_armory)

/area/intrepid/department/security/locker
	name = "\improper Security - Locker Room"
	icon_state = "security"
	req_access = list(access_brig)

/area/intrepid/department/security/wing
	name = "\improper Security Wing"
	icon_state = "security"
	req_access = list(access_security)

/area/intrepid/department/security/interrogation
	name = "\improper Security Processing"
	icon_state = "security"
	req_access = list(access_security)

/area/intrepid/department/security/detectives_office
	name = "\improper Security - Investigations Office"
	icon_state = "detective"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_forensics_lockers)

/area/intrepid/department/security/firing_range
	name = "\improper Security - Firing Range"
	icon_state = "security"

/area/intrepid/department/security/starboarddockingbaysecurity
	name = "\improper Starboard Docking Bay Checkpoint"
	icon_state = "security"
	req_access = list(access_security)

/area/intrepid/department/security/portdockingbaysecurity
	name = "\improper Port Docking Bay Checkpoint"
	icon_state = "security"
	req_access = list(access_security)

// Tcomms
/area/tcommsat
	name = "\improper Telecommunications"
	icon_state = "tcomsatcham"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	req_access = list(access_tcomsat)
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/eva
	name = "\improper EVA Storage"
	icon_state = "eva"
	req_access = list(access_eva)
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/*** CentCom ***/
/area/centcom/evac
	name = "\improper Centcom Emergency Shuttle"
	dynamic_lighting = TRUE
	req_access = list()

// Actors Guild
/area/acting
	name = "\improper Centcom Acting Guild"
	icon_state = "red"
	dynamic_lighting = 0
	requires_power = 0

/area/acting/backstage
	name = "\improper Backstage"

/area/acting/stage
	name = "\improper Stage"
	dynamic_lighting = 1
	icon_state = "yellow"

// Thunderdome

/area/tdome
	name = "\improper Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	dynamic_lighting = 0
	sound_env = ARENA
	req_access = list(access_cent_thunder)

/area/tdome/tdome1
	name = "\improper Thunderdome (Team 1)"
	icon_state = "green"

/area/tdome/tdome2
	name = "\improper Thunderdome (Team 2)"
	icon_state = "yellow"

/area/tdome/tdomeadmin
	name = "\improper Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "\improper Thunderdome (Observer.)"
	icon_state = "purple"

/area/shuttle/escape_pod1/station
	holomap_color = HOLOMAP_AREACOLOR_ESCAPE
	name = "Escape Pod One"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod2/station
	holomap_color = HOLOMAP_AREACOLOR_ESCAPE
	name = "Escape Pod Two"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod3/station
	holomap_color = HOLOMAP_AREACOLOR_ESCAPE
	name = "Escape Pod Three"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/area/shuttle/escape_pod1/centcom
	icon_state = "shuttle"
	req_access = list(access_cent_general)

/area/shuttle/escape_pod2/centcom
	icon_state = "shuttle"
	req_access = list(access_cent_general)

/area/shuttle/escape_pod3/centcom
	icon_state = "shuttle"
	req_access = list(access_cent_general)

// Needed so as to prevent arriving shuttles from deleting the "roof" and spacing the pods underneath.
/area/space/intrepid_pod_roof
	base_turf = /turf/simulated/floor/reinforced/airless
