// ~Hack~ Andaron Saga
// #ID = 26735
// 20240916 Version - Sines

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

ChapterNames = { 
                    0:"1 - Rambunctious Reunion",
                    1:"2 - Northern Raiders",
                    2:"3 - Glory of the Hunt",
                    3:"4 - Maiden of Light",
                    4:"5 - Shrouded Shrine",
                    5:"6 - Nest of Terrors",
                    6:"7 - Scalies Above!",
                    7:"8 - Grim Reunion",
                    8:"9 - Grand Crossing",
                    9:"10 - Malthrak Ablaze",
                    0xa:"11 - Storming the Castle",
                    0xb:"12 - Long Live the King",
                    0xc:"13 - Prison Break",
                    0xd:"14 - Deceit By Dawn",
                    0xe:"15 - Sea Skirmish",
                    0xf:"16 - Berserkergang",
                    0x10:"17 - Ethereal Legion",
                    0x11:"18 - Decisive Duel",
                    0x12:"19 - Call of the Void",
                    0x13:"20 - Pyrion's Envoy",
                    0x14:"21 - Trial by Fire",
                    0x15:"22 - Rightful Ruler",
                    0x16:"23 - Styxian Sands",
                    0x17:"24 - Tomb of Horrors",
                    0x18:"25 - Lich's Requiem",
                    0x19:"26 - Fortress of Flames",
                    0x1a:"27 - Abominations",
                    0x1b:"28 - Winds of Change",
                    0x1c:"29 - Against All Odds",
                    0x1d:"30 - Dire Pursuit",
                    0x1e:"31 - Light's Return",
                    0x1f:"32 - Dark Origin",
                    0x3f:"1x - First Light",
                    0x3e:"2x - Angvik's Forest",
                    0x3d:"4x - Counting the Cost",
                    0x3c:"6x - A Brief Respite",
                    0x3b:"7x - Heroes of Silvermist",
                    0x39:"9x - The Wedding",
                    0x37:"12x - Ashen Haven",
                    0x36:"14x - Last Light",
                    0x35:"16x - Skadi's Clemency",
                    0x34:"22x - Alliances Forged",
                    0x33:"25x - Declaration of War",
                    0x32:"30x - Before the Storm",
                    0x21:"32x - Andaron Saga",
                    0x20:"Epilogue"

                    }  

ASCIIStart = 0x326ac

// Variable

LastItemObtained = byte(0x05f4)
MapID = byte(0x33cfe)
TurnPhase = byte(0x33cff) // Player phase == 0
TurnCounter = byte(0x33d00)
LunaticDifficulty = bit6(0x33d04)
SecretFlagCheck = bit6(0x5254)
CharIDStart = byte(0x033e4c)
CurrentUnit = word(0x424ec)

function LoadCheck() => MapID == prev(MapID)
function LunaticCheck() => LunaticDifficulty == 1
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

function ChapterProgLunatic(ChapterIDStart, ChapterIDEnd, CheevoName, CheevoPoints){
	
    title = CheevoName
	points = CheevoPoints
	description = format("Clear Chapter {0} with the Lunatic Secret Flag cleared", ChapterNames[ChapterIDStart])
	trigger = MapID == ChapterIDEnd
			&& prev(MapID) == ChapterIDStart
            && LunaticCheck()
            && SecretFlagCheck == 1
            && TurnCounter > 0


    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

    achievement(title="Word of Warning",
                description = "This Hack has know issues with some cores, use VBA-M. Some achievements check for text, skip cutscenes at your own risk.",
                points = 0,
                trigger = TurnCounter == 1 && prev(TurnCounter) == 0
)  

    achievement(title="The Adventure Begins",
                description = "Clear Ch" + ChapterNames[0],
                points = 1,
                trigger = MapID == 0x3f
                       && prev(MapID) == 0
                       && bit0(0x005272) == 1
)    

    achievement(title="Defender of the Oppressed",
                description = "Save all the Green Units in Chapter 1 to obtain a reward",
                points = 1,
                trigger = MapID == 0
                       && LastItemCheck(0x61)
                       && LoadCheck()
)    

    achievement(title="The Long Run",
                description = "Clear Ch" + ChapterNames[0]+ " with the Lunatic Secret Flag cleared",
                points = 3,
                trigger = MapID == 0x3f
                       && prev(MapID) == 0
                       && bit0(0x005272) == 1
                       && LunaticCheck()
                       && SecretFlagCheck == 1
)  

ChapterProg(1, 0x3e, "Friendly Neighbours", 1)

    achievement(title="Defender of the Oppressed",
                description = "Save all the Green Units in Chapter 2, just because you're a good guy",
                points = 1,
                trigger = MapID == 1
                       && LoadCheck()
                       && measured((bit7(0x5271) + bit0(0x5272) + bit1(0x5272) + bit2(0x5272)) == 4
                       , when = MapID == 1)
                       && prev(bit7(0x5271) + bit0(0x5272) + bit1(0x5272) + bit2(0x5272)) == 3

)   

    achievement(title="Foreign Representant",
                description = "Recruit Berit & Bjarki during Chapter 2",
                points = 1,
                trigger = MapID == 1
                       && LoadCheck()
                       && bit7(0x5270) == 1
                       && prev(bit7(0x5270)) == 0
                       
) 

    achievement(title="Hasty Assault",
                description = "Recruit Runa during Chapter 2",
                points = 1,
                trigger = MapID == 1
                       && LoadCheck()
                       && bit0(0x5271) == 1
                       && prev(bit0(0x5271)) == 0
                       
) 


ChapterProgLunatic(1, 0x3e, "Fiery Aunt", 3)

    achievement(title="Moonlight Reflexion",
                description = "Fish during Chapter 2x",
                points = 1,
                trigger = MapID == 0x3e
                       && LoadCheck()
                       && bit7(0x5272) == 1
                       && prev(bit7(0x5272)) == 0
                       
) 

ChapterProg(2, 3, "Trampling Ground", 1)

    achievement(title="Noble Warrior",
                description = "Recruit Garam at the end of Chapter 3",
                points = 2,
                trigger = MapID == 0x2
                       && LoadCheck()
                       && ascii_string_equals(0x0326bb, "Forest Warrior, Garam.")
                       && byte(0x0326bb) != prev(byte(0x0326bb))
                       
) 

ChapterProgLunatic(2, 3, "Khan Konqueror", 3)

ChapterProg(3, 0x3d, "The Last Light", 2)

    achievement(title="Good Deed",
                description = "Obtain the Holy Axe in Chapter 4",
                points = 2,
                trigger = MapID == 3
                       && LastItemCheck(0x83)
                       && LoadCheck()
)    

    achievement(title="Rallying the Citizenship",
                description = "Visit all the Houses in Chapter 4",
                points = 2,
                trigger = MapID == 3
                       && LoadCheck()
                       && measured((bit0(0x5271) + bit0(0x5272) + bit1(0x5272) + bit2(0x5272)) == 4
                       , when = MapID == 3)
                       && prev(bit0(0x5271) + bit0(0x5272) + bit1(0x5272) + bit2(0x5272)) == 3

)   

    achievement(title="Out of Season",
                description = "Recruit Natalie in Chapter 4",
                points = 1,
                trigger = MapID == 3
                       && LoadCheck()
                       && bit1(0x5271) == 1
                       && prev(bit1(0x5271)) == 0
                       
) 

ChapterProgLunatic(3, 0x3d, "Speed Dating", 3)

ChapterProg(4, 5, "Cleaning Duty", 2)

    achievement(title="Sword of Seal",
                description = "Use Dawncaller on a certain Altar to gain bonus stats in Chapter 5",
                points = 1,
                trigger = MapID == 4
                       && LoadCheck()
                       && bit5(0x5272) == 1
                       && prev(bit5(0x5272)) == 0
                       
) 

ChapterProgLunatic(4, 5, "Dust Force", 3)

ChapterProg(5, 0x3c, "Dread Cavern", 2)

    achievement(title="Nest of Treasures",
                description = "Obtain all the Treasure Chests items of Chapter 6 in a single session",
                points = 2,
                trigger = MapID == 5
                       && LoadCheck()
                       && once(MapID == 5 && LastItemCheck(0x50))
                       && once(MapID == 5 && LastItemCheck(0xc4))
                       && once(MapID == 5 && LastItemCheck(0x7b))
                       && once(MapID == 5 && LastItemCheck(0x47))
                       && once(MapID == 5 && LastItemCheck(0x81))
                       && once(MapID == 5 && LastItemCheck(0x55))
                       && once(MapID == 5 && LastItemCheck(0x5a))
                       && never(MapID != 5)
) 

    achievement(title="Venerable Master",
                description = "Recruit Zakarias in Chapter 6",
                points = 1,
                trigger = MapID == 5
                       && LoadCheck()
                       && byte(0x33d00) == 2
                       && prev(byte(0x33d00)) == 1
                       && bit7(0x5254) == 0
                       
) 

    achievement(title="Blasting Season",
                description = "Recruit Buggi in Chapter 6 or in Chapter 8",
                points = 2,
                trigger = (MapID == 5
                       && LoadCheck()
                       && bit0(0x5273) == 1
                       && prev(bit0(0x5273)) == 0)
                       ||
                       (MapID == 5
                       && LoadCheck()
                       && bit7(0x5273) == 1
                       && prev(bit7(0x5273)) == 0)
                       ||
                       (MapID == 7
                       && LoadCheck()
                       && bit0(0x5273) == 1
                       && prev(bit0(0x5273)) == 0)
                       
) 

ChapterProgLunatic(5, 0x3c, "Mother of All Omelette", 3)

    achievement(title="Bros being Pals",
                description = "Witness the Hot Spring event in Chapter 6x",
                points = 1,
                trigger = MapID == 0x3c
                       && LoadCheck()
                       && bit7(0x5271) == 1
                       && prev(bit7(0x5271)) == 0
                       
) 

    achievement(title="I Can Stop Whenever I Want",
                description = "Indulge in some gambling in Chapter 6x",
                points = 1,
                trigger = MapID == 0x3c
                       && LoadCheck()
                       && ((bit7(0x5270) == 1
                       && prev(bit7(0x5270)) == 0)
                       || (bit0(0x5271) == 1
                       && prev(bit0(0x5271)) == 0)
                       || (bit7(0x5272) == 1
                       && prev(bit7(0x5272)) == 0)
                       || (bit1(0x5273) == 1
                       && prev(bit1(0x5273)) == 0)
                       || (bit2(0x5273) == 1
                       && prev(bit2(0x5273)) == 0))
                    

                       
) 

ChapterProg(6, 0x3b, "Drake Overload", 3)

    achievement(title="Death From Above",
                description = "Recruit Jaheira in Chapter 7",
                points = 1,
                trigger = MapID == 6
                       && LoadCheck()
                       && bit7(0x5270) == 1
                       && prev(bit7(0x5270)) == 0
                       
) 

    achievement(title="Death From Below",
                description = "Recruit Kurt in Chapter 7",
                points = 1,
                trigger = MapID == 6
                       && LoadCheck()
                       && bit0(0x5271) == 1
                       && prev(bit0(0x5271)) == 0
                       
) 

ChapterProgLunatic(6, 0x3b, "Prompt Retreat", 5)

ChapterProg(7, 8, "City Defenders", 3)

    achievement(title="Friendly Neighbours",
                description = "Visit all the Houses in Chapter 8",
                points = 2,
                trigger = MapID == 7
                       && LoadCheck()
                       && measured((bit2(0x5272) + bit3(0x5272) + bit4(0x5272) + bit5(0x5272) + bit6(0x5272) + bit7(0x5273)) == 6
                       , when = MapID == 7)
                       && prev(bit2(0x5272) + bit3(0x5272) + bit4(0x5272) + bit5(0x5272) + bit6(0x5272) + bit7(0x5273)) == 5

)  

    achievement(title="Little Arrow",
                description = "Recruit Hailey in Chapter 8",
                points = 2,
                trigger = MapID == 7
                       && LoadCheck()
                       && bit7(0x5271) == 1
                       && prev(bit7(0x5271)) == 0
                       
) 

    achievement(title="Wings of Hope",
                description = "Recruit Shay in Chapter 8",
                points = 2,
                trigger = MapID == 7
                       && LoadCheck()
                       && bit0(0x5272) == 1
                       && prev(bit0(0x5272)) == 0
                       
) 

    achievement(title="Magical Potential",
                description = "Recruit Elmer in Chapter 8",
                points = 1,
                trigger = (MapID == 7
                       && LoadCheck()
                       && bit1(0x5273) == 1
                       && prev(bit1(0x5273)) == 0)
                       ||
                       (MapID == 7
                       && LoadCheck()
                       && bit7(0x5274) == 1
                       && prev(bit7(0x5274)) == 0)

                       
) 

ChapterProgLunatic(7, 8, "Thorough Cleansing", 5)

ChapterProg(8, 0x39, "Bursting Enemy Lines", 3)

    achievement(title="Another Path",
                description = "Give the Dawncaller to Mortimer in Chapter 9",
                points = 1,
                trigger = MapID == 8
                       && LoadCheck()
                       && bit6(0x5270) == 1
                       && prev(bit6(0x5270)) == 0
                       
) 

    achievement(title="Change in Leadership",
                description = "Obtain the Gladiolus Regalia early in Chapter 9",
                points = 25,
                trigger = MapID == 8
                       && LoadCheck()
                       && LastItemCheck(0xd6)
                       
) 

    achievement(title="Arrow in Flight",
                description = "Obtain the Galeshot Regalia early in Chapter 9",
                points = 10,
                trigger = MapID == 8
                       && LoadCheck()
                       && LastItemCheck(0xd8)
                       
) 

    achievement(title="Wings of Hope",
                description = "Recruit Christina in Chapter 9",
                points = 2,
                trigger = MapID == 8
                       && LoadCheck()
                       && bit2(0x5273) == 1
                       && prev(bit2(0x5273)) == 0
                       
) 

ChapterProgLunatic(8, 0x39, "Not So Great", 5)

ChapterProg(9, 0x0a, "Firefighters", 3)

    achievement(title="Acidic pH",
                description = "Find a way to obtain the only Warp Staff of the game in Chapter 10",
                points = 25,
                trigger = MapID == 9
                       && bit4(0x5271) == 1
                       && prev(bit4(0x5271)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Wrong House",
                description = "Find a way to obtain the Antitoxin from one of this game dev in Chapter 10. All this work for...this?",
                points = 5,
                trigger = MapID == 9
                       && bit0(0x5272) == 1
                       && prev(bit0(0x5272)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Number 1 Fan",
                description = "Talk to Hubert with Lilinette in Chapter 10",
                points = 2,
                trigger = MapID == 9
                       && bit4(0x5255) == 1
                       && prev(bit4(0x5255)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Prodigual Son's Return",
                description = "Have Elmer chat with his Master in Chapter 10",
                points = 2,
                trigger = MapID == 9
                       && trigger_when(bit2(0x5272) == 1
                       && prev(bit2(0x5272)) == 0)
                       && CurrentUnit == 0x4a30
                       && LoadCheck()
                       
) 

    achievement(title="Fixing Hands",
                description = "Obtained a Hammerne Staff in Chapter 10",
                points = 2,
                trigger = MapID == 9
                       && LastItemCheck(0x57)
                       && LoadCheck()
                       
) 


    achievement(title="Familiar Face",
                description = "Recruit Rodd in Chapter 10",
                points = 5,
                trigger = MapID == 9
                       && bit3(0x5258) == 1
                       && prev(bit3(0x5258)) == 0
                       && LoadCheck()
                       && TurnCounter > 0
                       
) 

    achievement(title="Tired Healer",
                description = "Recruit Harriet in Chapter 10",
                points = 5,
                trigger = MapID == 9
                       && LoadCheck()
                       && ((bit6(0x5270) == 1
                       && prev(bit6(0x5270)) == 0)
                       || (bit7(0x5257) == 1
                       && prev(bit7(0x5257)) == 0))
                       
                       
) 

    achievement(title="Butchered Reputation",
                description = "Recruit Ariel in Chapter 10, Chapter 11 or Chapter 29",
                points = 5,
                trigger = LoadCheck()
                       && ((MapID == 9
                       && bit3(0x5255) == 1
                       && prev(bit3(0x5255)) == 0)
                       || (MapID == 0xa
                       && bit3(0x5255) == 1
                       && prev(bit3(0x5255)) == 0)
                       || (MapID == 0x1c
                       && bit3(0x5255) == 1
                       && prev(bit3(0x5255)) == 0))
                       
                       
) 

ChapterProgLunatic(9, 0x0a, "No One Left Behind", 5)

ChapterProg(0x0a, 0x0b, "Push for the Throne", 5)

    achievement(title="War Treasury",
                description = "Loot all the Treasure Chests of Chapter 11 in a single session [Need to open the Chests yourself]",
                points = 3,
                trigger = MapID == 0xa
                       && LoadCheck()
                       && once(MapID == 0xa && LastItemCheck(0xdd) && TurnPhase == 0)
                       && once(MapID == 0xa && LastItemCheck(0x74) && TurnPhase == 0)
                       && once(MapID == 0xa && LastItemCheck(0x4e) && TurnPhase == 0)
                       && once(MapID == 0xa && LastItemCheck(0xdf) && TurnPhase == 0)
                       && never(MapID != 0xa)
) 

    achievement(title="Through the Fire and the Flames",
                description = "Obtain the Ashcleaver Regalia early in Chapter 11",
                points = 10,
                trigger = MapID == 0xa
                       && LoadCheck()
                       && LastItemCheck(0x93)
                       
) 

    achievement(title="Loyal Knight",
                description = "Recruit Isabelle at the end of Chapter 11",
                points = 2,
                trigger = MapID == 0x0a
                       && LoadCheck()
                       && ascii_string_equals(0x0326bb, "Stop right there, Baudimon")
                       && byte(0x0326bb) != prev(byte(0x0326bb))
                       
) 

ChapterProgLunatic(0x0a, 0x0b, "Naught but Ashes", 5)

ChapterProg(0x0b, 0x37, "Long Live the King", 5)

    achievement(title="Fratricide",
                description = "Defeat Randall in Chapter 12's duel",
                points = 3,
                trigger = MapID == 0x0b
                       && bit6(0x5252) == 1
                       && prev(bit6(0x5252)) == 0
                       && LoadCheck()
                       
) 

ChapterProgLunatic(0x0b, 0x37, "Familial Conflict", 5)

ChapterProg(0x0c, 0x0d, "Darkest Hour", 5)

    achievement(title="Dubious Savant",
                description = "Talk to the Weird Sage for the opportunity to switch your stats in Chapter 13",
                points = 2,
                trigger = MapID == 0x0c
                       && bit6(0x5270) == 1
                       && prev(bit6(0x5270)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="On the Lucky Side",
                description = "Find Jesse Lucky Knife in Chapter 13",
                points = 2,
                trigger = MapID == 0x0c
                       && bit6(0x5274) == 1
                       && prev(bit6(0x5274)) == 0
                       && bit5(0x5271) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Esteemed Henchman",
                description = "Obtain the Dragonshield with Rodd in Chapter 13",
                points = 3,
                trigger = MapID == 0x0c
                       && LoadCheck()
                       && LastItemCheck(0x60)
                       
) 

    achievement(title="Chainbreaker",
                description = "Free all the Prisoners in Chapter 13",
                points = 3,
                trigger = MapID == 0x0c
                       && LoadCheck()
                       && measured((bit0(0x5271) + bit1(0x5271) + bit2(0x5271) + bit3(0x5271) + bit0(0x5273)) == 5
                       , when = MapID == 0x0c)
                       && prev((bit0(0x5271) + bit1(0x5271) + bit2(0x5271) + bit3(0x5271) + bit0(0x5273))) == 4

)  

    achievement(title="Dungeon Dive",
                description = "Loot all the Treasure Chests of Chapter 13 in a single session [Need to open the Chests yourself]",
                points = 2,
                trigger = MapID == 0x0c
                       && LoadCheck()
                       && once(MapID == 0x0c && LastItemCheck(0x7d) && TurnPhase == 0)
                       && once(MapID == 0x0c && LastItemCheck(0xdc) && TurnPhase == 0)
                       && once(MapID == 0x0c && LastItemCheck(0xdb) && TurnPhase == 0)
                       && once(MapID == 0x0c && LastItemCheck(0xf3) && TurnPhase == 0)
                       && never(MapID != 0x0c)
) 

    achievement(title="You're Gonna Carry That Weight",
                description = "Get an HP boost for Jakka in Chapter 13",
                points = 2,
                trigger = MapID == 0x0d
                       && prev(MapID) == 0x0c
                       && bit5(0x5274) == 0
                       
) 

    achievement(title="Time to Cook",
                description = "Recruit Jesse in Chapter 13",
                points = 2,
                trigger = MapID == 0x0c
                       && LoadCheck()
                       && ((bit7(0x5270) == 1
                       && prev(bit7(0x5270)) == 0)
                       || (bit7(0x5274) == 1
                       && prev(bit7(0x5274)) == 0))
                       
                       
) 

    achievement(title="Late Arrival",
                description = "Recruit Albert in Chapter 13",
                points = 3,
                trigger = MapID == 0x0c
                       && bit7(0x5273) == 1
                       && prev(bit7(0x5273)) == 0
                       && LoadCheck()
                       
) 

ChapterProgLunatic(0x0c, 0x0d, "Mass Exodus", 5)

ChapterProg(0x0d, 0x36, "Hunted Rabbits", 5)

    achievement(title="Wilted Rose",
                description = "Obtain the Rosethorn Regalia early in Chapter 14",
                points = 10,
                trigger = MapID == 0x0d
                       && LoadCheck()
                       && LastItemCheck(0xd7)
                       
) 

    achievement(title="New Dawn",
                description = "Recruit Dawn in Chapter 14",
                points = 1,
                trigger = MapID == 0x0d
                       && LoadCheck()
                       && TurnPhase == 0x80
                       && TurnCounter == 1
                       && bit7(0x5254) == 1
                       
) 

ChapterProgLunatic(0x0d, 0x36, "Garden of Snakes", 5)

    achievement(title="Heavy Heart",
                description = "Recruit Caroline early in Chapter 14x",
                points = 3,
                trigger = MapID == 0x49
                       && prev(MapID) == 0x36
                       && bit7(0x5258) == 1
                       
) 

ChapterProg(0x0e, 0x0f, "Troubling Boat Ride", 5)

    achievement(title="Clearing the Competition",
                description = "Kill Thors, Greta and Sigmar in Chapter 15",
                points = 3,
                trigger = MapID == 0x0f
                       && prev(MapID) == 0x0e
                       && measured((bit1(0x5270) + bit6(0x5270) + bit7(0x5270) ) == 3
                       )
                       
) 

ChapterProgLunatic(0x0e, 0x0f, "Reverse Pirates", 5)

ChapterProg(0x0f, 0x35, "Black Ice", 5)

    achievement(title="Everywhere at Once",
                description = "Protect all the villages in Chapter 16",
                points = 3,
                trigger = MapID == 0x0f
                       && bit0(0x5261) == 1
                       && prev(bit0(0x5261)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Gruff Uncle",
                description = "Get a gift from Halfdan in Chapter 16",
                points = 2,
                trigger = MapID == 0x0f
                       && bit0(0x5273) == 1
                       && prev(bit0(0x5273)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Boots with the Fur",
                description = "Obtain the Boots in Chapter 16",
                points = 10,
                trigger = MapID == 0x0f
                       && LoadCheck()
                       && LastItemCheck(0x62)
                       
) 

    achievement(title="Dream of Glory",
                description = "Recruit Ralf in Chapter 16",
                points = 1,
                trigger = MapID == 0x0f
                       && bit4(0x5271) == 1
                       && prev(bit4(0x5271)) == 0
                       && LoadCheck()
                       
) 

ChapterProgLunatic(0x0f, 0x35, "Snow Leopard", 5)

ChapterProg(0x10, 0x11, "Demon Realm", 5)

    achievement(title="Demon Pact",
                description = "Accept Asmodeus's Pact in Chapter 17. After all, what's the worst that could happen?",
                points = 1,
                trigger = MapID == 0x10
                       && LoadCheck()
                       && LastItemCheck(0x9f)
                       
) 

    achievement(title="The Old House",
                description = "Obtain the Void Shield skill with Victoria or Caroline in Chapter 17. Can you restore the Old House to their former glory?",
                points = 25,
                trigger = MapID == 0x10
                       && bit7(0x5273) == 1
                       && prev(bit7(0x5273)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="LTC Machine",
                description = "Obtain the Galeforce skill for Helga in Chapter 17",
                points = 10,
                trigger = MapID == 0x10
                       && LoadCheck()
                       && (byte(0x46a55) == 0x30 && prev(byte(0x46a55)) == 0
                       || byte(0x46a56) == 0x30 && prev(byte(0x46a56)) == 0
                       || byte(0x46a57) == 0x30 && prev(byte(0x46a57)) == 0
                       || byte(0x46a58) == 0x30 && prev(byte(0x46a58)) == 0)
                       
) 

    achievement(title="Devil Gear",
                description = "Loot all the Treasure Chests of Chapter 17 in a single session [Need to open the Chests yourself]",
                points = 5,
                trigger = MapID == 0x10
                       && LoadCheck()
                       && once(MapID == 0x10 && LastItemCheck(0x56) && TurnPhase == 0)
                       && once(MapID == 0x10 && LastItemCheck(0x57) && TurnPhase == 0)
                       && once(MapID == 0x10 && LastItemCheck(0xb7) && TurnPhase == 0)
                       && once(MapID == 0x10 && LastItemCheck(0x3c) && TurnPhase == 0)
                       && once(MapID == 0x10 && LastItemCheck(0x64) && TurnPhase == 0)
                       && once(MapID == 0x10 && LastItemCheck(0xed) && TurnPhase == 0)
                       && never(MapID != 0x10)
) 
ChapterProgLunatic(0x10, 0x11, "Hell Broke Loose", 5)

    achievement(title="Arena Fighting",
                description = "Clear Chapter 18 - Decisive Duel by beating Tyronar in a Group combat",
                points = 3,
                trigger = MapID == 0x12
                       && prev(MapID) == 0x11
                       && bit6(0x5270) == 1
                       
) 

    achievement(title="Let Me Solo Him",
                description = "Clear Chapter 18 - Decisive Duel by beating Tyronar in a Duel",
                points = 2,
                trigger = MapID == 0x12
                       && prev(MapID) == 0x11
                       && bit6(0x5270) == 0
                       
) 

    achievement(title="New Blood",
                description = "Promote Ralf to a secret class in Chapter 18",
                points = 5,
                trigger = MapID == 0x12
                       && prev(MapID) == 0x11
                       && bit3(0x5271) == 1
                       
) 

ChapterProgLunatic(0x11, 0x12, "Ordered Execution", 5)

ChapterProg(0x12, 0x13, "It's Always Snakes", 5)

    achievement(title="Righteous Anger",
                description = "Deploy Theodor in Chapter 19 to get his bonus skill",
                points = 3,
                trigger = MapID == 0x12
                       && LoadCheck()
                       && (byte(0x46985) == 0xce && prev(byte(0x46985)) == 0
                       || byte(0x46986) == 0xce && prev(byte(0x46986)) == 0
                       || byte(0x46987) == 0xce && prev(byte(0x46987)) == 0
                       || byte(0x46988) == 0xce && prev(byte(0x46988)) == 0)
                       
) 

    achievement(title="Unholy Path",
                description = "Obtain the Volsunga tome in Chapter 19",
                points = 10,
                trigger = MapID == 0x12
                       && LoadCheck()
                       && LastItemCheck(0x97)
                       
) 

ChapterProgLunatic(0x12, 0x13, "Facing Mortality", 5)

ChapterProg(0x13, 0x14, "In the Frying Pan", 5)

    achievement(title="Magical Progress",
                description = "Have Elmer chat with his Master in Chapter 20",
                points = 2,
                trigger = MapID == 0x13
                       && trigger_when(bit3(0x5272) == 1
                       && prev(bit3(0x5272)) == 0)
                       && CurrentUnit == 0x4a30
                       && LoadCheck()
                       
) 

    achievement(title="Mountainside",
                description = "Visit all the Villages and Churches in Chapter 20",
                points = 3,
                trigger = MapID == 0x13
                       && LoadCheck()
                       && measured((bit0(0x5271) + bit1(0x5271) + bit2(0x5271) + bit3(0x5271) + bit4(0x5271) + bit5(0x5271)) == 6
                       , when = MapID == 0x13)
                       && prev((bit0(0x5271) + bit1(0x5271) + bit2(0x5271) + bit3(0x5271) + bit4(0x5271) + bit5(0x5271))) == 5

)  

    achievement(title="Ruined Abode",
                description = "Obtain the secret Body Ring in Chapter 20",
                points = 2,
                trigger = MapID == 0x13
                       && bit0(0x5273) == 1
                       && prev(bit0(0x5273)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Disillusioned Drake",
                description = "Recruit Miriam at the end of Chapter 20",
                points = 2,
                trigger = MapID == 0x14
                       && prev(MapID) == 0x13
                       && bit5(0x5255) == 0
                       
) 

    achievement(title="Zealot Priestess",
                description = "Recruit Ashe at the end of Chapter 20",
                points = 10,
                trigger = MapID == 0x14
                       && prev(MapID) == 0x13
                       && bit5(0x5255) == 1
                       
) 


ChapterProgLunatic(0x13, 0x14, "White Materia", 5)

ChapterProg(0x14, 0x15, "Gatecrash", 5)

    achievement(title="Faith Retreat",
                description = "Visit all the Churches in Chapter 21",
                points = 3,
                trigger = MapID == 0x14
                       && LoadCheck()
                       && measured((bit0(0x5274) + bit1(0x5274) + bit2(0x5274) + bit7(0x5273) ) == 4
                       , when = MapID == 0x14)
                       && prev((bit0(0x5274) + bit1(0x5274) + bit2(0x5274) + bit7(0x5273))) == 3

)  

    achievement(title="Fire Embla",
                description = "Steal the Holy Symbol from Embla in Chapter 21",
                points = 5,
                trigger = MapID == 0x14
                       && LoadCheck()
                       && LastItemCheck(0x7c)
                       
) 

ChapterProgLunatic(0x14, 0x15, "Synchronised Hit Squads", 5)

ChapterProg(0x15, 0x34, "Drake Power", 5)

    achievement(title="Tricky Rescue",
                description = "Obtain the Boots in Chapter 22",
                points = 10,
                trigger = MapID == 0x15
                       && LoadCheck()
                       && LastItemCheck(0x62)
                       
) 

ChapterProgLunatic(0x15, 0x34, "Personal Guard", 5)

ChapterProg(0x16, 0x17, "Treacherous Sands", 5)

    achievement(title="Buried Riches",
                description = "Obtain all the Secret Treasures in Chapter 23",
                points = 3,
                trigger = MapID == 0x16
                       && LoadCheck()
                       && measured((bitcount(0x5274)   == 7)
                       , when = MapID == 0x16)
                       && prev((bitcount(0x5274))) == 6

)  

    achievement(title="Friends from Foes",
                description = "Save all the Slaves in Chapter 23",
                points = 5,
                trigger = MapID == 0x16
                       && LoadCheck()
                       && (byte(0x468a5) == 0x36 && prev(byte(0x468a5)) == 0
                       || byte(0x468a6) == 0x36 && prev(byte(0x468a6)) == 0
                       || byte(0x468a7) == 0x36 && prev(byte(0x468a7)) == 0
                       || byte(0x468a8) == 0x36 && prev(byte(0x468a8)) == 0)

)  

    achievement(title="Real Gentleman",
                description = "Save all the Dancers in Chapter 23",
                points = 5,
                trigger = MapID == 0x16
                       && LoadCheck()
                       && LastItemCheck(0x62)

)  

    achievement(title="Dark Secrets",
                description = "Recruit Varg in Chapter 23",
                points = 2,
                trigger = MapID == 0x16
                       && LoadCheck()
                       && ((bit1(0x5272) == 1
                       && prev(bit1(0x5272)) == 0)
                       || (bit2(0x5272) == 1
                       && prev(bit2(0x5272)) == 0)
                       || (bit3(0x5272) == 1
                       && prev(bit3(0x5272)) == 0)
                       || (bit4(0x5272) == 1
                       && prev(bit4(0x5272)) == 0)
                       )
                       
                       
) 

    achievement(title="Back to the Classics",
                description = "Recruit Zahri at the end of Chapter 23",
                points = 3,
                trigger = MapID == 0x17
                       && prev(MapID) == 0x16
                       && bit1(0x5255) == 1
                       && bit0(0x5272) == 0
                       
) 
ChapterProgLunatic(0x16, 0x17, "Plight of the People", 5)

ChapterProg(0x17, 0x18, "Lovely Stroll", 5)

    achievement(title="Tomb Raiders",
                description = "Obtain all the Secret Treasures in Chapter 24",
                points = 3,
                trigger = MapID == 0x17
                       && LoadCheck()
                       && measured((bit1(0x5274) + bit2(0x5274) + bit3(0x5274) + bit4(0x5274) ) == 4
                       , when = MapID == 0x17)
                       && prev((bit1(0x5274) + bit2(0x5274) + bit3(0x5274) + bit4(0x5274))) == 3

)  

    achievement(title="Lost Treasure",
                description = "Obtain the Ring in Chapter 24",
                points = 5,
                trigger = MapID == 0x17
                       && LoadCheck()
                       && LastItemCheck(0xa4)

)  

    achievement(title="Familial Bond",
                description = "Talk to Nemesis with Varg in Chapter 24",
                points = 2,
                trigger = MapID == 0x17
                       && bit6(0x5270) == 1
                       && prev(bit6(0x5270)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Weird but Fair",
                description = "Talk to the Weird Sage to receive a free skill in Chapter 24",
                points = 2,
                trigger = MapID == 0x17
                       && LoadCheck()
                       && ascii_string_equals(0x0326b5, "And with that.")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
) 

    achievement(title="Constant Vigilance",
                description = "Obtain the Watchful skill from the Weird Sage in Chapter 24. The quest to restore the old house continues!",
                points = 10,
                trigger = MapID == 0x17
                       && LoadCheck()
                       && (byte(0x46ab5) == 0xcd && prev(byte(0x46ab5)) == 0x00 
                       || byte(0x46ab6) == 0xcd && prev(byte(0x46ab6)) == 0x00
                       || byte(0x46ab7) == 0xcd && prev(byte(0x46ab7)) == 0x00 
                       || byte(0x46ab8) == 0xcd && prev(byte(0x46ab8)) == 0x00
                       || byte(0x46965) == 0xcd && prev(byte(0x46965)) == 0x00 
                       || byte(0x46966) == 0xcd && prev(byte(0x46966)) == 0x00 
                       || byte(0x46967) == 0xcd && prev(byte(0x46967)) == 0x00 
                       || byte(0x46968) == 0xcd && prev(byte(0x46968)) == 0x00)

)  

ChapterProgLunatic(0x17, 0x18, "Ancient Nightmare", 5)

ChapterProg(0x18, 0x33, "Yet Another Putsch", 5)

    achievement(title="Over the Edge",
                description = "Obtain the Lightbringer skill for Zakarias in Chapter 25",
                points = 2,
                trigger = MapID == 0x18
                       && LoadCheck()
                       && (byte(0x469b5) == 0x39 && prev(byte(0x469b5)) == 0x00 
                       || byte(0x469b6) == 0x39 && prev(byte(0x469b6)) == 0x00
                       || byte(0x469b7) == 0x39 && prev(byte(0x469b7)) == 0x00 
                       || byte(0x469b8) == 0x39 && prev(byte(0x469b8)) == 0x00)

)  

    achievement(title="Double Agent",
                description = "Recruit Khepri in Chapter 25",
                points = 5,
                trigger = MapID == 0x18
                       && LoadCheck()
                       && ((bit4(0x5272) == 1
                       && prev(bit4(0x5272)) == 0)
                       || (ascii_string_equals(0x0326b1, "Alright, they've taken down")
                       && byte(0x0326b1) != prev(byte(0x0326b1)))
                       )
                       
                       
) 

ChapterProgLunatic(0x18, 0x33, "To Kill a Mocking Lich", 5)

    achievement(title="Small Gesture",
                description = "Give back the Ring to Khepri in Chapter 25x",
                points = 5,
                trigger = MapID == 0x33
                       && LoadCheck()
                       && (byte(0x46bb5) == 0x9a && prev(byte(0x46bb5)) == 0x00 
                       || byte(0x46bb6) == 0x9a && prev(byte(0x46bb6)) == 0x00
                       || byte(0x46bb7) == 0x9a && prev(byte(0x46bb7)) == 0x00 
                       || byte(0x46bb8) == 0x9a && prev(byte(0x46bb8)) == 0x00)

)  

ChapterProg(0x19, 0x1a, "Guardbreaker", 10)

    achievement(title="The Last Laugh",
                description = "Fight Cassandra with Natalie and Jesse in Chapter 26",
                points = 5,
                trigger = MapID == 0x19
                       && (bit2(0x5273) + bit6(0x5274)) == 2
                       && prev(bit2(0x5273) + bit6(0x5274)) == 1
                       && LoadCheck()
                       
) 

    achievement(title="Old Protector",
                description = "Recruit John in Chapter 26",
                points = 3,
                trigger = MapID == 0x19
                       && LoadCheck()
                       && ((bit4(0x5274) == 1
                       && prev(bit4(0x5274)) == 0)
                       || (bit5(0x5274) == 1
                       && prev(bit5(0x5274)) == 0)
    )
    )

    achievement(title="Nobless Oblige",
                description = "Recruit Cyrus at the end of Chapter 26",
                points = 5,
                trigger = MapID == 0x19
                       && LoadCheck()
                       && ascii_string_equals(0x0326b6, "That's close enough, Flameguard.")
                       && byte(0x0326b6) != prev(byte(0x0326b6))
                       
)                        
                       


ChapterProgLunatic(0x19, 0x1a, "Surgeon's Strike", 10)

ChapterProg(0x1a, 0x1b, "Darkest Dungeon", 10)

    achievement(title="Light's Fury",
                description = "Obtain the Hopesfire in Chapter 27",
                points = 2,
                trigger = MapID == 0x1a
                       && LoadCheck()
                       && LastItemCheck(0x91)

)  

    achievement(title="Infernal Research",
                description = "Talk to Alvaro with Emilia and then convince her to switch back to your side in Chapter 27",
                points = 3,
                trigger = MapID == 0x1a
                       && bit3(0x5274) == 1
                       && prev(bit3(0x5274)) == 0
                       && bit2(0x5274) == 1
                       && LoadCheck()
                       
) 

    achievement(title="The Pale Man",
                description = "Fight Alvaro with Natalie and Jesse in Chapter 27",
                points = 5,
                trigger = MapID == 0x1a
                       && (bit0(0x5274) + bit1(0x5274)) == 2
                       && prev(bit0(0x5274) + bit1(0x5274)) == 1
                       && LoadCheck()
                       
) 

ChapterProgLunatic(0x1a, 0x1b, "Monster Purge", 10)

ChapterProg(0x1b, 0x1c, "Uphill Battle", 10)

    achievement(title="Vengeance's Tempest",
                description = "Obtain the Arcgale Regalia early in Chapter 28",
                points = 10,
                trigger = MapID == 0x1b
                       && LoadCheck()
                       && LastItemCheck(0x3e)
                       
) 

    achievement(title="Forest Spirit",
                description = "Talk to Drogon with Garam to convert him to your side in Chapter 28",
                points = 3,
                trigger = MapID == 0x1b
                       && bit6(0x5274) == 1
                       && prev(bit6(0x5274)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Qui Pro Quo",
                description = "Recruit Madeline in Chapter 28",
                points = 5,
                trigger = MapID == 0x1b
                       && bit7(0x5272) == 1
                       && prev(bit7(0x5272)) == 0
                       && bit3(0x5272) == 1
                       && bit6(0x5272) == 1
                       && LoadCheck()
                       
) 

ChapterProgLunatic(0x1b, 0x1c, "Auspicious Wind", 10)

ChapterProg(0x1c, 0x1d, "City's Siege", 10)

    achievement(title="Good Intentions, Bad End",
                description = "Surrender to Galahad at the start of Chapter 29",
                points = 1,
                trigger = MapID == 0x1c
                       && LoadCheck()
                       && ascii_string_equals(0x0326b9, "I'm sorry, I can't let")
                       && byte(0x0326b9) != prev(byte(0x0326b9))
                       
)    

    achievement(title="The Lost Regalia",
                description = "Obtain the Claymore Regalia in Chapter 29",
                points = 25,
                trigger = MapID == 0x1c
                       && bit6(0x5270) == 1
                       && prev(bit6(0x5270)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Blinding Rose",
                description = "Obtain the Alastor Regalia in Chapter 28",
                points = 10,
                trigger = MapID == 0x1c
                       && LoadCheck()
                       && LastItemCheck(0x8e)
                       
) 

    achievement(title="Business Partner",
                description = "Recruit Aubrey in Chapter 29",
                points = 5,
                trigger = MapID == 0x1c
                       && bit7(0x5271) == 1
                       && prev(bit7(0x5271)) == 0
                       && LoadCheck()
                       
) 
ChapterProgLunatic(0x1c, 0x1d, "Solid Architecture", 10)

ChapterProg(0x1d, 0x32, "Steel Fortress", 10)
    achievement(title="Little Knife, Big Damages",
                description = "Talk between Aubrey and Coulter to unlock the Lethality Skill in Chapter 30",
                points = 5,
                trigger = MapID == 0x1d
                       && bit6(0x5270) == 1
                       && prev(bit6(0x5270)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Road to Redemption",
                description = "Recruit Galahad in Chapter 30",
                points = 5,
                trigger = MapID == 0x1d
                       && LoadCheck()
                       && ascii_string_equals(0x0326b7, "Sorry, uncle, but I refuse")
                       && byte(0x0326b7) != prev(byte(0x0326b7))
                       
)   

ChapterProgLunatic(0x1d, 0x32, "Last Stand", 10)

    achievement(title="A Mother Always Worry",
                description = "Talk to Ella in Chapter 30x",
                points = 1,
                trigger = MapID == 0x32
                       && bit6(0x5271) == 1
                       && prev(bit6(0x5271)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="The Squire of Javelins",
                description = "Clear Ch" + ChapterNames[0x1e]+ " in any Difficulty",
                points = 10,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b8, "Nowhere to run. Damn.")
                       && byte(0x0326b8) != prev(byte(0x0326b8))
)    

    achievement(title="The Knight of Spears",
                description = "Clear Ch" + ChapterNames[0x1e]+ " in Hard Difficulty or Above",
                points = 10,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b8, "Nowhere to run. Damn.")
                       && byte(0x0326b8) != prev(byte(0x0326b8))
                       && bit5(0x33d32) == 1
)   

    achievement(title="The Lord of Lances",
                description = "Clear Ch" + ChapterNames[0x1e]+ " in Lunatic Difficulty",
                points = 25,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b8, "Nowhere to run. Damn.")
                       && byte(0x0326b8) != prev(byte(0x0326b8))
                       && bit6(0x33d04) == 1
)   

    achievement(title="Or I Could Use the Warp Staff!",
                description = "Use the Warp Staff in Chapter 31 to skip directly to the boss. I bet they never thought of that!",
                points = 1,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b5, "Well played.")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
)    

    achievement(title="Oh No You Don't",
                description = "Get back the Claymore Regalia in Chapter 31. You didn't do a game-long quest just to lose it after one chapter!",
                points = 5,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && LastItemCheck(0x18)
                       
) 

    achievement(title="By the Sword in my Hand",
                description = "Defeat the Sword wielding Mortimer in Chapter 31",
                points = 5,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b6, "Jakka. For this last part")
                       && byte(0x0326b6) != prev(byte(0x0326b6))
                       && bit7(0x5254) == 0
)    

    achievement(title="Might and Magic",
                description = "Defeat the Magic wielding Mortimer in Chapter 31",
                points = 5,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b6, "Jakka. For this last part")
                       && byte(0x0326b6) != prev(byte(0x0326b6))
                       && bit7(0x5254) == 1
) 

    achievement(title="They'll Never be a Memory",
                description = "Clear Ch" + ChapterNames[0x1e]+ " with the Lunatic Secret Flag cleared",
                points = 25,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b8, "Nowhere to run. Damn.")
                       && byte(0x0326b8) != prev(byte(0x0326b8))
                       && bit6(0x033d04) == 1
                       && SecretFlagCheck == 1
) 

    achievement(title="Darkest Abyss",
                description = "Clear Ch" + ChapterNames[0x1f],
                points = 10,
                trigger = MapID == 0x1f
                       && LoadCheck()
                       && bit2(0x5270) == 1
                       && prev(bit2(0x5270)) == 0
)    

    achievement(title="Beautiful Synergy",
                description = "Defeat your old comrade in Chapter 32",
                points = 5,
                trigger = MapID == 0x1f
                       && LoadCheck()
                       && ascii_string_equals(0x0326b3, "No... how...")
                       && byte(0x0326b3) != prev(byte(0x0326b3))
)    

    achievement(title="Blackest Night",
                description = "Clear Ch" + ChapterNames[0x1f]+" in Lunatic Difficulty",
                points = 10,
                trigger = MapID == 0x1f
                       && LoadCheck()
                       && bit2(0x5270) == 1
                       && prev(bit2(0x5270)) == 0
                       && bit6(0x033d04) == 1
)    

    achievement(title="Hard Work, Great Rewards",
                description = "Clear Ch" + ChapterNames[0x21]+ ". That's all folks!",
                points = 100,
                trigger = MapID == 0x21
                       && LoadCheck()
                       && bit2(0x5270) == 1
                       && prev(bit2(0x5270)) == 0
)   

    achievement(title="Eggman",
                description = "Kill Mangs in Chapter 32x. It's not mandatory but you'll feel better afterward.",
                points = 1,
                trigger = MapID == 0x21
                       && LoadCheck()
                       && bit3(0x5273) == 1
                       && prev(bit3(0x5273)) == 0
                       && bit6(0x5271) == 1
)   

/// Support Cheevos

    achievement(title="Loyal Knight",
                description = "Get a B Rank support between Baudimon and Samuel",
                points = 5,
                trigger = LoadCheck()
                       && (byte(0x468d5) == 0xc3 && prev(byte(0x468d5)) == 0x00 
                       || byte(0x468d6) == 0xc3 && prev(byte(0x468d6)) == 0x00
                       || byte(0x468d7) == 0xc3 && prev(byte(0x468d7)) == 0x00 
                       || byte(0x468d8) == 0xc3 && prev(byte(0x468d8)) == 0x00)

)  

    achievement(title="Brotherly Love",
                description = "Get a B Rank support between Baudimon and Mortimer",
                points = 5,
                trigger = MapID >= 0x09
                       && MapID <= 0x0b
                       && LoadCheck()
                       && ascii_string_equals(0x0326b7, "There you are.")
                       && byte(0x0326b7) != prev(byte(0x0326b7))
                       && (bit0(0x033e58) == 1
                       || bit0(0x033ea0) == 1)
)    

    achievement(title="What Is Love?",
                description = "Get a Betrothal A Rank support between Jakka and the lady of your choice",
                points = 5,
                trigger = LoadCheck()
                       && (byte(0x468a5) == 0x93 && prev(byte(0x468a5)) == 0x00 
                       || byte(0x468a6) == 0x93 && prev(byte(0x468a6)) == 0x00
                       || byte(0x468a7) == 0x93 && prev(byte(0x468a7)) == 0x00 
                       || byte(0x468a8) == 0x93 && prev(byte(0x468a8)) == 0x00)

)  

    achievement(title="Power of Money",
                description = "Get an A Rank Support with Darius resulting in a Black Gem gift.",
                points = 5,
                trigger = LoadCheck()
                       && LastItemCheck(0xba)
                       && MapID >= 0x17
                       
) 

    achievement(title="Time to Stop Cooking",
                description = "Get an A Rank Support between Jesse and either Natalie or John to help him get rid of his Dust addiction",
                points = 5,
                trigger = LoadCheck()
                       && (byte(0x46ad5) == 0xe3 && prev(byte(0x46ad5)) == 0x00 
                       || byte(0x46ad6) == 0xe3 && prev(byte(0x46ad6)) == 0x00
                       || byte(0x46ad7) == 0xe3 && prev(byte(0x46ad7)) == 0x00 
                       || byte(0x46ad8) == 0xe3 && prev(byte(0x46ad8)) == 0x00)

)  

    achievement(title="Horseback Healing",
                description = "Get an A Rank support between Lilinette and Garam",
                points = 5,
                trigger = LoadCheck()
                       && ascii_string_equals(0x0326b9, "Lilinette, I must speak with you")
                       && byte(0x0326b9) != prev(byte(0x0326b9))
)  

    achievement(title="Polyvalence",
                description = "Give Shay access to magic through a support conversation",
                points = 5,
                trigger = LoadCheck()
                       && ascii_string_equals(0x0326b8, "Big brother, how are you feeling?")
                       && byte(0x0326b8) != prev(byte(0x0326b8))
)  

    achievement(title="Wrong Vocation",
                description = "Give Runa access to magic through a support conversation",
                points = 5,
                trigger = LoadCheck()
                       && (ascii_string_equals(0x0326b5, "Oh, hello Shom.")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       || ascii_string_equals(0x0326ba, "Splendid! There you are, daughter!")
                       && byte(0x0326ba) != prev(byte(0x0326ba))
    )
)  

    achievement(title="The Whole Troop",
                description = "Get an A Rank support between Zahri and Angelus for double refresh shenanigans",
                points = 10,
                trigger = LoadCheck()
                       && ascii_string_equals(0x0326b9, "I... was wrong about you.")
                       && byte(0x0326b9) != prev(byte(0x0326b9))
)  