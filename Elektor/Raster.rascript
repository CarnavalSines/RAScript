// Raster
// #ID = 24659

// 20230612 Version - Sines

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

//0x170c	
//[8 Bit] Can be used for game state
//0x10 > Game Over Screen
//0x50 > In Play

//0x1751	
//[8 Bit] Score BCD


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

// var
Score = bcd(byte(0x1751))
GameState = byte(0x170c)

// function

function Progression(points,title,pointsgoal)
{
    achievement(title = title,
                description = "Reach " + pointsgoal +" Points",
                points = points,
                trigger = 
                            GameState == 0x50
                         && prev(Score) < pointsgoal
                         && Score == pointsgoal
                         
)
}

// Cheevo

Progression(1,"Congratulation on launching the game",5)
Progression(1,"Getting the Rythm",10)
Progression(1,"No More Freebies",20)
Progression(1,"Is Is Me or Are the Hole Getting Smaller ?",30)
Progression(3,"Score Pressure",40)
Progression(3,"Sharpshooter",50)


// Leaderboard 
leaderboard(
    title = "High Score",
    description = "Blast them good !",
    start  = GameState == 0x10 && prev(GameState) == 0x50,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
