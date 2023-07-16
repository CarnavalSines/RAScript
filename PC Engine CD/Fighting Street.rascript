// Fighting Street
// #ID = 9165
// 20230716 Version - Sines

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


// $001B: [8 Bit] P1 State ?
//        Change on movement and attacks
//        0x19 > Shoryuken
//        0x1a > Hadoken
//        0x1b > Tatsumaki
// $0502: [8 Bit] Bonus Game ID
//        00 > Normal gameplay
//        01 > Bonus game 1 Breaking Plates
//        02 > Bonus game 2 Martial Art Showcase 1
//        03 > Bonus game 3 Breaking Bricks
//        04 > Bonus game 4 Martial Art Showcase 2
//        05 > Ending
// $050B: [8 Bit] High Score Name Input Letter 1
//        Used as a cheat input method
//        0x3f > Default "?"
//        0x41 > A
//        0x42 > B
//        0x43 > C
//        0x44 > D
//        0x45 > E
//        0x46 > F
//        0x47 > G
//        0x48 > H
//        0x49 > I
//        0x4a > J
//        0x4b > K
//        0x4c > L
//        0x4d > M
//        0x4e > N
//        0x4f > O
//        0x50 > P
//        0x51 > Q
//        0x52 > R
//        0x53 > S
//        0x54 > T
//        0x55 > U
//        0x56 > V
//        0x57 > W
//        0x58 > X
//        0x59 > Y
//        0x5a > Z
//        0x2e > .
//        0x10 > Heart emoji
// $050C: [8 Bit] High Score Name Input Letter 2
// $050D: [8 Bit] High Score Name Input Letter 3
// $057A: [8 Bit] BCD Time * 100
// $057B: [8 Bit] BCD Time * 10
// $057C: [8 Bit] BCD Time * 1
// $0581: [8 Bit] Number of time the ending has been seen
//        Hidden ending on 4th viewing
//        Trigger when viewing the ending while value is already at 0x03
// $0582: [8 Bit] Number of Credits
// $0583: [8 Bit] Mode
//        01 > 1P
//        02 > Versus
// $0584: [8 Bit] Current Course
//        0x00 > Japan Course
//        0x01 > China Course
//        0x02 > USA Course
//        0x03 > England Course
//        0x41 > Main Menu
// $0585: [8 Bit] Fight ID
//        Start at 0x00
//        Ending at 0x0a
// $0586: [8 Bit] Current "tier"
//        Start at 0x00
//        Each tier is 2 fights + 1 bonus game (or ending)
// $0587: [8 Bit] Round Indicator
//        Start at 0x00
// $058A: [8 Bit] Opponent ID
//        00 > Retsu
//        01 > Geki
//        02 > Joe
//        03 > Mike
//        04 > Lee
//        05 > Gen
//        06 > Birdie
//        07 > Eagle
//        08 > Adon
//        09 > Sagat
// $058C: [8 Bit] Some special ID ?
//        Can be used to identify Hadoken
//        Goes 0x0e > 0x0f on Hadoken
// $0598: [8 Bit] P1 Life
//        Start at 0x30
// $059A: [8 Bit] P1 Won Round
// $05AC: [8 Bit] BCD P1 Score * 100000
// $05AD: [8 Bit] BCD P1 Score * 10000
// $05AE: [8 Bit] BCD P1 Score * 1000
// $05AF: [8 Bit] BCD P1 Score * 100
// $05B0: [8 Bit] BCD P1 Score * 10
// $05B1: [8 Bit] BCD P1 Score * 1
// $05C8: [8 Bit] 2P Life
// $05CA: [8 Bit] P2 Won Round
// $0C87: [8 Bit] Bonus Point * 1000
//        Used for bonus games Martial Art exhib
//        Game 2 Max: 5
//        Game 4 Max: 8
//        
//        Not used for brick break, just check score increase for that
//        Game 1 Max: 5
//        Game 3 Max: 5


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CharID = { 
                    0:0x00, //Retsu
                    1:0x01, //Geki
                    2:0x02, //Joe
                    3:0x03, //Mike
                    4:0x04, //Lee
                    5:0x05, //Gen
                    6:0x06, //Birdie
                    7:0x07, //Eagle
                    8:0x08, // Adon
                    9:0x09 //Sagat
                    }  
                    
CharName = { 
                    0:"Retsu",
                    1:"Geki",
                    2:"Joe",
                    3:"Mike",
                    4:"Lee",
                    5:"Gen",
                    6:"Birdie",
                    7:"Eagle",
                    8:"Adon",
                    9:"Sagat"
                    }      
                    
CheevoProgTitle = { 
                    0:"Eyebrows-Man",
                    1:"Way of the Ninja",
                    2:"Average Joe",
                    3:"No Fight Money",
                    4:"Twins Teacher",
                    5:"Old Menace",
                    6:"Physical Prime",
                    7:"The BOUNCER",
                    8:"Star Pupil",
                    9:"Reigning Emperor"
                    }  
                    
CheevoProgTitleHard = { 
                    0:"Forbidden Instructor",
                    1:"Claw Tradition",
                    2:"Joe Who ?",
                    3:"Figthing Chance",
                    4:"Drunken Master",
                    5:"Ederly Assassin",
                    6:"Average Bri'ish Lad",
                    7:"Landing Eagle",
                    8:"Aspiring Emperor",
                    9:"Satsui no Hado"
                    }                      

CheevoProgTitleCourse = { 
                    0:"So Good They Made Sequels",
                    1:"Land of the Martial Artists",
                    2:"Home of the Braves",
                    3:"Fighting License Not Required"

                    }  
                    
CheevoProgTitleCourseName = { 
                    0:"Japan",
                    1:"China",
                    2:"USA",
                    3:"England"

                    }                      
//----------------
//Variable

CurrentRound = byte(0x0585) // 9 Round total, start at 0x00, 0x0a credit roll
ModeSelect = byte(0x0583)
P1Mode = ModeSelect == 1

CurrentCourse = byte(0x584) // 00 Japan / 01 China / 02 USA / 03 England
MainMenu = CurrentCourse == 0x41

CharacterID = byte(0x58a)

P1Life = byte(0x598) // Start at 0x30
P2Life = byte(0x5c8)

CurrentFightP1Win = byte(0x59a) // Win at 0x02
CurrentFightP2Win = byte(0x5ca)

Score = bcd(byte(0x5ac)) * 100000 + bcd(byte(0x5ad)) * 10000 + bcd(byte(0x5ae)) * 1000 + bcd(byte(0x5af)) * 100 + bcd(byte(0x5b0)) * 10 + bcd(byte(0x5b1))
P1SpecialMove = byte(0x1b) // x19 Shoryu / x1a Hadoken / x1b Tatsu
HighScoreName1 = byte(0x50b)
HighScoreName2 = byte(0x50c)
HighScoreName3 = byte(0x50d)

EndingSeen = byte(0x581) // Easter egg when already at 3 when watching a new ending
PauseFlag = byte(0x580)

//----------------
//Function       

function NoCheat() => HighScoreName1 != 0x2e
function PauseGlitch() => disable_when(repeated(3,PauseFlag == 0x02 && prev(PauseFlag)!= 2), until=(CurrentRound != prev(CurrentRound) || CurrentFightP2Win == 2))  // Pause glitch prevention, reset on loss or new fight
function FightWon() => CurrentFightP1Win == 2 && prev(CurrentFightP1Win) == 1

function ArcadeProg(Character,points)
{
    achievement(title = CheevoProgTitle[Character],
                description = "Defeat "+ CharName[Character] + " in any Course",
                points = points,
                trigger = NoCheat()
                       && CharacterID == Character
                       && FightWon()
                       && PauseGlitch()
                )
}

function ArcadePerfect(Character,points)
{
    achievement(title = CheevoProgTitleHard[Character],
                description = "Get a Perfect Round against "+ CharName[Character] + " in any Course",
                points = points,
                trigger = NoCheat()
                       && CharacterID == Character
                       && CurrentFightP1Win > prev(CurrentFightP1Win)
                       && PauseGlitch()
                       && P1Life == 0x30
                )
}

function CourseProg(Course)
{
    achievement(title = CheevoProgTitleCourse[Course],
                description = "Complete the "+ CheevoProgTitleCourseName[Course] + " Course",
                points = 10,
                trigger = NoCheat()

                       && CurrentRound == 0x0a
                       && prev(CurrentRound) == 0x09 
                       && CurrentCourse == Course
                )
}
//----------------
///Achievement Code
// Progression
achievement(title = "The Fight is Everything",
                description = "This set is protected against in-game cheat codes and the pause glitch. Don't register a high score name starting with a dot and to undo the pause protection freeze simply lose your current round or progress to the next one ",
                points = 0,
                trigger = byte(0x502) != prev(byte(0x502))
                )

for i in range (0,4)
ArcadeProg(i,3)

for i in range (5,9)
ArcadeProg(i,5)

for i in range (0,4)
ArcadePerfect(i,5)

for i in range (5,9)
ArcadePerfect(i,10)

for i in range (0,3)
CourseProg(i)

achievement(title = "All I Got for the Grind Was This Lousy Achievement",
                description = "Complete the Arcade mode 4 times to witness a very different ending",
                points = 25,
                trigger = NoCheat()

                       && CurrentRound == 0x0a
                       && prev(CurrentRound) == 0x09 
                       && EndingSeen == 0x03
                )


             
