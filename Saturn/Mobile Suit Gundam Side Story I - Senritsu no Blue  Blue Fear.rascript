// Mobile Suit Gundam Side Story I - Senritsu no Blue | Blue Fear
// #ID = 25887
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
// $118158: [16 Bit] Stage 2 Tactical Score Upper
// $11815A: [16 Bit] Stage 2 Tactical Score Lower
// $11815C: [16 Bit] Stage 2 Total Score Upper
// $11815E: [16 Bit] Stage 2 Total Score Lower
// $118160: [8 Bit] Rank Stage 2
// $118161: [8 Bit] Hit Rate Stage 2
// $118168: [16 Bit] Stage 3 Tactical Score Upper
// $11816A: [16 Bit] Stage 3 Tactical Score Lower
// $11816C: [16 Bit] Stage 3 Total Score Upper
// $11816E: [16 Bit] Stage 3 Total Score Lower
// $118170: [8 Bit] Rank Stage 3
// $118171: [8 Bit] Hit Rate Stage 3
// $118178: [16 Bit] Stage 4 Tactical Score Upper
// $11817A: [16 Bit] Stage 4 Tactical Score Lower
// $11817C: [16 Bit] Stage 4 Total Score Upper
// $11817E: [16 Bit] Stage 4 Total Score Lower
// $118180: [8 Bit] Rank Stage 4
// $118181: [8 Bit] Hit Rate Stage 4
// $118188: [16 Bit] Stage 5 Tactical Score Upper
// $11818A: [16 Bit] Stage 5 Tactical Score Lower
// $11818C: [16 Bit] Stage 5 Total Score Upper
// $11818E: [16 Bit] Stage 5 Total Score Lower
// $118190: [8 Bit] Rank Stage 5
// $118191: [8 Bit] Hit Rate Stage 5
// $1181D0: [8 Bit] Bitflag
//          Bit 0 | Stage Select Unlocked
// $1181D6: [8 Bit] Option Difficulty
//          00 > Easy
//          01 > Normal
//          02 > Hard
// $1181D9: [8 Bit] Sound Mode
//          00 > Stereo
//          01 > Mono
// $1181DB: [8 Bit] Key Assign
//          00~05
// $15377A: [8 Bit] Mission ID
//          Start at 0x00 for Mission 1
// $153792: [16 Bit] Game State ?
//          Could be used to check end of mission
//          Goes 0x05 > 0x15
//          Can be used to check in game with 0x408
// $153798: [16 Bit] Tactical Score Upper Part
//          * 65536
// $15379A: [16 Bit] Tactical Score Lower Part
// $15379E: [16 Bit] Hit Rate
//          Gets updated on mission complete
// $1537A4: [16 Bit] Total Score Upper Part
//          Gets Updated on result screen
// $1537A6: [16 Bit] Total Score Lower Part
//          Gets Updated on result screen
// $1537A8: [16 Bit]
//          Mission Rank
//          00 > A
//          01 > B
//          02 > C
//          03 > D
//          04 > E
// $153CD8: [16 Bit] Armor (Display)
// $153CDD: [8 Bit] Hand Grenade Ammo
// $18E5FE: amor pointer 2
// $196C18: [16 Bit] Vertical Position
//          Pointed
// $196C1C: [16 Bit] Horizontal Position
//          Pointed
// $196C2E: [16 Bit] Armor (Manipulable)
//          Pointed

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
MissionID = byte(0x15377a)
GameState = word(0x153792)

CurrentTacticalScorePart1 = word(0x153798)
CurrentTacticalScorePart2 = word(0x15379a)
CurrentTacticalScore = (CurrentTacticalScorePart1 * 65536) + CurrentTacticalScorePart2
CurrentHitRate = word(0x15379e)
CurrentTotalScorePart1 = word(0x1537a4)
CurrentTotalScorePart2 = word(0x1537a6)
CurrentTotalScore = (CurrentTotalScorePart1* 65536) + CurrentTotalScorePart2
MissionRank = word(0x1537a8) // 00 == A, 01 == B etc
Armor = word(0x153cd8)
MissionFailCheck = low4(0x153792)

//Function
function MissionEnd2(Level) => once(MissionID == Level && GameState == 0x408) && CurrentTotalScorePart2 == LevelScore[Level] && LevelScore[Level] != prev(LevelScore[Level]) && never(Armor == 0) && never(MissionID != Level) 
function MissionEnd(Level) => once(MissionID == Level && GameState == 0x408) && CurrentTotalScore != prev(CurrentTotalScore) && never(Armor == 0) && never(MissionID != Level) && never(MissionFailCheck == 0x09)
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
CheevoProg(0,5,"Night Raid")
CheevoProgHard(0,5,"Medea Salvager")
CheevoProgExpert(0,5,"Ace GM")

CheevoProg(1,5,"Blue Terror")
CheevoProgHard(1,5,"Abnormal Survivor")
CheevoProgExpert(1,10,"Ace Duelist")

CheevoProg(2,5,"Desert Struggle")
CheevoProgHard(2,10,"Gallop Run")
CheevoProgExpert(2,10,"Ace Fox")

CheevoProg(3,10,"Zeon's Counterattack")
CheevoProgHard(3,10,"Castle Doctrine")
CheevoProgExpert(3,25,"Ace Defender")

CheevoProg(4,10,"They Came from the Deep")
CheevoProgHard(4,10,"Tri-Stars?!")
CheevoProgExpert(4,25,"Ace Pilot")

// --- --- --- --- --- ---
// Bonus
// --- --- --- --- --- ---


// Leaderboard




// Rich Presence
rich_presence_conditional_display(
    MissionFailCheck == 0x408,
    "• {0}❤️ • Mission {1} - {2} Mode • Tactical Score: {3} •",
    rich_presence_value("Armor", Armor),
    rich_presence_value("MissionID", MissionID+1),
    rich_presence_lookup("Difficulty", Difficulty, DifficultyRP),
    rich_presence_value("CurrentScore", CurrentTacticalScore))  
 
rich_presence_display(
    "• 🤖 Trying to Survive against perfidious Zeon 🤖 •"

)
