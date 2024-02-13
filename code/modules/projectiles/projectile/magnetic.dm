// Rod for railguns. Slightly less nasty than the sniper round.
/obj/item/projectile/bullet/magnetic
	name = "rod"
	icon_state = "rod"
	damage = 55
	penetrating = 5
	armor_penetration = 65
	penetration_modifier = 1.1
	fire_sound = 'sound/weapons/gunshot/railgun.ogg'
	distance_falloff = 1

/obj/item/projectile/bullet/magnetic/slug
	name = "slug"
	icon_state = "gauss_silenced"
	damage = 115
	armor_penetration = 90

// Used by those "automatic" railguns; The most powerful projectile in the game
/obj/item/projectile/bullet/magnetic/slug/super
	name = "anti-tank slug"
	icon_state = "gauss"
	damage = 250
	armor_penetration = 90
	fire_sound = 'sound/weapons/gunshot/railgun_2.ogg'

/obj/item/projectile/bullet/magnetic/flechette
	name = "flechette"
	icon_state = "flechette"
	damage = 35
	armor_penetration = 100
	fire_sound = 'sound/weapons/rapidslice.ogg'
	distance_falloff = 0.5
