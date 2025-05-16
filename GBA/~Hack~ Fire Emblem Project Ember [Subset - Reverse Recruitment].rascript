// ~Hack~ Fire Emblem: Project Ember [Subset - Reverse Recruitment]
// #ID = 32931
// 20250516 Version - Sines

//// - Code organisation -
/// Code Notes
/// Core
// Constant
// Variable
// Function
// Achievement Code
/// Rich Presence
// Lookup
// RP Code
/// Leaderboard


///Core
//Constant
LastItemObtained = byte(0x00f8)
MapID = byte(0x32a56)
TurnPhase = byte(0x32a57) // Player phase == 0
TurnCounter = byte(0x32a58)
HardDifficulty = bit6(0x32a5c)
LastLoadedClassID = word(0x41218)
LastLoadedCharID = word(0x041214)
YouWin = bit2(0x4898)

function LoadCheck() => MapID == prev(MapID)
function HardCheck() => HardDifficulty == 1
function LastItemCheck(ItemCheckID) => LastItemObtained == ItemCheckID && prev(LastItemObtained) != ItemCheckID

function ChapterProg(ChapterIDStart, ChapterIDEnd, CheevoName, CheevoPoints){
	
    title = CheevoName
	points = CheevoPoints
	description = format("Clear Chapter {0} ", ChapterNames[ChapterIDStart])
	trigger = MapID == ChapterIDEnd
			&& prev(MapID) == ChapterIDStart
            && TurnCounter > 0


    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

     achievement(title = "Princess's Flight",
	points = 1,
	description = "Defeat the bandit group attacking Pherae in Chapter 1",
	trigger = MapID == 1
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
     )
            

    achievement(title = "International Interference",
	points = 5,
	description = "Defeat the shady advisor and runback to Ostia in Chapter 6",
	trigger = MapID == 6
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Flames of Rebellion",
	points = 5,
	description = "Defeat the Pirate forces and choose your next destination in Chapter 9",
	trigger = MapID == 9
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Church Censure",
	points = 5,
	description = "Put an end to the Bishop's corruption in Chapter 11A",
	trigger = MapID == 0x0b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

   achievement(title = "Behavior Correction",
	points = 5,
	description = "Liberate the prisoners and end the cruel worker treatment in Chapter 11B",
	trigger = MapID == 0x1b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
   )


    achievement(title = "Shades of Magic",
	points = 5,
	description = "Brave the harsh desert and reach Arcadia in Chapter 14",
	trigger = MapID == 0x0e
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Counter Rebellion",
	points = 10,
	description = "Liberate Castle Aquileia and save Etruria from Bern in Chapter 16",
	trigger = MapID == 0x10
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Thawing Out",
	points = 10,
	description = "Defeat the High Chancellor and restore order to Ilia in Chapter 20A",
	trigger = MapID == 0x14
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Endless Plains",
	points = 10,
	description = "Defeat Bern's occupation force and garantee freedom for Sacae in Chapter 20B",
	trigger = MapID == 0x1f
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Memory of a Kind Brother",
	points = 10,
	description = "End King Zephiel's madness in Chapter 22",
	trigger = MapID == 0x16
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Purifying Light",
	points = 25,
	description = "Rid the world of the Demon Dragon in the Final Chapter",
	trigger = MapID == 0x19
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Heir of Legend",
	points = 5,
	description = "Obtain the True Ending",
	trigger = MapID == 0x19
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit6(0x004892) == 1
            && prev(bit6(0x004892)) == 0
    )


////
//// Gaiden Chapters

    achievement(title = "Cave Delving",
	points = 5,
	description = "Obtain Durandal",
	trigger = MapID == 0x20
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Walk in the Parc",
	points = 5,
	description = "Obtain Armads",
	trigger = MapID == 0x21
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )        


    achievement(title = "The Ancient Sage",
	points = 5,
	description = "Obtain Forblaze",
	trigger = MapID == 0x22
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Divine Retribution",
	points = 10,
	description = "Obtain Aureola",
	trigger = MapID == 0x23
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Labyrinth of Doom",
	points = 10,
	description = "Obtain Maltet from its resting place",
	trigger = MapID == 0x24
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Horse Camp",
	points = 10,
	description = "Obtain Murgleis from its resting place",
	trigger = MapID == 0x25
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Dust to Dust",
	points = 10,
	description = "Obtain Apocalypse",
	trigger = MapID == 0x26
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Mistress of War",
	points = 50,
	description = "Achieve at least an A Player Rank after beating the Final Chapter",
	trigger = prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x032a5c) == 1
            && byte(0x027146) <= 4
            && byte(0x027148) <= 4
            && byte(0x02714a) <= 4
            && byte(0x02714c) <= 4
            && byte(0x02714e) <= 4
            && byte(0x027150) <= 4
            && byte(0x027152) == 4
            && prev(byte(0x027152)) == 3

    )

///
/// Recruitment Cheevos

     achievement(title = "Elemental Switch",
	points = 3,
	description = "Recruit Hugh",
	trigger = MapID == 0x03
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4898) == 1
            && prev(bit7(0x4898)) == 0
     )   

     achievement(title = "Axe Power",
	points = 5,
	description = "Recruit Garret",
	trigger = MapID == 0x04
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   

     achievement(title = "Magical Pony",
	points = 5,
	description = "Recruit Cecilia",
	trigger = MapID == 0x06
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit6(0x4899) == 1
            && prev(bit6(0x4899)) == 0
     ) 

     achievement(title = "Young Gatekeeper",
	points = 5,
	description = "Recruit Raigh",
	trigger = MapID == 0x07
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4899) == 1
            && prev(bit7(0x4899)) == 0
     )          

     achievement(title = "Apprentice Sharpshooter",
	points = 5,
	description = "Recruit Klein",
	trigger = MapID == 0x09
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit4(0x4898) == 1
            && prev(bit4(0x4898)) == 0
     )   


     achievement(title = "Good Pirate",
	points = 5,
	description = "Recruit Geese",
	trigger = MapID == 0x09
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   


     achievement(title = "Noble Blade",
	points = 5,
	description = "Recruit Fir",
	trigger = (MapID == 0x1a
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
    )
            || (MapID == 0x0b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4898) == 1
            && prev(bit7(0x4898)) == 0
    )
     )   

     achievement(title = "The More Things Changes, the More They Stay the Same",
	points = 5,
	description = "Recruit Gonzales",
	trigger = (MapID == 0x1a
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit3(0x4898) == 1
            && prev(bit3(0x4898)) == 0
    )
            || (MapID == 0x0a
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
    )
     )   

     achievement(title = "Wingless Pink",
	points = 5,
	description = "Recruit Gwendolyn",
	trigger = (MapID == 0x1a
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4898) == 1
            && prev(bit7(0x4898)) == 0
    )
            || (MapID == 0x0b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit1(0x4899) == 1
            && prev(bit1(0x4899)) == 0
    )
     )   


     achievement(title = "Navy Anti-Air",
	points = 5,
	description = "Recruit Sin",
	trigger = (MapID == 0x1b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit2(0x4899) == 1
            && prev(bit2(0x4899)) == 0
    )
            || (MapID == 0x0a
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit6(0x4898) == 1
            && prev(bit6(0x4898)) == 0
    )
     )   


     achievement(title = "Sneaky, No Mustache",
	points = 5,
	description = "Recruit Astolfo",
	trigger = MapID == 0x1b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   

     achievement(title = "Wrong Map",
	points = 5,
	description = "Recruit Bartre",
	trigger = MapID == 0x0b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   

     achievement(title = "Confused Knight",
	points = 5,
	description = "Recruit Debias",
	trigger = MapID == 0x0c
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit4(0x4898) == 1
            && prev(bit4(0x4898)) == 0
     )   

     achievement(title = "Saga Elibe",
	points = 5,
	description = "Recruit Noah",
	trigger = prev(MapID) == MapID
            && TurnCounter > 0
            && bit2(0x4890) == 1
            && bit3(0x4890) == 1
            && bit4(0x4890) == 1
            && prev(bit4(0x4890)) == 0
            && MapID >= 0x0c
     )   

     achievement(title = "Not So Bad Knight of the Realm",
	points = 5,
	description = "Recruit Zealot",
	trigger = (MapID == 0x0d
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit1(0x4899) == 1
            && prev(bit1(0x4899)) == 0
    )
            || (MapID == 0x0f
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit4(0x4898) == 1
            && prev(bit4(0x4898)) == 0
    )
     )   

     achievement(title = "Glass Canon",
	points = 5,
	description = "Recruit Rutger",
	trigger = MapID == 0x0f
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit6(0x4898) == 1
            && prev(bit6(0x4898)) == 0
     )   

     achievement(title = "Pay To Win",
	points = 5,
	description = "Recruit Lugh",
	trigger = MapID == 0x10
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && ((bit6(0x4899) == 1
            && prev(bit6(0x4899)) == 0)
            || (bit7(0x4899) == 1
            && prev(bit7(0x4899)) == 0)
            || (bit0(0x489a) == 1
            && prev(bit0(0x489a)) == 0)
            || (bit1(0x489a) == 1
            && prev(bit1(0x489a)) == 0))
     )   

     achievement(title = "The Chad Chad VS the Virgin Wyvern",
	points = 5,
	description = "Recruit Chad",
	trigger = MapID == 0x10
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4898) == 1
            && prev(bit7(0x4898)) == 0
     )   

     achievement(title = "Empty Lot",
	points = 5,
	description = "Recruit Lot",
	trigger = MapID == 0x23
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit3(0x4898) == 1
            && prev(bit3(0x4898)) == 0
     )   

     achievement(title = "Holy Matron",
	points = 10,
	description = "Recruit Elen",
	trigger = MapID == 0x14
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   

     achievement(title = "Late Christmas",
	points = 10,
	description = "Recruit Lance",
	trigger = MapID == 0x1f
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit4(0x4898) == 1
            && prev(bit4(0x4898)) == 0
     )   

     achievement(title = "Thanks for Nothing",
	points = 10,
	description = "Recruit Alen",
	trigger = MapID == 0x17
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit3(0x4898) == 1
            && prev(bit3(0x4898)) == 0
     )   

     achievement(title = "Just What We Needed",
	points = 10,
	description = "Recruit Wolt",
	trigger = MapID == 0x17
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4898) == 1
            && prev(bit7(0x4898)) == 0
     )  