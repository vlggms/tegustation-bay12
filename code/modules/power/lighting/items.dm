// The light item
// Can be tube or bulb subtypes
// Will fit into empty /obj/machinery/light of the corresponding type
/obj/item/light
	icon = 'icons/obj/lighting.dmi'
	force = 2
	throwforce = 5
	w_class = ITEM_SIZE_TINY
	var/status = 0		// LIGHT_OK, LIGHT_BURNED or LIGHT_BROKEN
	var/base_state
	var/switchcount = 0	// number of times switched
	matter = list(MATERIAL_STEEL = 60)
	var/broken_chance = 2
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CAN_BE_PAINTED

	var/b_max_bright = 0.9
	var/b_inner_range = 2
	var/b_outer_range = 6
	var/b_curve = 2
	var/b_colour = "#ffffff"
	var/list/lighting_modes = list()
	var/sound_on
	var/random_tone = FALSE
	var/list/random_tone_options = list(
		"#ffffff",
		"#fffee0",
		"#e0fefe",
		"#fefefe",
	)

/obj/item/light/Initialize()
	. = ..()
	if(random_tone)
		b_colour = pick(random_tone_options)
		color = b_colour
	update_icon()

// Attack bulb/tube with object
// If a syringe, can inject phoron to make it explode
/obj/item/light/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/reagent_containers/syringe) && status == LIGHT_OK)
		var/obj/item/reagent_containers/syringe/S = I
		if(S.reagents.total_volume)
			if(!reagents)
				create_reagents(5)
				S.reagents.trans_to_obj(src, 5)
				to_chat(user, SPAN_WARNING("You inject the solution into [src]."))
				if(reagents.get_reagent_amount(/datum/reagent/toxin/phoron) >= LIGHT_PHORON_EXPLODE_THRESHOLD)
					log_and_message_admins("injected a light with phoron, rigging it to explode.", user)
				return
			to_chat(user, SPAN_WARNING("\The [src] is already filled with fluid!"))
			return
		to_chat(user, SPAN_WARNING("\The [S] is empty."))
		return
	. = ..()

// Update the icon state and description of the light
/obj/item/light/on_update_icon()
	color = b_colour
	var/broken
	switch(status)
		if(LIGHT_OK)
			icon_state = base_state
			desc = "A replacement [name]."
		if(LIGHT_BURNED)
			icon_state = "[base_state]_burned"
			desc = "A burnt-out [name]."
		if(LIGHT_BROKEN)
			icon_state = "[base_state]_broken"
			desc = "A broken [name]."
			broken = TRUE
	var/image/I = image(icon, src, "[base_state]_attachment[broken ? "_broken" : ""]")
	I.color = null
	overlays += I

/obj/item/light/examine(mob/user)
	. = ..()
	if(reagents?.total_volume && Adjacent(user))
		to_chat(user, SPAN_WARNING("There's some sort of fluid inside [src]."))

/obj/item/light/get_color()
	return b_colour

/obj/item/light/set_color(color)
	b_colour = isnull(color) ? COLOR_WHITE : color
	update_icon()

// called after an attack with a light item
// shatter light, unless it was an attempt to put it in a light socket
// now only shatter if the intent was harm

/obj/item/light/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return
	if(istype(target, /obj/machinery/light))
		return
	if(user.a_intent != I_HURT)
		return

	shatter()

/obj/item/light/proc/shatter()
	if(status == LIGHT_OK || status == LIGHT_BURNED)
		visible_message(SPAN_WARNING("[src] shatters!"), SPAN_WARNING("You hear a small glass object shatter."))
		status = LIGHT_BROKEN
		force = 5
		sharp = TRUE
		playsound(loc, "glasscrack", 75, TRUE)
		update_icon()

/obj/item/light/proc/switch_on()
	switchcount++
	if(reagents)
		if (reagents.get_reagent_amount(/datum/reagent/toxin/phoron) >= LIGHT_PHORON_EXPLODE_THRESHOLD)
			visible_message(SPAN_DANGER("[src] flares brilliantly!"), SPAN_DANGER("You hear a loud crack!"))
			log_and_message_admins("Rigged light explosion, last touched by [fingerprintslast]")
			var/turf/T = get_turf(loc)
			status = LIGHT_BROKEN
			spawn(0)
				sleep(2)
				explosion(T, 0, 0, 3, 5)
		else
			visible_message(SPAN_WARNING("[src] short-circuits as something burns out its filament!"))
			status = LIGHT_BURNED
			if (sound_on)
				playsound(src, sound_on, 100)
	else if(prob(min(60, switchcount*switchcount*0.01)))
		status = LIGHT_BURNED
	else if(sound_on)
		playsound(src, sound_on, 75)
	return status

/obj/item/light/tube
	name = "light tube"
	desc = "A replacement light tube."
	icon_state = "ltube"
	base_state = "ltube"
	item_state = "c_tube"
	matter = list(MATERIAL_GLASS = 100, MATERIAL_ALUMINIUM = 20)

	lighting_modes = list(
		LIGHTMODE_EMERGENCY = list(l_outer_range = 4, l_max_bright = 1, l_color = "#da0205"),
		)
	sound_on = 'sound/machines/lightson.ogg'

// Subtypes for mapping
// Blue-ish color for use in medical areas
/obj/item/light/tube/medbay
	desc = "A replacement light tube. This one is meant to be used in sterile/medical areas."
	color = "#e0fefe"
	b_colour = "#e0fefe"

// Yellow-ish color
/obj/item/light/tube/yellowish
	desc = "A replacement light tube. This one has a yellow tint to it."
	color = "#fffee0"
	b_colour = "#fffee0"

// DYSTOPIAN GREEN-BLUE COLOR OF CORPORATE OFFICES!
/obj/item/light/tube/dystopian
	desc = "A replacement light tube. This one is meant to be used in a corporate office where you will spend your life doing meaningless, soul-consuming paperwork."
	color = "#addbbe"
	b_colour = "#addbbe"

/obj/item/light/tube/party/Initialize() //Randomly colored light tubes. Mostly for testing, but maybe someone will find a use for them.
	. = ..()
	b_colour = rgb(pick(0,255), pick(0,255), pick(0,255))
	color = b_colour

/obj/item/light/tube/skrell
	name = "skrellian light filament"
	desc = "Some kind of strange alien lightbulb technology."
	color = COLOR_LIGHT_CYAN
	b_colour = COLOR_LIGHT_CYAN

/obj/item/light/tube/large
	w_class = ITEM_SIZE_SMALL
	name = "large light tube"
	b_max_bright = 1
	b_inner_range = 3
	b_outer_range = 9
	b_curve = 2.5

/obj/item/light/tube/large/skrell
	name = "skrellian light filament"
	desc = "Some kind of strange alien lightbulb technology."
	color = COLOR_LIGHT_CYAN
	b_colour = COLOR_LIGHT_CYAN

// Randomly colored light tubes. Mostly for testing, but maybe someone will find a use for them.
/obj/item/light/tube/large/party/Initialize()
	. = ..()
	b_colour = rgb(pick(0,255), pick(0,255), pick(0,255))


/* Bulbs are used for small fixtures */
/obj/item/light/bulb
	name = "light bulb"
	desc = "A replacement light bulb."
	icon_state = "lbulb"
	base_state = "lbulb"
	item_state = "contvapour"
	broken_chance = 3
	matter = list(MATERIAL_GLASS = 100)

	b_max_bright = 0.7
	b_inner_range = 0.5
	b_outer_range = 4
	b_curve = 3
	b_colour = "#fcfcc7"
	lighting_modes = list(
		LIGHTMODE_EMERGENCY = list(l_outer_range = 3, l_max_bright = 1, l_color = "#da0205"),
		)

// Subtypes for mapping
/obj/item/light/bulb/red
	color = "#da0205"
	b_colour = "#da0205"
	random_tone = FALSE

/obj/item/light/bulb/red/readylight
	lighting_modes = list(
		LIGHTMODE_READY = list(l_outer_range = 5, l_max_bright = 1, l_color = "#00ff00"),
		)

/obj/item/light/throw_impact(atom/hit_atom)
	..()
	shatter()

/obj/item/light/bulb/fire
	name = "fire bulb"
	desc = "A replacement fire bulb."
	icon_state = "fbulb"
	base_state = "fbulb"
	item_state = "egg4"
	matter = list(MATERIAL_GLASS = 100)

/obj/item/light/bulb/medbay
	desc = "A replacement light bulb. This one is meant to be used in sterile/medical areas."
	color = "#e0fefe"
	b_colour = "#e0fefe"

/obj/item/light/bulb/yellowish
	desc = "A replacement light bulb. This one has a yellow tint to it."
	color = "#fffee0"
	b_colour = "#fffee0"

/obj/item/light/bulb/dystopian
	desc = "A replacement light bulb. This one is meant to be used in a corporate office where you will spend your life doing meaningless, soul-consuming paperwork."
	color = "#addbbe"
	b_colour = "#addbbe"
