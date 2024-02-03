#define HOLOMAP_LEGEND_STYLING(X) SPAN_STYLE("font-family: 'Small Fonts'; font-size: 7px;", X)

/obj/screen/holomap_text
	icon = null
	layer = HUD_ITEM_LAYER
	maptext_width = 96

/obj/screen/holomap_text/Initialize()
	. = ..()
	appearance_flags |= RESET_COLOR

/obj/screen/holomap_level_select
	icon = 'icons/misc/mark.dmi'
	layer = HUD_ITEM_LAYER
	var/active = TRUE
	var/datum/station_holomap/holomap

/obj/screen/holomap_level_select/Initialize(mapload, mob/_owner, ui_style, ui_color, ui_alpha, datum/station_holomap/_holomap)
	. = ..()
	holomap = _holomap

/obj/screen/holomap_level_select/Click()
	return (!usr.incapacitated() && !isghost(usr))

/obj/screen/holomap_level_select/up
	icon_state = "fup"

/obj/screen/holomap_level_select/up/Click()
	if(..() && holomap)
		holomap.set_level(holomap.displayed_level - 1)

/obj/screen/holomap_level_select/down
	icon_state = "fdn"

/obj/screen/holomap_level_select/down/Click()
	if(..() && holomap)
		holomap.set_level(holomap.displayed_level + 1)

/obj/screen/holomap_legend
	icon = null
	maptext_height = 128
	maptext_width = 128
	layer = HUD_ITEM_LAYER
	pixel_x = HOLOMAP_LEGEND_X
	appearance_flags = DEFAULT_APPEARANCE_FLAGS | RESET_COLOR
	var/saved_color
	var/datum/station_holomap/holomap = null
	var/has_areas = FALSE

/obj/screen/holomap_legend/cursor
	icon = 'icons/misc/holomap_markers.dmi'
	icon_state = "you"
	maptext_x = 11
	pixel_x = HOLOMAP_LEGEND_X - 3
	has_areas = TRUE

/obj/screen/holomap_legend/Initialize(mapload, mob/_owner, ui_style, ui_color, ui_alpha, map_color, text)
	. = ..()
	color = map_color
	saved_color = map_color
	maptext = "<a href='?src=\ref[src]' style='color: #ffffff'>[HOLOMAP_LEGEND_STYLING(text)]</a>"
	alpha = 254

/obj/screen/holomap_legend/Click()
	if(!usr.incapacitated() && !isghost(usr) && istype(holomap))
		holomap.legend_select(src)

/obj/screen/holomap_legend/proc/Setup(z_level)
	has_areas = FALSE
	//Get the areas for this z level and mark if we're empty
	overlays.Cut()
	for(var/area/A in SSminimap.holomaps[z_level].holomap_areas)
		if(A.holomap_color == saved_color)
			var/image/area = image(SSminimap.holomaps[z_level].holomap_areas[A])
			area.pixel_x = ((HOLOMAP_ICON_SIZE / 2) - WORLD_CENTER_X) - pixel_x
			area.pixel_y = ((HOLOMAP_ICON_SIZE / 2) - WORLD_CENTER_Y) - pixel_y
			overlays += area
			has_areas = TRUE

//What happens when we are clicked on / when another is clicked on
/obj/screen/holomap_legend/proc/Select()
	//Start blinking
	animate(src, alpha = 0, time = 2, loop = -1, easing = JUMP_EASING | EASE_IN | EASE_OUT)
	animate(alpha = 254, time = 2, loop = -1, easing = JUMP_EASING | EASE_IN | EASE_OUT)

/obj/screen/holomap_legend/proc/Deselect()
	//Stop blinking
	animate(src, flags = ANIMATION_END_NOW)

//Cursor doesnt do anything specific.
/obj/screen/holomap_legend/cursor/Setup()
	return

/obj/screen/holomap_legend/cursor/Select()
	return

/obj/screen/holomap_legend/cursor/Deselect()
	return

#undef HOLOMAP_LEGEND_STYLING
