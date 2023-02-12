/obj/item/factory_blueprint/test_t12
	name = "test T12 blueprint"
	desc = "Where did you get this???"
	icon_state = "blueprint_weapon"

	production_path = /obj/item/gun/projectile/automatic/t12/empty
	production_time = 20
	required_materials = list(
		/obj/item/stack/material/iron = 50,
		/obj/item/stack/material/titanium = 20,
		/obj/item/stock_parts/capacitor/super = 5,
		/obj/item/stock_parts/manipulator/pico = 3,
		)


/obj/item/factory_blueprint/cigarette
	name = "cigarette refinery blueprint"
	desc = "A blueprint that allows factory to re-create a cigarette butt back into usable shape."

	production_path = /obj/item/clothing/mask/smokable/cigarette
	production_time = 5
	required_materials = list(
		/obj/item/trash/cigbutt = 1,
		/obj/item/paper = 1,
		)
