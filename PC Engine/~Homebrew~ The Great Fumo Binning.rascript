// ~Homebrew~ The Great Fumo Binning
// #ID = 25183
// 20230713 Version - Sines

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


// $0041: [8 Bit] Fumo Speed
// $0042: [8 Bit] Bin Reserve
// $0043: [8 Bit] Prompt message
//        00 > Ready ??
//        01 > In Game (no msg)
//        02 > Bollocks
//        03 > You Lose
// $01FA: [8 Bit] Input Flag
//        Bit 0 | Up
//        Bit 1 | Right
//        Bit 2 | Down
//        Bit 3 | Left
//        Bit 4 | A > Small Speed Boost
//        Bit 5 | B > Big Speed Boost
// $0946: [8 Bit] BCD Score * 100000
// $0947: [8 Bit] BCD Score * 10000
// $0948: [8 Bit] BCD Score * 1000
// $0949: [8 Bit] BCD Score * 100
// $094A: [8 Bit] BCD Score * 10
// $094B: [8 Bit] BCD Score * 1

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

FumoSpeed = byte(0x41)
BinReserve = byte(0x42)

GameState = byte(0x43)
SmallBoost = bit4(0x1fa)
BigBoost = bit5(0x1fa)

Score = bcd(byte(0x946)) * 100000 + bcd(byte(0x947)) * 10000 + bcd(byte(0x948)) * 1000 + bcd(byte(0x949)) * 100 + bcd(byte(0x94a)) * 10 + bcd(byte(0x94b))

//----------------
//Function
function GameOver() => GameState == 3 && prev(GameState) != 3
function FumoTrashed() => Score > prev(Score)
function SamusSaved() => Score == prev(Score) + 100
function NoBoost() => SmallBoost == 1 || BigBoost == 1


//----------------
///Achievement Code
// Progression
achievement(title = "Plushies ? At your age ?",
                description = "Bin 10 Fumos",
                points = 2,
                trigger = 
                            GameState == 1
                         && repeated(10,FumoTrashed()) 
                         && never(GameOver())
                         
)

achievement(title = "They look low quality to me",
                description = "Bin 50 Fumos",
                points = 2,
                trigger = 
                            GameState == 1
                         && repeated(50,FumoTrashed()) 
                         && never(GameOver())
                         
)

achievement(title = "Know your place, Trash !",
                description = "Bin 100 Fumos",
                points = 3,
                trigger = 
                            GameState == 1
                         && repeated(100,FumoTrashed()) 
                         && never(GameOver())
                         
)

achievement(title = "Fun Fact: Atomic element number 27 is Cobalt",
                description = "Bin 270 Fumos",
                points = 3,
                trigger = 
                            GameState == 1
                         && repeated(270,FumoTrashed()) 
                         && never(GameOver())
                         
)

achievement(title = "The Great Fumo Binning",
                description = "Bin 400 Fumos",
                points = 5,
                trigger = 
                            GameState == 1
                         && repeated(400,FumoTrashed()) 
                         && never(GameOver())
                         
)

achievement(title = "Beating the Birthday Boy",
                description = "Get a Score of 4500 or above",
                points = 10,
                trigger = 
                            GameState == 1
                         && Score >= 4500 
                         && prev(Score) < 4500
                         
)

achievement(title = "The Last Samus is in Captivity",
                description = "Bin 10 copies of Metroid: Other M",
                points = 5,
                trigger = 
                            GameState == 1
                         && repeated(10,SamusSaved()) 
                         && never(GameOver())
                         
)

achievement(title = "No Hurry",
                description = "Reach a score of 2000 or above without ever using the speed-up function",
                points = 5,
                trigger = 
                            GameState == 1
                         && Score >= 2000 
                         && prev(Score) < 2000
                         && once(Score == 0)
                         && never(NoBoost())
                         
)

achievement(title = "9",
                description = "Reach yeeting speed 9",
                points = 10,
                trigger = 
                            Score > 0
                         && FumoSpeed == 9
                         && prev(FumoSpeed) == 8
                         
)

// leaderboard
leaderboard(
    title = "High Score",
    description = "Expert Trasher",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
