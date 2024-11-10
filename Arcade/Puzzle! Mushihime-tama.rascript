// Puzzle! Mushihime-tama
// #ID = 29645
// 20241110 Version - Sines

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


///Core
//Constant

// Variable
FloorLevel = byte(0x1385ee)
GameStatus = byte(0x13864e)
ContinueScreen = GameStatus == 0x0f
EndgameCheck = dword(0x138db0)
DemoFlag = dword(0x139158)
DemoFlagCheck = DemoFlag != 0xffffffff
LevelProgression = byte(0x17314a)
ScoreUpper = word(0x139188) * 65536
ScoreLower = word(0x13918a)
Score = ScoreUpper + ScoreLower
MarbleChain = byte(0x1391d6)
Difficulty = byte(0x13d28a)
GameMode = byte(0x15807e)
WorldID = byte(0x160c8a)
FitCounter = byte(0x160d56)
ContinueCounter = byte(0x15ab46)

function GameClear() => (EndgameCheck != prev(EndgameCheck)) && GameStatus != 0x0f

    achievement(title="Little Things",
                description = "Beat the first Stage",
                points = 2,
                trigger = LevelProgression == 1
                       && prev(LevelProgression) == 0
                       && DemoFlagCheck
                       && GameMode == 0x00
)  

    achievement(title="Rolly Polly",
                description = "Beat your second Stage",
                points = 3,
                trigger = LevelProgression == 2
                       && prev(LevelProgression) == 1
                       && DemoFlagCheck
                       && GameMode == 0x00
)  

    achievement(title="Majestic Forest",
                description = "Beat your third Stage",
                points = 5,
                trigger = LevelProgression == 3
                       && prev(LevelProgression) == 2
                       && DemoFlagCheck
                       && GameMode == 0x00
)  

    achievement(title="Riverside",
                description = "Beat your fourth Stage",
                points = 5,
                trigger = LevelProgression == 4
                       && prev(LevelProgression) == 4
                       && DemoFlagCheck
                       && GameMode == 0x00
)  

    achievement(title="Bug Princess",
                description = "Clear the fifth and final Stage, beating the game",
                points = 5,
                trigger = LevelProgression == 4
                       && GameClear()
                       && DemoFlagCheck
                       && GameMode == 0x00
)  

    achievement(title="CAVE Fan",
                description = "Beat the game in Very Hard difficulty",
                points = 10,
                trigger = LevelProgression == 4
                       && GameClear()
                       && DemoFlagCheck
                       && Difficulty == 0x04
                       && GameMode == 0x00
)  

    achievement(title="Taking the high road",
                description = "Beat the game in Path A",
                points = 10,
                trigger = LevelProgression == 4
                       && GameClear()
                       && DemoFlagCheck
                       && WorldID == 0x0a
                       && GameMode == 0x00
)  

    achievement(title="Dream of Insects",
                description = "Beat the game in Path B",
                points = 10,
                trigger = LevelProgression == 4
                       && GameClear()
                       && DemoFlagCheck
                       && WorldID == 0x0b
                       && GameMode == 0x00
)  

    achievement(title="Marble Hell",
                description = "Beat the game in Path C",
                points = 10,
                trigger = LevelProgression == 4
                       && GameClear()
                       && DemoFlagCheck
                       && WorldID == 0x0c
                       && GameMode == 0x00
)  

    achievement(title="Fly Like a Butterfly",
                description = "Beat the game in Path D",
                points = 10,
                trigger = LevelProgression == 4
                       && GameClear()
                       && DemoFlagCheck
                       && WorldID == 0x0d
                       && GameMode == 0x00
)  

    achievement(title="Close to the Ground",
                description = "Beat the game in Path E",
                points = 10,
                trigger = LevelProgression == 4
                       && GameClear()
                       && DemoFlagCheck
                       && WorldID == 0x0e
                       && GameMode == 0x00
) 

    achievement(title="Not a Bug, a Feature",
                description = "Beat the game in 1CC",
                points = 25,
                trigger = trigger_when(LevelProgression == 4
                       && GameClear())
                       && DemoFlagCheck
                       && ContinueCounter == 0
                       && GameMode == 0x00
)  

    achievement(title="Puzzled",
                description = "Get 1 000 000 Points",
                points = 2,
                trigger = DemoFlagCheck
                       && GameMode == 0x00
                       && Score >= 1000000
                       && prev(Score) < 1000000
)  

    achievement(title="U Wot?",
                description = "Get 2 500 000 Points and beat the default High-Score",
                points = 3,
                trigger = DemoFlagCheck
                       && GameMode == 0x00
                       && Score >= 2500000
                       && prev(Score) < 2500000
)  

    achievement(title="Link Master",
                description = "Get a combo Chain of 10 or more",
                points = 10,
                trigger = DemoFlagCheck
                       && GameMode == 0x00
                       && MarbleChain >= 10
                       && prev(MarbleChain) < 10
)  

    achievement(title="Hawk Eyes",
                description = "Raise your Just Fit counter to 25",
                points = 2,
                trigger = DemoFlagCheck
                       && GameMode == 0x00
                       && FitCounter >= 25
                       && prev(FitCounter) < 25
)  

    achievement(title="Aim Assist",
                description = "Raise your Just Fit counter to 50",
                points = 3,
                trigger = DemoFlagCheck
                       && GameMode == 0x00
                       && FitCounter >= 50
                       && prev(FitCounter) < 50
)  

    achievement(title="If it Fit, I Sit",
                description = "Raise your Just Fit counter to 100 and get an Extra Life",
                points = 10,
                trigger = DemoFlagCheck
                       && GameMode == 0x00
                       && FitCounter >= 100
                       && prev(FitCounter) < 100
)  

RPDifficulty = { 
                    0x00:"Very Easy",
                    0x01:"Easy",
                    0x02:"Normal",
                    0x03:"Hard",
                    0x04:"Very Hard"

                    }    

rich_presence_display(
    "• Saving our Bug Friends in World {0} • {1} Continues - Score: {2} • {3} Mode • ",
    rich_presence_value("WorldID", WorldID+1),
    rich_presence_value("Continue", ContinueCounter),
    rich_presence_value("Score", Score),
    rich_presence_lookup("Difficulty", Difficulty, RPDifficulty)
)  