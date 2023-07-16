/datum/species/diona
	name = SPECIES_DIONA
	name_plural = "Dionaea"
	icobase = 'icons/mob/human_races/species/diona/body.dmi'
	deform = 'icons/mob/human_races/species/diona/deformed_body.dmi'
	preview_icon = 'icons/mob/human_races/species/diona/preview.dmi'
	hidden_from_codex = FALSE
	move_intents = list(/decl/move_intent/walk, /decl/move_intent/creep)
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/diona)
	//primitive_form = "Nymph"
	slowdown = 5
	rarity_value = 3
	hud_type = /datum/hud_data/diona
	siemens_coefficient = 0.3
	show_ssd = "completely quiescent"
	strength = STR_VHIGH
	assisted_langs = list(LANGUAGE_NABBER)
	spawns_with_stack = 0
	health_hud_intensity = 2
	hunger_factor = 3
	thirst_factor = 0.01

	min_age = 1
	max_age = 300

	description = "Commonly referred to (erroneously) as 'plant people', the Dionaea are a strange space-dwelling collective \
	species hailing from Epsilon Ursae Minoris. Each 'diona' is a cluster of numerous cat-sized organisms called nymphs; \
	there is no effective upper limit to the number that can fuse in gestalt, and reports exist	of the Epsilon Ursae \
	Minoris primary being ringed with a cloud of singing space-station-sized entities.<br/><br/>The Dionaea coexist peacefully with \
	all known species, especially the Skrell. Their communal mind makes them slow to react, and they have difficulty understanding \
	even the simplest concepts of other minds. Their alien physiology allows them survive happily off a diet of nothing but light, \
	water and other radiation."

	has_organ = list(
		BP_NUTRIENT = /obj/item/organ/internal/diona/nutrients,
		BP_STRATA =   /obj/item/organ/internal/diona/strata,
		BP_RESPONSE = /obj/item/organ/internal/diona/node,
		BP_GBLADDER = /obj/item/organ/internal/diona/bladder,
		BP_POLYP =    /obj/item/organ/internal/diona/polyp,
		BP_ANCHOR =   /obj/item/organ/internal/diona/ligament
		)

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/diona/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/diona/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/diona),
		BP_L_ARM =  list("path" = /obj/item/organ/external/diona/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/diona/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/diona/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/diona/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/diona/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/diona/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/diona/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/diona/foot/right)
		)

	base_auras = list(
		/obj/aura/regenerating/human/diona
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/diona_heal_toggle
		)

	warning_low_pressure = 50
	hazard_low_pressure = -1
	warning_high_pressure = 1500
	hazard_high_pressure = 2000

	cold_level_1 = -1
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 3000
	heat_level_2 = 4000
	heat_level_3 = 5000

	body_temperature = T0C + 15		//make the plant people have a bit lower body temperature, why not

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_IS_PLANT | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_DISEASE
	appearance_flags = 0
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_FBP_CHARGEN

	blood_color = "#004400"
	flesh_color = "#907e4a"

	reagent_tag = IS_DIONA
	genders = list(PLURAL)

	available_cultural_info = list(
		TAG_CULTURE =   list(CULTURE_DIONA),
		TAG_HOMEWORLD = list(HOME_SYSTEM_DIONAEA),
		TAG_FACTION =   list(FACTION_OTHER),
		TAG_RELIGION =  list(RELIGION_OTHER)
	)

/proc/spawn_diona_nymph(turf/target)
	if (!istype(target))
		return
	var/mob/living/carbon/alien/diona/nymph = new (target)
	var/datum/ghosttrap/trap = get_ghost_trap("living plant")
	trap.request_player(nymph, "A diona nymph has split from its gestalt.", 30 SECONDS)
	addtimer(CALLBACK(nymph, /mob/living/carbon/alien/diona/proc/check_spawn_death), 30 SECONDS)

/mob/living/carbon/alien/diona/proc/check_spawn_death()
	if (QDELETED(src))
		return
	if (!ckey || !client)
		death()

#define DIONA_LIMB_DEATH_COUNT 9
/datum/species/diona/handle_death_check(var/mob/living/carbon/human/H)
	var/lost_limb_count = has_limbs.len - H.organs.len
	if(lost_limb_count >= DIONA_LIMB_DEATH_COUNT)
		return TRUE
	for(var/thing in H.bad_external_organs)
		var/obj/item/organ/external/E = thing
		if(E && E.is_stump())
			lost_limb_count++
	return (lost_limb_count >= DIONA_LIMB_DEATH_COUNT)
#undef DIONA_LIMB_DEATH_COUNT

/datum/species/diona/can_understand(var/mob/other)
	var/mob/living/carbon/alien/diona/D = other
	if(istype(D))
		return 1
	return 0

/datum/species/diona/equip_survival_gear(var/mob/living/carbon/human/H)
	if(istype(H.get_equipped_item(slot_back), /obj/item/storage/backpack))
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/flare(H.back), slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/flare(H), slot_r_hand)


// Dionaea spawned by hand or by joining will not have any
// nymphs passed to them. This should take care of that.
/datum/species/diona/handle_post_spawn(var/mob/living/carbon/human/H)
	H.gender = NEUTER
	. = ..()
	addtimer(CALLBACK(src, .proc/fill_with_nymphs, H), 0)

/datum/species/diona/proc/fill_with_nymphs(var/mob/living/carbon/human/H)

	if(!H || H.species.name != name) return

	var/nymph_count = 0
	for(var/mob/living/carbon/alien/diona/nymph in H)
		nymph_count++
		if(nymph_count >= 3) return

	while(nymph_count < 3)
		new /mob/living/carbon/alien/diona/sterile(H)
		nymph_count++

/datum/species/diona/handle_death(var/mob/living/carbon/human/H)

	if(H.isSynthetic())
		var/mob/living/carbon/alien/diona/S = new(get_turf(H))

		if(H.mind)
			H.mind.transfer_to(S)
		H.visible_message("<span class='danger'>\The [H] collapses into parts, revealing a solitary diona nymph at the core.</span>")
		return
	else
		split_into_nymphs(H, TRUE)

/datum/species/diona/get_blood_name()
	return "sap"

/datum/species/diona/handle_environment_special(var/mob/living/carbon/human/H)
	if(H.InStasis() || H.stat == DEAD)
		return

	if(H.nutrition < 10)
		H.take_overall_damage(2,0)

	if(H.hydration < 550 && H.loc)
		var/is_in_water = FALSE
		if(H.loc.is_flooded(lying_mob = TRUE))
			is_in_water = TRUE
		else
			for(var/obj/structure/hygiene/shower/shower in H.loc)
				if(shower.on)
					is_in_water = TRUE
					break
		if(is_in_water)
			H.adjust_hydration(100)
