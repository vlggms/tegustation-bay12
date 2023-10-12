// Assoc list of spell types and their categories
GLOBAL_LIST_EMPTY(spells_by_categories)

// Does exactly what it says: Unless dispelled, only wizards can use it.
#define WIZARD_ONLY 1
// Only apprentices can use it
#define APPRENTICE_ONLY 2
// Anyone can use it, owner won't be selected
#define NO_OWNER 4

/obj/item/spellbook
	name = "spell book"
	desc = "A rare magical artifact that engraves spells in the mind of its user."
	icon = 'icons/obj/library.dmi'
	icon_state = "book"
	throw_speed = 1
	throw_range = 3
	w_class = ITEM_SIZE_NORMAL
	var/temp = null
	var/book_flags = 0
	/// Current owner of the book, none other than them can use it; Can be dispelled to remove that and other locks.
	var/mob/owner = null
	/// List of shown spells.
	var/list/allowed_spells = list()
	/// Currently applied spell categories that will be shown; If none - all spells are shown.
	var/list/spell_categories = list()

/obj/item/spellbook/Initialize()
	. = ..()
	// Create the global list if empty
	if(!LAZYLEN(GLOB.spells_by_categories))
		for(var/spell_type in subtypesof(/datum/spell))
			var/datum/spell/S = new spell_type()
			GLOB.spells_by_categories[S.type] = S.categories
			qdel(S)

/obj/item/spellbook/Destroy()
	RemoveOwner()
	return ..()

/obj/item/spellbook/attack_self(mob/living/user)
	if(!user.mind)
		return
	if(!user.mind.mana)
		to_chat(user, SPAN_WARNING("You cannot see anything in the book..."))
		return
	if(user.mind.special_role != ANTAG_WIZARD && (book_flags & WIZARD_ONLY))
		to_chat(user, SPAN_WARNING("The book refuses to open for you!"))
		return
	if(user.mind.special_role != ANTAG_APPRENTICE && (book_flags & APPRENTICE_ONLY))
		to_chat(user, SPAN_WARNING("The book refuses to open for you!"))
		return
	if(!(book_flags & NO_OWNER) && owner && user != owner)
		to_chat(user, SPAN_WARNING("The book refuses to open for you!"))
		return
	if(!owner && !(book_flags & NO_OWNER))
		to_chat(user, SPAN_NOTICE("The book starts to glow..."))
		if(!do_after(user, 5 SECONDS, src))
			to_chat(user, SPAN_NOTICE("The book falls silent."))
			return
		to_chat(user, SPAN_NOTICE("The spell book is now bound to your soul!"))
		SetOwner(user)
		return

	interact(user)

/obj/item/spellbook/interact(mob/living/user)
	var/dat = null
	dat += "Your spell points: [user.mind.mana.spell_points].<br>"
	dat += "Applied categories: <A href='byond://?src=\ref[src];categories=1'>[english_list(spell_categories, "None")].</a><br>"
	dat += "<hr>"
	for(var/spell_type in allowed_spells)
		var/datum/spell/S = spell_type
		var/list/combined_list = GLOB.spells_by_categories[spell_type] & spell_categories
		if(LAZYLEN(spell_categories) && !LAZYLEN(combined_list))
			continue

		dat += "<A href='byond://?src=\ref[src];spell=[spell_type]'>[initial(S.name)]</a><br>"

	var/datum/browser/popup = new(user, "spellbook", "Spell Book")
	popup.set_content(dat)
	popup.open()

/obj/item/spellbook/CanUseTopic(mob/M)
	if(!istype(M))
		return STATUS_CLOSE

	if(!istype(M.mind))
		return STATUS_CLOSE

	if((book_flags & WIZARD_ONLY) && M.mind.special_role != ANTAG_WIZARD)
		return STATUS_CLOSE

	if((book_flags & APPRENTICE_ONLY) && M.mind.special_role != ANTAG_APPRENTICE)
		return STATUS_CLOSE

	if(!(book_flags & NO_OWNER) && owner && M != owner)
		return STATUS_CLOSE

	return ..()

/obj/item/spellbook/OnTopic(mob/user, href_list)
	if(href_list["spell"])
		var/datum/spell/S = text2path(href_list["spell"])
		if(!ispath(S))
			return TOPIC_REFRESH
		var/dat = null
		dat += "<A href='byond://?src=\ref[src];purchase=[S]'>Purchase ([initial(S.spell_cost)] points)</a> "
		dat += "<br><hr>"
		dat += "[initial(S.name)]<br>"
		dat += "[initial(S.desc)]<br>"
		dat += "<hr>"
		dat += "Mana cost: [initial(S.mana_cost)].<br>"
		dat += "Categories: [english_list(GLOB.spells_by_categories[S], "None")].<br>"
		if(initial(S.spell_flags) & NEEDSCLOTHES)
			dat += "Requires wizard robes to cast."
		if(initial(S.spell_flags) & NO_SOMATIC)
			dat += "Can be cast while incapacitated."

		var/datum/browser/popup = new(user, "spellbook_[S]", "Spell Book - [initial(S.name)]")
		popup.set_content(dat)
		popup.open()
		return TOPIC_NOACTION

	else if(href_list["purchase"])
		var/path = text2path(href_list["purchase"])
		if(!path)
			return TOPIC_NOACTION
		SendFeedback(path) //feedback stuff
		if(ispath(path, /datum/spell))
			to_chat(user, AddSpell(user, path))
		else
			var/obj/O = new path(get_turf(user))
			to_chat(user, SPAN_NOTICE("You have purchased \a [O]."))
			//finally give it a bit of an oomf
			playsound(get_turf(user),'sound/effects/phasein.ogg',50,1)
		. = TOPIC_REFRESH

	else if(href_list["categories"])
		var/option = "Add"
		if(LAZYLEN(spell_categories))
			option = input(user, "What do you want to do?", "Options") as anything in list("Add", "Remove", "Clear")
		switch(option)
			if("Add")
				var/list/add_list = list("-- None --") + GLOB.spell_categories - spell_categories
				var/cat = input(user, "What category do you want to add?", "Add Category") as anything in add_list
				if(cat && !(cat in spell_categories) && (cat in GLOB.spell_categories))
					spell_categories |= cat
			if("Remove")
				var/list/rem_list = list("-- None --") + spell_categories
				var/cat = input(user, "What category do you want to remove?", "Remove Category") as anything in rem_list
				if(cat && (cat in spell_categories))
					spell_categories -= cat
			if("Clear")
				spell_categories = list()
		. = TOPIC_REFRESH

	interact(user)

// Being hit with any source of dispell releases any locks
/obj/item/spellbook/Dispell()
	. = ..()
	if(!istype(owner) && !(book_flags & WIZARD_ONLY) && !(book_flags & APPRENTICE_ONLY))
		return
	visible_message(SPAN_NOTICE("\The [src] fizzles and sparks!"))
	RemoveOwner()
	owner = null
	book_flags &= ~WIZARD_ONLY
	book_flags &= ~APPRENTICE_ONLY

/obj/item/spellbook/proc/SetOwner(mob/new_owner)
	if(!istype(new_owner))
		return
	RegisterSignal(new_owner, COMSIG_PARENT_QDELETING, .proc/RemoveOwner)
	owner = new_owner

/obj/item/spellbook/proc/RemoveOwner()
	if(!istype(owner))
		return
	UnregisterSignal(owner, COMSIG_PARENT_QDELETING)
	// We set it to random text to prevent people from using the book after gibbing the owner
	owner = "Dead owner"

/obj/item/spellbook/proc/SendFeedback(path)
	if(ispath(path, /datum/spell))
		var/datum/spell/S = path
		SSstatistics.add_field_details("wizard_spell_learned","[initial(S.name)]")
	else if(ispath(path, /obj))
		var/obj/O = path
		SSstatistics.add_field_details("wizard_spell_learned","[initial(O.name)]")

/obj/item/spellbook/proc/AddSpell(mob/living/user, spell_path)
	for(var/datum/spell/S in user.mind.learned_spells)
		if(istype(S,spell_path))
			if(!S.can_improve())
				return
			if(S.can_improve(UPGRADE_SPEED) && S.can_improve(UPGRADE_POWER))
				switch(alert(user, "Do you want to upgrade this spell's speed or power?", "Spell upgrade", "Speed", "Power", "Cancel"))
					if("Speed")
						return S.quicken_spell()
					if("Power")
						return S.empower_spell()
					else
						return
			else if(S.can_improve(UPGRADE_POWER))
				return S.empower_spell()
			else if(S.can_improve(UPGRADE_SPEED))
				return S.quicken_spell()

	var/datum/spell/SP = spell_path
	if(user.mind.mana.spell_points < initial(SP.spell_cost))
		return SPAN_WARNING("Not enough points!")

	var/datum/spell/S = new spell_path()
	user.add_spell(S)
	user.mind.mana.spell_points -= S.spell_cost
	return SPAN_NOTICE("You learn the spell [S]")

/* Subtypes */
// A spell book with EVERY spell available
/obj/item/spellbook/all_spells/Initialize()
	. = ..()
	for(var/spell_type in subtypesof(/datum/spell))
		var/datum/spell/S = spell_type
		if(isnull(initial(S.name)))
			continue
		allowed_spells |= S

// All spells available via spell book
/obj/item/spellbook/all_book_spells/Initialize()
	. = ..()
	for(var/spell_type in GLOB.spells_by_categories)
		var/datum/spell/S = spell_type
		if(isnull(initial(S.name)))
			continue
		if(initial(S.spell_book_visible))
			allowed_spells |= spell_type

// A book spawned to wizard apprentices
/obj/item/spellbook/apprentice
	allowed_spells = list(
		/datum/spell/aoe_turf/knock,
		/datum/spell/targeted/ethereal_jaunt,
		/datum/spell/targeted/projectile/magic_missile,
		)

// Free for all spell book that contains low-end spells that do not require wizard robes.
/obj/item/spellbook/minor_free
	book_flags = NO_OWNER
	allowed_spells = list(
		/datum/spell/aoe_turf/knock,
		/datum/spell/aoe_turf/blink,
		/datum/spell/aimed/heal_target/touch,
		/datum/spell/aoe_turf/exchange_wounds,
		/datum/spell/aoe_turf/smoke,
		)

// Most healing-related spells, any user
/obj/item/spellbook/healing
	book_flags = NO_OWNER
	allowed_spells = list(
		/datum/spell/hand/analyze_health,
		/datum/spell/aimed/heal_target/touch,
		/datum/spell/aimed/heal_target,
		/datum/spell/aimed/heal_target/major,
		/datum/spell/aimed/heal_target/trance,
		/datum/spell/aimed/heal_target/sacrifice,
		)
