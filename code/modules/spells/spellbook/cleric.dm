//Cleric is all about healing. Mobility and offense comes at a higher price but not impossible.
/obj/item/spellbook/cleric
	spellbook_type = /datum/spellbook/cleric

/datum/spellbook/cleric
	name = "\improper Cleric's Tome"
	feedback = "CR"
	desc = "For those who do not harm, or at least feel sorry about it."
	book_desc = "All about healing. Mobility and offense comes at a higher price but not impossible."
	title = "Cleric's Tome of Healing"
	title_desc = "Buy spells using your available spell slots. Artefacts may also be bought however their cost is permanent."
	book_flags = CAN_MAKE_CONTRACTS|INVESTABLE
	max_uses = 7

	spells = list(/datum/spell/targeted/heal_target/major = 				1,
				/datum/spell/targeted/heal_target/area = 					1,
				/datum/spell/targeted/heal_target/sacrifice = 			1,
				/datum/spell/targeted/genetic/blind = 					1,
				/datum/spell/targeted/shapeshift/baleful_polymorph = 		1,
				/datum/spell/targeted/projectile/dumbfire/stuncuff = 		1,
				/datum/spell/targeted/ethereal_jaunt = 					2,
				/datum/spell/aoe_turf/knock = 							1,
				/datum/spell/radiant_aura =								1,
				/datum/spell/targeted/equip_item/holy_relic = 			1,
				/datum/spell/aoe_turf/conjure/grove/sanctuary = 			1,
				/datum/spell/aimed/fireball = 								2,
				/datum/spell/area_teleport = 								2,
				/datum/spell/portal_teleport = 							2,
				/datum/spell/aoe_turf/conjure/forcewall = 				1,
				/datum/spell/noclothes = 									1,
				/obj/item/magic_rock = 						1,
				/obj/structure/closet/wizard/scrying = 				2,
				/obj/item/summoning_stone = 					2,
				/obj/item/contract/wizard/telepathy = 		1,
				/obj/item/contract/apprentice = 				1
				)

	sacrifice_reagents = list(/datum/reagent/medicine/peridaxon,
							/datum/reagent/adminordrazine)
	sacrifice_objects = list(/obj/item/stack/nanopaste,
							/obj/item/device/scanner/health,
							/obj/item/stack/medical/advanced/bruise_pack,
							/obj/item/stack/medical/advanced/ointment,
							/obj/item/bodybag/rescue,
							/obj/item/defibrillator
							)
