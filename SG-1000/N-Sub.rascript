// N-Sub
// #ID = 24551


// 20230704 Version - Sines

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

// $012D: [8 Bit] Pause Flag
//        00 > Off
//        FF > On
// $0130: [16 Bit] Current Score
// $0132: [16 Bit] Hi-Score
// $013B: [8 Bit] Life Count
//        Start at 0x03
//        Game Over at 0x00
// $0142: [8 Bit] Round ID



///Core
//Constant
InGame = byte(0x03ff)
Score = word(0x0130)

LifeCount = byte(0x013b)
RoundID = byte(0x0142)

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable

//----------------
//Function
function GameOver() => InGame == 1 && LifeCount == 0 && prev(LifeCount) == 1
function Deathless() => LifeCount < prev(LifeCount)

//----------------

///Achievement Code
// Progression
achievement(title = "Silent Death",
                description = "Beat the first fleet and finish the 1st Round",
                points = 5,
                trigger = 
                            InGame == 1
                         && RoundID == 2
                         && prev(RoundID) == 1
                         && LifeCount > 0
                         
)


achievement(title = "Under the Sea",
                description = "Beat the third fleet and finish the 3rd Round",
                points = 10,
                trigger = 
                            InGame == 1
                         && RoundID == 4
                         && prev(RoundID) == 3
                         && LifeCount > 0
                         
)


achievement(title = "Slayer of the Yamato",
                description = "Beat the fifth fleet and finish the 5th Round",
                points = 10,
                trigger = 
                            InGame == 1
                         && RoundID == 6
                         && prev(RoundID) == 5
                         && LifeCount > 0
                         
)


achievement(title = "Mute Fear",
                description = "Beat the first fleet without losing any Subs",
                points = 5,
                trigger = 
                            InGame == 1
                         && RoundID == 2
                         && prev(RoundID) == 1
                         && LifeCount > 0
                         && once(Score == 0)
                         && never(Deathless())
                         
)

achievement(title = "Operation Sworfish",
                description = "Beat the third fleet without losing any Subs",
                points = 10,
                trigger = 
                            InGame == 1
                         && RoundID == 4
                         && prev(RoundID) == 3
                         && LifeCount > 0
                         && once(Score == 0)
                         && never(Deathless())
                         
)

achievement(title = "Terror from the Deep",
                description = "Beat the fifth fleet without losing any Subs",
                points = 25,
                trigger = 
                            InGame == 1
                         && RoundID == 6
                         && prev(RoundID) == 5
                         && LifeCount > 0
                         && once(Score == 0)
                         && never(Deathless())
                         
)

achievement(title = "In the Hunt",
                description = "Hunt down critical targets and take down 10 bonus & mystery vessels in a single session",
                points = 5,
                trigger = 
                            InGame == 1
                         && LifeCount > 0
                         && tally(10, Score >= prev(Score)+350)
                         
)

achievement(title = "Thrill Newbie",
                description = "Get a score of 5000 or more",
                points = 2,
                trigger = 
                            InGame == 1
                         && Score >= 5000
                         && prev(Score) < 5000
                         
)

achievement(title = "Risk Seeker",
                description = "Get a score of 10 000 or more",
                points = 3,
                trigger = 
                            InGame == 1
                         && Score >= 10000
                         && prev(Score) < 10000
                         
)

achievement(title = "Double it for the next Sub !",
                description = "Get a score of 20 000 or more",
                points = 5,
                trigger = 
                            InGame == 1
                         && Score >= 20000
                         && prev(Score) < 20000
                         
)

achievement(title = "Artful Dodger",
                description = "Get a score of 30 000 or more",
                points = 10,
                trigger = 
                            InGame == 1
                         && Score >= 30000
                         && prev(Score) < 30000
                         
)

achievement(title = "More of those and you risk a score rollover",
                description = "Get a score of 40 000 or more",
                points = 10,
                trigger = 
                            InGame == 1
                         && Score >= 40000
                         && prev(Score) < 40000
                         
)

achievement(title = "Ohno.jpg",
                description = "Get a score of 0 or more",
                points = 25,
                trigger = 
                            InGame == 1
                         && Score >= 0
                         && Score < 1000
                         && prev(Score) > 60000
                         
                         
)

// leaderboard
leaderboard(
    title = "Further Round",
    description = "Going the distance, how many rounds can you reach ?",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = RoundID,
    format = "VALUE"
)   