/obj/item/drill_upgrade
	name = "drill modification kit"
	desc = "Does nothing. Yell at coders."
	icon = 'icons/obj/mining.dmi'
	icon_state = "upgrade_automatic"
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_STEEL = 1000, MATERIAL_PLASTEEL = 750, MATERIAL_GLASS = 500, MATERIAL_ALUMINIUM = 250)
	/// If more than one can be installed on the same drill
	var/allow_multiple = FALSE

/obj/item/drill_upgrade/proc/Install(obj/machinery/mining/drill/drill, mob/user)
	drill.drill_upgrades += src
	if(user)
		user.unEquip(src, drill)
	return

/obj/item/drill_upgrade/proc/Uninstall(obj/machinery/mining/drill/drill, mob/user)
	drill.drill_upgrades -= src
	forceMove(get_turf(drill))
	return

/obj/item/drill_upgrade/proc/ExamineMessage(mob/user, obj/machinery/mining/drill/drill)
	return null

/obj/item/drill_upgrade/auto_dispense
	name = "automatic dispenser modification kit"
	desc = "A modification kit for the mining drills. This one forces drills to dispense its stored ores whenever at full capacity automatically."

/obj/item/drill_upgrade/auto_dispense/Install(obj/machinery/mining/drill/drill)
	. = ..()
	drill.upgrade_flags |= DRILL_AUTOMATIC

/obj/item/drill_upgrade/auto_dispense/Uninstall(obj/machinery/mining/drill/drill)
	. = ..()
	drill.upgrade_flags &= ~DRILL_AUTOMATIC

/obj/item/drill_upgrade/auto_dispense/ExamineMessage(mob/user, obj/machinery/mining/drill/drill)
	return SPAN_NOTICE("The drill is fully automated and will dispense ores to the [dir2text(drill.dispense_dir)].")

/obj/item/drill_upgrade/range_increase
	name = "deep mining modification kit"
	desc = "A modification kit for the mining drills. This one increases range of drilling by 1."
	allow_multiple = TRUE

/obj/item/drill_upgrade/range_increase/Install(obj/machinery/mining/drill/drill)
	. = ..()
	drill.resource_area += 1

/obj/item/drill_upgrade/range_increase/Uninstall(obj/machinery/mining/drill/drill)
	. = ..()
	drill.resource_area -= 1
