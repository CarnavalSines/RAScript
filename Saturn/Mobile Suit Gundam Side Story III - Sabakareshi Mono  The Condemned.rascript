// Mobile Suit Gundam Side Story III - Sabakareshi Mono | The Condemned
// #ID = 25889
// 20240113 Version - Sines

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

// $118148: [16 Bit] Stage 1 Tactical Score Upper
// $11814A: [16 Bit] Stage 1 Tactical Score Lower
// $11814C: [16 Bit] Stage 1 Total Score Upper
// $11814E: [16 Bit] Stage 1 Total Score Lower
// $118150: [8 Bit] Rank Stage 1
// $118151: [8 Bit] Hit Rate Stage 1
// $1181D0: [8 Bit] Main Menu Unlocks
//          0x02 > Default
//          0x03 > Stage Select Unlock
//          0x04 > MS Viewer Unlock
//          0x05 > Simulator Battle Unlock
// $1181D1: [8 Bit] Main Menu Select Cursor
//          Used to check Simulator Battle
//          0x03 > Simulator Battle when it's unlocked (Unlock value == 0x05)
// $1181D2: [8 Bit] Option Difficulty
//          00 > Easy
//          01 > Normal
//          02 > Hard
// $1181D9: [8 Bit] Sound Mode
//          00 > Stereo
//          01 > Mono
// $1181DA: [8 Bit] Score Display
//          00 > On
//          01 > Off
// $1181DB: [8 Bit] Key Assign
//          00~05
// $1181DD: [8 Bit] Radar Display
//          00 > On
//          01 > Off
// $1550B5: [8 Bit] Mission ID
//          Start at 0x00 for Mission 1
// $1550C2: [8 Bit] Game State
//          Could be used to check end of mission
//          Goes 0x05 > 0x15
//          Can be used to check in game with 0x08
//          0x09 Mission failed
//          Bit0 == 0 && Bit4 == 1 for simulator battle win
// $1550C8: [16 Bit] Tactical Score Upper Part
//          * 65536
// $1550CA: [16 Bit] Tactical Score Lower Part
// $1550CE: [16 Bit] Hit Rate
//          Gets updated on mission complete
// $1550D4: [16 Bit] Total Score Upper Part
//          Gets Updated on result screen
// $1550D6: [16 Bit] Total Score Lower Part
//          Gets Updated on result screen
// $1550D8: [16 Bit]
//          Mission Rank
//          00 > A
//          01 > B
//          02 > C
//          03 > D
//          04 > E
// $155620: [16 Bit] Armor (Display)
// $155628: [16 Bit] EXAM System Timer

///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

DifficultyRP = { 
                    0x00:"Easy",
                    0x01:"Normal",
                    0x02:"Hard"
                    }                    

//----------------
//Variable
/// Mission Data
Level1TotalScorePart1 = word(0x11814c)
Level1TotalScorePart2 = word(0x11814e)
Level1TotalScore = (Level1TotalScorePart1 * 65536) + Level1TotalScorePart2
Level1Rank = word(0x118150)

Level2TotalScorePart1 = word(0x11815c)
Level2TotalScorePart2 = word(0x11815e)
Level2TotalScore = (Level2TotalScorePart1 * 65536) + Level2TotalScorePart2
Level2Rank = word(0x118160)

Level3TotalScorePart1 = word(0x11816c)
Level3TotalScorePart2 = word(0x11816e)
Level3TotalScore = (Level3TotalScorePart1 * 65536) + Level3TotalScorePart2
Level3Rank = word(0x118170)

Level4TotalScorePart1 = word(0x11817c)
Level4TotalScorePart2 = word(0x11817e)
Level4TotalScore = (Level4TotalScorePart1 * 65536) + Level4TotalScorePart2
Level4Rank = word(0x118180)

Level5TotalScorePart1 = word(0x11818c)
Level5TotalScorePart2 = word(0x11818e)
Level5TotalScore = (Level5TotalScorePart1 * 65536) + Level5TotalScorePart2
Level5Rank = word(0x118190)

LevelScore = { 
                    0:Level1TotalScorePart2,
                    1:Level2TotalScorePart2,
                    2:Level3TotalScorePart2,
                    3:Level4TotalScorePart2,
                    4:Level5TotalScorePart2

                    }  

LevelRank = { 
                    0:Level1Rank,
                    1:Level2Rank,
                    2:Level3Rank,
                    3:Level4Rank,
                    4:Level5Rank

                    }    
/// Game Data
Difficulty = byte(0x1181d6)
MissionID = byte(0x1550b5)
GameState = word(0x1550c2)

CurrentTacticalScorePart1 = word(0x1550c8)
CurrentTacticalScorePart2 = word(0x1550ca)
CurrentTacticalScore = (CurrentTacticalScorePart1 * 65536) + CurrentTacticalScorePart2
CurrentHitRate = word(0x1550ce)
CurrentTotalScorePart1 = word(0x1550d4)
CurrentTotalScorePart2 = word(0x1550d6)
CurrentTotalScore = (CurrentTotalScorePart1* 65536) + CurrentTotalScorePart2
MissionRank = word(0x1550d8) // 00 == A, 01 == B etc
Armor = word(0x155620)
MissionFailCheck = low4(0x1550c2)
MainMenuUnlocks = byte(0x1181d0)
MainMenuSelectCursor = byte(0x1181d1)

//Function
function MissionEnd2(Level) => once(MissionID == Level && GameState == 0x408) && CurrentTotalScorePart2 == LevelScore[Level] && LevelScore[Level] != prev(LevelScore[Level]) && never(Armor == 0) && never(MissionID != Level) 
function MissionEnd(Level) => once(MissionID == Level && GameState == 0x400) && CurrentTotalScore != prev(CurrentTotalScore) && never(Armor == 0) && never(MissionID != Level) && never(MissionFailCheck == 0x09)
function CheevoProg(Level,Points,Title)
{
    achievement(title=Title,
                description = "Clear Mission " + Level+1,
                points = Points,
                trigger = MissionID == Level
                       && MissionEnd(Level)

)              
}

function CheevoProgHard(Level,Points,Title)
{
    achievement(title=Title,
                description = "Clear Mission " + Level+1+ " in Hard mode",
                points = Points,
                trigger = MissionID == Level
                       && MissionEnd(Level)
                       && Difficulty == 2

)              
}

function CheevoProgExpert(Level,Points,Title)
{
    achievement(title=Title,
                description = "Clear Mission " + Level+1+ " with an A rank",
                points = Points,
                trigger = MissionID == Level
                       && MissionEnd(Level)
                       && MissionRank == 0

)              
}


           

//----------------
///Achievement Code
// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
CheevoProg(0,5,"New Destiny")
CheevoProgHard(0,5,"Double Blues")
CheevoProgExpert(0,10,"Ace Tester")

CheevoProg(1,5,"Destination Space")
CheevoProgHard(1,10,"There are Always Remnants")
CheevoProgExpert(1,10,"Ace Chameleon")

CheevoProg(2,10,"Nerfed Performance")
CheevoProgHard(2,10,"Data Retrieval")
CheevoProgExpert(2,10,"Ace Infiltrator")

CheevoProg(3,10,"Fear of the Unknown")
CheevoProgHard(3,10,"Marion's Spirit")
CheevoProgExpert(3,25,"Ace Avenger")

CheevoProg(4,10,"Final EXAM")
CheevoProgHard(4,25,"Sore Loser")
CheevoProgExpert(4,50,"Final Ace")

// --- --- --- --- --- ---
// Bonus
// --- --- --- --- --- ---
    achievement(title="White Devil",
                description = "Clear the Simulator battle against the RX-78-2",
                points = 25,
                trigger = MissionID == 5
                       && Armor > 0
                       && bit0(0x1550c2) == 0
                       && bit4(0x1550c2) == 1
                       && prev(bit4(0x1550c2)) == 0
                       && MainMenuSelectCursor == 0x03 
                       && MainMenuUnlocks == 0x05

)   

    achievement(title="Newtype Destroyer",
                description = "Clear the Simulator battle against the RX-78-2 in Hard mode",
                points = 50,
                trigger = MissionID == 5
                       && Armor > 0
                       && bit0(0x1550c2) == 0
                       && bit4(0x1550c2) == 1
                       && prev(bit4(0x1550c2)) == 0
                       && MainMenuSelectCursor == 0x03 
                       && MainMenuUnlocks == 0x05
                       && Difficulty == 2

)   

// Leaderboard




// Rich Presence
rich_presence_conditional_display(
    MissionFailCheck == 0x8 || GameState == 0x400,
    "• {0}❤️ • Mission {1} - {2} Mode • Tactical Score: {3} •",
    rich_presence_value("Armor", Armor),
    rich_presence_value("MissionID", MissionID+1),
    rich_presence_lookup("Difficulty", Difficulty, DifficultyRP),
    rich_presence_value("CurrentScore", CurrentTacticalScore))  
 
rich_presence_display(
    "• 🤖 Remnant of the EXAM System 🤖 •"

)
