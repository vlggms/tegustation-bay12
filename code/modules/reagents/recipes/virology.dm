/* Reagents used to alter diseases */
/datum/chemical_reaction/virus_food
	result = list(/datum/reagent/nutriment/virus_food = 15)
	required_reagents = list(/datum/reagent/water = 5, /datum/reagent/drink/milk = 5)

/datum/chemical_reaction/virus_food_mutagen
	result = list(/datum/reagent/unstable_mutagen/mutagen_virus_food = 1)
	required_reagents = list(/datum/reagent/unstable_mutagen = 1, /datum/reagent/nutriment/virus_food = 1)

/datum/chemical_reaction/virus_food_mutagen_sugar
	result = list(/datum/reagent/unstable_mutagen/mutagen_virus_food/sugar = 2)
	required_reagents = list(/datum/reagent/sugar = 1, /datum/reagent/unstable_mutagen/mutagen_virus_food = 1)

/datum/chemical_reaction/virus_food_phoron
	result = list(/datum/reagent/toxin/phoron/phoron_virus_food = 1)
	required_reagents = list(/datum/reagent/toxin/phoron = 1, /datum/reagent/nutriment/virus_food = 1)

/datum/chemical_reaction/virus_food_phoron_synaptizine
	result = list(/datum/reagent/toxin/phoron/phoron_virus_food/weak = 2)
	required_reagents = list(/datum/reagent/medicine/stimulant/synaptizine = 1, /datum/reagent/toxin/phoron/phoron_virus_food = 1)

/datum/chemical_reaction/virus_food_synaptizine
	result = list(/datum/reagent/medicine/stimulant/synaptizine/synaptizine_virus_food = 1)
	required_reagents = list(/datum/reagent/medicine/stimulant/synaptizine = 1, /datum/reagent/nutriment/virus_food = 1)

/datum/chemical_reaction/virus_food_uranium
	result = list(/datum/reagent/uranium/uranium_virus_food = 1)
	required_reagents = list(/datum/reagent/uranium = 1, /datum/reagent/nutriment/virus_food = 1)

/datum/chemical_reaction/virus_food_uranium_plasma
	result = list(/datum/reagent/uranium/uranium_virus_food/unstable = 1)
	required_reagents = list(/datum/reagent/uranium = 5, /datum/reagent/toxin/phoron/phoron_virus_food = 1)

/datum/chemical_reaction/virus_food_uranium_plasma_gold
	result = list(/datum/reagent/uranium/uranium_virus_food/stable = 1)
	required_reagents = list(/datum/reagent/uranium = 10, /datum/reagent/gold = 10, /datum/reagent/toxin/phoron = 1)

/datum/chemical_reaction/virus_food_uranium_plasma_silver
	result = list(/datum/reagent/uranium/uranium_virus_food/stable = 1)
	required_reagents = list(/datum/reagent/uranium = 10, /datum/reagent/silver = 10, /datum/reagent/toxin/phoron = 1)


/* Reactions that alter a disease within blood reagent */
/datum/chemical_reaction/mix_virus
	result = list(/datum/reagent/blood = 1)
	required_reagents = list(/datum/reagent/nutriment/virus_food = 1)
	catalysts = list(/datum/reagent/blood = 1)
	var/level_min = 1
	var/level_max = 2

/datum/chemical_reaction/mix_virus/on_reaction(datum/reagents/holder, created_volume)
	var/datum/reagent/blood/B = locate(/datum/reagent/blood) in holder.reagent_list
	if(B?.data)
		var/datum/disease/advance/D = locate(/datum/disease/advance) in B.data["viruses"]
		if(D)
			D.Evolve(level_min, level_max)


/datum/chemical_reaction/mix_virus/mix_virus_2
	required_reagents = list(/datum/reagent/unstable_mutagen = 1)
	level_min = 2
	level_max = 4

/datum/chemical_reaction/mix_virus/mix_virus_3
	required_reagents = list(/datum/reagent/toxin/phoron = 1)
	level_min = 4
	level_max = 6

/datum/chemical_reaction/mix_virus/mix_virus_4
	required_reagents = list(/datum/reagent/uranium = 1)
	level_min = 5
	level_max = 6

/datum/chemical_reaction/mix_virus/mix_virus_5
	required_reagents = list(/datum/reagent/unstable_mutagen/mutagen_virus_food = 1)
	level_min = 3
	level_max = 3

/datum/chemical_reaction/mix_virus/mix_virus_6
	required_reagents = list(/datum/reagent/unstable_mutagen/mutagen_virus_food/sugar = 1)
	level_min = 4
	level_max = 4

/datum/chemical_reaction/mix_virus/mix_virus_7
	required_reagents = list(/datum/reagent/toxin/phoron/phoron_virus_food/weak = 1)
	level_min = 5
	level_max = 5

/datum/chemical_reaction/mix_virus/mix_virus_8
	required_reagents = list(/datum/reagent/toxin/phoron/phoron_virus_food = 1)
	level_min = 6
	level_max = 6

/datum/chemical_reaction/mix_virus/mix_virus_9
	required_reagents = list(/datum/reagent/medicine/stimulant/synaptizine/synaptizine_virus_food = 1)
	level_min = 1
	level_max = 1

/datum/chemical_reaction/mix_virus/mix_virus_10
	required_reagents = list(/datum/reagent/uranium/uranium_virus_food = 1)
	level_min = 6
	level_max = 7

/datum/chemical_reaction/mix_virus/mix_virus_11
	required_reagents = list(/datum/reagent/uranium/uranium_virus_food/unstable = 1)
	level_min = 7
	level_max = 7

/datum/chemical_reaction/mix_virus/mix_virus_12
	required_reagents = list(/datum/reagent/uranium/uranium_virus_food/stable = 1)
	level_min = 8
	level_max = 8

/datum/chemical_reaction/mix_virus/rem_virus
	required_reagents = list(/datum/reagent/medicine/stimulant/synaptizine = 1)
	catalysts = list(/datum/reagent/blood = 1)

/datum/chemical_reaction/mix_virus/rem_virus/on_reaction(datum/reagents/holder, created_volume)
	var/datum/reagent/blood/B = locate(/datum/reagent/blood) in holder.reagent_list
	if(B?.data)
		var/datum/disease/advance/D = locate(/datum/disease/advance) in B.data["viruses"]
		if(D)
			D.Devolve()

/datum/chemical_reaction/mix_virus/neuter_virus
	required_reagents = list(/datum/reagent/toxin/formaldehyde = 1)
	catalysts = list(/datum/reagent/blood = 1)

/datum/chemical_reaction/mix_virus/neuter_virus/on_reaction(datum/reagents/holder, created_volume)
	var/datum/reagent/blood/B = locate(/datum/reagent/blood) in holder.reagent_list
	if(B?.data)
		var/datum/disease/advance/D = locate(/datum/disease/advance) in B.data["viruses"]
		if(D)
			D.Neuter()
