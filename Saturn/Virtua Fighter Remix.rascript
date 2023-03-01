// Virtua Fighter Remix
// #ID = 22577

// 20230301 Version - Sines

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



// $1739E3: [8 Bit] Certificate Rank
// $19189C: [8 Bit] Congratulation Letter Pick ID
// $1919A2: [8 Bit] Secret Character Dural Flag
//          00 > Normal Play
//          01 > Dural
// $192072: [8 Bit] Life
//          0xa0 is max
// $1940CE: [8 Bit] 2P Life
// $19E0AE: [8 Bit] Round Indicator
// $19EA85: [8 Bit] Nb Fights Won 1P
//          Force 3 Rounds for Bonus Stage
// $19EA87: [8 Bit] Current Fight Number
// $19EA8D: [8 Bit] Mode Select
//          00 > Main Menu
//          01 > Arcade
//          02 > Ranking
//          03 > VS
// $19EA90: [8 Bit] Also round indicator
//          Bonus Stage on 0x09
// $19EA91: [8 Bit] Transition / In play value ?
//          00 on Certificate View
//          01 in play
// $19ED86: [8 Bit] Life bar indication (not life)
// $19F512: [8 Bit] Character Select
//          00 > Akira
//          01 > Pai
//          02 > Lau
//          03 > Wolf
//          04 > Jeffry
//          05 > Kage
//          06 > Sarah
//          07 > Jacky
// $19F546: [8 Bit] Player Select Countdown
// $19F982: [8 Bit] Option Menu Scroll
// $19F9A0: [8 Bit] Match Point
//          00 > 1pt
//          01 > 2pts
//          02 > 3pts
//          03 > 4pts
//          04 > 5 pts
// $19F9A1: [8 Bit] 1P Life Gauge
//          00 > Smallest
//          01 > Smaller
//          02 > Default
//          03 > Larger
//          04 > Largest
// $19F9A2: [8 Bit] Enemy Level
//          00 > Easy
//          01 > Normal
//          02 > Hard
//          03 > Expert
// $19F9A3: [8 Bit] Time Limit
//          00 > 10s
//          01 > 20s
//          02 > 30s
//          03 > 60s
//          04 > No Limit
// $19F9AD: [8 Bit] 2P Life Gauge
//          00 > Smallest
//          01 > Smaller
//          02 > Default
//          03 > Larger
//          04 > Largest
// $19F9B0: [8 Bit] Hidden Option Stage Size
//          03 per default
// $19F9B1: [8 Bit] Hidden Option Stage Select
//          00 per default


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


CharID = { 
                    0:0x00, //Akira
                    1:0x01, //Pai
                    2:0x02, //Lau
                    3:0x03, //Wolf
                    4:0x04, //Jeffry
                    5:0x05, //Kage
                    6:0x06, //Sarah
                    7:0x07 //Jacky
                    }  
                    
CharName = { 
                    0:"Akira",
                    1:"Pai",
                    2:"Lau",
                    3:"Wolf",
                    4:"Jeffry",
                    5:"Kage",
                    6:"Sarah",
                    7:"Jacky"
                    }      
                    
CheevoProgTitle = { 
                    0:"Style Inheritor",
                    1:"Fresh Face",
                    2:"Ice Tiger",
                    3:"Leaf Hound",
                    4:"Built like a Fridge",
                    5:"Shadow's Revenge",
                    6:"Turncoat",
                    7:"Young Pup"
                    }  


CheevoHardTitle = { 
                    0:"The Fight is Everything",
                    1:"Young Star",
                    2:"The Power of Experience",
                    3:"Howling Dark",
                    4:"Shark Killer",
                    5:"Shadow's Dominion",
                    6:"Bryant Skills",
                    7:"Underdog"
                    }                      

CheevoRankedProgTitle = { 
                    0:"Bajiquan Practitioner",
                    1:"Father's Footstep",
                    2:"The Old Master",
                    3:"Hounding for Blood",
                    4:"Trolling Pro",
                    5:"Silent Night",
                    6:"Mindless Fighter",
                    7:"Rising Bryant"
                    }      

CheevoRankedHardTitle = { 
                    0:"Bajiquan Master",
                    1:"Overcoming Heritage",
                    2:"Skills over Age",
                    3:"Alpha Predator",
                    4:"Master Lurer",
                    5:"Unseen Death",
                    6:"Perfect Conditionning",
                    7:"Superior Sibling"
                    }                           
                    
                    
//----------------
//Variable
CertificateRank = byte(0x1739E3) //0x09 for low expert, 0x0c for Master
DuralFlag = byte(0x1919A2) // 1 When Dural (+ ID0 Akira), only for Arcade
CurrentRound = byte(0x19EA90) // 9 Round total
CurrentFightWin = byte(0x19EA85) // ==2 for victory on default settings, ==3 on Dural bonus fight

ModeSelect = byte(0x19EA8D)
MainMenu = ModeSelect == 0
ArcadeMode = ModeSelect == 1
RankingMode = ModeSelect == 2

CertificateView = byte(0x19EA91) // Transition from 1 > 0 on loading the Certificate
CharacterID = byte(0x19F512)

MatchPoint = byte(0x19F9A0)
LifeConf = byte(0x19F9A1)
DifficultySetting = byte(0x19F9A2)
TimeLimit = byte(0x19F9A3)
P2LifeConf = byte(0x19F9AD)
StageSize = byte(0x19F9B0)
StageSelectSet = byte(0x19F9B1) == 0 //No achievement should work if this is changed
ContinueAllowed = byte(0x19f9a5) // 00 Yes, 01 No

//----------------
//Function
function PlayingDural() => DuralFlag == 1 && CharacterID == 0 && ArcadeMode //Flag on, selecting Akira and in Arcade Mode

function FinishedRun() => ArcadeMode && CurrentRound == 9 && prev(CurrentFightWin) == 2 && CurrentFightWin == 3 //In Arcade Mode, reach the bonus stage and win the 3rd point

function FinishedRanked() => RankingMode && CurrentRound == 9 && CertificateView == 0 && prior(CertificateView) == 1

function DefaultSettings() => MatchPoint == 1 && LifeConf == 2 && P2LifeConf == 2 && DifficultySetting == 1 && TimeLimit == 2 && ContinueAllowed == 0 && StageSize == 3 && StageSelectSet
function HardMode() => MatchPoint == 1 && LifeConf == 2 && P2LifeConf == 2 && DifficultySetting == 3 && TimeLimit == 2 && ContinueAllowed == 1 && StageSize == 3 && StageSelectSet


function ArcadeProg(Character,points)
{
    achievement(title = CheevoProgTitle[Character],
                description = "Complete the Arcade Mode with "+ CharName[Character] + " [Default Settings]",
                points = points,
                trigger = DefaultSettings()
                       && CharacterID == Character
                       && DuralFlag == 0
                       && FinishedRun()
                )
}

function ArcadeProgDural()
{
    achievement(title = "Steel Manikin",
                description = "Complete the Arcade Mode with Dural [Default Settings]",
                points = 5,
                trigger = DefaultSettings()
                       && CharacterID == 0
                       && DuralFlag == 1
                       && FinishedRun()
                )
}

function ArcadeHard(Character,points)
{
    achievement(title = CheevoHardTitle[Character],
                description = "Complete the Arcade Mode with "+ CharName[Character] + " [Enemy Level: Expert, Continue OFF, Other Settings on Default]",
                points = points,
                trigger = HardMode()
                       && CharacterID == Character
                       && DuralFlag == 0
                       && FinishedRun()
                )
}


function ArcadeHardDural()
{
    achievement(title = "Metal Slime",
                description = "Complete the Arcade Mode with Dural [Enemy Level: Expert, Continue OFF, Other Settings on Default]",
                points = 10,
                trigger = HardMode()
                       && CharacterID == 0
                       && DuralFlag == 1
                       && FinishedRun()
                )
}



function RankedProg(Character,points)
{
    achievement(title = CheevoRankedProgTitle[Character],
                description = "Complete the Ranked Mode with "+ CharName[Character] + " getting a Low Ranking Expert rank or above",
                points = points,
                trigger = CharacterID == Character
                       && FinishedRanked()
                       && CertificateRank >=0x09
                )
}

function RankedHard(Character,points)
{
    achievement(title = CheevoRankedHardTitle[Character],
                description = "Complete the Ranked Mode with "+ CharName[Character] + " getting a Master rank or above",
                points = points,
                trigger = CharacterID == Character
                       && FinishedRanked()
                       && CertificateRank >=0x0c
                )
}
//----------------
///Achievement Code
// Progression
for i in range (0,7)
ArcadeProg(i,5)
ArcadeProgDural()

for i in range(0,7)
ArcadeHard(i,10)
ArcadeHardDural()
//----------------
//Ranked Challenge    
for i in range (0,7)
RankedProg(i,10)

for i in range (0,7)
RankedHard(i,25)
