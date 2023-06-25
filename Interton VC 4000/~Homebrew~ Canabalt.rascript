// ~Homebrew~ Canabalt
// #ID = 24634
// 20230608 Version - Sines

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

// $051E: [16 Bit] Score BCD
// $05C3: [8 Bit] In Game indicator
//        03 > menu / game over
//        02 > in game


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
CurrentLevel = byte(0x339a)
RemainingObjects = byte(0x2773)
RemainingLives = byte(0x339b)


Score = bcd(word(0x51e))
Ingame = byte(0x5c3)


//----------------
//Function

function GameOver() => Score > 0 && Ingame == 3 && prev(Ingame) == 2


//----------------

///Achievement Code
achievement(title = "Going through Mud",description = "Get a score of 500",points = 2, trigger = Ingame == 2 && Score == 500 && prev(Score) < 500)
achievement(title = "Running to the Hill",description = "Get a score of 1000",points = 3, trigger = Ingame == 2 && Score == 1000 && prev(Score) < 1000)
achievement(title = "Why are you running ?",description = "Get a score of 1500",points = 5, trigger = Ingame == 2 && Score == 1500 && prev(Score) < 1500)
achievement(title = "The running man",description = "Get a score of 2000",points = 5, trigger = Ingame == 2 && Score == 2000 && prev(Score) < 2000)
achievement(title = "Fresh like the wind",description = "Get a score of 2500",points = 10, trigger = Ingame == 2 && Score == 2500 && prev(Score) < 2500)
achievement(title = "Trully the Canabalt of them all",description = "Get a score of 3000",points = 10, trigger = Ingame == 2 && Score == 3000 && prev(Score) < 3000)    
                


// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Run to your end",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
