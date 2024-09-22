// ~Hack~ Andaron Saga: Randomizer
// #ID = 30881
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

    achievement(title="The Random Adventure Begins",
                description = "Clear Chapter " + ChapterNames[0],
                points = 1,
                trigger = MapID == 0x3f
                       && prev(MapID) == 0
                       && TurnCounter > 0
)    

ChapterProg(1, 0x3e, "Maybe Vikings?", 1)

ChapterProg(2, 3, "Hooves in the Night", 1)

ChapterProg(3, 0x3d, "City Revolt", 2)

ChapterProg(4, 5, "Random Shrine", 2)

ChapterProg(5, 0x3c, "Odd Cave", 2)

ChapterProg(6, 0x3b, "Who's Gonna Blast?", 2)

ChapterProg(7, 8, "From All Sides", 3)

ChapterProg(8, 0x39, "The Die Are Cast", 3)

ChapterProg(9, 0x0a, "Sweet Home", 3)

ChapterProg(0x0a, 0x0b, "Royal Invasion", 5)

ChapterProg(0x0b, 0x37, "Whacky Siblings", 5)

ChapterProg(0x0c, 0x0d, "Blind Bat", 5)

ChapterProg(0x0d, 0x36, "Hell to Pay", 5)

ChapterProg(0x0e, 0x0f, "By the Sea", 5)

ChapterProg(0x0f, 0x35, "No Icecream for You", 5)

ChapterProg(0x10, 0x11, "Mirror Dimension", 5)

    achievement(title="Team Spirit",
                description = "Clear Chapter 18 - Decisive Duel by beating Tyronar in a Group combat",
                points = 3,
                trigger = MapID == 0x12
                       && prev(MapID) == 0x11
                       && bit6(0x5270) == 1
                       
) 

    achievement(title="Final Destination, No Items",
                description = "Clear Chapter 18 - Decisive Duel by beating Tyronar in a Duel",
                points = 2,
                trigger = MapID == 0x12
                       && prev(MapID) == 0x11
                       && bit6(0x5270) == 0
                       
) 

ChapterProg(0x12, 0x13, "Those Who Slither in the Dark", 5)

ChapterProg(0x13, 0x14, "Sizzling Run", 5)

ChapterProg(0x14, 0x15, "Rush B", 5)

ChapterProg(0x15, 0x34, "Holding Out", 5)

ChapterProg(0x16, 0x17, "Gets Everywhere", 5)

ChapterProg(0x17, 0x18, "Random Skills for Random Classes", 5)

ChapterProg(0x18, 0x33, "Life is for the Living", 5)

ChapterProg(0x19, 0x1a, "Extinguished Flame", 10)

ChapterProg(0x1a, 0x1b, "No Pressure", 10)

ChapterProg(0x1b, 0x1c, "Wings of Hope", 10)

ChapterProg(0x1c, 0x1d, "Home Not Alone", 10)

ChapterProg(0x1d, 0x32, "Can Opener", 10)

    achievement(title="The Squire of Random",
                description = "Clear Ch" + ChapterNames[0x1e]+ " in any Difficulty",
                points = 10,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b8, "Nowhere to run. Damn.")
                       && byte(0x0326b8) != prev(byte(0x0326b8))
)    

    achievement(title="The Random of Spear",
                description = "Clear Ch" + ChapterNames[0x1e]+ " in Hard Difficulty or Above",
                points = 10,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b8, "Nowhere to run. Damn.")
                       && byte(0x0326b8) != prev(byte(0x0326b8))
                       && bit5(0x33d32) == 1
)   

    achievement(title="The Lord of Madness",
                description = "Clear Ch" + ChapterNames[0x1e]+ " in Lunatic Difficulty",
                points = 25,
                trigger = MapID == 0x1e
                       && LoadCheck()
                       && ascii_string_equals(0x0326b8, "Nowhere to run. Damn.")
                       && byte(0x0326b8) != prev(byte(0x0326b8))
                       && bit6(0x33d04) == 1
)   

    achievement(title="Spider Mommy",
                description = "Clear Ch" + ChapterNames[0x1f],
                points = 10,
                trigger = MapID == 0x1f
                       && LoadCheck()
                       && bit2(0x5270) == 1
                       && prev(bit2(0x5270)) == 0
)    

    achievement(title="What in the Unholy Devil Axe?",
                description = "Clear Ch" + ChapterNames[0x21]+ ". Time for another random run!",
                points = 100,
                trigger = MapID == 0x21
                       && LoadCheck()
                       && bit2(0x5270) == 1
                       && prev(bit2(0x5270)) == 0
)   