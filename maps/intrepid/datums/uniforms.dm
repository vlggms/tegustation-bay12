/decl/hierarchy/mil_uniform
	name = "Master outfit hierarchy"
	hierarchy_type = /decl/hierarchy/mil_uniform
	var/list/branches = null
	var/departments = 0
	var/min_rank = 0

	var/pt_under = null
	var/pt_shoes = null

	var/utility_under = null
	var/utility_shoes = null
	var/utility_hat = null
	var/utility_extra = null

	var/service_under = null
	var/service_skirt = null
	var/service_over = null
	var/service_shoes = null
	var/service_hat = null
	var/service_gloves = null
	var/service_extra = null

	var/dress_under = null
	var/dress_skirt = null
	var/dress_over = null
	var/dress_shoes = null
	var/dress_hat = null
	var/dress_gloves = null
	var/dress_extra = null

/decl/hierarchy/mil_uniform/ec
	name = "Master EC outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/ec
	branches = list(/datum/mil_branch/exploration_division)

	utility_under = /obj/item/clothing/under/terragov/utility/exploration
	utility_shoes = /obj/item/clothing/shoes/dutyboots
	utility_hat = /obj/item/clothing/head/soft/terragov/exploration
	utility_extra = list(/obj/item/clothing/head/beret/terragov/exploration, /obj/item/clothing/head/ushanka/tg, /obj/item/clothing/suit/storage/hooded/wintercoat/terragov, /obj/item/clothing/shoes/jackboots/unathi)

	service_over = /obj/item/clothing/suit/storage/terragov/service/exploration
	service_shoes = /obj/item/clothing/shoes/terran
	service_hat = /obj/item/clothing/head/terragov/service/exploration

	dress_under = /obj/item/clothing/under/terragov/dress/exploration
	dress_skirt = /obj/item/clothing/under/terragov/dress/exploration/skirt
	dress_over = /obj/item/clothing/suit/storage/terragov/dress/exploration
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_hat = /obj/item/clothing/head/terragov/service/exploration
	dress_gloves = /obj/item/clothing/gloves/white

/*
/decl/hierarchy/mil_uniform/fleet
	name = "Master fleet outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/fleet
	branches = list(/datum/mil_branch/fleet)

	pt_under = /obj/item/clothing/under/terragov/pt/fleet
	pt_shoes = /obj/item/clothing/shoes/black

	utility_under = /obj/item/clothing/under/terragov/utility/fleet
	utility_shoes = /obj/item/clothing/shoes/dutyboots
	utility_hat = /obj/item/clothing/head/terragov/utility/fleet
	utility_extra = list(/obj/item/clothing/head/beret/terragov/fleet, /obj/item/clothing/head/ushanka/terragov/fleet, /obj/item/clothing/suit/storage/hooded/wintercoat/terragov/fleet,/obj/item/clothing/head/soft/terragov/fleet)

	service_under = /obj/item/clothing/under/terragov/service/fleet
	service_skirt = /obj/item/clothing/under/terragov/service/fleet/skirt
	service_over = null
	service_shoes = /obj/item/clothing/shoes/dress
	service_hat = /obj/item/clothing/head/terragov/dress/fleet/garrison

	dress_under = /obj/item/clothing/under/terragov/service/fleet
	dress_skirt = /obj/item/clothing/under/terragov/service/fleet/skirt
	dress_over = /obj/item/clothing/suit/dress/terragov/fleet/sailor
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_hat = /obj/item/clothing/head/terragov/dress/fleet/garrison
	dress_gloves = /obj/item/clothing/gloves/white

/decl/hierarchy/mil_uniform/civilian
	name = "Master civilian outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/civilian
	branches = list(/datum/mil_branch/civilian,/datum/mil_branch/terragov)

	service_under = /obj/item/clothing/under/suit_jacket/really_black
	service_skirt = /obj/item/clothing/under/skirt_c/dress/black
	service_shoes = /obj/item/clothing/shoes/dress
	service_extra = list(/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/shoes/heels/black, /obj/item/clothing/shoes/heels/red)

	dress_under = /obj/item/clothing/under/rank/internalaffairs/plain
	dress_skirt = /obj/item/clothing/under/skirt_c/dress/long/black
	dress_over = /obj/item/clothing/suit/storage/toggle/suit/black
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_extra = list(/obj/item/clothing/accessory/wcoat/black, /obj/item/clothing/under/skirt_c/dress/long/eggshell, /obj/item/clothing/shoes/flats/black)
*/