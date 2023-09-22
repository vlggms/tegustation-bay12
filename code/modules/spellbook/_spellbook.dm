// Assoc list of category = spell type
GLOBAL_LIST_EMPTY(categories_to_spells)
// Reverse assoc list for "reasons"
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
	/// Currently applied spell categories that will be shown; If none - all spells are shown.
	var/list/spell_categories = list()

/obj/item/spellbook/Destroy()
	RemoveOwner()
	return ..()

/obj/item/spellbook/attack_self(mob/user)
	if(!user.mind)
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

/obj/item/spellbook/interact(mob/user)
	var/dat = null

	// Create the global lists if empty
	if(!LAZYLEN(GLOB.categories_to_spells) || !LAZYLEN(GLOB.spells_by_categories))
		for(var/spell_type in subtypesof(/datum/spell))
			var/datum/spell/S = new spell_type()
			for(var/category in S.categories)
				if(!(category in GLOB.categories_to_spells))
					GLOB.categories_to_spells[category] = list()
				GLOB.categories_to_spells[category] += S.type
			GLOB.spells_by_categories[S.type] = S.categories
			qdel(S)

	for(var/spell_type in GLOB.spells_by_categories)
		var/datum/spell/S = spell_type
		if(LAZYLEN(spell_categories) && !(GLOB.spells_by_categories[spell_type] & spell_categories))
			continue
		if(!initial(S.spell_book_visible))
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
	if(href_list["temp"])
		temp = null
		. = TOPIC_REFRESH

	else if(href_list["path"])
		var/path = text2path(href_list["path"])
		if(!path)
			return TOPIC_HANDLED
		SendFeedback(path) //feedback stuff
		if(ispath(path, /datum/spell))
			temp = AddSpell(user, path)
		else
			var/obj/O = new path(get_turf(user))
			temp = "You have purchased \a [O]."
			//finally give it a bit of an oomf
			playsound(get_turf(user),'sound/effects/phasein.ogg',50,1)
		. = TOPIC_REFRESH

	else if(href_list["reset"])
		var/area/map_template/wizard_station/A = get_area(user)
		if(istype(A))
			user.spellremove()
			temp = "All spells and investments have been removed. You may now memorize a new set of spells."
			SSstatistics.add_field_details("wizard_spell_learned","UM") //please do not change the abbreviation to keep data processing consistent. Add a unique id to any new spells
		else
			to_chat(user, "<span class='warning'>You must be in the wizard academy to re-memorize your spells.</span>")
		. = TOPIC_REFRESH

	interact(user)

// Being hit with any source of dispell releases any locks
/obj/item/spellbook/Dispell()
	if(!istype(owner) && !(book_flags & WIZARD_ONLY) && !(book_flags & APPRENTICE_ONLY))
		return
	visible_message(SPAN_NOTICE("\The [src] fizzles and sparks!"))
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

/obj/item/spellbook/proc/AddSpell(mob/user, spell_path)
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

	var/datum/spell/S = new spell_path()
	user.add_spell(S)
	return "You learn the spell [S]"
