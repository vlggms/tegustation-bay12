///Defines for the pressure strength of the fist
#define LOW_PRESSURE 1
#define MID_PRESSURE 2
#define HIGH_PRESSURE 3

/obj/item/melee/powerfist
	name = "power-fist"
	desc = "A metal gauntlet with a gas-powered piston ram ontop for that extra 'ompfh' in your punch."
	icon = 'icons/obj/weapons/melee_physical.dmi'
	icon_state = "powerfist"
	item_state = "powerfist"
	attack_verb = list("whacked", "power-fisted", "power-punched")
	force = 10
	throwforce = 10
	throw_range = 7
	w_class = ITEM_SIZE_LARGE //its a damn power fist, its big
	var/fist_pressure_setting = LOW_PRESSURE
	var/gas_per_fist = 20 //amount of shit to use on pawnch, scales with pressure setting
	var/obj/item/tank/tank

/obj/item/melee/powerfist/proc/pressure_setting_to_text(fist_pressure_setting)
	switch(fist_pressure_setting)
		if(LOW_PRESSURE)
			return "low"
		if(MID_PRESSURE)
			return "medium"
		if(HIGH_PRESSURE)
			return "high"
		else
			CRASH("Invalid pressure setting: [fist_pressure_setting]!")

/obj/item/melee/powerfist/examine(mob/user, distance)
	. = ..()
	if(distance <= 1)
		if(tank)
			to_chat(user, SPAN_NOTICE("[icon2html(tank, user)] It has \a <b>[tank]</b> mounted on it."))
			to_chat(user, SPAN_NOTICE("It can be removed with a <b>screwdriver</b>."))
	else
		to_chat(user, "You'll need to get closer to see any more.")
		return
	to_chat(user, SPAN_NOTICE("Use a <b>wrench</b> to change the valve strength. Current strength is at <b>[pressure_setting_to_text(fist_pressure_setting)]</b> level."))


/obj/item/melee/powerfist/attackby(obj/item/W, mob/user)
	. = ..()
	if(istype(W, /obj/item/tank))
		if(!user.unEquip(W, src)) //for some reason this allows it to actually move, hilarious
			return
		tank = W
		W.forceMove(src)
		to_chat(user, SPAN_NOTICE("You insert \the [W] into \the [src]."))

	if(isScrewdriver(W))
		if(tank)
			tank.forceMove(get_turf(user))
			user.put_in_hands(tank)
			to_chat(user, SPAN_NOTICE("You detach \the [tank] from \the [src]."))
			tank = null
		else
			to_chat(user, SPAN_WARNING("No tank present!"))

	if(isWrench(W))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		fist_pressure_setting = fist_pressure_setting >= HIGH_PRESSURE ? LOW_PRESSURE : fist_pressure_setting + 1
		to_chat(user, SPAN_NOTICE("Piston strength set to [pressure_setting_to_text(fist_pressure_setting)]!"))

/obj/item/melee/powerfist/attack(mob/living/M, mob/living/user, target_zone, animate)
	. = ..()
	if(user.a_intent == I_HURT)
		if(tank)
			var/affecting = user.get_organ_target()
			if(tank.air_contents.volume >= gas_per_fist*fist_pressure_setting)
				tank.air_contents.remove_volume(gas_per_fist*fist_pressure_setting)
				src.visible_message(SPAN_DANGER("[user] punches \the [M] with \the [src]!"))
				M.apply_damage(force*2*fist_pressure_setting, BRUTE, affecting) //might be a little too op... Too bad!
			else
				src.visible_message(SPAN_WARNING("\The [src] lets out a dull hiss..."))
		else
			to_chat(user, SPAN_WARNING("\The [src] doesn't have a tank!"))
