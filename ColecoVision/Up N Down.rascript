// Up N Down
// #ID = 9323

// 20240110 Version - Sines

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


// $013F: [8 Bit] Current Player
//        00 > P1
//        01 > P2
// $0140: [24 Bit] Score P1 BCD
// $014A: [8 Bit] Difficulty Level
//        Start at 0 in normal mode
//        Start at 2 in Hard mode
//        +1 per level
// $014B: [8 Bit] Life Counter P1
//        Game Over on reaching 0
// $026D: [8 Bit] Remaining Flags (Display)
// $0280: [8 Bit] Current Round (display)

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
/// Game Data
Score = bcd(tbyte(0x0140))
CurrentPlayer = byte(0x013f)
DifficultyLevel = byte(0x014a)

LifeCounter = byte(0x014b)
RemainingFlags = byte(0x026d)
CurrentRound = byte(0x0280)
CurrentMin = byte(0x014d)
CurrentSec = byte(0x014c)

//Function
function LevelEnd() => LifeCounter > 0 && RemainingFlags == 0 && prev(RemainingFlags) == 1
function CheevoProg(Level,Title,Points)
{
    achievement(title=Title,
                description = "Complete a difficulty "+Level+1+" Round",
                points = Points,
                trigger = DifficultyLevel == Level
                       && CurrentPlayer == 0
                       && LevelEnd()
)              
}
//----------------
///Achievement Code

// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
CheevoProg(0,"Test Run",2)
CheevoProg(1,"Jumping Bug",3)
CheevoProg(2,"Long Distance Traveler",3)
CheevoProg(3,"Want for Velocity",5)
CheevoProg(4,"World Traveler",10)
// --- --- --- --- --- ---
// Misc
// --- --- --- --- --- ---

    achievement(title="Rookie's Luck",
                description = "Complete a difficulty 1 Round without losing a car",
                points = 5,
                trigger = trigger_when(DifficultyLevel == 0
                       && CurrentPlayer == 0
                       && LevelEnd())
                       && once(DifficultyLevel == 0 && Score == 0 && LifeCounter == 5)
                       && never(LifeCounter < prev(LifeCounter))
)              

    achievement(title="Smooth Drive",
                description = "Complete a difficulty 3 Round without losing a car [Start in Hard Mode]",
                points = 10,
                trigger = trigger_when(DifficultyLevel == 2
                       && CurrentPlayer == 0
                       && LevelEnd())
                       && once(DifficultyLevel == 2 && Score == 0 && LifeCounter == 5)
                       && never(LifeCounter < prev(LifeCounter))
)  

    achievement(title="Fuel Waster",
                description = "Drive and complete 10 rounds in any difficulty",
                points = 25,
                trigger = CurrentPlayer == 0
                       && CurrentRound == 0x10
                       && LevelEnd()
) 
//    achievement(title="Plumber's Drive",
//                description = "Jump and destroy 5 cars in a single level",
//                points = 2,
//                trigger = CurrentPlayer == 0
//                       && measured(repeated(5,(Score >= prev(Score)+1024) && (Score <= prev(Score)+1280)))
//                       && never(CurrentRound > prev(CurrentRound))
//                       && never(RemainingFlags == 0)
//)  

//    achievement(title="Carmageddon",
//                description = "Jump and destroy 15 cars in a single level",
//                points = 5,
//                trigger = CurrentPlayer == 0
//                       && measured(repeated(5,(Score >= prev(Score)+1024) && (Score <= prev(Score)+1280)))
//                       && never(CurrentRound > prev(CurrentRound))
//                       && never(RemainingFlags == 0)
//)  

    achievement(title="Fast Lane",
                description = "Collect all the flags quick enough to obtain a speed bonus",
                points = 10,
                trigger = CurrentPlayer == 0
                       && RemainingFlags == 0
                       && CurrentMin == 0
                       && CurrentSec <= 59

)  

    achievement(title="Precision Pilot",
                description = "Collect all the flags quick enough to obtain the highest speed bonus",
                points = 50,
                trigger = CurrentPlayer == 0
                       && RemainingFlags == 0
                       && CurrentMin == 0
                       && CurrentSec <= 19

)  
///Leaderboards Data
leaderboard(
    title = "High Score",
    description = "Up N Down Arcade Score",
    start  = LifeCounter == 0 && prev(LifeCounter) == 1 && CurrentPlayer == 0, //Trigger on death
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
            )






// Rich Presence

rich_presence_conditional_display(
    LifeCounter > 0,
    "• Flag Racing • {0}❤️ - Level {1} - Difficulty {2} • {3}🚩 •",
    rich_presence_value("Life", LifeCounter),
    rich_presence_value("CurrentLevel", CurrentRound+1),
    rich_presence_value("DifficultyLevel", DifficultyLevel+1),
    rich_presence_value("RemainingFlags", RemainingFlags))  
 
rich_presence_display(
    "• Up N Down 🏎️ •"

)