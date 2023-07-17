// Cacoma Knight in Bizyland
// #ID = 23056
// 20230717 Version - Sines

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

// $0E16: [16 Bit] Current Arena % Objective
// $0E2E: [8 Bit] Level ID
//        0x1a > 0x1c  Ending Screen
//        World 1 End > 0x02
//        World 2 End > 0x06
//        World 3 End > 0x0a
//        World 4 End > 0x0e
//        World 5 End > 0x12
//        World 6 End > 0x16
//        World 7 End > 0x1a
// $0E4C: [8 Bits] Current credit lives
//        Continue Screen at 0x00 > 0xff
// $0E54: [16 Bit] Current Arena % coverage
// $12D6: [8 Bit] Difficulty Select
//        00 > Easy
//        01 > Normal
//        02 > Hard
//        03 > Maniac (requires code)
// $12D8: [8 Bit] Lives Count
//        Default 0x02 (3 Lives)
// $12DA: [8 Bit] Round Conf
//        Default 0x00 (1 Round)
// $12DC: [8 Bit] Credit Conf
//        Default 0x04 (5 Credits)
// $12E4: [8 Bit] Current Play Credits
// $12E8: [8 Bit] Selected Player
//        00 > Jack
//        01 > Jean
//        02 > RB93
// $12F0: [8 Bit] Mode Select (tbc, seems static in-game)
//        00 > 1P VS COM
//        01 > 1P & 2P VS COM
//        02 > 1P VS 2P



///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


                    

DifficultyMode = { 
                    0:"Easy",
                    1:"Normal", 
                    2:"Hard",
                    3:"Maniac"

                    }                      
                    
WorldEndID = { 
                    1:0x02, 
                    2:0x06,
                    3:0x0a,
                    4:0x0e,
                    5:0x12,
                    6:0x16,
                    7:0x1a

                    } 
                    
WorldStartID = { 
                    1:0x00, 
                    2:0x04,
                    3:0x08,
                    4:0x0c,
                    5:0x10,
                    6:0x14,
                    7:0x18

                    }                     
                    
WorldEndCheevoName = { 
                    1:"Flower Field", 
                    2:"Clockwork City",
                    3:"Candy Land",
                    4:"Green Meadow",
                    5:"Robot Factory",
                    6:"Boss Rush",
                    7:"Golden Castle"

                    }                        

MirrorMasterCheevoName = { 
                    1:"Flower Mirror", 
                    2:"Clockwork Mirror",
                    3:"Candy Mirror",
                    4:"Mirror Meadow",
                    5:"Robot Mirror",
                    6:"Boss Mirror",
                    7:"Golden Mirror"

                    }     
                    
CharIDName = { 
                    0:"Jack",
                    1:"Jean", 
                    2:"RB93" 

                    }  
                    
                    
//----------------
//Variable
LevelObjective = word(0xe16)
PlayerCoverage = word(0xe54)
MirrorFound = byte(0x1012)// 3 per world except world 7 with only 2. Reset between world except World 6 > 7 so check hits increments instead

P1Life = byte(0xe4c)
P1Credit = byte(0x12e4)
LevelID = byte(0xe2e)
CharID = byte(0x12e8)

LifeConf = byte(0x12d8) // default 0x02
RoundConf = byte(0x12da) // default 0x00
CreditConf = byte(0x12dc) // default 0x04

ModeSelect = byte(0x12f0)
Difficulty = byte(0x12d6)

//----------------
//Function   
function DefaultConf() => LifeConf == 0x02 && RoundConf == 0x00 && CreditConf == 0x04 && ModeSelect == 0x00
function LevelClear() => PlayerCoverage >= LevelObjective && prev(PlayerCoverage) < LevelObjective
function GameClear() => LevelID == 0x1c && prev(LevelID) == 0x1a
function Damageless() => P1Life < prev(P1Life)
function OneCC() => P1Credit < prev(P1Credit)

function WorldProg(World,points)
{
    achievement(title = WorldEndCheevoName[World],
                description = "Complete World "+ World,
                points = points,
                trigger = DefaultConf()
                       && LevelID == WorldEndID[World]
                       && LevelClear()
                       
                )
}

function MirrorMaster(World,points)
{
    achievement(title = MirrorMasterCheevoName[World],
                description = "Complete World "+ World + " and find the 3 mirrors",
                points = points,
                trigger = DefaultConf()
                       && LevelID == WorldEndID[World]
                       && LevelClear()
                       && MirrorFound == 3
                       
                )
}


function GameClearChar(Char,Title)
{
    achievement(title = Title,
                description = "Finish the game in Any difficulty with "+ CharIDName[Char],
                points = 10,
                trigger = DefaultConf()
                       && GameClear()
                       && CharID == Char
                       
                )
}

function GameClearDifficulty(DifficultySelect,Title,Points)
{
    achievement(title = Title,
                description = "Finish the game in "+ DifficultyMode[DifficultySelect] + " difficulty or Above",
                points = Points,
                trigger = DefaultConf()
                       && GameClear()
                       && Difficulty >= DifficultySelect
                       
                )
}
//----------------
///Achievement Code
// Progression

for i in range (1,2)
WorldProg(i,2)

for i in range (3,4)
WorldProg(i,3)

for i in range (5,6)
WorldProg(i,5)

WorldProg(7,10)


for i in range (1,3)
MirrorMaster(i,5)

for i in range (4,6)
MirrorMaster(i,10)

GameClearChar(0,"For King and Country !")
GameClearChar(1,"For Love and Beauty !")
GameClearChar(2,"Cool !")

GameClearDifficulty(0,"Training Wheels",3)
GameClearDifficulty(1,"Shining Knight",5)
GameClearDifficulty(2,"Above and Beyond Duty",10)
GameClearDifficulty(3,"Princess Savior",25)

achievement(title = "Nimble Cavalier",
                description = "Finish the game in Normal difficulty or Above without getting any Game Over",
                points = 25,
                trigger = DefaultConf()
                       && GameClear()
                       && Difficulty >= 1
                       && once(LevelID == 0 && P1Credit == 4)
                       && never(OneCC())
                       
                )
                
achievement(title = "Decisive Cut",
                description = "Complete the first stage in a single line",
                points = 2,
                trigger = DefaultConf()
                       && LevelID == 0
                       && PlayerCoverage >= 0x500
                       && prev(PlayerCoverage) == 0
                       
                )   
                
achievement(title = "Spammer",
                description = "Make 25 or more boxes in a single level without completing it",
                points = 3,
                trigger = DefaultConf()
                       && never(LevelID != prev(LevelID))
                       && repeated(25,PlayerCoverage > prev(PlayerCoverage))
                       && PlayerCoverage < LevelObjective
                       
                )   
                
achievement(title = "Go Big",
                description = "Clear any level with a completion rate of 90% or more",
                points = 5,
                trigger = DefaultConf()
                       && PlayerCoverage >= LevelObjective
                       && PlayerCoverage >= 0x900
                       && prev(PlayerCoverage) < 0x900
                       
                )                         
