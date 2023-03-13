// Crazy Kart
// #ID = 22869
// 20230313 Version - Sines

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


// $0101: [8 Bit] Speed Level
//        00 - 05
// $0104: [8 Bit] Life Counter
//        00 - 03
// $0186: [16 Bit] Score


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
SpeedLevel = byte(0x101)
LifeCounter = byte(0x104)
Score = word(0x186)

//----------------
//Function
function GameOver() => prev(LifeCounter) > 0 && LifeCounter == 0

function Progression(points,title,score)
{
    achievement(title = title,
                description = "Reach a Score of " + score + " or more",
                points = points,
                trigger = 
                            Score >= score
                         && prev(Score) < score
                         && LifeCounter > 0
)
}


//----------------

///Achievement Code
Progression(1,"First Lap",10000)
Progression(2,"Double Dash",20000)
Progression(3,"Grand Kart",30000)
Progression(5,"Kart Horizon",40000)
Progression(5,"DiRT Kart",50000)

    achievement(title = "Super ***** Kart",
                description = "Reach a Score of 50000 or more in a single life (Reset race to retry)",
                points = 10,
                trigger = 
                            Score >= 50000
                         && prev(Score) < 50000
                         && LifeCounter == 3
)

achievement(title = "The Need for Speed",
                description = "Once reaching maximum speed stay at that speed for a full minute",
                points = 5,
                trigger = 
                            repeated(3600,SpeedLevel==5)
                         && never(SpeedLevel<5)
                         && LifeCounter > 0
                         && never(GameOver())
             )
// Leaderboard             
leaderboard(
    title = "HighScore",
    description = "Show 'em who's the best !",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)             
