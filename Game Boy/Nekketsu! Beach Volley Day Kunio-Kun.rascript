// Nekketsu! Beach Volley Dayo Kunio-Kun
// #ID = 6489

// 20230219 Version - Sines

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

// $DCB0: [8 Bit] Team Select
//        00 > Team Hot-Blooded
//        01 > Women's Team
//        02 > Team Soccer
//        03 > Team Karate
//        08 > Team Comedy
//        09 > Team Macho
//        0a > Team Bullfighter
//        0b > Team Tengu
// $DCB1: [8 Bit] Team you're fighting
//        00 > Team Hot-Blooded
//        01 > Women's Team
//        02 > Team Soccer
//        03 > Team Karate
//        08 > Team Comedy
//        09 > Team Macho
//        0a > Team Bullfighter
//        0b > Team Tengu
// $FFA6: [8 Bit] Screen ID
//        --- ---
//        0x0a > Main Menu
//        0x13 > Option Menu
//        --- ---
//        0x10 > Team Select
//        0x11 > Enemy Team Select
//        0x12 > Round 1 Results
//        0x0c > Pre-Match screen
//        --- ---
//        0x00 > Team Hot-Blooded Terrain
//        0x01 > Women's Team Terrain
//        0x02 > Team Soccer Stage
//        0x03 > Team Karate Stage
//        0x04 > Team Comedy Stage
//        0x05 > Team Macho Stage
//        0x06 > Team Bullfighter Stage
//        0x07 > Team Tengu Stage
//        --- ---
//        0x14 > Item Select Main
//        0x15 > Item Select Bomb
//        0x16 > Item Select Drug
//        0x17 > Item Select Etc
//        --- ---
//        0x0e > Continue Screen
//        --- ---
//        0x19 > Hot Blooded Start Screen
//        0x1b > Women Start Screen
//        0x1e > Soccer Start Screen
//        0x1f > Karateka Start Screen
//        0x20 > Comedy Start Screen
//        0x21 > Macho Start Screen
//        0x22 > Bullfighter Start Screen
//        0x23 > Tengu Start Screen
//        --- ---
//        0x25 > Hot Blooded Victory End Screen
//        0x26 > Women Victory End Screen
//        0x27 > Soccer Victory End Screen
//        0x28 > Karateka Victory End Screen
//        0x29 > Comedy Victory End Screen
//        0x2a > Macho Victory End Screen
//        0x2b > Bullfighter Victory End Screen
//        0x2c > Tengu Victory End Screen
//        --- ---
//        0x2d > Credit Roll
// $FFA7: [8 Bit] Difficutly Setting
//        00 > Easy
//        01 > Normal
//        02 > Hard
// $FFA8: [8 Bit] Match Settings
//        00 > Bo1
//        01 > Bo3
// $FFA9: [8 Bit] Victory Points Setting
//        00 > 5
//        01 > 7
//        02 > 10
//        03 > 15
// $FFAC: [8 Bit] Left Side TeamID
//        00 > Hot Blooded
//        01 > Women
//        02 > Soccer
//        03 > Karate
//        04 > Comedy
//        05 > Macho
//        06 > Bullfighter
//        07 > Tengu
// $FFAD: [8 Bit] Right Side TeamID
// $FFAE: [8 Bit] Left Side score
// $FFAF: [8 Bit] Right Side score


///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

TeamName = {        //For Cheevo descriptions
                    0:"Hot-Blooded",
                    1:"Women",
                    2:"Soccer",
                    3:"Karateka",
                    4:"Comedy",
                    5:"Macho",
                    6:"Bullfighter",
                    7:"Tengu"
                    }          
                    
ProgCheevoNames = { //Simple progression achievements
                    0:"Protag Powers",
                    1:"Girl Supremacy",
                    2:"Look Ma', No Hands !",
                    3:"Brick-Breaker",
                    4:"Comedic Geniuses",
                    5:"Glistening Muscles",
                    6:"Red Capote",
                    7:"Not Masks"
                    }                        

HardCheevoNames = { //1cc single session hard mode achievements
                    0:"Hard Work and Guts",
                    1:"Feminine's Touch",
                    2:"World Cup Worthy",
                    3:"Black Belt",
                    4:"Stand-up Stars",
                    5:"No Pain, No Gains",
                    6:"Vuelta Al Ruedo",
                    7:"Daitengu"
                    }    
                    
PerfectCheevoNames = { //Perfect Win achievements
                    0:"Not Even Our Final Form",
                    1:"Matriarchy",
                    2:"Perfect Record",
                    3:"Flawless Kata",
                    4:"Standing Ovation",
                    5:"Mister Olympia",
                    6:"Salida a Hombros",
                    7:"Yokai's Wrath"
                    }   
                    
TeamSelectID = {   // For Player1Team check
                    0: 0x00,
                    1: 0x01,
                    2: 0x02,
                    3: 0x03,
                    4: 0x08,
                    5: 0x09,
                    6: 0x0a,
                    7: 0x0b
                    }    
                    
TeamStartCutscene = {  // ScreenID check for 1CC achievements
                    0: 0x19,
                    1: 0x1b,
                    2: 0x1e,
                    3: 0x1f,
                    4: 0x20,
                    5: 0x21,
                    6: 0x22,
                    7: 0x23
                    }     
                    
                    
TeamEndCutscene = {  // ScreendID check for tournament won
                    0: 0x25,
                    1: 0x26,
                    2: 0x27,
                    3: 0x28,
                    4: 0x29,
                    5: 0x2a,
                    6: 0x2b,
                    7: 0x2c
                    }                      
//----------------
//Variable
ScreenID = byte(0xffa6)
CreditRoll = ScreenID == 0x2d
ContinueScreen = ScreenID == 0x0e
MainMenu = ScreenID == 0x0a
PreMatchScreen = ScreenID == 0x0c

Player1Team = byte(0xdcb0)
EnemyTeam = byte(0xdcb1)

DifficultySetting = byte(0xffa7)
MatchSetting = byte(0xffa8)
VictoryPointSetting = byte(0xffa9)

LeftSideTeamID = byte(0xffac)
RightSideTeamID = byte(0xffad)

LeftSideScore = byte(0xffae)
RightSideScore = byte(0xffaf)

//----------------
//Function
function DefaultSettings() => DifficultySetting >= 1 && MatchSetting == 1 && VictoryPointSetting == 1
function HardMode() => DifficultySetting == 2 && MatchSetting == 1 && VictoryPointSetting == 1

function ProgCheevo(Team)
{
    achievement(title = ProgCheevoNames[Team],
                description = "Win the tournament with the " + TeamName[Team] + " Team [Settings: Normal Mode or Above, Best of 3, 7 Points per Round]",
                points = Medium,
                trigger = DefaultSettings()
                       && Player1Team == TeamSelectID[Team]
                       && once(ScreenID == TeamEndCutscene[Team])
                       && CreditRoll
                       && never(MainMenu)
                )

} 

function HardCheevo(Team)
{
    achievement(title = HardCheevoNames[Team],
                description = "Win the tournament with the " + TeamName[Team] + " Team on Hard mode without using Continue in a single session [Settings: Hard Mode, Best of 3, 7 Points per Round]",
                points = Hard,
                trigger = HardMode()
                       && Player1Team == TeamSelectID[Team]
                       && once(ScreenID == TeamEndCutscene[Team]) // Start check
                       && once(ScreenID == TeamStartCutscene[Team]) // End check
                       && CreditRoll // Trigger on credit roll
                       && never(ContinueScreen) // No Continue
                       && never(MainMenu)  // No getting back to the main menu to use password
                )

} 

function PerfectCheevo(Team)
{
    achievement(title = PerfectCheevoNames[Team],
                description = "Defeat anyone with a perfect score playing as the " + TeamName[Team] + " Team [Settings: Any Mode, Best of 3, 10 Points per Round]",
                points = Easy,
                trigger = MatchSetting == 1
                       && VictoryPointSetting == 2 
                       && Player1Team == TeamSelectID[Team]
                       && once((LeftSideTeamID == Team) && (LeftSideScore == 0xa) && (RightSideScore == 0)) // First round Perfect
                       && once((RightSideTeamID == Team) && (RightSideScore == 0xa) && (LeftSideScore == 0)) // Second round Perfect
                       && never(MainMenu) // Double check, should not be needed
                       && never(PreMatchScreen) // Reset on Pre-Match screen to avoid getting a hit on one round and getting the achievement in another match
                )

} 
//----------------
///Achievement Code
// Progression
for i in range(0,7)
    ProgCheevo(i)
    
    
// Hard Mode
for i in range(0,7)
    HardCheevo(i)
// Perfect

for i in range(0,7)
    PerfectCheevo(i)
