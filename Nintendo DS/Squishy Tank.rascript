// Squishy Tank
// #ID = 28123

// 20231226 Version - Sines

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


// $066E4C: [32 Bit] Timer Pointer
//          +0xfe0004e6 Timer
// $184A71: [8 Bit] Difficulty
//          00 > Easy
//          01 > Normal
//          02 > Hard
// $184A72: [8 Bit] Story Mode Chapter
//          --- --- ---
//          Used for Time Attack Limit Option
//          00 > 1min
//          01 > 3min
//          02 > 5min
// $184A73: [8 Bit] Story Mode Stage
//          0x13 > 0x14 | Chapter End
// $184A80: [8 Bit] Game Mode
//          0x1e > Story Mode
//          0x11 > Survival
//          0x12 > Time Attack
// $185608: [16 Bit] Survival Easy Mode Rank 1 Score
// $18560C: [16 Bit] Survival Easy Mode Rank 2 Score
// $185610: [16 Bit] Survival Easy Mode Rank 3 Score
// $185614: [16 Bit] Survival Normal Mode Rank 1 Score
// $185618: [16 Bit] Survival Normal Mode Rank 2 Score
// $18561C: [16 Bit] Survival Normal Mode Rank 3 Score
// $185620: [16 Bit] Survival Hard Mode Rank 1 Score
// $185624: [16 Bit] Survival Hard Mode Rank 2 Score
// $185628: [16 Bit] Survival Hard Mode Rank 3 Score
// $185638: [16 Bit] Time Attack 1Min Easy Rank 1 Score
// $18563C: [16 Bit] Time Attack 1Min Easy Rank 2 Score
// $185640: [16 Bit] Time Attack 1Min Easy Rank 3 Score
// $185644: [16 Bit] Time Attack 1Min Normal Rank 1 Score
// $185648: [16 Bit] Time Attack 1Min Normal Rank 2 Score
// $18564C: [16 Bit] Time Attack 1Min Normal Rank 3 Score
// $185650: [16 Bit] Time Attack 1Min Hard Rank 1 Score
// $185654: [16 Bit] Time Attack 1Min Hard Rank 2 Score
// $185658: [16 Bit] Time Attack 1Min Hard Rank 3 Score
// $185668: [16 Bit] Time Attack 3Min Easy Rank 1 Score
// $18566C: [16 Bit] Time Attack 3Min Easy Rank 2 Score
// $185670: [16 Bit] Time Attack 3Min Easy Rank 3 Score
// $185674: [16 Bit] Time Attack 3Min Normal Rank 1 Score
// $185678: [16 Bit] Time Attack 3Min Normal Rank 2 Score
// $18567C: [16 Bit] Time Attack 3Min Normal Rank 3 Score
// $185680: [16 Bit] Time Attack 3Min Hard Rank 1 Score
// $185684: [16 Bit] Time Attack 3Min Hard Rank 2 Score
// $185688: [16 Bit] Time Attack 3Min Hard Rank 3 Score
// $185698: [16 Bit] Time Attack 5Min Easy Rank 1 Score
// $18569C: [16 Bit] Time Attack 5Min Easy Rank 2 Score
// $1856A0: [16 Bit] Time Attack 5Min Easy Rank 3 Score
// $1856A4: [16 Bit] Time Attack 5Min Normal Rank 1 Score
// $1856A8: [16 Bit] Time Attack 5Min Normal Rank 2 Score
// $1856AC: [16 Bit] Time Attack 5Min Normal Rank 3 Score
// $1856B0: [16 Bit] Time Attack 5Min Hard Rank 1 Score
// $1856B4: [16 Bit] Time Attack 5Min Hard Rank 2 Score
// $1856B8: [16 Bit] Time Attack 5Min Hard Rank 3 Score
// $1856C8: [8 Bit] Quest Mode Clear Bitflags
//          Mission 1 - 8
//          -> Bit 0 - 7
// $1856C9: [8 Bit] Quest Mode Clear Bitflags
//          Mission 9 - 16
//          -> Bit 0 - 7
// $1856CA: [8 Bit] Quest Mode Clear Bitflags
//          Mission 17 - 24
//          -> Bit 0 - 7
// $1856CB: [8 Bit] Quest Mode Clear Bitflags
//          Mission 25 - 30
//          -> Bit 0 - 5
// $1856E0: [32 Bit] Squishy Combat 1 Score
//          Technically overflow the display after 99 999 (0x1869f)
// $1856E4: [32 Bit] Squishy Combat 2 Score
//          Technically overflow the display after 99 999 (0x1869f)
// $1856E8: [32 Bit] Squishy Combat 3 Score
//          Technically overflow the display after 99 999 (0x1869f)
// $1857CA: [8 Bit] Quest Mode Current Mission
// $187CEC: red point 2
// $1A69A8: red point 1
// $1A69D4: blue point 1
// $1A6A00: green point 1
// $1A6A2C: yellow
// $1A6A58: purple
// $1A777C: [8 Bit] Survival Mode Stage

///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

ChapterName = { 
                    0:"Meet the Squishy Tanks", 
                    1:"Gunnery Sgt. Jimmy", 
                    2:"General Abrams", 
                    3:"Jane the Dame"
                    } 

TimeAttackLookup = { 
                    0:"1 Minute", 
                    1:"3 Minutes", 
                    2:"5 Minutes" 
                    }    

DifficultyLookup = { 
                    0:"Easy", 
                    1:"Normal", 
                    2:"Hard" 
                    }                                       

ProgCheevoName = { 
                    1:"Squish", 
                    2:"Clean it Up", 
                    3:"Special Helmets", 
                    4:"I Do"
                    }                     

ProgCheevoNameHard = { 
                    1:"Ultimate Camouflage", 
                    2:"Made in Germany", 
                    3:"Court Martial", 
                    4:"Ultimate Art of War: Retreat!"
                    }                     

//----------------
//Variable
/// Game Data
Difficulty = byte(0x184a71)
StoryModeChapter = byte(0x184a72)
StoryModeStage = byte(0x184a73)
GameMode = byte(0x184a80)
MiniGameFlag = byte(0x184a84)

/// High Score
SurvivalEasyScore = dword(0x185608)
SurvivalNormalScore = dword(0x185614)
SurvivalHardScore = dword(0x185620)

TimeAttack1MinEasyScore = dword(0x185638)
TimeAttack1MinNormalScore = dword(0x185644)
TimeAttack1MinHardScore = dword(0x185650)

TimeAttack3MinEasyScore = dword(0x185668)
TimeAttack3MinNormalScore = dword(0x185674)
TimeAttack3MinHardScore = dword(0x185680)

TimeAttack5MinEasyScore = dword(0x185698)
TimeAttack5MinNormalScore = dword(0x1856a4)
TimeAttack5MinHardScore = dword(0x1856b0)

//Function
function ChapterEnd(ChapterID) => StoryModeChapter == ChapterID && StoryModeStage == 0x14 && prev(StoryModeStage) == 0x13 && GameMode == 0x1e
function ProgCheevo(ChapterID,Points)
{
    achievement(title = ProgCheevoName[ChapterID+1],
                description = "Complete Chapter "+ChapterID+1 +": "+ChapterName[ChapterID],
                points = Points,
                trigger = 
                           ChapterEnd(ChapterID)
                )
}     

function ProgCheevoHard(ChapterID,Points)
{
    achievement(title = ProgCheevoNameHard[ChapterID+1],
                description = "Complete Chapter "+ChapterID+1 +": "+ChapterName[ChapterID]+" in Hard mode",
                points = Points,
                trigger = 
                           ChapterEnd(ChapterID)
                        && Difficulty == 2  
                )
}   

function SurvivalModeCheevo(SurvivalGoal,Title,Description,Points)
{
    achievement(title = Title,
                description = Description,
                points = Points,
                trigger = 
                           GameMode == 0x07
                           && prior(GameMode) == 0x11
                           && SurvivalGoal > prev(SurvivalGoal)
                )
}     

function TimeAttackModeCheevo(SurvivalGoal,Title,Description,Points)
{
    achievement(title = Title,
                description = Description,
                points = Points,
                trigger = 
                           GameMode == 0x07
                           && prior(GameMode) == 0x12
                           && SurvivalGoal > prev(SurvivalGoal)
                )
}     
//----------------
///Achievement Code

// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
ProgCheevo(0,2)
ProgCheevo(1,3)
ProgCheevo(2,10)
ProgCheevo(3,25)

ProgCheevoHard(0,3)
ProgCheevoHard(1,5)
ProgCheevoHard(2,10)
ProgCheevoHard(3,25)

// Survival mode
SurvivalModeCheevo(SurvivalEasyScore,"Squishy Squire","Beat the Survival Easy mode HighScore",3)
SurvivalModeCheevo(SurvivalNormalScore,"Squishy Knight","Beat the Survival Normal mode HighScore",5)
SurvivalModeCheevo(SurvivalHardScore,"Squishy Tank","Beat the Survival Hard mode HighScore",10)

// Time Attack
TimeAttackModeCheevo(TimeAttack1MinEasyScore,"Tank Drifting","Beat the 1Min Time Attack Easy mode HighScore",3)
TimeAttackModeCheevo(TimeAttack1MinNormalScore,"Tank Drive By","Beat the 1Min Time Attack Normal mode HighScore",5)
TimeAttackModeCheevo(TimeAttack1MinHardScore,"Tank Racing","Beat the 1Min Time Attack Hard mode HighScore",10)

TimeAttackModeCheevo(TimeAttack3MinEasyScore,"Worm","Beat the 3Min Time Attack Easy mode HighScore",3)
TimeAttackModeCheevo(TimeAttack3MinNormalScore,"Clean Worm","Beat the 3Min Time Attack Normal mode HighScore",5)
TimeAttackModeCheevo(TimeAttack3MinHardScore,"Useful Worm","Beat the 3Min Time Attack Hard mode HighScore",10)

TimeAttackModeCheevo(TimeAttack5MinEasyScore,"Long Jog","Beat the 5Min Time Attack Easy mode HighScore",3)
TimeAttackModeCheevo(TimeAttack5MinNormalScore,"Distance Running","Beat the 5Min Time Attack Normal mode HighScore",5)
TimeAttackModeCheevo(TimeAttack5MinHardScore,"Marathon Sprinter","Beat the 5Min Time Attack Hard mode HighScore",10)

// Quest Mode
achievement(title = "Versatile Tank",
                description = "Complete all Quest mode missions",
                points = 25,
                trigger = 
                           (bitcount(0x1856c8) + bitcount(0x1856c9) + bitcount(0x1856ca) + bitcount(0x1856cb)) == 30
                        && prev((bitcount(0x1856c8) + bitcount(0x1856c9) + bitcount(0x1856ca) + bitcount(0x1856cb))) == 29   
                )

// Minigame                

achievement(title = "Hide and Tank",
                description = "Get a new Highscore for the first minigame",
                points = 2,
                trigger = 
                           MiniGameFlag == 0x22
                        && dword(0x1856E0) > prev(dword(0x1856E0))
                )

achievement(title = "Raining Tanks",
                description = "Get a new Highscore for the second minigame",
                points = 3,
                trigger = 
                           MiniGameFlag == 0x23
                        && dword(0x1856E4) > prev(dword(0x1856E4))
                )                

achievement(title = "Tanks Invaders?",
                description = "Get a new Highscore for the third minigame",
                points = 5,
                trigger = 
                           MiniGameFlag == 0x24
                        && dword(0x1856E8) > prev(dword(0x1856E8))
                )                   


// Rich Presence

rich_presence_conditional_display(
    GameMode == 0x1e,
    "• Squishy Story • {0} - Stage {1} • {2} Difficulty•",
    rich_presence_lookup("ChapterName", StoryModeChapter, ChapterName),
    rich_presence_value("Stage",StoryModeStage+1),
    rich_presence_lookup("Difficulty", Difficulty, DifficultyLookup)
    )

rich_presence_conditional_display(
    GameMode == 0x11,
    "• Squishy Survival • {0} Difficulty •",
    rich_presence_lookup("Difficulty", Difficulty, DifficultyLookup)
    )

rich_presence_conditional_display(
    GameMode == 0x12,
    "• Squishy Timer • {0} Mode - {1} Difficulty • ",
    rich_presence_lookup("TimeAttack", StoryModeChapter, TimeAttackLookup),
    rich_presence_lookup("Difficulty", Difficulty, DifficultyLookup)
    ) 

rich_presence_display(
    "• Squishy Tanks •"
)                