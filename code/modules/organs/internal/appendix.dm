/obj/item/organ/internal/appendix
	name = "appendix"
	icon_state = "appendix"
	parent_organ = BP_GROIN
	organ_tag = BP_APPENDIX
	// If above 0 - will gradually increase until inevitably appendix rupture
	var/inflamed = 0

/obj/item/organ/internal/appendix/Process()
	..()
	if(!inflamed || !owner)
		return
	inflamed++
	if(prob(5))
		if(owner.can_feel_pain())
			owner.custom_pain("You feel a stinging pain in your abdomen!")
			if(owner.can_feel_pain())
				owner.visible_message("<B>\The [owner]</B> winces slightly.")
	if(inflamed > APPENDIX_INFLAMATION_EARLY)
		if(prob(3))
			take_internal_damage(0.1)
			owner.adjustToxLoss(1)
			if(owner.can_feel_pain())
				owner.visible_message("<B>\The [owner]</B> winces painfully.")
	if(inflamed > APPENDIX_INFLAMATION_MIDDLE)
		if(prob(inflamed / APPENDIX_INFLAMATION_MIDDLE))
			germ_level += rand(1,3)
			owner.vomit()
	if(inflamed > APPENDIX_INFLAMATION_CRITICAL)
		if(prob(inflamed / APPENDIX_INFLAMATION_CRITICAL)) // If you somehow live long enough the chance will increase
			AppendixRupture()

/obj/item/organ/internal/appendix/on_update_icon()
	..()
	if(inflamed)
		icon_state = "appendixinflamed"
		SetName("inflamed appendix")

// Getting to maximum damage results in appendix rupture if it was badly inflamed
/obj/item/organ/internal/appendix/die()
	. = ..()
	if(inflamed > APPENDIX_INFLAMATION_MIDDLE)
		AppendixRupture()

/obj/item/organ/internal/appendix/proc/AppendixRupture()
	if(!owner)
		return
	if(owner.can_feel_pain())
		owner.custom_pain("You feel a stinging pain in your abdomen!")
		owner.Weaken(10)
		owner.flash_eyes()
		owner.eye_blurry += 15
		owner.confused += 10

	owner.playsound_local(get_turf(owner), 'sound/effects/splat.ogg', 50)
	owner.playsound_local(get_turf(owner), 'sound/effects/singlebeat.ogg', 75)
	var/obj/item/organ/external/E = owner.get_organ(parent_organ)
	E.sever_artery()
	E.germ_level = clamp(E.germ_level + (germ_level * 2), INFECTION_LEVEL_TWO, INFECTION_LEVEL_THREE)
	owner.adjustToxLoss(50)
	removed()
	QDEL_NULL(src)
