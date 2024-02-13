/* Access Datums */

/var/const/access_bunker = "ACCESS_BUNKER"
/datum/access/bunker
	id = access_bunker
	desc = "ISC Bunker"
	region = ACCESS_REGION_NONE
	access_type = ACCESS_TYPE_NONE

/var/const/access_bunker_security = "ACCESS_BUNKER_SECURITY"
/datum/access/bunker_security
	id = access_bunker_security
	desc = "ISC Bunker Security"
	region = ACCESS_REGION_NONE
	access_type = ACCESS_TYPE_NONE

/var/const/access_bunker_armory = "ACCESS_BUNKER_ARMORY"
/datum/access/bunker_armory
	id = access_bunker_armory
	desc = "ISC Bunker Armory"
	region = ACCESS_REGION_NONE
	access_type = ACCESS_TYPE_NONE

/* ID Cards */

/obj/item/card/id/bunker
	name = "bunker identification card"
	desc = "An identification card issued to inhabitants of ISC bunker #129."
	access = list(access_bunker)

/obj/item/card/id/bunker/security
	rank = "Bunker Security"
	assignment = "Bunker Security"
	detail_color = "#e00000"
	access = list(access_bunker, access_bunker_security)

/obj/item/card/id/bunker/security/warden
	rank = "Bunker Warden"
	assignment = "Bunker Warden"
	detail_color = "#ee0000"
	access = list(access_bunker, access_bunker_security, access_bunker_armory)
