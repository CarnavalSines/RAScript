// Virtua Fighter
// #ID = 14304


// 20230506 Version - Sines

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


// $820A: [8 Bit] P2 Life Gauge
//        Default 0x02
// $820B: [8 Bit] P1 Life Gauge
//        Default 0x02
// $820C: [8 Bit] Time Limit
//        Default 0x02
// $820D: [8 Bit] Match Points
//        Default 0x01
// $820E: [8 Bit] Stage Size
//        Default 0x03
// $820F: [8 Bit] Enemy Level
//        0x01 > Normal
//        0x03 > Expert
// $8210: [8 Bit] Camera Options
// $8211: [8 Bit] Display
// $8214: [8 Bit] Stage Select
//        Default 0x00
// $8216: [8 Bit] Time Gauge ON
//        Default 0x00
// $8217: [8 Bit] Life Gauge ON
//        Default 0x00
// $8220: [8 Bit] Sound Test S.E Test
// $8221: [8 Bit] Sound Test Current Option
//        00 > S.E Test
//        01 > Voice Test
//        02 > BGM Test
//        03 > Exit
// $8222: [8 Bit] Sound Test BGM Test
// $8223: [8 Bit] Sound Test Voice Test
// $840B: [8 Bit] P1 Character
//        00 > Akira
//        01 > Pai
//        02 > Lau
//        03 > Wolf
//        04 > Jeffry
//        05 > Kage
//        06 > Sarah
//        07 > Jacky
//        08 > Dural
// $8416: [8 Bit] P2 Round Victory
//        Start at 0x00
// $8417: [8 Bit] P1 Round Victory
//        Start at 0x00
// $8418: [8 Bit] P1 KO
//        00 > Normal
//        FF > KO
// $8419: [8 Bit] P2 KO
//        00 > Normal
//        FF > KO
// $8424: [8 Bit] P1 Life Display
//        Max at 0x70
// $8426: [8 Bit] P2 Life Display
//        Max at 0x70
// $842A: [16 Bit] Time Display BCD
// $8430: [8 Bit] Mode
//        00 > Arcade
//        01 > VS
//        02 > Ranking
//        03 > Tournament
//        04 > Options
// $8460: [8 Bit] Ranking Level
//        00 > 6th Level
//        01 > 5th Level
//        02 > 4th Level
//        03 > 3rd Level
//        04 > 2nd Level
//        05 > 1st Level
// $8463: [16 Bit] Ranking Mode Stage Cleared BCD
// $8464: [16 Bit] Ranking Mode Play Time X' 00" 00 BCD
// $8466: [16 Bit] Ranking Mode Play Time 0' XX" XX BCD
// $8468: [16 Bit] Ranking Mode Style Points BCD
// $846A: [16 Bit] Ranking Mode Total Points BCD
// $8C24: [8 Bit] Current Round
//        Starts at 0x00 for Round 1
//        0x08 > Bonus Fight
//        0x09 > Credit Roll
//        In Ranking Mode stay at 0x08 on Bonus fight win


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
                    7:0x07, //Jacky
                    8:0x08 //Dural
                    }  
                    
CharName = { 
                    0:"Akira",
                    1:"Pai",
                    2:"Lau",
                    3:"Wolf",
                    4:"Jeffry",
                    5:"Kage",
                    6:"Sarah",
                    7:"Jacky",
                    8:"Dural"
                    }      
                    
CheevoProgTitle = { 
                    0:"Akira Yuki",
                    1:"Pai Chan",
                    2:"Lau Chan",
                    3:"Wolf Hawkfield",
                    4:"Jeffry McWild",
                    5:"Kage-Maru",
                    6:"Sarah Bryant",
                    7:"Jack Bryant",
                    8:"Dural"
                    }  


CheevoHardTitle = { 
                    0:"Kung fu Expert",
                    1:"The Movie Star",
                    2:"The Retired Master",
                    3:"Pro Wrestler",
                    4:"Weakest Australian",
                    5:"Ninja's Skills",
                    6:"Brainwashed Agent",
                    7:"Diligent Brother",
                    8:"Slick Design"
                    }                      


                    
//----------------
//Variable

CurrentRound = byte(0x8c24) // 9 Round total, start at 0x00, 0x09 credit roll
CurrentFightWin = byte(0x8417) // ==2 for victory on default settings, ==3 on Dural bonus fight

ModeSelect = byte(0x8430)
MainMenu = byte(0x8400) // 00 Main Menu > FF Other
ArcadeMode = ModeSelect == 0
RankingMode = ModeSelect == 2

CharacterID = byte(0x840b)

MatchPoint = byte(0x820d)
LifeConf = byte(0x820b)
DifficultySetting = byte(0x820f)
TimeLimit = byte(0x820c)
P2LifeConf = byte(0x820a)
StageSize = byte(0x820e)
StageSelectSet = byte(0x8214) == 0 //No achievement should work if this is changed


//----------------
//Function

function FinishedRun() => ArcadeMode && CurrentRound == 8 && prev(CurrentFightWin) == 2 && CurrentFightWin == 3 //In Arcade Mode, reach the bonus stage and win the 3rd point

function FinishedRanked() => RankingMode && CurrentRound == 8 && prev(CurrentFightWin) == 2 && CurrentFightWin == 3 

function DefaultSettings() => MatchPoint == 1 && LifeConf == 2 && P2LifeConf == 2 && DifficultySetting == 1 && TimeLimit == 2 && StageSize == 3 && StageSelectSet
function HardMode() => MatchPoint == 1 && LifeConf == 2 && P2LifeConf == 2 && DifficultySetting == 3 && TimeLimit == 2 && StageSize == 3 && StageSelectSet


function ArcadeProg(Character,points)
{
    achievement(title = CheevoProgTitle[Character],
                description = "Complete the Arcade Mode with "+ CharName[Character] + " [Default Settings]",
                points = points,
                trigger = DefaultSettings()
                       && CharacterID == Character
                       && FinishedRun()
                )
}

function ArcadeHard(Character,points)
{
    achievement(title = CheevoHardTitle[Character],
                description = "Complete the Arcade Mode with "+ CharName[Character] + " [Enemy Level: Expert, Other Settings on Default]",
                points = points,
                trigger = HardMode()
                       && CharacterID == Character
                       && FinishedRun()
                )
}

function RankedProg(Character,points)
{
    achievement(title = CharName[Character] + " Master",
                description = "Complete the Ranked Mode with "+ CharName[Character] + " and defeat Dural",
                points = points,
                trigger = CharacterID == Character
                       && FinishedRanked()

                )
}

//----------------
///Achievement Code
// Progression
for i in range (0,8)
ArcadeProg(i,5)

for i in range(0,8)
ArcadeHard(i,10)

//Ranked Challenge    
for i in range (0,7)
RankedProg(i,10)


//Misc Victory Conditions
    achievement(title = "EXCELLENT",
                description = "Win a round without taking any damage [Default Life Settings, Arcade or Ranked]",
                points = 5,
                trigger = CurrentFightWin > prev(CurrentFightWin)
                       && LifeConf == 2
                       && P2LifeConf == 2
                       && byte(0x8419) == 0xff //P2 KO
                       && byte(0x8424) == 0x70 //P1 LIfe, max at 0x70
                       && byte(0x8426) == 0 //P2 Life
                       && (ArcadeMode || RankingMode)

                )
                
    achievement(title = "Stall Pro",
                description = "Win a round with a Time Over [Default Time Settings, Arcade or Ranked]",
                points = 5,
                trigger = CurrentFightWin > prev(CurrentFightWin)
                       && TimeLimit == 2
                       && byte(0x8426) > 0 //P2 Life, not regular KO
                       && word(0x842a) == 0 //Time display BCD
                       && (ArcadeMode || RankingMode)

                ) 
                
    achievement(title = "Space Control",
                description = "Win a round with a Ring Out [Default Stage Settings, Arcade or Ranked]",
                points = 5,
                trigger = CurrentFightWin > prev(CurrentFightWin)
                       && StageSize == 3
                       && byte(0x8419) == 0xff //P2 KO
                       && byte(0x8426) > 0 //P2 Life
                       && word(0x842a) > 0 //Time display BCD
                       && (ArcadeMode || RankingMode)
                )            
                
                
