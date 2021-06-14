/mob/living/simple_animal/hostile/retaliate/gator
	name = "alligator"
	desc = "Thats an alligator."
	icon_state = "gator"
	icon_living = "gator"
	icon_dead ="gator_dead"
	speak_emote = list("snaps.","hisses.","waits apprehensively.", "shuffles.")
	turns_per_move = 5
	response_help = "pets"
	response_disarm = "rolls over"
	response_harm = "kicks"
	harm_intent_damage = 24
	health = 125
	maxHealth = 125
	speed = 8
	glide_size = 2
	natural_weapon = /obj/item/natural_weapon/bite
	attack_sound = 'sound/weapons/bite.ogg'

/datum/ai_holder/simple_animal/hostile/retaliate/gator
	speak_chance = 1

/mob/living/simple_animal/hostile/retaliate/gator/steppy
	name = "Steppy"
	desc = "Cargo's pet gator. Is he being detained!?"
// lame ass hrp desc: desc = "The local pet gator. Who would keep a alligator as a pet!?"
	gender = MALE

/mob/living/simple_animal/hostile/retaliate/gator/steppy/cool
	name = "Cool Steppy"
	desc = "Cargo's pet gator. Looks like nobody can detain him now."
	speak_emote = list("snaps menacingly")
	icon_state = "gator_cool"
	icon_living = "gator_cool"
	speed = 7
	harm_intent_damage = 30
	health = 150
	maxHealth = 150

/mob/living/simple_animal/hostile/retaliate/gator/steppy/cool/death()
	. = ..()
	var/turf/T = get_turf(src)
	new /obj/item/clothing/glasses/sunglasses/sechud(T)

/mob/living/simple_animal/hostile/retaliate/gator/steppy/Initialize() // im not abandonign cool steppy
	. = ..()
	var/turf/T = get_turf(src)
	if(prob(5))
		new /mob/living/simple_animal/hostile/retaliate/gator/steppy/cool(T)
		return INITIALIZE_HINT_QDEL
	else
		return 0
