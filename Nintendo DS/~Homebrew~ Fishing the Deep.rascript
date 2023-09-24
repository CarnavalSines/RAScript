// ~Homebrew~ Fishing the Deep
// #ID = 25801

// 20230920 Version - Sines

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

// $0C252C: [32 Bit] Score
// $0C2530: [32 Bit] In-game Timer
//          Game Over when 0
// $0C278C: [8 Bit] Can be used as an in-game check
//          00 > Main Menu
//          0x0f > In-Game
//          0x04 > Credits
// $0C3F18: [16 Bit] Vertical Cursor / Hook position
//          superior to 0x2f7 > out of water (when picking up fish)


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
Score = dword(0xc252c)
Timer = dword(0xC2530)
GameStatus = dword(0xC278C)
InGame = GameStatus == 0xf
HorizontalPos = byte(0x0c3f02) // 1 far left > 0x60 center default > 0xbf far right
VerticalPos = word(0xc3cee)

//----------------
//Function
function GameOver() => InGame && Timer == 0 && prev(Timer) > 0
function Fished() => InGame && Score > prev(Score)



//----------------
///Achievement Code
// Progression
achievement(title = "Starter Fisher",
                description = "Get your first haul",
                points = 1,
                trigger = 
                            prev(Score) == 0
                         && Fished()  
                         && Timer > 0
                         
)

achievement(title = "Big Haul",
                description = "Get a haul of at least 6 fishes at once",
                points = 3,
                trigger = 
                            Timer > 0
                         && InGame   
                         && Score >= prev(Score)+3000  
                        
                         
)

achievement(title = "Patient Seamen",
                description = "Fish successfuly 10 times without moving your boat",
                points = 3,
                trigger = 
                            Timer > 0
                         && InGame   
                         && measured(repeated(10, Fished())) 
                         && never(HorizontalPos != prev(HorizontalPos))
                        
                         
)


achievement(title = "Shallow Pond",
                description = "Reach a score of 5000 or more without moving down the screen [From a fresh game start]",
                points = 2,
                trigger = 
                            Timer > 0
                         && InGame  
                         && once(Score==0 && InGame)
                         && trigger_when(Score >= 5000)
                         && disable_when(VerticalPos > 0, until=GameStatus==0)
                        
                         
)

achievement(title = "Bass Hunter",
                description = "Reach a score of 50 000 or more",
                points = 3,
                trigger = 
                            Timer > 0
                         && InGame  
                         && Score >= 50000
                         && prev(Score) < 50000
                         
                        
                         
)

achievement(title = "Expert Wrangler",
                description = "Reach a score of 100 000 or more",
                points = 3,
                trigger = 
                            Timer > 0
                         && InGame  
                         && Score >= 100000
                         && prev(Score) < 100000
                         
                        
                         
)
// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Just want to fish",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   

