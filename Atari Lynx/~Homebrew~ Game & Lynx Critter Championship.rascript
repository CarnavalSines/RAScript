// ~Homebrew~ Game & Lynx: Critter Championship
// #ID = 19715
// 20240405 Version - Sines

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

// $1829: [32 Bit] ASCII "Fall" Game 3
//        Only displayed when Game 3 is running, used for in-game check
// $1A37: [32 Bit] ASCII "Fail" Game 2
//        Only displayed when Game 2 is running, used for in-game check
// $2F7A: [32 Bit] ASCII "Fall" Game 1
//        Only displayed when Game 1 is running, used for in-game check
// $2FAF: [8 Bit] Score Game 1
// $2FB1: [8 Bit] Fail Counter Game 1
// $3A9E: [8 Bit] Score Game 3
// $3AA7: [8 Bit] Fail Counter Game 3
// $56B9: [8 Bit] Score Game 2
// $56C3: [8 Bit] Fail Counter Game 2
// $B35F: [8 Bit] Game Version
//        00 > Game A
//        01 > Game B
// $B361: [8 Bit] Game Select
//        00 > Canyons
//        01 > Showdown
//        02 > Jelly Jump
//        03 > Credits

///Core
//Variables
Game1Check = ascii_string_equals(0x2f7a, "Fall")	
Game2Check = ascii_string_equals(0x1a37, "Fail")	
Game3Check = ascii_string_equals(0x1829, "Fall")	

ScoreGame1 = byte(0x2faf)
ScoreGame2 = byte(0x56b9)
ScoreGame3 = byte(0x3a9e)

FailGame1 = byte(0x2fb1)
FailGame2 = byte(0x56c3)
FailGame3 = byte(0x3aa7)

GameVersion = byte(0xb35f)
GameSelect = byte(0xb361)
//Constant

Cheevo_Dict = { // {0}: GameSelect - {1}: GameVersion - {2}: ASCII Check - {3}: Score - {4}: Cheevo Points - {5}: Cheevo Name - {6}: Game Name - {7}: Mode
                    0x01: [00, 00, Game1Check, 10, 2, "Bridging Gap", "Canyons", "Game A"],
                    0x02: [00, 00, Game1Check, 25, 3, "Little Spider", "Canyons", "Game A"],
                    0x03: [00, 00, Game1Check, 50, 5, "Vigilance", "Canyons", "Game A"],
                    0x04: [00, 01, Game1Check, 10, 2, "Speed-Up", "Canyons", "Game B"],
                    0x05: [00, 01, Game1Check, 25, 3, "Traffic Jam", "Canyons", "Game B"],
                    0x06: [00, 01, Game1Check, 50, 5, "Maestro", "Canyons", "Game B"],
                    0x07: [01, 00, Game2Check, 25, 2, "Squire", "Showdown", "Game A"],
                    0x08: [01, 00, Game2Check, 50, 3, "Knight", "Showdown", "Game A"],
                    0x09: [01, 00, Game2Check, 100, 5, "Paladin", "Showdown", "Game A"],
                    0x0a: [02, 00, Game3Check, 10, 2, "Package Delivery", "Jelly Jump", "Game A"],
                    0x0b: [02, 00, Game3Check, 25, 3, "Stable Footing", "Jelly Jump", "Game A"],
                    0x0c: [02, 00, Game3Check, 50, 5, "Egging On", "Jelly Jump", "Game A"],
                    0x0d: [02, 01, Game3Check, 10, 2, "Fish Invasion", "Jelly Jump", "Game B"],
                    0x0e: [02, 01, Game3Check, 25, 3, "From A to Z", "Jelly Jump", "Game B"],
                    0x0f: [02, 01, Game3Check, 50, 5, "Jellyfish Techno Rave", "Jelly Jump", "Game B"],

                    } 

//----------------
//Function
function ArcadeProgGame1(Char){
	
    title = Cheevo_Dict[Char][5]
	points = Cheevo_Dict[Char][4]
	description = format("Get {0} points or more in the {1} {2} Mode", Cheevo_Dict[Char][3], Cheevo_Dict[Char][6], Cheevo_Dict[Char][7])
	trigger = Game1Check
			&& GameVersion == Cheevo_Dict[Char][1]
            && GameSelect == Cheevo_Dict[Char][0]
            && ScoreGame1 >= Cheevo_Dict[Char][3]
            && prev(ScoreGame1) < Cheevo_Dict[Char][3]
            && FailGame1 < 3
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}                    

for i in range (1,6)
ArcadeProgGame1(i)

function ArcadeProgGame2(Char){
	
    title = Cheevo_Dict[Char][5]
	points = Cheevo_Dict[Char][4]
	description = format("Get {0} points or more in the {1} {2} Mode", Cheevo_Dict[Char][3], Cheevo_Dict[Char][6], Cheevo_Dict[Char][7])
	trigger = Game2Check
			&& GameVersion == Cheevo_Dict[Char][1]
            && GameSelect == Cheevo_Dict[Char][0]
            && ScoreGame2 >= Cheevo_Dict[Char][3]
            && prev(ScoreGame2) < Cheevo_Dict[Char][3]
            && FailGame2 < 3
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}                    

for i in range (7,9)
ArcadeProgGame2(i)

function ArcadeProgGame3(Char){
	
    title = Cheevo_Dict[Char][5]
	points = Cheevo_Dict[Char][4]
	description = format("Get {0} points or more in the {1} {2} Mode", Cheevo_Dict[Char][3], Cheevo_Dict[Char][6], Cheevo_Dict[Char][7])
	trigger = Game3Check
			&& GameVersion == Cheevo_Dict[Char][1]
            && GameSelect == Cheevo_Dict[Char][0]
            && ScoreGame3 >= Cheevo_Dict[Char][3]
            && prev(ScoreGame3) < Cheevo_Dict[Char][3]
            && FailGame3 < 3
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}                    

for i in range (10,15)
ArcadeProgGame3(i)

//Rich Presence
RPGame = { 
                    0:"Canyons",
                    1:"Showdown",
                    2:"Jelly Jump",
                    3:"Credits"

                    }  

RPMode = { 
                    0:"Game A",
                    1:"Game B"

                    }  
///Default 
rich_presence_display(
    "• Playing {0} - {1} •",
    rich_presence_lookup("Game", GameSelect, RPGame),
    rich_presence_lookup("Mode", GameVersion, RPMode)
)

//Leaderboards
leaderboard(
    title ="Canyons - Game A",
    description = "Highest Score for Canyons - Game A",
    start  = Game1Check && GameSelect == 0 && GameVersion == 0 && FailGame1 == 3 && prev(FailGame1) == 2,
    cancel = always_false(),
    submit = always_true(),
    value = ScoreGame1,
    format = "VALUE",
    lower_is_better=false
)

leaderboard(
    title ="Canyons - Game B",
    description = "Highest Score for Canyons - Game B",
    start  = Game1Check && GameSelect == 0 && GameVersion == 1 && FailGame1 == 3 && prev(FailGame1) == 2,
    cancel = always_false(),
    submit = always_true(),
    value = ScoreGame1,
    format = "VALUE",
    lower_is_better=false
)


leaderboard(
    title ="Showdown - Game A",
    description = "Highest Score for Showdown - Game A",
    start  = Game2Check && GameSelect == 1 && GameVersion == 0 && FailGame2 == 3 && prev(FailGame2) == 2,
    cancel = always_false(),
    submit = always_true(),
    value = ScoreGame2,
    format = "VALUE",
    lower_is_better=false
)



leaderboard(
    title ="Jelly Jump - Game A",
    description = "Highest Score for Jelly Jump - Game A",
    start  = Game3Check && GameSelect == 2 && GameVersion == 0 && FailGame3 == 3 && prev(FailGame3) == 2,
    cancel = always_false(),
    submit = always_true(),
    value = ScoreGame3,
    format = "VALUE",
    lower_is_better=false
)

leaderboard(
    title ="Jelly Jump - Game B",
    description = "Highest Score for Jelly Jump - Game B",
    start  = Game3Check && GameSelect == 2 && GameVersion == 1 && FailGame3 == 3 && prev(FailGame3) == 2,
    cancel = always_false(),
    submit = always_true(),
    value = ScoreGame3,
    format = "VALUE",
    lower_is_better=false
)