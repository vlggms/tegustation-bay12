/* All reagents that are exclusively used for advance diseases */
/datum/reagent/nutriment/virus_food
	name = "Virus Food"
	description = "A mixture of water and milk. Virus cells can use this mixture to reproduce."
	nutriment_factor = 2 * REM
	color = "#899613" // rgb: 137, 150, 19
	taste_description = "watery milk"

/datum/reagent/unstable_mutagen/mutagen_virus_food
	name = "mutagenic agar"
	color = "#A3C00F" // rgb: 163,192,15
	taste_description = "sourness"

/datum/reagent/unstable_mutagen/mutagen_virus_food/sugar
	name = "sucrose agar"
	color = "#41B0C0" // rgb: 65,176,192
	taste_description = "sweetness"

/datum/reagent/toxin/phoron/phoron_virus_food
	name = "virus phoron"
	color = "#A270A8" // rgb: 166,157,169
	taste_description = "bitterness"
	taste_mult = 1.5

/datum/reagent/toxin/phoron/phoron_virus_food/weak
	name = "weakened virus phoron"
	color = "#A28CA5" // rgb: 206,195,198

/datum/reagent/medicine/stimulant/synaptizine/synaptizine_virus_food
	name = "virus rations"
	color = "#D18AA5" // rgb: 209,138,165
	taste_description = "bitterness"

/datum/reagent/uranium/uranium_virus_food
	name = "decaying uranium gel"
	color = "#67ADBA" // rgb: 103,173,186
	taste_description = "the inside of a reactor"

/datum/reagent/uranium/uranium_virus_food/unstable
	name = "unstable uranium gel"
	color = "#2FF2CB" // rgb: 47,242,203

/datum/reagent/uranium/uranium_virus_food/stable
	name = "stable uranium gel"
	color = "#04506C" // rgb: 4,80,108
