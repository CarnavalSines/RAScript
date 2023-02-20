// Charlie Blasts Territory
// #ID = 11600


// 20230220 Version - Sines

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


// $046324: [8 Bit] Gameplay Phase
//          05 > In puzzle
//          08 > Intro
//          09 > Congratulations (puzzle done)
// $046350: [8 Bit] Level ID
//          Stays at 1 on Main Menu by default (fixed on last value)
//          Increment on "Congratulations" Screen
//          After that goes from 1 (level one) to 0x3c (level 60)
//          Multiplayer have their own LevelID (as seen on demo mode)
// $046374: [16 Bit] Demo mode timer
//          Appears to be a timer in Main Menu that ticks up, goes into demo mode on 0x1c3
// $051432: [8 Bit] Relative Menu Position
//          Only ever f8 on Password Menu > tbc
// $067F98: Character movement
//          Menu movement
// $0A6F44: Red pump time
//          Level 34
// $0B4408: [16 Bit] SFX Level
//          0000 - 0x7fff
// $0DBDD8: [16 Bit] Music Level
//          0000 - 0x7fff
// $304C80: Time Level 1
// $305EC0: Time Level 2
// $30BC40: Time Level 3
// $30C728: Red pump time
//          Level 12
// $3101B0: Time Level 12
// $3172D8: Red pump time
//          Level 34


///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


LevelCodes = {  // Code for the first level of each section
                    1: "",
                    6: "[Code for the first Level: 9D 10D JD JH QH]",
                    11: "[Code for the first Level: 7D 4S 9D 7H QH]",
                    16: "[Code for the first Level: 6D JS 2H AD 6H]",
                    21: "[Code for the first Level: AC JS 3C 7H 9H]",
                    26: "[Code for the first Level: 4C 6H 8C QS AD]",
                    31: "[Code for the first Level: 2H 6S 8D 7H 7D]",
                    36: "[Code for the first Level: AC 6S 8S 2C JS]",
                    41: "[Code for the first Level: 5S 10D JH QH 4C]",
                    46: "[Code for the first Level: 5D 10D KH AC QD]",
                    51: "[Code for the first Level: 7H QC 2D 9C 2D]",  
                    56: "[Code for the first Level: 6D QC 10C 6C QS]"                 
                    }   
//----------------
//Variable
LevelIntro = byte(0x46324) == 0x8
LevelOutro = byte(0x46324) == 0x9

LevelID = byte(0x46350)


GameStatus = word(0x46374)


PasswordMenu = byte(0x51432) == 0xf8 // Password relative menu position, value only seems reachable for this


//----------------
//Function
function DemoMode() => word(0x46374) == 0x1c3 // Max value, only reached on demo mode and stay there
function MainMenu() => word(0x46374) > 0 && word(0x46374) < 0x1c3 //MainMenu = word(0x46374) > 0 && word(0x46374) < DemoMode //If the value is above 0 and under the demo mode trigger that mean the player is on the main menu

function ProgCheevoBatch(LevelBatch,Points) 
{
    achievement(title = "Destruction Professional: "+ LevelBatch+"~"+(LevelBatch+4),
                description = "Complete the levels " + LevelBatch + " through "+ LevelBatch+4 +" in one go "+LevelCodes[LevelBatch],
                points = Points,
                trigger = 
                   once(LevelID == LevelBatch && LevelIntro)
                && once(LevelID == (LevelBatch+1) && LevelOutro)
                && once(LevelID == (LevelBatch+4) && LevelIntro)
                && LevelID == LevelBatch+5
                && LevelOutro
                && never(DemoMode())
                && never(MainMenu())
//                && never(PasswordMenu)  // > Can't access Password mode without going through the main menu anyway
                    
                )
                
}                 
//----------------
///Achievement Code
// Progression
ProgCheevoBatch(1,2)
ProgCheevoBatch(6,3)
ProgCheevoBatch(11,5)
ProgCheevoBatch(16,5)
ProgCheevoBatch(21,5)
ProgCheevoBatch(26,5)
ProgCheevoBatch(31,5)
ProgCheevoBatch(36,5)
ProgCheevoBatch(41,10)
ProgCheevoBatch(46,10)
ProgCheevoBatch(51,10)
ProgCheevoBatch(56,25)

// Perfect
    achievement(title = "Destruction Expert",
                description = "Complete the game in one go [Restart OK, no going back to the Main menu or Password]",
                points = 50,
                trigger = 
                   once(LevelID == 1 && LevelIntro)
                && once(LevelID == 2 && LevelOutro)
                && once(LevelID == (60) && LevelIntro)
                && LevelID == 61
                && LevelOutro
                && never(DemoMode())
                && never(MainMenu())
                && never(PasswordMenu)
                    
                )


// Speed
// Everyone's going to cheat and look the solution online anyway
//----------------
//Leaderboard
