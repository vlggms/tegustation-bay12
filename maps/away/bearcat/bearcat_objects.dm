#define CATASTROPHE_FISH 1
#define CATASTROPHE_INFESTATION 2

// Randomized problem with the ship
// Selects one at round-start and applies throughout the ship at landmarks
/obj/effect/landmark/bearcat_catastrophe
	delete_me = TRUE
	var/global/catastrophe_type = 0

/obj/effect/landmark/bearcat_catastrophe/New()
	if(!catastrophe_type)
		catastrophe_type = rand(CATASTROPHE_FISH, CATASTROPHE_INFESTATION)
	return ..()

// Spawns the normal enemies, if applicable
/obj/effect/landmark/bearcat_catastrophe/generic_spawn
	name = "Bearcat - Generic Enemy Spawn"

/obj/effect/landmark/bearcat_catastrophe/generic_spawn/Initialize()
	switch(catastrophe_type)
		if(CATASTROPHE_FISH)
			new /mob/living/simple_animal/hostile/carp(loc)
		if(CATASTROPHE_INFESTATION)
			var/mob_type = pick(/mob/living/simple_animal/hostile/infestation/broodling, /mob/living/simple_animal/hostile/infestation/floatfly)
			new mob_type(loc)

	return ..()

#undef CATASTROPHE_FISH
#undef CATASTROPHE_INFESTATION

/obj/effect/landmark/corpse/bearcat_captain
	name = "Bearcat Captain"
	corpse_outfits = list(/decl/hierarchy/outfit/deadcap)

/obj/effect/landmark/corpse/bearcat_captain/AdditionalEffects(mob/living/carbon/human/H)
	. = ..()
	var/obj/structure/bed/chair/C = locate() in loc
	if(C)
		C.buckle_mob(H)

/decl/hierarchy/outfit/deadcap
	name = "Derelict Captain"
	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	suit = /obj/item/clothing/suit/storage/hooded/wintercoat
	shoes = /obj/item/clothing/shoes/black
	r_pocket = /obj/item/device/radio/map_preset/bearcat

/obj/machinery/power/apc/derelict
	cell_type = /obj/item/cell/crap/empty
	locked = 0
	coverlocked = 0

/obj/item/card/id/bearcat
	access = list(access_bearcat)

/obj/item/card/id/bearcat_captain
	access = list(access_bearcat, access_bearcat_captain)

/obj/structure/closet/secure_closet/engineering_electrical/bearcat
	req_access = list(access_bearcat)

/obj/structure/closet/secure_closet/engineering_welding/bearcat
	req_access = list(access_bearcat)

/obj/structure/closet/secure_closet/freezer/fridge/bearcat
	req_access = list(access_bearcat)

/obj/structure/closet/secure_closet/freezer/meat/bearcat
	req_access = list(access_bearcat)

/obj/machinery/vending/engineering/bearcat
	req_access = list(access_bearcat)

/obj/machinery/vending/tool/bearcat
	req_access = list(access_bearcat)

/obj/machinery/suit_storage_unit/engineering/salvage/bearcat
	req_access = list(access_bearcat)

/obj/machinery/suit_cycler/salvage/bearcat
	req_access = list(access_bearcat)
