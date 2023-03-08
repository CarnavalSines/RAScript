// Arkanoid R 2000
// #ID = 22556


// 20230308 Version - Sines

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


// $078D5E: [8 Bit] Mode Select
//          00 > Main Menu / Arcade
//          01 > Extra Mode
//          02 > Edit
//          03 > Squash
//          04 > Option
// $078EA4: [8 Bit] Pause Indicator
//          00 > Pause
//          02 > In-Game
// $078F30: [8 Bit] Option - Player Speed
//          Default 0x03
//          00 - 07
// $078F31: [8 Bit] Option - Player Stock
//          Default 0x03
//          01 - 05
// $078F32: [8 Bit] Option - Game Level
//          Default 0x02 (Normal)
//          00 - 05
// $078F33: [8 Bit] Option - Sound
//          00 > Stereo
//          01 > Mono
// $078F34: [8 Bit] Option - BGM
//          00 - 0x11
// $078F35: [8 Bit] Option - Sound Effect
//          00 - 0x3b
// $078F36: [8 Bit] Option - Memory Card
//          00 >Load
//          01 >Save
// $078F37: [8 Bit] Option - Auto Save
//          00 > Off
//          01 > On
// $078F80: [8 Bit] Controller 1 Type
//          00 > Playstation Controller
//          01 > Mouse
// $0792C0: [32 Bit] High Score
// $0792C4: [32 Bit] Score
// $0792DC: [8 Bit] Level Indicator
//          delta 0x64 > 0x01 Ending Screen / Credit Roll
// $0792F8: [16 Bit] Counter before Demo mode on main menu
//          If 0 > Demo Mode
//          Else > Good to go
// $0D0C10: [8 Bit] Live Indicator
//          0xff on Continue Screen
//          0x22 On "Enter your name" screen


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
GameMode = byte(0x78d5e)
AchievementMode = (GameMode == 0 || GameMode == 1)

PlayerStock = byte(0x7ebc0)
DifficultyLevel = byte(0x7ebbf)
PlaystationMouse = byte(0x78f80) == 1 

PlayerScore = dword(0x792c4)
LevelID = byte(0x792dc) // Goes from 0x64 (level 100 MAX) to 0x01 on credit roll
PlayerLives = byte(0xd0c10) // 0xff on Continue Screen, 0x22 on "Enter your Name" screen

DemoMode = word(0x792f8) == 0

//----------------
//Function

function GameOver() => PlayerLives == 0xff && prev(PlayerLives) == 0
function NormalMode() => DifficultyLevel >= 0x02 && PlayerStock == 0x03 //Normal mode or above, 3 lives
function HardMode() => DifficultyLevel == 0x05 && PlayerStock == 0x03 //Hardest difficulty, still 3 lives


function ArcadeModeProgression(Title,Level,Points)
{
    achievement(title=Title,
                description = "Complete level " + Level + " of the Arcade Mode [Difficulty Normal or above]",
                points = Points,
                trigger = GameMode == 0 // Arcade Mode check
                       && DifficultyLevel >= 0x02 // Normal or above
                       && LevelID == Level+1 // Check the level switch
                       && prev(LevelID) == Level
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
      
)              
}

function ArcadeMode1CC(Title,Level,Points)
{
    achievement(title=Title,
                description = "Starting a new game, complete level " + Level + " of the Arcade Mode without any Game Over [Any Difficulty, 3 Stocks]",
                points = Points,
                trigger = GameMode == 0 // Arcade Mode check
                       && never(GameOver())
                       && PlayerStock == 0x03
                       && trigger_when(LevelID == Level+1 // Check the level switch
                       && prev(LevelID) == Level
                       && once(LevelID == 0x01) // Checking a few levels, not all
                       && once(LevelID == Level-1)
                       && once(LevelID == Level-5)
                       && once(LevelID == Level-10))
                       && once(LevelID == Level-20)
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
     
)              
}

function ExtraModeProgression(Title,Level,Points)
{
    achievement(title=Title,
                description = "Complete level " + Level + " of the Extra Mode [Difficulty Normal or above]",
                points = Points,
                trigger = GameMode == 1 // Extra Mode check
                       && DifficultyLevel >= 0x02 // Normal or above
                       && LevelID == Level+1 // Check the level switch
                       && prev(LevelID) == Level
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
      
)              
}

function ExtraMode1CC(Title,Level,Points)
{
    achievement(title=Title,
                description = "Starting a new game, complete level " + Level + " of the Extra Mode without any Game Over [Any Difficulty, 3 Stocks]",
                points = Points,
                trigger = GameMode == 1 // Arcade Mode check
                       && never(GameOver())
                       && PlayerStock == 0x03
                       && trigger_when(LevelID == Level+1 // Check the level switch
                       && prev(LevelID) == Level
                       && once(LevelID == 0x01) // Checking a few levels, not all
                       && once(LevelID == Level-1)
                       && once(LevelID == Level-5)
                       && once(LevelID == Level-10) )
                       && once(LevelID == Level-20) 
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
     
)              
}

function HighScoreCheevo(Title,Score,Points)
{
    achievement(title=Title,
                description = "In Arcade or Extra mode, reach a Score of at least " + Score,
                points = Points,
                trigger = AchievementMode
                       && PlayerScore >= Score
                       && prev(PlayerScore) < Score
                       && !DemoMode // Not in Demo
     
)              
}

//----------------
///Achievement Code
// Arcade Mode
ArcadeModeProgression("The First Planet",9,5)
ArcadeModeProgression("Alien Towers",18,5)
ArcadeModeProgression("Sky Beam",27,5)
ArcadeModeProgression("T Posing",36,10)
ArcadeModeProgression("Vaporwave Diamond",45,10)
ArcadeModeProgression("Curtain's Call",54,10)
ArcadeModeProgression("The Rainbow Fish",63,10)
ArcadeModeProgression("Four Leaves",72,10)
ArcadeModeProgression("Ancient Aliens",81,10)
ArcadeModeProgression("Lost Temple",90,25)
    achievement(title="Bruh Moment",
                description = "Complete level 100 of the Arcade Mode by defeating Doh [Difficulty Normal or above]",
                points = 25,
                trigger = GameMode == 0 // Arcade Mode check
                       && DifficultyLevel >= 0x02 // Normal or above
                       && LevelID == 0x01 // Check the level switch
                       && prior(LevelID) == 0x64
                       && PlayerLives == 0x05 // Always at that value on credit roll
                       && prev(PlayerLives) == 0 // Same as previous line
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
      
)    
ArcadeMode1CC("Perfect Quarter",25,10)
ArcadeMode1CC("Perfect Half",50,10)
achievement(title="Lucky 7s",
                description = "Reach level 77 of the Arcade Mode with 7 or more Lives [Any Difficulty, 3 Stocks]",
                points = 25,
                trigger = GameMode == 0 // Arcade Mode check
                       && LevelID == 77 // Check the level switch
                       && prev(LevelID) == 76
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
                       && PlayerStock == 0x03
                       && PlayerLives >= 7
      
)     

achievement(title="Doh or Doh not. There is no Try",
                description = "Reach Doh on level 100 of the Arcade Mode with 10 or more Lives [Any Difficulty, 3 Stocks]",
                points = 25,
                trigger = GameMode == 0 // Arcade Mode check
                       && LevelID == 100 // Check the level switch
                       && prev(LevelID) == 99
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
                       && PlayerStock == 0x03
                       && PlayerLives >= 10
      
)     
// Extra Mode
ExtraModeProgression("Falling Appart",8,5)
ExtraModeProgression("Trifecta",15,5)
ExtraModeProgression("Out of Phase",24,5)
ExtraModeProgression("The Cyberwyrm Comes",33,10)
ExtraModeProgression("Industrial Construct",41,10)
ExtraModeProgression("Lake's Flowers",49,10)
ExtraModeProgression("Cupid",57,10)
ExtraModeProgression("Return of the Cyberwyrm",66,10)
ExtraModeProgression("Enemy Ship",74,25)
ExtraModeProgression("Checker Board",82,25)
ExtraModeProgression("Spiralling Out",90,25)
achievement(title="Doh It Again !",
                description = "Complete level 100 of the Extra Mode by defeating Doh [Difficulty Normal or above]",
                points = 50,
                trigger = GameMode == 1 // Arcade Mode check
                       && DifficultyLevel >= 0x02 // Normal or above
                       && LevelID == 0x01 // Check the level switch
                       && prior(LevelID) == 0x64
                       && PlayerLives == 0x05 // Always at that value on credit roll
                       && prev(PlayerLives) == 0 // Same as previous line
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
      
)   
ExtraMode1CC("Another Quarter",25,10)
ExtraMode1CC("Another Half",50,10)
achievement(title="Extra Lucky",
                description = "Reach level 77 of the Extra Mode with 7 or more Lives [Any Difficulty, 3 Stocks]",
                points = 25,
                trigger = GameMode == 1 // Arcade Mode check
                       && LevelID == 77 // Check the level switch
                       && prev(LevelID) == 76
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
                       && PlayerStock == 0x03
                       && PlayerLives >= 7
      
)     

achievement(title="Baby Moai, Doh-Doh, Doh-Doh",
                description = "Reach Doh on level 100 of the Extra Mode with 10 or more Lives [Any Difficulty, 3 Stocks]",
                points = 25,
                trigger = GameMode == 1 // Arcade Mode check
                       && LevelID == 100 // Check the level switch
                       && prev(LevelID) == 99
                       && !DemoMode // Not in Demo
                       && PlayerScore > 0 // Mandatory, should always be true, added to double check against early memory initialisation issues
                       && PlayerStock == 0x03
                       && PlayerLives >= 10
      
)     
// Score
HighScoreCheevo("The Beginning",250000,10)
HighScoreCheevo("Halway Mark",500000,10)
HighScoreCheevo("Almost There",750000,25)
HighScoreCheevo("The Big M",1000000,50)

//----------------

///Leaderboard

leaderboard(
    title = "Arcade Mode HighScore",
    description = "Show Doh who's the best !",
    start  = (GameMode == 0 && GameOver()) || (GameMode == 0 && PlayerLives==0x05 && prev(PlayerLives)==0 && LevelID==0x01 && prior(LevelID)==0x64),
    cancel = always_false(),
    submit = always_true(),
    value = PlayerScore,
    format = "VALUE"
)
              
leaderboard(
    title = "Extra Mode HighScore",
    description = "Show Doh who's the extra best !",
    start  = (GameMode == 1 && GameOver()) || (GameMode == 1 && PlayerLives==0x05 && prev(PlayerLives)==0 && LevelID==0x01 && prior(LevelID)==0x64),
    cancel = always_false(),
    submit = always_true(),
    value = PlayerScore,
    format = "VALUE"
)              
              
              

