/datum/reagent/drink/tegu/shirley
	name = "Shirley Temple"
	description = "Space-up, Grenadine, and Orange Juice."
	taste_description = "sweet tonic cherries"
	color = "#f74c5d"
	adj_temp = -5

	glass_name = "shirley temple"
	glass_desc = "Reminds you of the days restaurants served this to kids..."

/datum/chemical_reaction/shirley
	name = "Shirley Temple"
	result = /datum/reagent/drink/tegu/shirley
	required_reagents = list(/datum/reagent/drink/grenadine = 1, /datum/reagent/drink/juice/orange = 2, /datum/reagent/drink/space_up = 2)
	result_amount = 5