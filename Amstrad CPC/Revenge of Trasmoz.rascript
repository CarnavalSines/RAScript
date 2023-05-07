// ~Homebrew~ Revenge of Trasmoz
// #ID = 24228

// 20230507 Version - Sines


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

// $7E07: [8 Bit] Trasmoz Activation Flag
//        0xFF > Off
//        0x07 > On
//        Not the only factor, but best flag for code
// $7E28: [8 Bit] Level ID
//        Start at 0x01
//        Last Level 0x0d
//        You Win Screen > 0x0e immediately followed by 0x01
//        Can be frozen and update level on death, not only on level cleared
// $7E29: [8 Bit] 1st Part of the Score
//        Treasure are worth 50 Pts
// $7E2A: [8 Bit] Score Multiplier
//        Total Score Calc is
//        0x7e2a value * 256 + 0x7e29 value
// $7E2D: [8 Bit] Life Count
// $7E2F: [8 Bit] Nb of Flame carried
//        Max at 0x04
// $7E31: [8 Bit] Nb of Candle activated
// $7E41: [8 Bit] Timer before Trasmoz appearance
//        Decrease until reaching 0x00 and then have to tick once more for Trasmoz to appear
//        To be combine with the boss data to check for real appearance
// $7E45: [8 Bit] Difficulty Rating
//        After a first loop is at 0x02, impact how quickly the boss spawn
//        0x00 on new game / game over


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
TrasmozLive = byte(0x7e07) // 0xFF Off > 0x07 On
LevelID = byte(0x7e28) // Start at 0x01 > 0x0d last level > 0x0e You Win screen
Score = byte(0x7e29) + (byte(0x7e2a) * 256)

LifeCount = byte(0x7e2d) // 0x04 on full life
FlameCarried = byte(0x7e2f)
CandleActivation = byte(0x7e31) // 0x04 on Level Complete

TrasmozTimer = byte(0x7e41) // Timer before boss appearance, tick once after reaching 0x00 > Combine with TrasmozLive 
DifficultyRating = byte(0x7e45) // Is raised on new loop, make the Boss timer decrease faster

//----------------
//Function
function GameOver() => LifeCount == 0 && prev(LifeCount) > 0
function TrasmozSpawn() => TrasmozTimer == 0 && TrasmozLive == 0x07 && prev(TrasmozLive) == 0xff
function Deathless() => LifeCount < prev(LifeCount)

function AreaClear(title,description,points,levelid)
{
    achievement(title = title,
                description = description,
                points = points,
                trigger = 
                            LevelID == levelid
                         && CandleActivation == 0x04
                         && prev(CandleActivation) < 0x04
                         
)
}

function TreasureHunter(points,levelid)
{
    achievement(title = "Treasure Hunter - Level "+ levelid,
                description = "Collect the treasure in Level "+ levelid ,
                points = points,
                trigger = 
                            LevelID == levelid
                         && Score == prev(Score) + 50
                         
)
}

//----------------

///Achievement Code
// Progression
AreaClear("Secret Entrance","Clear the Abandoned Cemetery area (Level 1 - 4)",5,4)
AreaClear("Exploring for the Hidden Temple","Clear the Secret Catacoms area (Level 5 - 8)",5,8)
AreaClear("Averting Trasmoz Revenge","Defeat Trasmoz at the heart of the Hidden Temple",10,13)

achievement(title = "Trasmoz Revengeance",
                description = "Defeat Trasmoz in a 2nd Loop",
                points = 25,
                trigger = 
                            LevelID == 13
                         && CandleActivation == 0x04
                         && prev(CandleActivation) < 0x04
                         && DifficultyRating == 1
                         
)

achievement(title = "Perfect Warrior I [m]",
                description = "Clear the Abandonned Cemetery without dying",
                points = 5,
                trigger = 
                            trigger_when(LevelID == 4
                         && CandleActivation == 0x04
                         && prev(CandleActivation) < 0x04)
                         && once(LevelID == 1 && LifeCount == 3)
                         && never(Deathless())
                         
                         
                         )

achievement(title = "Perfect Warrior II [m]",
                description = "Clear the Secret Catacombs without dying",
                points = 10,
                trigger = 
                            trigger_when(LevelID == 8
                         && CandleActivation == 0x04
                         && prev(CandleActivation) < 0x04)
                         && once(LevelID == 5 && prev(LevelID) == 4)
                         && never(Deathless())
                         
                         
                         )

achievement(title = "Perfect Warrior III [m]",
                description = "Clear the Secret Catacombs without dying",
                points = 10,
                trigger = 
                            trigger_when(LevelID == 13
                         && CandleActivation == 0x04
                         && prev(CandleActivation) < 0x04)
                         && once(LevelID == 9 && prev(LevelID) == 8)
                         && never(Deathless())
                         
                         
                         )
                         
achievement(title = "Sneaky Infiltration [m]",
                description = "Clear the Abandonned Cemetery without triggering Trasmoz once",
                points = 10,
                trigger = 
                            trigger_when(LevelID == 4
                         && CandleActivation == 0x04
                         && prev(CandleActivation) < 0x04)
                         && once(LevelID == 1 && LifeCount == 3 && prev(LevelID) > 1)
                         && never(TrasmozSpawn())
                         
                         
                         ) 
                         
achievement(title = "Deep Undercover [m]",
                description = "Clear the Secret Catacombs without triggering Trasmoz once",
                points = 10,
                trigger = 
                            trigger_when(LevelID == 8
                         && CandleActivation == 0x04
                         && prev(CandleActivation) < 0x04)
                         && once(LevelID == 5 && prev(LevelID) == 4)
                         && never(TrasmozSpawn())
                         
                         
                         )                         

achievement(title = "Carrier of the Flame",
                description = "Carry 4 flames at once",
                points = 2,
                trigger = 
                            FlameCarried == 0x04
                         && prev(FlameCarried) < 4
                         && LifeCount > 0
                         
                         
                         )   
TreasureHunter(2,1)    
TreasureHunter(3,5)  
TreasureHunter(3,10)                       
// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Don't forget the treasures !",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
