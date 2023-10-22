/obj/item/device/radioactive_microlaser //a health scanner that instead of scanning will give you aids and radiation
	name = "health analyzer"
	desc = "A hand-held body scanner able to distinguish vital signs of the subject."
	icon_state = "health"
	item_state = "analyzer"
	item_flags = ITEM_FLAG_NO_BLUDGEON
	matter = list(MATERIAL_ALUMINIUM = 200)
	origin_tech = list(TECH_MATERIAL = 2, TECH_ESOTERIC = 5)
	var/rads = 100
	var/cooldown
	var/delay = 4 SECONDS
	var/microlaserLevel = 1

/obj/item/device/radioactive_microlaser/examine(mob/user, distance)
	. = ..()
	if(user.mind in GLOB.traitors.current_antagonists || user.skill_check(SKILL_MEDICAL, SKILL_TRAINED) || user.skill_check(SKILL_DEVICES, SKILL_TRAINED))
		to_chat(user, "It might seem like a normal health analyzer, but you noticed a few differences here and there.")
		to_chat(user, "There's a dial on the side, it seems to be set to the number [microlaserLevel].")

/obj/item/device/radioactive_microlaser/afterattack(atom/target, mob/user, proximity, click_parameters)
	. = ..()
	if(!proximity)
		return
	if(cooldown > world.time)
		to_chat(user, SPAN_WARNING("\The [src] is not yet done cooling down!"))
		return
	if(isliving(target))
		playsound(src, 'sound/effects/fastbeep.ogg', 20)
		user.visible_message("<span class='notice'>[user] runs \the [src] over \the [target].</span>", range = 2)
		SSradiation.radiate(target, rads)
		cooldown = world.time + delay

/obj/item/device/radioactive_microlaser/attack_self(mob/user)
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
