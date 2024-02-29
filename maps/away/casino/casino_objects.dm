#define CATASTROPHE_ZOMBIES 1
#define CATASTROPHE_INFESTATION 2

// Randomized problem
// Selects one at round-start and applies throughout the away site at landmarks
/obj/effect/landmark/casino_catastrophe
	delete_me = TRUE
	var/global/catastrophe_type = 0

/obj/effect/landmark/casino_catastrophe/New()
	if(!catastrophe_type)
		catastrophe_type = rand(CATASTROPHE_ZOMBIES, CATASTROPHE_INFESTATION)
	return ..()

// Weak enemies
/obj/effect/landmark/casino_catastrophe/weak_enemy
	name = "Casino Ship - Weak Enemy Spawn"
	icon_state = "x3"

/obj/effect/landmark/casino_catastrophe/weak_enemy/Initialize()
	if(prob(33))
		return ..()

	switch(catastrophe_type)
		if(CATASTROPHE_ZOMBIES)
			new /mob/living/carbon/human/zombie(loc)
		if(CATASTROPHE_INFESTATION)
			var/mob_type = pick(/mob/living/simple_animal/hostile/infestation/broodling, /mob/living/simple_animal/hostile/infestation/floatfly, /mob/living/simple_animal/hostile/infestation/spitter)
			new mob_type(loc)

	return ..()

// Normal enemies
/obj/effect/landmark/casino_catastrophe/normal_enemy
	name = "Casino Ship - Normal Enemy Spawn"
	icon_state = "x2"

/obj/effect/landmark/casino_catastrophe/normal_enemy/Initialize()
	var/mob_type = /mob/living/simple_animal/hostile/carp
	switch(catastrophe_type)
		if(CATASTROPHE_ZOMBIES)
			mob_type = pick(/mob/living/carbon/human/zombie/fast, /mob/living/carbon/human/zombie/juggernaut)
		if(CATASTROPHE_INFESTATION)
			mob_type = pick(/mob/living/simple_animal/hostile/infestation/assembler, /mob/living/simple_animal/hostile/infestation/eviscerator, /mob/living/simple_animal/hostile/infestation/larva/implant/implanter)
	new mob_type(loc)

	return ..()

// Strong enemies
/obj/effect/landmark/casino_catastrophe/strong_enemy
	name = "Casino Ship - Strong Enemy Spawn"
	icon_state = "x"

/obj/effect/landmark/casino_catastrophe/strong_enemy/Initialize()
	var/mob_type = /mob/living/simple_animal/hostile/carp
	switch(catastrophe_type)
		if(CATASTROPHE_ZOMBIES)
			mob_type = /mob/living/carbon/human/zombie/juggernaut/armored
		if(CATASTROPHE_INFESTATION)
			mob_type = /mob/living/simple_animal/hostile/infestation/rhino
	new mob_type(loc)

	return ..()

// Dangerous event spawned in the middle of the casino
/obj/effect/landmark/casino_catastrophe/central_danger
	name = "Casino Ship - Central Danger"
	icon_state = "x"

/obj/effect/landmark/casino_catastrophe/central_danger/Initialize()
	switch(catastrophe_type)
		if(CATASTROPHE_INFESTATION)
			new /obj/infestation_structure/hive_heart(loc)
			var/turf/T = pick_turf_in_range(loc, 3, list(/proc/not_turf_contains_dense_objects))
			new /obj/infestation_structure/pike_burrow(T)

	return ..()

#undef CATASTROPHE_ZOMBIES
#undef CATASTROPHE_INFESTATION

/obj/effect/shuttle_landmark/nav_casino/cutter_hangar
	name = "Casino Hangar"
	landmark_tag = "nav_casino_hangar"
	base_area = /area/casino/casino_hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/nav_casino/cutter_transit
	name = "In transit"
	landmark_tag = "nav_casino_transit"

/obj/machinery/computer/shuttle_control/explore/casino_cutter
	name = "cutter control console"
	shuttle_tag = "Casino Cutter"

/obj/structure/casino
	icon = 'maps/away/casino/casino_sprites.dmi'

/obj/structure/casino/roulette
	name = "roulette"
	desc = "Spin the roulette to try your luck."
	icon_state = "roulette_r"
	density = FALSE
	anchored = TRUE
	var/busy = FALSE

/obj/structure/casino/roulette/attack_hand(mob/user as mob)
	if(busy)
		to_chat(user,SPAN_NOTICE("You cannot spin now! \The [src] is already spinning."))
		return

	visible_message(SPAN_NOTICE("\ [user]  spins the roulette and throws inside little ball."))
	busy = TRUE
	var/n = rand(0,36)
	var/color = "green"
	add_fingerprint(user)
	if((n>0 && n<11) || (n>18 && n<29))
		if(n%2)
			color="red"
	else
		color="black"
	if((n>10 && n<19) || (n>28) )
		if(n%2)
			color="black"
	else
		color="red"

	spawn(5 SECONDS)
		visible_message(SPAN_NOTICE("\The [src] stops spinning, the ball landing on [n], [color]."))
		busy = FALSE

/obj/structure/casino/roulette_chart
	name = "roulette chart"
	desc = "Roulette chart. Place your bets! "
	icon_state = "roulette_l"
	density = FALSE
	anchored = TRUE

/obj/structure/casino/bj_table
	name = "blackjack table"
	desc = "This is a blackjack table. "
	icon_state = "bj_left"
	density = FALSE
	anchored = TRUE

/obj/structure/casino/bj_table/bj_right
	icon_state = "bj_right"

/obj/structure/casino/oh_bandit
	name = "one armed bandit"
	desc = "Turned off slot machine. "
	icon_state = "slot_machine"
	density = FALSE
	anchored = TRUE

/obj/structure/casino/craps
	name = "craps table"
	desc = "Craps table: roll dice!"
	icon_state = "craps_top"
	density = FALSE
	anchored = TRUE

/obj/structure/casino/craps/craps_down
	icon_state = "craps_down"

