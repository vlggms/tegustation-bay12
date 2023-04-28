/* Closets */

/obj/structure/closet/secure_closet/security/bunker
	req_access = list(access_bunker_security)
	closet_appearance = /decl/closet_appearance/secure_closet/security

/obj/structure/closet/secure_closet/security/bunker/WillContain()
	return list(
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		/obj/item/clothing/suit/armor/vest,
		/obj/item/storage/belt/holster/security,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/melee/baton/loaded,
		/obj/item/clothing/head/soft/sec,
		/obj/item/clothing/under/rank/security/corp,
	)

/* Vendors */

/obj/machinery/vending/security/bunker
	name = "\improper SecTech v0.9"
	desc = "A slightly outdated security equipment vendor. It doesn't have any donuts!"
	product_ads = "Remain calm and geared up!;Coalition stands strong!;Stay vigilant!;Remain strong - Remain independent!"
	req_access = list(access_bunker_security)
	products = list(
		/obj/item/handcuffs = 8,
		/obj/item/reagent_containers/spray/pepper = 4,
		/obj/item/ammo_magazine/pistol/double = 3,
		/obj/item/ammo_magazine/pistol/double/rubber = 3,
		/obj/item/ammo_magazine/smg_top = 3,
		/obj/item/ammo_magazine/smg_top/rubber = 3,
		)
	contraband = list(/obj/item/clothing/glasses/sunglasses = 2)
