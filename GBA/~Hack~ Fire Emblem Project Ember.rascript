// ~Hack~ Fire Emblem: Project Ember
// #ID = 22464
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


     achievement(title = "Embers of War",
	points = 1,
	description = "Defeat the bandit group attacking Pherae in Chapter 1",
	trigger = MapID == 1
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
     )
            

    achievement(title = "End of Innocence",
	points = 5,
	description = "Defeat the shady advisor and runback to Ostia in Chapter 6",
	trigger = MapID == 6
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Cleaning the Western Isles",
	points = 5,
	description = "Defeat the Pirate forces and choose your next destination in Chapter 9",
	trigger = MapID == 9
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Tainted Light",
	points = 5,
	description = "Put an end to the Bishop's corruption in Chapter 11A",
	trigger = MapID == 0x0b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

   achievement(title = "Union Savior",
	points = 5,
	description = "Liberate the prisoners and end the cruel worker treatment in Chapter 11B",
	trigger = MapID == 0x1b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
   )


    achievement(title = "Magical Oasis",
	points = 5,
	description = "Brave the harsh desert and reach Arcadia in Chapter 14",
	trigger = MapID == 0x0e
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Dragon's Folly",
	points = 10,
	description = "Liberate Castle Aquileia and save Etruria from Bern in Chapter 16",
	trigger = MapID == 0x10
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Frozen Hell",
	points = 10,
	description = "Defeat the High Chancellor and restore order to Ilia in Chapter 20A",
	trigger = MapID == 0x14
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Free as the Wind",
	points = 10,
	description = "Defeat Bern's occupation force and garantee freedom for Sacae in Chapter 20B",
	trigger = MapID == 0x1f
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Dream's End",
	points = 10,
	description = "End King Zephiel's madness in Chapter 22",
	trigger = MapID == 0x16
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Dragonslayer",
	points = 25,
	description = "Rid the world of the Demon Dragon in the Final Chapter",
	trigger = MapID == 0x19
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Heart of a Hero",
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

    achievement(title = "Volcanic Strength",
	points = 5,
	description = "Obtain Durandal",
	trigger = MapID == 0x20
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )

    achievement(title = "Lightning Strike Again",
	points = 5,
	description = "Obtain Armads",
	trigger = MapID == 0x21
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )        


    achievement(title = "Water Temple",
	points = 5,
	description = "Obtain Forblaze",
	trigger = MapID == 0x22
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Reaching to the Heaven",
	points = 10,
	description = "Obtain Aureola",
	trigger = MapID == 0x23
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Confusion of the Senses",
	points = 10,
	description = "Obtain Maltet from its resting place",
	trigger = MapID == 0x24
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "Ambush Troubles",
	points = 10,
	description = "Obtain Murgleis from its resting place",
	trigger = MapID == 0x25
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


    achievement(title = "The Last Seal",
	points = 10,
	description = "Obtain Apocalypse",
	trigger = MapID == 0x26
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
    )


///
/// Hard Mode
    achievement(title = "Young Veteran",
	points = 1,
	description = "Defeat the bandit group attacking Pherae in Chapter 1 [Hard Mode]",
	trigger = MapID == 1
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
            && HardDifficulty == 1
    )


    achievement(title = "Deep Cleansing",
	points = 5,
	description = "Defeat the Pirate forces and choose your next destination in Chapter 9 [Hard Mode]",
	trigger = MapID == 9
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
            && HardDifficulty == 1
    )

    achievement(title = "Short Rest",
	points = 5,
	description = "Brave the harsh desert and reach Arcadia in Chapter 14 [Hard Mode]",
	trigger = MapID == 0x0e
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
            && HardDifficulty == 1
    )

    achievement(title = "Cycle of Hatred",
	points = 10,
	description = "End King Zephiel's madness in Chapter 22 [Hard Mode]",
	trigger = MapID == 0x16
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
            && HardDifficulty == 1
    )


    achievement(title = "Raging Inferno",
	points = 25,
	description = "Rid the world of the Demon Dragon in the Final Chapter [Hard Mode]",
	trigger = MapID == 0x19
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && YouWin == 1
            && prev(YouWin) == 0
            && HardDifficulty == 1
    )


    achievement(title = "Master Strategist",
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
/// Trial Maps
    achievement(title = "A New Cycle",
	points = 10,
	description = "Clear Trial Map 1 with an S Rank",
	trigger =  MapID == 0x28 
            && prev(MapID) == MapID
            && TurnCounter > 0
            && byte(0x02714c) == 5
            && prev(byte(0x02714c)) == 4
            && YouWin == 1

    )

    achievement(title = "A Bad Day for Rain",
	points = 10,
	description = "Clear Trial Map 2 with an S Rank",
	trigger =  MapID == 0x29
            && prev(MapID) == MapID
            && TurnCounter == 0x15
            && byte(0x02714c) == 5
            && prev(byte(0x02714c)) == 4

    )

    achievement(title = "Heart Pure as Snow",
	points = 10,
	description = "Clear Trial Map 3 with an S Rank",
	trigger =  MapID == 0x2a 
            && prev(MapID) == MapID
            && TurnCounter == 0x15
            && byte(0x02714c) == 5
            && prev(byte(0x02714c)) == 4

    )   

    achievement(title = "Hard Scales, Sea Salt",
	points = 10,
	description = "Clear Trial Map 4 with an S Rank",
	trigger =  MapID == 0x2b
            && prev(MapID) == MapID
            && TurnCounter > 0
            && byte(0x02714c) == 5
            && prev(byte(0x02714c)) == 4
            && YouWin == 1

    )    

    achievement(title = "Righteous is not Easy",
	points = 25,
	description = "Clear Trial Map 5 with an S Rank",
	trigger =  MapID == 0x2c
            && prev(MapID) == MapID
            && TurnCounter > 0
            && byte(0x02714c) == 5
            && prev(byte(0x02714c)) == 4
            && YouWin == 1

    )     
///
/// Misc Cheevos


     achievement(title = "Wait, This Whole Thing Was Your Plan!",
	points = 2,
	description = "Talk to Debias with Lilina in Chapter 8",
	trigger = MapID == 8
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit3(0x4899) == 1
            && prev(bit3(0x4899)) == 0
     )

     achievement(title = "Aim True",
	points = 2,
	description = "Talk to Wolt with Lilina in Chapter 8",
	trigger = MapID == 8
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit4(0x4899) == 1
            && prev(bit4(0x4899)) == 0
     )

     achievement(title = "Desert Mouse",
	points = 10,
	description = "Obtain every hidden desert treasures",
	trigger = MapID == 0x0e
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && (bit0(0x4899) + bit1(0x4899) + bit2(0x4899) + bit3(0x4899) + bit4(0x4899) + bit5(0x4899) + bit6(0x4899)) == 7
            && prev((bit0(0x4899) + bit1(0x4899) + bit2(0x4899) + bit3(0x4899) + bit4(0x4899) + bit5(0x4899) + bit6(0x4899))) == 6
     )


     achievement(title = "Be Useful for Once",
	points = 5,
	description = "Find the Guiding Ring in the desert with Sophia",
	trigger = MapID == 0x0e
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4899) == 1
            && prev(bit7(0x4899)) == 0
     )

     achievement(title = "Graceless Fall",
	points = 5,
	description = "Steal a Delphi Shield",
	trigger = MapID == 0x10
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && LastItemCheck(0x7c)
     )

     achievement(title = "Serious Vocation",
	points = 2,
	description = "Talk to Saul with Yoder in Chapter 21",
	trigger = MapID == 0x15
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit0(0x489a) == 1
            && prev(bit0(0x489a)) == 0
     )

     achievement(title = "True Faith",
	points = 2,
	description = "Talk to Dorothy with Yoder in Chapter 21",
	trigger = MapID == 0x15
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit1(0x489a) == 1
            && prev(bit1(0x489a)) == 0
     )     

     achievement(title = "New Lord of the Sky",
	points = 5,
	description = "Talk to Galle with Zeiss in Chapter 21",
	trigger = MapID == 0x15
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4899) == 1
            && prev(bit7(0x4899)) == 0
     )   

     achievement(title = "Roaching Out",
	points = 5,
	description = "Call for reinforcements in the Final Chapter",
	trigger = MapID == 0x19
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit6(0x4893) == 1
            && prev(bit6(0x4893)) == 0
     )      

     achievement(title = "No Time Like the Present",
	points = 10,
	description = "Promote Roy before Chapter 10",
	trigger = (MapID <= 0x09
            || MapID == 0x20)
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && LastLoadedCharID == prev(LastLoadedCharID)
            && LastLoadedClassID == 0xb3c0
            && prev(LastLoadedClassID) == 0xa130
     )  

     achievement(title = "Brand New Toy",
	points = 5,
	description = "Promote a Thief using a Hero Crest",
	trigger = prev(MapID) == MapID
            && TurnCounter > 0
            && LastLoadedCharID == prev(LastLoadedCharID)
            && LastLoadedClassID == 0xae20
            && prev(LastLoadedClassID) == 0xaf88
     )  



///
/// Recruitment Cheevos

     achievement(title = "Magical Fairy",
	points = 3,
	description = "Recruit Lugh",
	trigger = MapID == 0x03
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4898) == 1
            && prev(bit7(0x4898)) == 0
     )   

     achievement(title = "Sharp Edge",
	points = 5,
	description = "Recruit Rutger",
	trigger = MapID == 0x04
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   

     achievement(title = "The Girl from the Plains",
	points = 5,
	description = "Recruit Sue",
	trigger = MapID == 0x06
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit6(0x4899) == 1
            && prev(bit6(0x4899)) == 0
     ) 

     achievement(title = "Eternal Turncoat",
	points = 5,
	description = "Recruit Debias",
	trigger = MapID == 0x07
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4899) == 1
            && prev(bit7(0x4899)) == 0
     )          

     achievement(title = "Blade Prodigy",
	points = 5,
	description = "Recruit Fir",
	trigger = MapID == 0x09
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit4(0x4898) == 1
            && prev(bit4(0x4898)) == 0
     )   


     achievement(title = "Straight Arrow",
	points = 5,
	description = "Recruit Sin",
	trigger = MapID == 0x09
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   


     achievement(title = "Nobless Oblige",
	points = 5,
	description = "Recruit Klein",
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

     achievement(title = "Savage Strength",
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

     achievement(title = "Honor and Grace",
	points = 5,
	description = "Recruit Thea",
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


     achievement(title = "Maritime Expertise",
	points = 5,
	description = "Recruit Geese",
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


     achievement(title = "Power Mustache",
	points = 5,
	description = "Recruit Bartre",
	trigger = MapID == 0x1b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   

     achievement(title = "Showing the Way",
	points = 5,
	description = "Recruit Echidna",
	trigger = MapID == 0x0b
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   

     achievement(title = "Dark Temptations",
	points = 5,
	description = "Recruit Raigh",
	trigger = MapID == 0x0c
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit4(0x4898) == 1
            && prev(bit4(0x4898)) == 0
     )   

     achievement(title = "Cat's Eyes",
	points = 5,
	description = "Recruit Cath",
	trigger = prev(MapID) == MapID
            && TurnCounter > 0
            && bit2(0x4890) == 1
            && bit3(0x4890) == 1
            && bit4(0x4890) == 1
            && prev(bit4(0x4890)) == 0
            && MapID >= 0x0c
     )   

     achievement(title = "Power Up",
	points = 2,
	description = "Recruit Cath only during Chapter 22",
	trigger = prev(MapID) == MapID
            && TurnCounter > 0
            && bit2(0x4890) == 1
            && bit3(0x4890) == 1
            && bit4(0x4890) == 1
            && prev(bit4(0x4890)) == 0
            && MapID == 0x16
     )   


     achievement(title = "Greatest Knight of the Realm",
	points = 5,
	description = "Recruit Perceval",
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

     achievement(title = "Ugly Mug",
	points = 5,
	description = "Recruit Garret",
	trigger = MapID == 0x0f
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit6(0x4898) == 1
            && prev(bit6(0x4898)) == 0
     )   

     achievement(title = "Charity Case",
	points = 5,
	description = "Recruit Hugh",
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

     achievement(title = "Wyrm's Honor",
	points = 5,
	description = "Recruit Zeiss",
	trigger = MapID == 0x10
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4898) == 1
            && prev(bit7(0x4898)) == 0
     )   

     achievement(title = "Papa Roach",
	points = 5,
	description = "Recruit Roach",
	trigger = MapID == 0x23
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit3(0x4898) == 1
            && prev(bit3(0x4898)) == 0
     )   

     achievement(title = "Frozen Matron",
	points = 10,
	description = "Recruit Juno",
	trigger = MapID == 0x14
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit5(0x4898) == 1
            && prev(bit5(0x4898)) == 0
     )   

     achievement(title = "Pack Leader",
	points = 10,
	description = "Recruit Dayan",
	trigger = MapID == 0x1f
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit4(0x4898) == 1
            && prev(bit4(0x4898)) == 0
     )   

     achievement(title = "Appeased Demon",
	points = 10,
	description = "Recruit Karel",
	trigger = MapID == 0x17
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit3(0x4898) == 1
            && prev(bit3(0x4898)) == 0
     )   

     achievement(title = "Tempest of Love",
	points = 10,
	description = "Recruit Galle",
	trigger = MapID == 0x17
			&& prev(MapID) == MapID
            && TurnCounter > 0
            && bit7(0x4898) == 1
            && prev(bit7(0x4898)) == 0
     )  