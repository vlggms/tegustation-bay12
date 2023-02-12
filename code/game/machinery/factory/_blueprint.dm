/obj/item/factory_blueprint
	name = "unknown blueprint"
	desc = "This does nothing. Report to coders."
	icon = 'icons/obj/blueprints.dmi'
	icon_state = "blueprint"
	item_state = "blueprint"

	/// Item that will be produced in factory with this blueprint
	var/production_path = null
	/// Amount of ticks it takes to produce an item
	var/production_time = 10
	/// List of items needed to start producing it on factory
	var/list/required_materials = list()

/obj/item/factory_blueprint/examine(mob/user)
	. = ..()
	if(ispath(production_path))
		var/obj/item/PRP = production_path
		to_chat(user, SPAN_NOTICE("It is a blueprint for [initial(PRP.name)]"))
	if(LAZYLEN(required_materials))
		to_chat(user, SPAN_NOTICE("It requires the following materials:"))
		for(var/path_type in required_materials)
			var/obj/item/PT = path_type
			to_chat(user, SPAN_NOTICE("- [initial(PT.name)] x[required_materials[path_type]]."))
