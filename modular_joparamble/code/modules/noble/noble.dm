#define CTAG_NOBLE "CAT_NOBLE" // Noble classes; sloppy class selection system.

/datum/job/roguetown/noble
	title = "Noble Guest"
	flag = KNIGHT
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	allowed_races = ALL_RACES_TYPES
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	allowed_patrons = ALL_DIVINE_PATRONS
	tutorial = "A person of noble blood but with no inherit responsibility or authority in the current hold but demands the same respect as any other nobles in the court."
	display_order = JDO_NOBLE
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/noble
	give_bank_account = 100
	min_pq = 0
	max_pq = null

	advclass_cat_rolls = list(CTAG_NOBLE = 20)

/datum/job/roguetown/noble/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(ishuman(H))
		var/mob/living/carbon/human/Q = H
		Q.advsetup = 1
		Q.invisibility = INVISIBILITY_MAXIMUM
		Q.become_blind("advsetup")

/datum/job/roguetown/noble/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
/*	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Lord"
		if(H.gender == FEMALE)
			honorary = "Lady"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]" */


/datum/advclass/noble/lover
	name = "Любовница"
	tutorial = "С самых ранних лет вас готовили как будущую жену, а то и наложницу. Тем не менее вы стали желанной девой для разных лордов, благодаря своей красоте и опыту в видении дворцовых дел. Вы достойный кандидат в жёны, потому бы и надо успеть найти себе достойного мужа, пока вы не стали ненужной старухой."
	allowed_sexes = list(FEMALE)
	allowed_races = ALL_RACES_TYPES
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, )
	outfit = /datum/outfit/job/roguetown/noble/lover
	category_tags = list(CTAG_NOBLE)

/datum/outfit/job/roguetown/noble/lover/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)

	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	beltl = /obj/item/storage/keyring/nobleguest
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	armor = /obj/item/clothing/suit/roguetown/armor/silkcoat
	shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess
	pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(0,1,), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(0,0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, pick(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1 , TRUE)
		H.change_stat("perception", 2)
		H.change_stat("speed", 2)
		H.change_stat("strength", -2)
		H.change_stat("fortune", 2)

/datum/advclass/noble/knight
	name = "Благородный рыцарь"
	tutorial = "С самых ранних лет вам не находилось лучше дела, чем практики с разным оружием и ношении доспехов, а так же верховая езда. Множество наставников вам помогало обрести нужны рыцарский опыт. Благодаря этому вы стали достойным противником в любом бою."
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	allowed_races = ALL_RACES_TYPES
	outfit = /datum/outfit/job/roguetown/noble/knight
	category_tags = list(CTAG_NOBLE)

/datum/outfit/job/roguetown/noble/knight/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	belt = /obj/item/storage/belt/rogue/leather/hand
	beltl = /obj/item/storage/keyring/nobleguest
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	neck = /obj/item/clothing/neck/roguetown/bervor
	pants = /obj/item/clothing/under/roguetown/platelegs
	armor = /obj/item/clothing/suit/roguetown/armor/plate/noblecuirass
	backr = /obj/item/storage/backpack/rogue/satchel
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	cloak = /obj/item/clothing/cloak/half
	head = /obj/item/clothing/head/roguetown/helmet/heavy
	gloves = /obj/item/clothing/gloves/roguetown/plate
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	if(prob(50))
		backl = /obj/item/rogueweapon/sword/long
	else if(prob(33))
		backl = /obj/item/rogueweapon/sword/rapier
	else
		backl = /obj/item/rogueweapon/flail/sflail
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()

/datum/advclass/noble/antimage
	name = "Отвергая магию"
	tutorial = "В раннем детстве у вас обнаружили странный дар? Проклятье? Неважно - вы отвергаете магию почти в любом её проявлении. К несчастью данное явление до конца не ясно, но вам это в жизни не сильно мешало. Вы шли дальше по жизненному пути дворянина, изредко прерываясь на приезжих магов и лекарей, что желали изучить вас и то как голубая кровь содержит такие дивные свойства. Слава Богам что вы не родились чернью имея то же самое. Вас бы запытали эксперементами."
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	allowed_races = ALL_RACES_TYPES
	pickprob = 11
	outfit = /datum/outfit/job/roguetown/noble/antimage
	category_tags = list(CTAG_NOBLE)

/datum/outfit/job/roguetown/noble/antimage/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ANTIMAGIC, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SHOCKIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SPELLCOCKBLOCK, TRAIT_GENERIC)

	if(H.gender == MALE)
		head = /obj/item/clothing/head/roguetown/fancyhat
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		shoes = /obj/item/clothing/shoes/roguetown/nobleboot
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/keyring/nobleguest
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		if(prob(50))
			cloak = /obj/item/clothing/cloak/cape/knight
		else
			cloak = /obj/item/clothing/cloak/half
	else
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random
		cloak = /obj/item/clothing/cloak/cape/knight
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/keyring/nobleguest
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		if(prob(50))
			cloak = /obj/item/clothing/cloak/cape/knight
		else
			cloak = /obj/item/clothing/cloak/half
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(2,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, pick(1,2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(1,2), TRUE) 
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("perception", 1)
		H.change_stat("fortune", 3)

/datum/advclass/noble/rich
	name = "Богач"
	tutorial = "Вам повезло с происхождением и с тем как продуктивно вы проводили своё время. Всю вашу жизнь вас окружало богатство и польза от этого богатсва. И вот вам хватило времени, чтобы немного потратить свои сбережения на деятельность в этом Богами забытом месте."
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	allowed_races = ALL_RACES_TYPES
	outfit = /datum/outfit/job/roguetown/noble/rich
	category_tags = list(CTAG_NOBLE)

/datum/outfit/job/roguetown/noble/rich/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)

	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	wrists = /obj/item/storage/keyring/nobleguest
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	head = /obj/item/clothing/head/roguetown/nightman
	neck = /obj/item/clothing/neck/roguetown/collar/surgcollar
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	pants = /obj/item/clothing/under/roguetown/tights/black
	backr = /obj/item/storage/backpack/rogue/satchel
	cloak = /obj/item/clothing/cloak/half
	id = /obj/item/scomstone
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(2,3,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/mathematics, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.change_stat("intelligence", 3)
	H.change_stat("perception", 3)
	H.change_stat("strength", -1)

/datum/advclass/noble/duelist
	name = "Фехтовальщик"
	tutorial = "Ещё с пелёнок вам хотелось помахать своими ручками мечом. За многие годы вы набрались многому опыту от окружавших вас наставников по фехтованию. Вы заверены самим собой, что только клинки могут вас спасти в любой ситуации. Буд-то это рапира или просто старый ржавый меч. И вот вы прибываете сюда с целью вновь по-практиковаться в своих умениях и найти себе противника, чтобы тот испытал вас."
	pickprob = 11
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	allowed_races = ALL_RACES_TYPES
	outfit = /datum/outfit/job/roguetown/noble/duelist
	category_tags = list(CTAG_NOBLE)

/datum/outfit/job/roguetown/noble/duelist/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

	head = /obj/item/clothing/head/roguetown/fancyhat
	pants = /obj/item/clothing/under/roguetown/tights
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/nobleguest
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogueweapon/sword/rapier
	if(prob(50))
		cloak = /obj/item/clothing/cloak/cape/knight
	else
		cloak = /obj/item/clothing/cloak/half
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 3)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("fortune", 2)

/datum/advclass/noble/norm
	name = "Обычный дворянин"
	tutorial = "Ваша жизнь протекала не столь насыщенно, чтобы чем-то гордиться или горчить о прошлом. Вы самый обычный дворянин, образ которого давно стал стереотипом не только в этих землях."
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	allowed_races = ALL_RACES_TYPES
	outfit = /datum/outfit/job/roguetown/noble/norm
	category_tags = list(CTAG_NOBLE)

/datum/outfit/job/roguetown/noble/norm/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	if(H.gender == MALE)
		head = /obj/item/clothing/head/roguetown/fancyhat
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		shoes = /obj/item/clothing/shoes/roguetown/nobleboot
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/keyring/nobleguest
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		if(prob(50))
			cloak = /obj/item/clothing/cloak/cape/knight
		else
			cloak = /obj/item/clothing/cloak/half
	else
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random
		cloak = /obj/item/clothing/cloak/cape/knight
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/keyring/nobleguest
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel
		if(prob(50))
			cloak = /obj/item/clothing/cloak/cape/knight
		else
			cloak = /obj/item/clothing/cloak/half
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(2,2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("perception", 2)
		H.change_stat("endurance", -1)
		H.change_stat("strength", -1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 2)

