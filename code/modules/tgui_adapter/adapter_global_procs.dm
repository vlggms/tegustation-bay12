/proc/ui_always_state()
	return GLOB.always_state

/proc/ui_default_state()
	return GLOB.default_state

/proc/ui_physical_state()
	return GLOB.physical_state

/proc/ui_inventory_state()
	return GLOB.inventory_state

/proc/ui_deep_inventory_state()
	return GLOB.deep_inventory_state

/proc/ui_self_state()
	return GLOB.self_state

/proc/ui_hands_state()
	return GLOB.hands_state

/proc/ui_interactive_state()
	return GLOB.inventory_state

/proc/ui_contained_state()
	return GLOB.contained_state

/proc/ui_not_contained_state()
	return GLOB.not_contained_state

/proc/ui_conscious_state()
	return GLOB.conscious_state

/proc/ui_z_state()
	return GLOB.z_state

/proc/ui_admin_state()
	return GLOB.admin_state

/proc/CanInteractWith(datum/user, datum/target, state)
	return (target.CanUseTopic(user, state) == UI_INTERACTIVE)

/proc/CanPhysicallyInteractWith(user, target)
	return CanInteractWith(user, target, ui_physical_state())
