// Submarine
// #ID = 24775

// 20230705 Version - Sines

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


// $0001: [8 Bit] Horizontal Position
//        00 > Far Left
//        0x23 > Far Right
// $0007: [8 Bit] Life
// $09C9: [8 Bit] Score


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

Position = byte(0x01)
LifeCount = byte(0x07)
Score = word(0x9c9)

//----------------
//Function

function GameOver() => LifeCount == 0 && prev(LifeCount) == 1
function Deathless() => LifeCount < prev(LifeCount)
//----------------
//Achievements

achievement(title = "Patient Hunter",
                description = "Get to 10 pts without moving or losing a single boat",
                points = 2,
                trigger = 
                            once(Score == 0 && LifeCount == 3)
                         && Score == 10
                         && prev(Score) == 9
                         && never(Position != prev(Position))
                         && never(Deathless())
                         
                         
)

achievement(title = "Reinforcements",
                description = "Reach 20 pts",
                points = 3,
                trigger = 
                            Score == 20
                         && prev(Score) == 19
                         && LifeCount > 0
                         
                         
)

achievement(title = "The Fleet's Here",
                description = "Reach 40 pts",
                points = 5,
                trigger = 
                            Score == 40
                         && prev(Score) == 39
                         && LifeCount > 0
                         
                         
)

achievement(title = "One Man Army",
                description = "Reach 60 pts",
                points = 5,
                trigger = 
                            Score == 60
                         && prev(Score) == 59
                         && LifeCount > 0
                         
                         
)

achievement(title = "Where Does Those Planes Even Come From ?",
                description = "Reach 80 pts",
                points = 5,
                trigger = 
                            Score == 80
                         && prev(Score) == 79
                         && LifeCount > 0
                         
                         
)

achievement(title = "The Circle of War",
                description = "Reach 100 pts",
                points = 10,
                trigger = 
                            Score == 100
                         && prev(Score) == 99
                         && LifeCount > 0
                         
                         
)

achievement(title = "Master and Commander",
                description = "Reach 50 pts without losing a single sub",
                points = 10,
                trigger = 
                            Score == 50
                         && prev(Score) == 49
                         && once(Score == 0 && LifeCount == 3)
                         && never(Deathless())
                         
                         
)

achievement(title = "Art of Running Away",
                description = "After reaching at least 20pts survive 1 minute without killing or being killed",
                points = 5,
                trigger = 
                            Score >= 20
                         && never(Score > prev(Score))
                         && never(Deathless())
                         && never(Score < 20)
                         && repeated(3600,Score == Score)
                         
                         
)

// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "The Hunt is On !",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
