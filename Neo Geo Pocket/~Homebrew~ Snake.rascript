// ~Homebrew~ Snake
// #ID = 23738
// 20230716 Version - Sines

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

// $000D: [8 Bit] Y Position
// $000E: [8 Bit] X Position
// $000F: [8 Bit] Score BCD
// $0010: [8 Bit] Score BCD * 100
// $0011: [8 Bit] High Score BCD
// $0012: [8 Bit] High Score BCD * 100
// $0014: [8 Bit] Speed Setting
//        0x04 > Fast
//        0x08 > Slow
// $2BE2: [8 Bit] Snake Direction
//        0x01 > Down
//        0x02 > Up
//        0x04 > Right
//        0x08 > Left
// $2BFD: [8 Bit] Not 100% Sure, can be used as an In-Game flag
//        0x00 > Main Menu
//        0x01 > Game Over
//        0x03 > In Game



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
GameStatus = byte(0x2bfd)
InGame = GameStatus == 3
GameOver = GameStatus == 1 && prev(GameStatus) == 1

Speed = byte(0x14) // 4 fast > 8 slow
Score = bcd(byte(0xf))
LeaderboardScore = bcd(byte(0x10))*100 + bcd(byte(0xf))

//----------------
//Function

//----------------

///Achievement Code
 achievement(title = "Slow",
                description = "Reach 10 points in Slow mode",
                points = 2,
                trigger = 
                (   InGame
                   && prev(Score) < 10
                   && Score >= 10
                   && Speed == 8
                   
                   
)
)

 achievement(title = "Steady",
                description = "Reach 25 points in Slow mode",
                points = 2,
                trigger = 
                (   InGame
                   && prev(Score) < 25
                   && Score >= 25
                   && Speed == 8
                   
                   
)
)

 achievement(title = "Suspicious",
                description = "Reach 50 points in Slow mode",
                points = 3,
                trigger = 
                (   InGame
                   && prev(Score) < 50
                   && Score >= 50
                   && Speed == 8
                   
                   
)
)

 achievement(title = "Solid",
                description = "Reach 75 points in Slow mode",
                points = 3,
                trigger = 
                (   InGame
                   && prev(Score) < 75
                   && Score >= 75
                   && Speed == 8
                   
                   
)
)

 achievement(title = "Fast",
                description = "Reach 10 points in Fast mode",
                points = 2,
                trigger = 
                (   InGame
                   && prev(Score) < 10
                   && Score >= 10
                   && Speed == 4
                   
                   
)
)

 achievement(title = "Furious",
                description = "Reach 25 points in Fast mode",
                points = 3,
                trigger = 
                (   InGame
                   && prev(Score) < 25
                   && Score >= 25
                   && Speed == 4
                   
                   
)
)

 achievement(title = "Fervent",
                description = "Reach 50 points in Fast mode",
                points = 5,
                trigger = 
                (   InGame
                   && prev(Score) < 50
                   && Score >= 50
                   && Speed == 4
                   
                   
)
)

 achievement(title = "Frantic",
                description = "Reach 75 points in Fast mode",
                points = 10,
                trigger = 
                (   InGame
                   && prev(Score) < 75
                   && Score >= 75
                   && Speed == 4
                   
                   
)
)

///Leaderboard

leaderboard(
    title = "Slow Snek",
    description = "High Score for Slow Speed",
    start  = prev(Score) == 0 && Score > 0 && InGame && Speed == 8,
    cancel = GameStatus == 0,
    submit = GameOver,
    value = LeaderboardScore,
    format = "VALUE"
)

leaderboard(
    title = "Fast Snek",
    description = "High Score for Fast Speed",
    start  = prev(Score) == 0 && Score > 0 && InGame && Speed == 4,
    cancel = GameStatus == 0,
    submit = GameOver,
    value = LeaderboardScore,
    format = "VALUE"
)
