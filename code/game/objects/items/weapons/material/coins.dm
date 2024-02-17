/obj/item/material/coin
	name = "coin"
	icon = 'icons/obj/coin.dmi'
	icon_state = "coin1"
	applies_material_colour = TRUE
	randpixel = 8
	force = 1
	throwforce = 1
	max_force = 5
	force_multiplier = 0.1
	thrown_force_multiplier = 0.1
	w_class = 1
	slot_flags = SLOT_EARS
	var/string_colour
	// Sound played when used in hand to "flip" it
	var/flip_sound = 'sound/effects/coin_flip1.ogg'
	// Sound played on thrown impact
	var/fall_sound = 'sound/effects/coin_flip2.ogg'
	// How loud are the sounds produced by it
	var/sound_volume = 35

/obj/item/material/coin/Initialize()
	. = ..()
	icon_state = "coin[rand(1,10)]"

/obj/item/material/coin/on_update_icon()
	..()
	if(!isnull(string_colour))
		var/image/I = image(icon = icon, icon_state = "coin_string_overlay")
		I.appearance_flags |= RESET_COLOR
		I.color = string_colour
		overlays += I
	else
		overlays.Cut()

/obj/item/material/coin/attackby(obj/item/W, mob/user)
	if(isCoil(W) && isnull(string_colour))
		var/obj/item/stack/cable_coil/CC = W
		if(CC.use(1))
			string_colour = CC.color
			to_chat(user, "<span class='notice'>You attach a string to the coin.</span>")
			update_icon()
			return
	else if(isWirecutter(W) && !isnull(string_colour))
		new /obj/item/stack/cable_coil/single(get_turf(user))
		string_colour = null
		to_chat(user, "<span class='notice'>You detach the string from the coin.</span>")
		update_icon()
	else ..()

/obj/item/material/coin/attack_self(mob/user)
	user.visible_message("<span class='notice'>\The [user] has thrown \the [src]. It lands on [rand(1, 2) == 1 ? "tails" : "heads"]!</span>")
	playsound(user, flip_sound, sound_volume, TRUE)

/obj/item/material/coin/throw_impact(atom/hit_atom, datum/thrownthing/TT)
	. = ..()
	var/turf/T = get_turf(hit_atom)
	if(!istype(T))
		return

	playsound(T, fall_sound, sound_volume, TRUE)

// Subtypes.
/obj/item/material/coin/gold
	default_material = MATERIAL_GOLD
	sound_volume = 65 // Very shiny

/obj/item/material/coin/silver
	default_material = MATERIAL_SILVER
	sound_volume = 50

/obj/item/material/coin/diamond
	default_material = MATERIAL_DIAMOND
	sound_volume = 80

/obj/item/material/coin/iron
	default_material = MATERIAL_IRON

/obj/item/material/coin/uranium
	default_material = MATERIAL_URANIUM

/obj/item/material/coin/platinum
	default_material = MATERIAL_PLATINUM

/obj/item/material/coin/phoron
	default_material = MATERIAL_PHORON
