/atom/proc/Value(base)
	return base

/obj/Value(base)
	. = ..()
	for(var/a in contents)
		. += get_value(a)

/obj/machinery/Value(base)
	. = ..()
	if(stat & BROKEN)
		. *= 0.5
	. = round(.)

/obj/structure/barricade/Value(base)
	return material.value

/obj/structure/bed/Value(base)
	return ..() * material.value

/obj/item/slime_extract/Value(base)
	. = ..()
	. *= Uses

/obj/item/ammo_casing/Value(base)
	. = ..()
	if(!BB)
		return

	for(var/mat in matter)
		var/material/material_def = SSmaterials.get_material_by_name(mat)
		. += material_def.value * (matter[mat] / SHEET_MATERIAL_AMOUNT)

	. = round(., 0.5)

/obj/item/reagent_containers/Value(base)
	. = ..()
	if(reagents)
		for(var/a in reagents.reagent_list)
			var/datum/reagent/reg = a
			. += reg.Value() * reg.volume
	. = round(.)

/datum/reagent/proc/Value(base)
	return value

/obj/item/stack/Value(base)
	return base * amount

/obj/item/stack/material/Value(base)
	if(!material)
		return ..()
	. = material.value * amount
	if(reinf_material)
		. += reinf_material.value * amount

/obj/item/ore/Value(base)
	return material ? material.value : 0

/obj/item/material/Value(base)
	return material.value * worth_multiplier

/obj/item/spacecash/Value(base)
	return worth

/mob/living/carbon/human/Value(base)
	. = ..()
	if(species)
		. *= species.rarity_value
	switch(src.stat)
		if(DEAD) // Living mobs would cost more, okay?
			. *= 0.8
	if(!key) // Mindless humans cost less
		. *= 0.2
	. = round(.)

/obj/structure/ship_munition/disperser_charge/explosive/Value(base)
	. = ..()
	. += devastation_modifier * 10000

/obj/structure/ship_munition/disperser_charge/orbital_bombardment/Value(base)
	. = ..()
	. += bomb_number * (devastation_modifier * 2000)

/obj/item/organ/Value(base)
	. = ..()
	if(istype(species))
		. *= species.rarity_value
	if(damage)
		. -= round(. * (damage / max_damage))

/obj/item/spellbook/Value(base)
	. = ..()
	. += length(allowed_spells * 1000)
	if(!isnull(owner))
		. *= 0.5

/obj/item/reagent_containers/food/snacks/grown/Value(base)
	. = ..()
	. += seed.Value(FALSE)

// Seeds cost less than fully grown plants
/obj/item/seeds/Value(base)
	. = ..()
	. += round(seed.Value(TRUE) * 0.3)

/obj/item/tank/Value(base)
	. = ..()
	for(var/gas_id in air_contents.gas)
		. += gas_data.value[gas_id] * air_contents.gas[gas_id]
	. = round(.)

// Mostly for canisters
/obj/machinery/portable_atmospherics/Value(base)
	. = ..()
	for(var/gas_id in air_contents.gas)
		. += gas_data.value[gas_id] * air_contents.gas[gas_id]
	. = round(.)

/obj/machinery/artifact/Value(base)
	. = ..()
	if(effect)
		. += effect.Value()

/obj/item/anobattery/Value(base)
	. = ..()
	if(battery_effect)
		. += round(battery_effect.Value() * 0.25)

/obj/item/mind_engraver_chip/Value(base)
	. = ..()
	if(istype(stored_data))
		. += stored_data.Value()

/mob/living/carbon/slime/Value(base)
	. = ..()
	var/atom/core_type = GetCoreType()
	. += get_value(core_type)
