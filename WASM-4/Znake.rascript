// Znake
// #ID = 24185


// 20230501 Version - Sines

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


// $3690: [8 Bit] Game Status
//        00 > In game
//        01 > Game Over
//        02 > Paused
//        03 > Speed Select
//        04 > Number of Mice Select
// $369C: [8 Bit] Speed Mode
//        00 > Molasses
//        01 > Kinda Movin'
//        02 > Slitherin'
//        03 > Super Slitherin'
// $36B4: [8 Bit] Number of Mice
//        00 > One Mouse
//        01 > Three Mice
//        02 > Ten Mice
//        03 > Twenty Mice
// $3B50: [16 Bit] Score
//        Display max out at 999
//        Gameplay Wise will max out at around 90


///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50



//----------------
//Variable
GameStatus = byte(0x3690)
GameOver = GameStatus == 1 && prev(GameStatus) == 0
InGame = GameStatus == 0
Pause = GameStatus == 2

Speed = byte(0x369C)
MiceNB = byte(0x36B4)
Score = word(0x3B50)

//----------------
//Function

//----------------

///Achievement Code
 achievement(title = "SSss",
                description = "Reach 10 points in Kinda Movin' Speed or above, One Mouse mode",
                points = 5,
                trigger = 
                (   InGame
                   && prev(Score) < 10
                   && Score >= 10
                   && Speed >= 1
                   && MiceNB == 0
                   
)
)

 achievement(title = "SSslither",
                description = "Reach 25 points in Kinda Movin' Speed or above, One Mouse mode",
                points = 5,
                trigger = 
                (   InGame
                   && prev(Score) < 25
                   && Score >= 25
                   && Speed >= 1
                   && MiceNB == 0
                   
)
)

 achievement(title = "SSsuperb",
                description = "Reach 40 points in Kinda Movin' Speed or above, One Mouse mode",
                points = 10,
                trigger = 
                (   InGame
                   && prev(Score) < 40
                   && Score >= 40
                   && Speed >= 1
                   && MiceNB == 0
                   
)
)

 achievement(title = "SSslendid",
                description = "Reach 55 points in Kinda Movin' Speed or above, One Mouse mode",
                points = 25,
                trigger = 
                (   InGame
                   && prev(Score) < 55
                   && Score >= 55
                   && Speed >= 1
                   && MiceNB == 0
                   
)
)

 achievement(title = "Sspeed",
                description = "Reach 15 points in Super Slitherin' Speed or above, One Mouse mode",
                points = 10,
                trigger = 
                (   InGame
                   && prev(Score) < 15
                   && Score >= 15
                   && Speed == 3
                   && MiceNB == 0
                   
)
)


 achievement(title = "Ssatiated",
                description = "Reach 90 points in any mode mode",
                points = 5,
                trigger = 
                (   InGame
                   && prev(Score) < 90
                   && Score >= 90
                   
)
)

 achievement(title = "SSsidestep",
                description = "Stay at 0 Score for 10sec in Super Slitherin' Speed, 20 Mices mode. No Pausing.",
                points = 5,
                trigger = 
                (   InGame
                   && trigger_when(repeated(600, Score == 0 && InGame)) 
                   && (once(GameStatus == 4) || once(prev(GameStatus)==1))
                   && never(Pause)
                   && never(Score >0)
                   && never(GameOver)
                   && Speed == 3
                   && MiceNB == 3
                   
)
)


///Leaderboard
leaderboard(
    title = "Slow Snek",
    description = "High Score for Molasses Speed, One Mouse",
    start  = prev(Score) == 0 && Score > 0 && InGame && Speed == 0 && MiceNB == 0,
    cancel = always_false(),
    submit = GameOver,
    value = Score,
    format = "VALUE"
)

leaderboard(
    title = "Normal Snake",
    description = "High Score for Kinda Movin' Speed, One Mouse",
    start  = prev(Score) == 0 && Score > 0 && InGame && Speed == 1 && MiceNB == 0,
    cancel = always_false(),
    submit = GameOver,
    value = Score,
    format = "VALUE"
)

leaderboard(
    title = "Speedy Snake",
    description = "High Score for Slitherin' Speed, One Mouse",
    start  = prev(Score) == 0 && Score > 0 && InGame && Speed == 2 && MiceNB == 0,
    cancel = always_false(),
    submit = GameOver,
    value = Score,
    format = "VALUE"
)

leaderboard(
    title = "Super Speedy Snake",
    description = "High Score for Super Slitherin' Speed, One Mouse",
    start  = prev(Score) == 0 && Score > 0 && InGame && Speed == 3 && MiceNB == 0,
    cancel = always_false(),
    submit = GameOver,
    value = Score,
    format = "VALUE"
)
