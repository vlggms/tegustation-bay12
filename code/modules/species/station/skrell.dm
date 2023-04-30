/datum/species/skrell
	name = SPECIES_SKRELL
	name_plural = SPECIES_SKRELL
	icobase = 'icons/mob/human_races/species/skrell/body.dmi'
	deform = 'icons/mob/human_races/species/skrell/deformed_body.dmi'
	preview_icon = 'icons/mob/human_races/species/skrell/preview.dmi'
	bandages_icon = 'icons/mob/bandage.dmi'
	primitive_form = "Neaera"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	description = "An amphibious species, Skrell come from the star system known as Qerr'Vallis, which translates to 'Star of \
	the royals' or 'Light of the Crown'.<br/><br/>Skrell are a highly advanced and logical race who live under the rule \
	of the Qerr'Katish, a caste within their society which keeps the empire of the Skrell running smoothly. Skrell are \
	herbivores on the whole and tend to be co-operative with the other species of the galaxy, although they rarely reveal \
	the secrets of their empire to their allies."
	assisted_langs = list(LANGUAGE_NABBER)
	health_hud_intensity = 1.75
	meat_type = /obj/item/reagent_containers/food/snacks/fish/octopus
	bone_material = MATERIAL_BONE_CARTILAGE
	genders = list(PLURAL)
	hidden_from_codex = FALSE
	min_age = 19
	max_age = 90

	burn_mod = 0.9
	oxy_mod = 1.3
	flash_mod = 1.2
	toxins_mod = 0.8
	siemens_coefficient = 1.3
	warning_low_pressure = WARNING_LOW_PRESSURE * 1.4
	hazard_low_pressure = HAZARD_LOW_PRESSURE * 2
	warning_high_pressure = WARNING_HIGH_PRESSURE / 0.8125
	hazard_high_pressure = HAZARD_HIGH_PRESSURE / 0.84615
	water_soothe_amount = 5

	body_temperature = null // cold-blooded, implemented the same way nabbers do it

	darksight_range = 4
	darksight_tint = DARKTINT_MODERATE

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR

	flesh_color = "#8cd7a3"
	blood_color = "#1d2cbf"
	base_color = "#006666"
	organs_icon = 'icons/mob/human_races/species/skrell/organs.dmi'

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	cold_discomfort_level = 292 //Higher than perhaps it should be, to avoid big speed reduction at normal room temp
	heat_discomfort_level = 368

	reagent_tag = IS_SKRELL

	descriptors = list(
		/datum/mob_descriptor/height = 1,
		/datum/mob_descriptor/build = 0,
		/datum/mob_descriptor/headtail_length = 0
	)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_SKRELL_QERR,
			CULTURE_SKRELL_MALISH,
			CULTURE_SKRELL_KANIN,
			CULTURE_SKRELL_TALUM,
			CULTURE_SKRELL_RASKINTA
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_QERRBALAK,
			HOME_SYSTEM_TALAMIRA,
			HOME_SYSTEM_ROASORA,
			HOME_SYSTEM_MITORQI,
			HOME_SYSTEM_SKRELLSPACE
		),
		TAG_FACTION = list(
			FACTION_EXPEDITIONARY,
			FACTION_CORPORATE,
			FACTION_NANOTRASEN,
			FACTION_PCRC,
			FACTION_HEPHAESTUS,
			FACTION_DAIS,
			FACTION_SKRELL_QERRVOAL,
			FACTION_SKRELL_QALAOA,
			FACTION_SKRELL_YIITALANA,
			FACTION_SKRELL_KRRIGLI,
			FACTION_SKRELL_QONPRRI,
			FACTION_OTHER
		),
		TAG_RELIGION = list(
			RELIGION_OTHER,
			RELIGION_ATHEISM,
			RELIGION_DEISM,
			RELIGION_AGNOSTICISM
		)
	)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs/gills,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/skrell
		)

	exertion_effect_chance = 10
	exertion_hydration_scale = 1
	exertion_charge_scale = 1
	exertion_reagent_scale = 5
	exertion_reagent_path = /datum/reagent/lactic_acid
	exertion_emotes_biological = list(
		/decl/emote/exertion/biological,
		/decl/emote/exertion/biological/breath,
		/decl/emote/exertion/biological/pant
	)
	exertion_emotes_synthetic = list(
		/decl/emote/exertion/synthetic,
		/decl/emote/exertion/synthetic/creak
	)


/datum/species/skrell/proc/handle_protein(mob/living/carbon/human/M, datum/reagent/protein)
	var/effective_dose = M.chem_doses[protein.type] * protein.protein_amount
	if (effective_dose > 20)
		M.adjustToxLoss(Clamp((effective_dose - 20) / 4, 2, 10))
		M.vomit(8, 3, rand(1 SECONDS, 5 SECONDS))
	else if (effective_dose > 10)
		M.vomit(4, 2, rand(3 SECONDS, 10 SECONDS))
	else
		M.vomit(1, 1, rand(5 SECONDS, 15 SECONDS))

/datum/species/skrell/get_sex(var/mob/living/carbon/human/H)
	return istype(H) && (H.descriptors["headtail length"] == 1 ? MALE : FEMALE)

/datum/species/skrell/check_background()
	return TRUE

/datum/species/skrell/can_float(mob/living/carbon/human/H)
	if(!H.is_physically_disabled())
		if(H.encumbrance() < 2)
			return TRUE
	return FALSE
