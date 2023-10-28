// THE RADIOACTIVE MICROLASER

/obj/item/device/scanner/health/radioactive_microlaser //a health scanner that will give you aids and radiation
	origin_tech = list(TECH_MATERIAL = 2, TECH_ESOTERIC = 5)
	var/rads = 100
	var/cooldown //when it will be ready to dispense rads
	var/delay = 4 SECONDS //how long we need to wait until we can dispense rads
	var/microlaserLevel = 1

/obj/item/device/scanner/health/radioactive_microlaser/examine(mob/user, distance)
	. = ..()
	if(distance <= 1)
		if(istraitor(user) || user.skill_check(SKILL_MEDICAL, SKILL_TRAINED) || user.skill_check(SKILL_DEVICES, SKILL_TRAINED))
			to_chat(user, "It might seem like a normal health analyzer, but you noticed a few differences here and there.")
			to_chat(user, SPAN_NOTICE("There's a dial on the side, it seems to be set to the number [microlaserLevel]. You can use <b>alt-click</b> to change the level."))

/obj/item/device/scanner/health/radioactive_microlaser/scan(atom/A, mob/user)
	. = ..()
	if(cooldown > world.time)
		to_chat(user, SPAN_WARNING("<b>\The [src] is not yet done cooling down!</b>"))
		return
	if(isliving(A))
		scan_data = medical_scan_action(A, user, src, mode)
		playsound(src, 'sound/effects/fastbeep.ogg', 20)
		SSradiation.radiate(A, rads)
		cooldown = world.time + delay
	return

/obj/item/device/scanner/health/radioactive_microlaser/AltClick(mob/user)
	. = ..()
	switch(microlaserLevel)
		if(1)
			microlaserLevel = 2
			playsound(src, 'sound/effects/flashlight.ogg', 20, extrarange = 2)
			to_chat(user, SPAN_NOTICE("You set \the [src] to level 2."))
			rads = 200
			delay = 40 SECONDS
		if(2)
			microlaserLevel = 3
			playsound(src, 'sound/effects/flashlight.ogg', 20, extrarange = 2)
			to_chat(user, SPAN_NOTICE("You set \the [src] to level 3."))
			rads = 300
			delay = 1 MINUTE
		if(3)
			microlaserLevel = 1
			playsound(src, 'sound/effects/flashlight.ogg', 20, extrarange = 2)
			to_chat(user, SPAN_NOTICE("You set \the [src] back to level 1."))
			rads = 100
			delay = 20 SECONDS
