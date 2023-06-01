// ~Homebrew~ Meteor Shower
// #ID = 24518

// 20230601 Version - Sines

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


// $0069: [8 Bit] Players Configuration
//        00 > One Player
//        01 > Two Players (one after the other)
//        02 > Two Players (Same time)
// $0071: [8 Bit] BCD Score Part 1
//        XX 00 00
// $0072: [8 Bit] BCD Score Part 2
//        00 XX 00
// $0073: [8 Bit] BCD Score Part 3
//        00 00 XX
// $0081: [8 Bit] Skill Level
//        00 > Easy
//        01 > Normal - Start at 5 000 pts
//        02 > Hard - Start at 50 000 pts
// $0082: [8 Bit] In-game flag
//        00 > Main Menu / Game Over
//        02 > In Play
// $008F: [8 Bit] Player Count
//        Start at 03
//        Game Over when reaching 00
// $0091: [8 Bit] Difficulty Level
//        00 > Easy - Start
//        01 > Normal - 1 000 pts
//        02 > Hard - 5 000 pts
//        03 > VHard - 20 000 pts
//        04 > Extreme - 50 000 pts
//        05 > VExtreme - 100 000 pts
//        Dynamic during gameplay, linked to Score


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable
PlayerConf = byte(0x69)
Score = bcd(byte(0x71)*10000) + bcd(byte(0x72)*100) + bcd(byte(0x73)) 
SkillLevel = byte(0x81)

InGame = byte(0x82)
LifeCount = byte(0x8f)
LifeCountP2 = byte(0x90)
DifficultyLevel = byte(0x91)

//----------------
///Function

function DeathlessCheck() => prev(LifeCount) > LifeCount
function DeathlessCheckP2() => prev(LifeCountP2) > LifeCountP2
function GameOver() => LifeCount == 0 && prev(LifeCount) == 1

function Progression(points,title,levelgoal)
{
    achievement(title = title,
                description = "Reach Difficulty level " + levelgoal + " starting from Easy Mode 1P",
                points = points,
                trigger = 
                            InGame == 2 // InGame
                         && prev(DifficultyLevel) == levelgoal -1
                         && DifficultyLevel == levelgoal
                         && LifeCount > 0
                         && SkillLevel == 0
                         && PlayerConf == 0
                         
)
}

//----------------
///Achievement Code
Progression(5,"Taking it Slow",1)
Progression(5,"Old Man War",2)
Progression(5,"And the 'Stroid Don't Stop Comin'",3)
Progression(10,"Colony Protector",4)
Progression(10,"Basking in the Sunset",5)


    achievement(title = "Evolving Backward",
                description = "Starting from Hard Mode 1P get to 40 000 points or lower",
                points = 10,
                trigger = 
                            InGame == 2 // InGame
                         && Score <= 40000
                         && prev(Score) > 40000
                         && LifeCount > 0
                         && SkillLevel == 2
                         && PlayerConf == 0
                         
)

    achievement(title = "Grizzled Veteran",
                description = "Reach Difficulty level 4 starting from Easy Mode 1P without losing a single ship",
                points = 25,
                trigger = 
                            InGame == 2 // InGame
                         && prev(DifficultyLevel) == 3
                         && DifficultyLevel == 4
                         && LifeCount > 0
                         && SkillLevel == 0
                         && PlayerConf == 0
                         && never(DeathlessCheck())
                         && once(LifeCount == 3 && SkillLevel == 0 && PlayerConf == 0 && InGame == 2 && prev(InGame) == 0)
                         
)

    achievement(title = "Synchronized Dodging",
                description = "Reach a P1 Score of 30 000 while playing in Normal Mode 1P+2P without losing any ship",
                points = 10,
                trigger = 
                            InGame == 2 // InGame
                         && LifeCount > 0
                         && SkillLevel == 1
                         && PlayerConf == 2
                         && Score <= 30000
                         && prev(Score) > 30000
                         && never(DeathlessCheck())
                         && never(DeathlessCheckP2())
                         && once(LifeCount == 3 && LifeCountP2 == 3 && SkillLevel == 1 && PlayerConf == 2 && InGame == 2 && prev(InGame) == 0)
                         
)

// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Starting from Normal Mode, get the most points",
    start  = GameOver() && PlayerConf == 00 && SkillLevel == 0,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
