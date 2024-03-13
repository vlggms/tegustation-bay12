// Most paper will be in English
/obj/item/paper
	language = LANGUAGE_HUMAN_ENGLISH

/obj/item/stock_parts/computer/nano_printer
	print_language = LANGUAGE_HUMAN_ENGLISH

/obj/item/modular_computer/pda/explorer
	icon_state = "pda-exp"
	icon_state_unpowered = "pda-exp"

/obj/item/modular_computer/pda/heads/hop
	stored_pen = /obj/item/pen/multi/cmd/xo

/obj/item/modular_computer/pda/captain
	stored_pen = /obj/item/pen/multi/cmd/co

/***********
Unique items
***********/

/obj/item/pen/multi/cmd/xo
	name = "executive officer's pen"
	icon = 'maps/torch/icons/obj/uniques.dmi'
	icon_state = "pen_xo"
	desc = "A slightly bulky pen with a silvery case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/co
	name = "commanding officer's pen"
	icon = 'maps/torch/icons/obj/uniques.dmi'
	icon_state = "pen_co"
	desc = "A slightly bulky pen with a golden case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/attack_self(mob/user)
	if(++selectedColor > 3)
		selectedColor = 1
	colour = colors[selectedColor]
	to_chat(user, "<span class='notice'>Changed color to '[colour].'</span>")

/obj/item/storage/backpack/marine
	name = "explorer backpack"
	desc = "A rugged backpack."
	icon_state = "marpack"

/obj/item/storage/backpack/satchel/marine
	name = "explorer satchel"
	desc = "A rugged satchel for field work."
	icon_state = "satchel-mar"

/obj/item/storage/backpack/messenger/marine
	name = "explorer messenger bag"
	desc = "A rugged backpack worn over one shoulder."
	icon_state = "courierbagmar"

// Explo banner capsule access edit
/obj/item/explo_banner/terragov
	req_access = list(access_squad_leader)

/obj/effect/paint/hull
	color = COLOR_RED_GRAY

/obj/effect/paint/expeditionary
	color = "#68099e"

/turf/simulated/wall/r_wall/hull
	color = COLOR_RED_GRAY

/obj/structure/wall_frame/hull
	paint_color = COLOR_RED_GRAY
