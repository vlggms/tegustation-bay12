/datum/map/intrepid
	default_assistant_title = "Passenger"

	species_to_job_whitelist = list(
		/datum/species/nabber = list(
			/datum/job/ai, /datum/job/cyborg,
			/datum/job/janitor,
			/datum/job/crew, /datum/job/chef,
			/datum/job/chemist, /datum/job/roboticist, /datum/job/cargo_tech,
			),
		/datum/species/vox = list(
			/datum/job/ai, /datum/job/cyborg,
			/datum/job/merchant, /datum/job/janitor,
			/datum/job/chef, /datum/job/bartender,
			/datum/job/engineer, /datum/job/roboticist,
			/datum/job/mining,
			),
		/datum/species/human/mule = list(/datum/job/ai, /datum/job/cyborg)
	)

#define HUMAN_ONLY_JOBS /datum/job/captain, /datum/job/hop, /datum/job/representative, \
/datum/job/warden, /datum/job/officer, /datum/job/detective, \
/datum/job/senior_engineer, /datum/job/senior_scientist, /datum/job/scientist, \
/datum/job/marine, /datum/job/marine_medic, /datum/job/marine_engineer, \
/datum/job/squad_leader, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos, \
/datum/job/rd, /datum/job/bridgeofficer, /datum/job/qm

	species_to_job_blacklist = list(
		/datum/species/unathi = list(HUMAN_ONLY_JOBS),
		/datum/species/unathi/yeosa = list(HUMAN_ONLY_JOBS),
		/datum/species/skrell = list(HUMAN_ONLY_JOBS),
		/datum/species/machine = list(HUMAN_ONLY_JOBS),
		/datum/species/diona = list(HUMAN_ONLY_JOBS),
		/datum/species/adherent = list(HUMAN_ONLY_JOBS),
	)

#undef HUMAN_ONLY_JOBS

	allowed_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos,
						/datum/job/representative, /datum/job/psiadvisor,
						/datum/job/bridgeofficer,
						/datum/job/squad_leader, /datum/job/marine_medic, /datum/job/marine_engineer, /datum/job/marine,
						/datum/job/senior_engineer, /datum/job/engineer, /datum/job/roboticist, /datum/job/engineer_trainee,
						/datum/job/warden, /datum/job/officer, /datum/job/detective,
						/datum/job/senior_doctor, /datum/job/doctor, /datum/job/chemist, /datum/job/medical_trainee,
						/datum/job/psychiatrist,
						/datum/job/qm, /datum/job/cargo_tech, /datum/job/mining,
						/datum/job/janitor, /datum/job/chef, /datum/job/bartender,
						/datum/job/senior_scientist, /datum/job/scientist, /datum/job/scientist_assistant,
						/datum/job/ai, /datum/job/cyborg,
						/datum/job/crew, /datum/job/assistant,
						/datum/job/merchant,
						)

/datum/job
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	required_language = LANGUAGE_HUMAN_EURO
