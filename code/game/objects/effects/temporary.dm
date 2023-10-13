//temporary visual effects
/obj/effect/temp_visual
	icon = 'icons/effects/effects.dmi'
	icon_state = "nothing"
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER
	mouse_opacity = 0
	simulated = FALSE
	var/duration = 10 //in deciseconds

/obj/effect/temp_visual/Initialize(mapload, set_dir)
	if(set_dir)
		set_dir(set_dir)
	. = ..()
	QDEL_IN(src, duration)

/obj/effect/temp_visual/bloodsplatter
	icon = 'icons/effects/bloodspatter.dmi'
	duration = 5
	layer = LYING_HUMAN_LAYER
	var/splatter_type = "splatter"

/obj/effect/temp_visual/bloodsplatter/Initialize(mapload, set_dir, _color)
	if(set_dir in GLOB.cornerdirs)
		icon_state = "[splatter_type][pick(1, 2, 6)]"
	else
		icon_state = "[splatter_type][pick(3, 4, 5)]"
	. = ..()
	if (_color)
		color = _color

	var/target_pixel_x = 0
	var/target_pixel_y = 0
	if(set_dir & NORTH)
		target_pixel_y = 16
	if(set_dir & SOUTH)
		target_pixel_y = -16
		layer = ABOVE_HUMAN_LAYER
	if(set_dir & EAST)
		target_pixel_x = 16
	if(set_dir & WEST)
		target_pixel_x = -16
	animate(src, pixel_x = target_pixel_x, pixel_y = target_pixel_y, alpha = 0, time = duration)

// Attack effect

/obj/effect/temp_visual/smash
	name = "smash"
	icon_state = "smash"
	duration = 8

// Smoke effect

/obj/effect/temp_visual/smoke
	name = "smoke"
	icon_state = "smoke"
	duration = 5

// Temporary sparkles

/obj/effect/temp_visual/sparkle
	name = "sparkle"
	icon_state = "pink_sparkles"
	duration = 8

/obj/effect/temp_visual/sparkle/cyan
	icon_state = "cyan_sparkles"

// Cult effects

/obj/effect/temp_visual/cultfloor
	name = "cult floor"
	icon_state = "cultfloor"
	duration = 5

/obj/effect/temp_visual/runeconvert
	name = "rune convert"
	icon_state = "rune_convert"
	duration = 5

/obj/effect/temp_visual/decoy
	desc = "It's a decoy!"
	duration = 15

/obj/effect/temp_visual/decoy/Initialize(mapload, setdir, atom/mimiced_atom, modified_duration = 15)
	duration = modified_duration
	. = ..()
	alpha = initial(alpha)
	if(mimiced_atom)
		name = mimiced_atom.name
		appearance = mimiced_atom.appearance
		set_dir(setdir)
		mouse_opacity = 0

// Used in place of old /obj/effect/temporary where applicable.
// Do not use it for new stuff, please
/obj/effect/temp_visual/temporary/Initialize(mapload, new_dur = 5, new_icon = null, new_icon_state = null)
	duration = new_dur
	icon = new_icon
	icon_state = new_icon_state
	return ..()

/obj/effect/temp_visual/cig_smoke
	name = "smoke"
	icon_state = "smallsmoke"
	icon = 'icons/effects/effects.dmi'
	opacity = FALSE
	anchored = TRUE
	mouse_opacity = FALSE
	layer = ABOVE_HUMAN_LAYER

	duration = 3 SECONDS

/obj/effect/temp_visual/cig_smoke/Initialize()
	. = ..()
	set_dir(pick(GLOB.cardinal))
	pixel_x = rand(-12, 12)
	pixel_y = rand(0, 16)
	animate(src, alpha = 0, pixel_x = pixel_x + rand(-6, 6), pixel_y = pixel_y + 12, duration, easing = EASE_IN)

/obj/effect/temp_visual/ftl
	icon = 'icons/obj/singularity.dmi'
	icon_state = "singularity_s1"
	blend_mode = BLEND_MULTIPLY
	mouse_opacity = 0
	alpha = 0
	layer = 4
	duration = 3 SECONDS

/obj/effect/temp_visual/ftl/Initialize()
	. = ..()
	var/matrix/M1 = matrix()
	M1.Scale(2, 2)
	transform.Scale(0, 0)
	var/matrix/M2 = transform
	filters += filter(type="blur", size = 2)
	animate(src, transform = M1, alpha = 192, time = 0.5 SECONDS)
	animate(time = 2 SECONDS)
	animate(transform = M2, alpha = 0, time = 0.5 SECONDS)

/obj/effect/temp_visual/bite
	name = "bite"
	icon_state = "bite"
	icon = 'icons/effects/effects.dmi'
	opacity = FALSE
	anchored = TRUE
	mouse_opacity = FALSE
	layer = ABOVE_HUMAN_LAYER

	duration = 1 SECONDS

/obj/effect/temp_visual/bite/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/FadeOut), (duration * 0.8))

/obj/effect/temp_visual/bite/proc/FadeOut()
	animate(src, alpha = 0, (duration * 0.2))

// Used by pestilence spell
/obj/effect/temp_visual/pestilence_glow
	name = "pestilence"
	icon_state = "greenglow"
	icon = 'icons/effects/effects.dmi'
	alpha = 125
	opacity = FALSE
	anchored = TRUE
	mouse_opacity = FALSE
	layer = ABOVE_HUMAN_LAYER

	duration = 1 SECONDS

	var/max_spread_pixels = 16

/obj/effect/temp_visual/pestilence_glow/Initialize()
	. = ..()
	pixel_x = rand(-4, 4)
	pixel_y = rand(-4, 4)
	animate(src, alpha = 0, pixel_x = pixel_x + rand(-max_spread_pixels, max_spread_pixels), pixel_y = pixel_y + rand(-max_spread_pixels, max_spread_pixels), duration, easing = EASE_IN)

// The one spreading from the user
/obj/effect/temp_visual/pestilence_glow/self
	duration = 5 SECONDS
	max_spread_pixels = 64

/obj/effect/temp_visual/slash
	name = "slash"
	icon_state = "slash"
	icon = 'icons/effects/effects.dmi'
	alpha = 25
	opacity = FALSE
	anchored = TRUE
	mouse_opacity = FALSE
	layer = ABOVE_HUMAN_LAYER

	duration = 2 SECONDS

/obj/effect/temp_visual/slash/Initialize()
	. = ..()
	animate(src, alpha = 255, time = (duration * 0.25))
	animate(alpha = 0, time = (duration * 0.75))

// Used by water slash spell
/obj/effect/temp_visual/slash/water
	color = COLOR_BLUE
