/obj/item/gun/magnetic/railgun
	name = "railgun"
	desc = "The HelTek Arms LM-76 Thunderclap. A portable linear motor cannon produced during the Gaia Conflict for anti-armour and anti-fortification operations. Today, it sees wide use among private militaries, and is a staple on the black market."
	icon = 'icons/obj/guns/railgun.dmi'
	icon_state = "railgun"
	removable_components = TRUE // Can swap out the capacitor for more shots, or cell for longer usage before recharge
	load_type = /obj/item/rcd_ammo
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4, TECH_MAGNET = 4)
	projectile_type = /obj/item/projectile/bullet/magnetic/slug
	one_hand_penalty = 6
	power_cost = 300
	fire_delay = 25
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	loaded = /obj/item/rcd_ammo/large // ~30 shots
	bulk = GUN_BULK_RIFLE + 1
	accuracy = 5

	cell = /obj/item/cell/hyper
	capacitor = /obj/item/stock_parts/capacitor/adv
	gun_unreliable = 0
	slowdown_held = 1
	slowdown_worn = 0.5

// Not going to check type repeatedly, if you code or varedit
// load_type and get runtime errors, don't come crying to me.
/obj/item/gun/magnetic/railgun/show_ammo(mob/user)
	var/obj/item/rcd_ammo/ammo = loaded
	if(ammo)
		to_chat(user, SPAN_NOTICE("There are [ammo.remaining] shot\s remaining in \the [loaded]."))
	else
		to_chat(user, SPAN_NOTICE("There is nothing loaded."))

/obj/item/gun/magnetic/railgun/check_ammo()
	var/obj/item/rcd_ammo/ammo = loaded
	return ammo && ammo.remaining

/obj/item/gun/magnetic/railgun/use_ammo()
	var/obj/item/rcd_ammo/ammo = loaded
	ammo.remaining--
	if(ammo.remaining <= 0)
		spawn(3)
			playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 1)
		out_of_ammo()

/obj/item/gun/magnetic/railgun/proc/out_of_ammo()
	qdel(loaded)
	loaded = null
	visible_message(SPAN_WARNING("\The [src] beeps and ejects its empty cartridge."))

/obj/item/gun/magnetic/railgun/mmi
	desc = "The Mars Military Industries MI-72 Comet. A man-portable mass driver for squad support, anti-armour and destruction of fortifications and emplacements."
	icon = 'icons/obj/guns/railgun_old.dmi'
	icon_state = "old_railgun"

// Whoever named it "advanced" should be lynched. It fires literal rods and is much weaker
/obj/item/gun/magnetic/railgun/tcc
	name = "advanced railgun"
	desc = "The HelTek Arms HR-22 Hammerhead. A man-portable helical rail cannon; favorite weapon of Terran shock troops and anti-tank personnel."
	icon = 'icons/obj/guns/railgun_adv.dmi'
	icon_state = "railgun-tcc"

	cell = /obj/item/cell/hyper // Standard power
	capacitor = /obj/item/stock_parts/capacitor/adv // 6-8 shots
	power_cost = 280 // Same number of shots, but it'll seem to recharge slightly faster

	loaded = /obj/item/stack/material/rods
	load_type = /obj/item/stack/material/rods // The Confederation learned that chunks of metal work just as well as fancy matter cartridges - actually they dont
	projectile_type = /obj/item/projectile/bullet/magnetic
	load_sheet_max = 6 // Fewer shots per "magazine", but more abundant than matter cartridges.
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 3, TECH_MAGNET = 5)
	slowdown_worn = 1.5 // Little slower when worn

/obj/item/gun/magnetic/railgun/tcc/show_ammo(mob/user)
	var/obj/item/stack/material/rods/ammo = loaded
	if(istype(ammo))
		to_chat(user, SPAN_NOTICE("It has [ammo.amount] shots loaded."))
	else
		to_chat(user, SPAN_NOTICE("There is nothing loaded."))

/obj/item/gun/magnetic/railgun/tcc/check_ammo()
	var/obj/item/stack/material/rods/ammo = loaded
	return ammo && ammo.amount

/obj/item/gun/magnetic/railgun/tcc/out_of_ammo()
	QDEL_NULL(loaded)
	loaded = null
	spawn(3)
		playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 1)
	visible_message(SPAN_WARNING("\The [src] beeps, before clanging as the ammunition bank resets."))

/obj/item/gun/magnetic/railgun/tcc/use_ammo()
	var/obj/item/stack/material/rods/ammo = loaded
	ammo.use(1)
	if(!istype(ammo))
		out_of_ammo()

// Adminspawn only, this shit is absurd.
/obj/item/gun/magnetic/railgun/automatic
	name = "\improper LMRA autocannon"
	desc = "The HelTek Arms LMRA-14A Meteor. Originally a vehicle-mounted turret weapon used by the Terran Government in the Gaia Conflict for anti-vehicular operations, the fact that it was made man-portable is mindboggling in itself."
	icon = 'icons/obj/guns/railgun_heavy.dmi'
	icon_state = "heavy_railgun"

	capacitor = /obj/item/stock_parts/capacitor/super
	projectile_type = /obj/item/projectile/bullet/magnetic/slug/super

	fire_delay =  8
	slowdown_held = 3
	slowdown_worn = 2
	accuracy = 0

	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_NO_CONTAINER

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round burst", burst=3, fire_delay=null, one_hand_penalty=2, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="full auto", burst=1, fire_delay=0, burst_delay=2, one_hand_penalty=3, burst_accuracy=list(0,-1,-2), dispersion=list(0.2, 0.8, 1.2), autofire_enabled=1)
		)

/obj/item/gun/magnetic/railgun/automatic/examine(mob/user, distance)
	. = ..()
	if(distance <= 1)
		to_chat(user, SPAN_NOTICE("Someone has scratched <i>Ultima Ratio Regum</i> onto the side of the barrel."))

/obj/item/gun/magnetic/railgun/automatic/mmi
	name = "\improper RHR accelerator"
	desc = "The Mars Military Industries MI-227 Meteor. Originally a vehicle-mounted turret weapon for heavy anti-vehicular and anti-structural fire, the fact that it was made man-portable is mindboggling in itself."
	icon = 'icons/obj/guns/railgun_old_heavy.dmi'
	icon_state = "old_heavy_railgun"

// I felt like we could use some bullshit weapon design
/obj/item/gun/magnetic/railgun/automatic/dominion
	name = "\improper ST-410 railgun"
	desc = "A standard-issue railgun used by shock troopers of the Terran Dominion during third expansion era. The power of that level was never meant to be in the hands of humans..."
	fire_delay = 2
	slowdown_held = 1.5
	slowdown_worn = 0.5

	power_cost = 50
	cell = /obj/item/cell/hyper
	capacitor = /obj/item/stock_parts/capacitor/super

	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 6, TECH_MAGNET = 8, TECH_DOMINION = 5)

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=null),
		list(mode_name="5-round burst", burst=5, fire_delay=null, one_hand_penalty=4, burst_accuracy=list(0),       dispersion=list(0.0, 0.2, 0.4)),
		list(mode_name="full auto", burst=1, fire_delay=0, burst_delay=0.2, one_hand_penalty=8, burst_accuracy=list(0), dispersion=list(0.1, 0.2, 0.3), autofire_enabled=1)
		)

/obj/item/gun/magnetic/railgun/flechette
	name = "flechette gun"
	desc = "The MI-12 Skadi is a burst fire capable railgun that fires flechette rounds at high velocity. Deadly against armour, but much less effective against soft targets."
	icon = 'icons/obj/guns/flechette.dmi'
	icon_state = "flechette_gun"
	item_state = "z8carbine"
	one_hand_penalty = 2
	fire_delay = 8
	removable_components = FALSE
	cell = /obj/item/cell/hyper
	capacitor = /obj/item/stock_parts/capacitor/adv
	slot_flags = SLOT_BACK
	power_cost = 100
	load_type = /obj/item/magnetic_ammo
	projectile_type = /obj/item/projectile/bullet/magnetic/flechette
	loaded = /obj/item/magnetic_ammo
	wielded_item_state = "z8carbine-wielded"

	firemodes = list(
		list(mode_name="semiauto",    burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=5,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		)

/obj/item/gun/magnetic/railgun/flechette/out_of_ammo()
	visible_message(SPAN_WARNING("\The [src] beeps to indicate the magazine is empty."))


/obj/item/gun/magnetic/railgun/flechette/skrell
	name = "skrellian rifle"
	desc = "The Zquiv*Tzuuli-8, or ZT-8, is a railgun rarely seen by anyone other than those within Skrellian SDTF ranks. The rotary magazine houses a cylinder with individual chambers, that press against the barrel when loaded."
	icon = 'icons/obj/guns/skrell_rifle.dmi'
	icon_state = "skrell_rifle"
	item_state = "skrell_rifle"
	one_hand_penalty = 3
	fire_delay = 10
	slowdown_held = 1
	slowdown_worn = 1
	removable_components = FALSE
	cell = /obj/item/cell/hyper
	capacitor = /obj/item/stock_parts/capacitor/adv
	load_type = /obj/item/magnetic_ammo/skrell
	loaded = /obj/item/magnetic_ammo/skrell/slug
	projectile_type = /obj/item/projectile/bullet/magnetic/slug
	slot_flags = SLOT_BACK
	power_cost = 100
	wielded_item_state = "skrell_rifle-wielded"
	firemodes = list()
