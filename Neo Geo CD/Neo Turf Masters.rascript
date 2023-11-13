// Neo Turf Masters | Big Tournament Golf
// #ID = 23831


// 20231105 Version - Sines

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


// $02A3: [8 Bit] Arcade Mode
//        00 > Stroke Play 1P
//        01 > Stroke Play 2P
//        02 > Match Play 2P
// $0330: [8 Bit] P1 Character
//        00 > Young Hero
//        01 > Technician
//        02 > Veteran
//        03 > Shot Maker
//        04 > Power Golfer
//        05 > Putt Master
// $07B4: [8 Bit] Remaining Holes
//        Continue Screen at 0
// $10B3: [8 Bit] Secondary Result Score value > Not fixed, potential pointer or messy memory
//        
//        0x00 > Hole in One
//        0x01 > Albatross
//        0x02 > Eagle
//        0x03 > Birdie
//        0x04 > Par
//        0x05 > Bogey
//        0x06 > Double Bogey
//        0x07 > Triple Bogey
// $13C4: [8 Bit] Course Par
//        00 > Par 4
//        01 > Par 5
//        0xff > Par 3
// $2988: [16 Bit] End Screen animation
//        if paired with Course = 0x13 && Game State = 0x19 can be used for winning course check
//        0x182 > Winning Course
// $29DB: [8 Bit] Difficulty
//        00 > Easy
//        03 > Normal
//        04 > MVS
//        07 > Hard
// $29DD: [8 Bit] Arcade Mode 2 (same as the other, use in priority)
//        00 > Stroke Play 1P
//        01 > Stroke Play 2P
//        02 > Match Play 2P
// $29E6: [8 Bit] Handicap Mode
//        0x00 > Other modes
//        0xff > Handicap Mode
// $29E7: [8 Bit] Grand Slam Mode
//        00 > Other Modes
//        01 > Grand Slam Day 1
//        02 > Grand Slam Day 2
// $29E9: [8 Bit] Announcement Flag
//        00 > On
//        01 > Off
// $29EA: [8 Bit] Double Yardage Option
//        00 > Off
//        0xff > On
// $2A03: [8 Bit] Game State
//        0x06 > Result Table
//        0x07 > Hole Presentation
//        0x08 > Playing
//        0x12 > Playing 2
//        0x19 > Winner
//        0xff > Switching screen (loading ?)
//        --- --- ---
//        Results
//        0x18 > Hole in One
//        0x05 > Eagle (-2 Par) / Albatross (-3 Par)
//        0x03 > Birdie (-1 Par)
//        0x02 > Par
//        0x04 > Bogey (+1/2/3 Par)
// $6B23: [8 Bit] Club used
//        00 > 1W - 260 Y
//        01 > 3W - 240 Y
//        02 > 4W - 230 Y
//        03 > 1I - 220 Y
//        04 > 3I - 200 Y
//        05 > 4I - 190 Y
//        06 > 5I - 180 Y
//        07 > 6I - 170 Y
//        08 > 7I - 160 Y
//        09 > 8I - 150 Y
//        0x0a > 9I - 140 Y
//        0x0b > PW - 120 Y
//        0x0c > SW - 100 Y
// $6B29: [8 Bit] Slice / Hook
//        0x04 > Default Straight
//        
//        0x03 > Hook 1
//        0x02 > Hook 2
//        0x01 > Hook 3
//        0x00 > Hook 4
//        
//        0x05 > Slice 1
//        0x06 > Slice 2
//        0x07 > Slice 3
//        0x08 > Slice 4
// $6B4A: [8 Bit] Current Shot Number
// $CFF9: [8 Bit] Course
//        00 > USA
//        01 > Germany
//        02 > Japan
//        03 > Australia
//        04 > Scotland
// $CFFB: [8 Bit] Current Course
//        0x12 Max
//        0x13 on Credit / Win
//        Can be used Delta 0 > 1 for start of run
// $D04F: [8 Bit] On the Green Flag ?
//        00 > On the Green
//        01 > Not
// $D068: [8 Bit] Bitflags Inputs
// $ED38: [8 Bit] America Cup Grand Slam Flag
//        00 > No
//        01 > On
// $ED39: [8 Bit] Germany Cup Grand Slam Flag
//        00 > No
//        01 > On
// $ED3A: [8 Bit] Japan Cup Grand Slam Flag
//        00 > No
//        01 > On
// $ED3B: [8 Bit] Australia Cup Grand Slam Flag
//        00 > No
//        01 > On
// $ED3C: [8 Bit] Super Grand Slam Flag (All 4 + Scotland)
//        00 > No
//        01 > On


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


CharID = { 
                    0:0x00, //Young Hero
                    1:0x01, //Technician
                    2:0x02, //Veteran
                    3:0x03, //Shot Maker
                    4:0x04, //Power Golfer
                    5:0x05 //Putt Master
                    }  
CharName = { 
                    0:"Young Hero",
                    1:"Technician",
                    2:"Veteran",
                    3:"Shot Maker",
                    4:"Power Golfer",
                    5:"Putt Master"
                    }                         
 
CourseName = {  
                    0:"USA",
                    1:"Germany",
                    2:"Japan",
                    3:"Australia",
                    4:"Scotland"
                    }     
                    
CupFlagAddress = { 
                    0:0xed38, 
                    1:0xed39, 
                    2:0xed3a, 
                    3:0xed3b, 
                    4:0xed3c
                    }     

CupFlagQualifier = {  
                    0:"US Qualifier",
                    1:"Germany Qualifier",
                    2:"Japan Qualifier",
                    3:"Down Under Qualifier",
                    4:"Scotland Qualifier"
                    }  
                    
CupFlagName = {  
                    0:"America Cup",
                    1:"Germany Cup",
                    2:"Japan Cup",
                    3:"Australia Cup",
                    4:"Super Grand Slam Cup"
                    }      
                    
PlayerCheevo = { 
                    0:"American Dream",
                    1:"INT Build",
                    2:"Australian Bushwacker",
                    3:"German Efficiency",
                    4:"Escape From Brazil",
                    5:"Frame Perfect"
                    }                       
//----------------
//Variable

ArcadeMode = byte(0x29dd) // 00 Stroke Play > 01 Stroke Play 2P > 02 Match Play 2P
P1Char = byte(0x0750)

RemainingHoles = byte(0x07b4) // Continue Screen on 00
CoursePar = byte(0x13c4) // 0 > Par 4, 01 > Par 5, 0xff > Par 3
EndScreenAnimation = word(0x2988) // 0x182 winning course, pair with Coure = 0x13 && game state == 0x19 for win check

Difficulty = byte(0x29db)
HandicapMode = byte(0x29e6) // 00 Other modes, 0xff Handicap mode
GrandSlamFlag = byte(0x29e7) // Other modes, 01 GS Day 1, 02 GS Day 2
DoubleYardageFlag = byte(0x29ea) // 00 Off, 0xff On

GameState = byte(0x2a03)
CurrentShotNumber = byte(0x6b4a)
CurrentCourse = byte(0xcff9) // 00 USA, 01 Germany, 02 Japan, 03 Australia, 04 Scottland
CurrentHole = byte(0xcffb)

AmericaCupFlag = byte(0xed38)
GermanyCupFlag = byte(0xed39)


//----------------
//Function
function DefaultSetting() => Difficulty >= 3 && HandicapMode == 0x00 && DoubleYardageFlag == 0x00 && ArcadeMode == 0x00
function CourseWin() => EndScreenAnimation == 0x182 && GameState == 0x19 && prior(GameState) != 0x19 && CurrentHole == 0x13
function BiosCheatCheck() => dword(0xfe30) == 0 

function ArcadeSlamProg(course)
{
    achievement(title = CupFlagQualifier[course],
                description = "Qualify for the second day of the "+ CourseName[course] + " Grand Slam",
                points = 10,
                trigger = DefaultSetting()
                       && BiosCheatCheck()
                       && CurrentCourse == course
                       && CurrentHole == 0x01
                       && GrandSlamFlag == 0x02
                       && prev(CurrentHole) == 0x13
                )
}

function ArcadeSlamWin(course)
{
    achievement(title = CupFlagName[course],
                description = "Win the "+ CourseName[course] + " Grand Slam",
                points = 50,
                trigger = DefaultSetting()
                       && BiosCheatCheck()
                       && CurrentCourse == course
                       && EndScreenAnimation == 0x182 
                       && GameState == 0x19 
                       && prior(GameState) != 0x19 
                       && CurrentHole == 0x13
                       && GrandSlamFlag == 0x02
                )
}

function ArcadeChar(player)
{
    achievement(title = PlayerCheevo[player],
                description = "Win Any Course in Stroke Play mode with "+ CharName[player],
                points = 10,
                trigger = DefaultSetting()
                       && BiosCheatCheck()
                       && once(P1Char == player && GameState == 0x16)
                       && never(P1Char != player && GameState == 0x16)
                       && CourseWin()
                       && GrandSlamFlag == 0x00

                )
}



//----------------
///Achievement Code
// Progression


achievement(title = "A Little Birdie Told Me",
                description = "Score your first Birdie (-1 Par)",
                points = 5,
                trigger = DefaultSetting()
                       && BiosCheatCheck()
                       && GameState == 0x03
                       && prev(GameState) != 0x03
                       
                )


achievement(title = "Sharpshooter",
                description = "Score a Hole In One",
                points = 25,
                trigger = DefaultSetting()
                       && BiosCheatCheck()
                       && GameState == 0x018
                       && prev(GameState) != 0x18
                       
                )



achievement(title = "Land of the Scott",
                description = "Win the new Scotland Course in Stroke Play (← ↙ ↓ ↘ → + D button in the Course Select screen)",
                points = 25,
                trigger = DefaultSetting()
                       && BiosCheatCheck()
                       && CurrentCourse == 4
                       && CourseWin()
                       && GrandSlamFlag == 0x00
                       
                )
for i in range (0,5) 
ArcadeChar(i)
                       
for i in range (0,4) 
ArcadeSlamProg(i)
                
for i in range (0,4) 
ArcadeSlamWin(i)

achievement(title = "Unlimited Power",
                description = "Win any Course in Stroke Play with Double Yardage activated",
                points = 10,
                trigger = Difficulty >= 3 
                       && HandicapMode == 0x00 
                       && DoubleYardageFlag == 0xff 
                       && ArcadeMode == 0x00
                       && BiosCheatCheck()
                       && CourseWin()
                       && GrandSlamFlag == 0x00
                       
                )
