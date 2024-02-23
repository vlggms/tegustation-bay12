// Pistol
/obj/item/ammo_casing/pistol
	desc = "A pistol bullet casing."
	caliber = CALIBER_PISTOL
	projectile_type = /obj/item/projectile/bullet/pistol
	icon_state = "pistolcasing"
	spent_icon = "pistolcasing-spent"

/obj/item/ammo_casing/pistol/flame
	desc = "A incendiary pistol bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/flame
	icon_state = "pistolcasing_fi" // fi = fireIncendiary

/obj/item/ammo_casing/pistol/rubber
	desc = "A rubber pistol bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber
	icon_state = "pistolcasing_r"

/obj/item/ammo_casing/pistol/practice
	desc = "A practice pistol bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/practice
	icon_state = "pistolcasing_p"

/obj/item/ammo_casing/pistol/small
	desc = "A small pistol bullet casing."
	caliber = CALIBER_PISTOL_SMALL
	projectile_type = /obj/item/projectile/bullet/pistol/holdout
	icon_state = "smallcasing"
	spent_icon = "smallcasing-spent"

/obj/item/ammo_casing/pistol/small/rubber
	desc = "A small pistol rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber/holdout
	icon_state = "pistolcasing_r"

/obj/item/ammo_casing/pistol/small/practice
	desc = "A small pistol practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/practice
	icon_state = "pistolcasing_p"

/obj/item/ammo_casing/pistol/magnum
	desc = "A high-power pistol bullet casing."
	caliber = CALIBER_PISTOL_MAGNUM
	projectile_type = /obj/item/projectile/bullet/pistol/strong
	icon_state = "magnumcasing"
	spent_icon = "magnumcasing-spent"

/obj/item/ammo_casing/pistol/throwback
	desc = "An antique pistol bullet casing. Somewhere between 9 and 11 mm in caliber."
	caliber = CALIBER_PISTOL_ANTIQUE

// Revolver
/obj/item/ammo_casing/revolver
	desc = "A revolver bullet casing."
	icon_state = "magnumcasing"
	spent_icon = "magnumcasing-spent"
	caliber = CALIBER_REVOLVER
	projectile_type = /obj/item/projectile/bullet/revolver

/obj/item/ammo_casing/revolver/rubber
	desc = "A small rubber pellet."
	caliber = CALIBER_REVOLVER
	projectile_type = /obj/item/projectile/bullet/revolver/rubber

/obj/item/ammo_casing/revolver/small
	desc = "A small revolver bullet casing."
	caliber = CALIBER_REVOLVER_SMALL
	projectile_type = /obj/item/projectile/bullet/revolver/small

/obj/item/ammo_casing/revolver/medium
	caliber = CALIBER_REVOLVER_MEDIUM
	projectile_type = /obj/item/projectile/bullet/revolver/medium

/obj/item/ammo_casing/revolver/heavy
	desc = "A high-power revolver bullet casing."
	caliber = CALIBER_REVOLVER_HEAVY
	projectile_type = /obj/item/projectile/bullet/revolver/heavy

// SMG
/obj/item/ammo_casing/smg
	desc = "An SMG bullet casing."
	caliber = CALIBER_SMG
	projectile_type = /obj/item/projectile/bullet/smg
	icon_state = "pistolcasing"
	spent_icon = "pistolcasing-spent"

/obj/item/ammo_casing/smg/rubber
	desc = "A rubber SMG bullet casing."
	projectile_type = /obj/item/projectile/bullet/smg/rubber
	icon_state = "pistolcasing_r"

/obj/item/ammo_casing/smg/flame
	desc = "An incendiary SMG bullet casing."
	projectile_type = /obj/item/projectile/bullet/smg/flame
	icon_state = "pistolcasing_fi"

/obj/item/ammo_casing/smg/small
	desc = "A small SMG bullet casing."
	caliber = CALIBER_SMG_SMALL
	projectile_type = /obj/item/projectile/bullet/smg/small

/obj/item/ammo_casing/smg/small/rubber
	desc = "A small rubber SMG bullet casing."
	projectile_type = /obj/item/projectile/bullet/smg/small/rubber
	icon_state = "pistolcasing_r"

/obj/item/ammo_casing/smg/small/practice
	desc = "A small practice SMG bullet casing."
	projectile_type = /obj/item/projectile/bullet/smg/small/practice
	icon_state = "pistolcasing_p"

/obj/item/ammo_casing/smg/flechette
	desc = "An SMG flechette casing."
	caliber = CALIBER_SMG_FLECHETTE
	projectile_type = /obj/item/projectile/bullet/smg/flechette
	icon_state = "flechette-casing"
	spent_icon = "flechette-casing-spent"

/obj/item/ammo_casing/smg/flechette/hp
	desc = "An SMG flechette (HP) casing."
	projectile_type = /obj/item/projectile/bullet/smg/flechette/hp

// Special
/obj/item/ammo_casing/gyrojet
	desc = "A minirocket casing."
	caliber = CALIBER_GYROJET
	projectile_type = /obj/item/projectile/bullet/gyro
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"

// Shotgun
/obj/item/ammo_casing/shotgun
	name = "shotgun slug"
	desc = "A shotgun slug."
	icon_state = "slshell"
	spent_icon = "slshell-spent"
	caliber = CALIBER_SHOTGUN
	projectile_type = /obj/item/projectile/bullet/shotgun
	matter = list(MATERIAL_STEEL = 360)
	fall_sounds = list('sound/weapons/guns/shotgun_fall.ogg')

/obj/item/ammo_casing/shotgun/flame //dragons breath
	desc = "A incendiary shotgun slug."
	projectile_type = /obj/item/projectile/bullet/shotgun/flame
	icon_state = "fishell"
	spent_icon = "fishell-spent"

/obj/item/ammo_casing/shotgun/pellet
	name = "shotgun shell"
	desc = "A shotshell."
	icon_state = "gshell"
	spent_icon = "gshell-spent"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun
	matter = list(MATERIAL_STEEL = 360)

/obj/item/ammo_casing/shotgun/blank
	name = "shotgun shell"
	desc = "A blank shell."
	icon_state = "blshell"
	spent_icon = "blshell-spent"
	projectile_type = /obj/item/projectile/bullet/blank
	matter = list(MATERIAL_STEEL = 90)

/obj/item/ammo_casing/shotgun/practice
	name = "shotgun shell"
	desc = "A practice shell."
	icon_state = "pshell"
	spent_icon = "pshell-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/practice
	matter = list(MATERIAL_STEEL = 90)

/obj/item/ammo_casing/shotgun/beanbag
	name = "beanbag shell"
	desc = "A beanbag shell."
	icon_state = "bshell"
	spent_icon = "bshell-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/beanbag
	matter = list(MATERIAL_STEEL = 180)

// Can stun in one hit if aimed at the head, but
// is blocked by clothing that stops tasers and is vulnerable to EMP
/obj/item/ammo_casing/shotgun/stunshell
	name = "stun shell"
	desc = "An energy stun cartridge."
	icon_state = "stunshell"
	spent_icon = "stunshell-spent"
	projectile_type = /obj/item/projectile/energy/electrode/stunshot
	leaves_residue = FALSE
	matter = list(MATERIAL_STEEL = 360, MATERIAL_GLASS = 720)

/obj/item/ammo_casing/shotgun/stunshell/emp_act(severity)
	if(prob(100/severity)) BB = null
	update_icon()

// Does not stun, only blinds, but has area of effect.
/obj/item/ammo_casing/shotgun/flash
	name = "flash shell"
	desc = "A chemical shell used to signal distress or provide illumination."
	icon_state = "fshell"
	spent_icon = "fshell-spent"
	projectile_type = /obj/item/projectile/energy/flash/flare
	matter = list(MATERIAL_STEEL = 90, MATERIAL_GLASS = 90)

// Rifle
/obj/item/ammo_casing/rifle
	desc = "A rifle bullet casing."
	caliber = CALIBER_RIFLE
	projectile_type = /obj/item/projectile/bullet/rifle
	icon_state = "riflecasing"
	spent_icon = "riflecasing-spent"

/obj/item/ammo_casing/rifle/flame
	desc = "A incendiary rifle bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/flame
	icon_state = "riflecasing_fi"

// Antimatter rifle
/obj/item/ammo_casing/shell
	name = "shell casing"
	desc = "An antimaterial shell casing."
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"
	caliber = CALIBER_ANTIMATERIAL
	projectile_type = /obj/item/projectile/bullet/rifle/shell
	matter = list(MATERIAL_STEEL = 1250, MATERIAL_DIAMOND = 250)

/obj/item/ammo_casing/shell/apds
	name = "\improper APDS shell casing"
	desc = "An Armour Piercing Discarding Sabot antimaterial shell."
	projectile_type = /obj/item/projectile/bullet/rifle/shell/apds
	matter = list(MATERIAL_STEEL = 1750, MATERIAL_DIAMOND = 750)

/obj/item/ammo_casing/shell/explosive
	name = "explosive shell casing"
	desc = "An explosive antimaterial shell."
	projectile_type = /obj/item/projectile/bullet/rifle/shell/explosive
	matter = list(MATERIAL_STEEL = 1500, MATERIAL_PHORON = 1250, MATERIAL_DIAMOND = 250)

// "Military" rifle
/obj/item/ammo_casing/rifle/military
	desc = "A military rifle bullet casing."
	caliber = CALIBER_RIFLE_MILITARY
	projectile_type = /obj/item/projectile/bullet/rifle/military
	icon_state = "rifle_mil"
	spent_icon = "rifle_mil-spent"

/obj/item/ammo_casing/rifle/military/flame
	projectile_type = /obj/item/projectile/bullet/rifle/military/flame

/obj/item/ammo_casing/rifle/military/practice
	desc = "A military rifle practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/military/practice
	icon_state = "rifle_mil_p"

/obj/item/ammo_casing/rifle/t12
	caliber = CALIBER_T12
	projectile_type = /obj/item/projectile/bullet/rifle/t12

/obj/item/ammo_casing/rifle/t18
	caliber = CALIBER_T12
	projectile_type = /obj/item/projectile/bullet/rifle/t18

/obj/item/ammo_casing/rifle/ak47
	caliber = CALIBER_AK47
	projectile_type = /obj/item/projectile/bullet/rifle/ak47

/obj/item/ammo_casing/rifle/ak47/flame
	desc = "A incendiary rifle bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/ak47/flame
	icon_state = "riflecasing_fi"

// Rocket launcher
/obj/item/ammo_casing/rocket
	name = "rocket shell"
	desc = "An explosive designed to be fired from a launcher."
	icon_state = "shell_he"
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/bullet/rocket
	caliber = CALIBER_ROCKET
	fall_sounds = list()
	matter = list(MATERIAL_STEEL = 2500, MATERIAL_PHORON = 500)

/obj/item/ammo_casing/rocket/expend()
	QDEL_NULL(src)
	return

/obj/item/ammo_casing/rocket/heavy
	name = "heavy rocket shell"
	desc = "A high explosive designed to be fired from a launcher."
	projectile_type = /obj/item/projectile/bullet/rocket/heavy
	matter = list(MATERIAL_STEEL = 2500, MATERIAL_PHORON = 2500)

// The other stuff
/obj/item/ammo_casing/cap
	name = "cap"
	desc = "A cap for children toys."
	caliber = CALIBER_CAPS
	color = "#ff0000"
	projectile_type = /obj/item/projectile/bullet/pistol/cap

// EMP ammo.
/obj/item/ammo_casing/pistol/emp
	name = "haywire round"
	desc = "A pistol bullet casing fitted with a single-use ion pulse generator."
	projectile_type = /obj/item/projectile/ion/small
	icon_state = "pistolcasing_h"
	matter = list(MATERIAL_STEEL = 130, MATERIAL_URANIUM = 100)

/obj/item/ammo_casing/pistol/small/emp
	name = "small haywire round"
	desc = "A small bullet casing fitted with a single-use ion pulse generator."
	projectile_type = /obj/item/projectile/ion/tiny
	icon_state = "smallcasing_h"
	matter = list(MATERIAL_STEEL = 130, MATERIAL_URANIUM = 100)

/obj/item/ammo_casing/shotgun/emp
	name = "haywire slug"
	desc = "A 12-gauge shotgun slug fitted with a single-use ion pulse generator."
	icon_state = "empshell"
	spent_icon = "empshell-spent"
	projectile_type  = /obj/item/projectile/ion
	matter = list(MATERIAL_STEEL = 260, MATERIAL_URANIUM = 200)

/* Used bullet casings **/
/obj/item/ammo_casing/rifle/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)

/obj/item/ammo_casing/pistol/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)

/obj/item/ammo_casing/pistol/magnum/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)
