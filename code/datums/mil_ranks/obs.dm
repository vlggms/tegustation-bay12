// Used by submaps with OBS members
/datum/mil_branch/obs
	name = "Order of the Black Sun"
	name_short = "OBS"
	email_domain = "obs.terra-2" // Used to be legal for a very short time before throwing a fit

	rank_types = list(
		/datum/mil_rank/obs/initiate,
		/datum/mil_rank/obs/acolyte,
		/datum/mil_rank/obs/socius,
		/datum/mil_rank/obs/inquisitor,
		/datum/mil_rank/obs/controller,
		/datum/mil_rank/obs/magister,
	)
	spawn_rank_types = list(
		/datum/mil_rank/obs/initiate,
		/datum/mil_rank/obs/acolyte,
		/datum/mil_rank/obs/socius,
		/datum/mil_rank/obs/inquisitor,
	)

/datum/mil_rank/obs
	name = "Member" // Unused
	name_short = "M"
	sort_order = 0

// That's where you start when you join!
// Equivalent of private in the military.
/datum/mil_rank/obs/initiate
	name = "Initiate"
	name_short = "INT"
	sort_order = 1

// Despite the name, it is an equivalent of a corporal in the military.
/datum/mil_rank/obs/acolyte
	name = "Acolyte"
	name_short = "ACL"
	sort_order = 2

// The "rank" of being officially admitted into the order.
// Equivalent of a sergeant in the military.
/datum/mil_rank/obs/socius
	name = "Socius"
	name_short = "SCS"
	sort_order = 3

// As close as you can feasibly get to the controllers without being one.
// Inquisitor is a rank of scientists and doctors.
// Equivalent of a lieutenant in the military, though technically nobody is required to obey their orders.
/datum/mil_rank/obs/inquisitor
	name = "Inquisitor"
	name_short = "IQS"
	sort_order = 10

// Local bad guy controlling a group of cells. Not used anywhere at the moment.
// Equivalent of a colonel or general in the military.
/datum/mil_rank/obs/controller
	name = "Controller"
	name_short = "CTRL"
	sort_order = 15

// The big bad behind it all. Isn't used anywhere, yet...
// If that wasn't obvious - it is an equivalent of being a general of the army, admiral of the fleet and ruler of the state.
/datum/mil_rank/obs/magister
	name = "Magister"
	name_short = "MGST"
	sort_order = 20
