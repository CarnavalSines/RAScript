// Samurai Shodown
// #ID = 17010
// 20230722 Version - Sines

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

// $0602: [8 Bit] Char Select ID (not ingame)
// $93B2: [16 Bit] Round Timer
// $9434: [8 Bit] Current Fight Round
// $943B: [8 Bit] Fight ID
//        Bonus Minigame at 0x03 & 0x06 & 0x0c
//        0x0c > Amakusa Final Boss Fight
// $947D: [8 Bit] Bonus Level Remaining Manequin
// $9677: [8 Bit] P2 Victory flag
//        2 > 1 on Win 1
//        1 > 0 on Win 2
// $9678: [8 Bit] P1 Char ID
//        00 > Haohmaro
//        01 > Nakoruru
//        02 > Hanzo
//        03 > Galford
//        04 > Wan-Fu
//        05 > Ukyo
//        06 > Kyoshiro
//        07 > Gen-An
//        08 > [NONE]
//        09 > Jubei
//        0a > Tamtam
//        0b > Charlotte
//        0c > Amakusa [Not Playable]
// $967A: [8 Bit] In Game flag
//        0x00 on char select (including Continue)
//        0xFF on fights
// $9697: [8 Bit] P1 Victory flag
//        2 > 1 on Win 1
//        1 > 0 on Win 2
// $9698: [8 Bit] P2 Char ID
// $969A: [8 Bit] P2 Human flag
//        0x00 > AI
//        0xFF > Versus Mode (human P2)
// $9F54: [8 Bit] Health Value 1
//        P1 Health on Round 1
// $A054: [8 Bit] Health Value 2
//        P2 Health on Round 1
//        P1 Health on Round > 1
// $A154: [8 Bit] Health Value 3
//        P2 Health on Round > 1
// $B054: [8 Bit] Health Value 4
//        P1 Health Last Fight after one P1 Victory
// $B154: [8 Bit] Health Value 5
//        P2 Health Last Fight after one P1 Victory
// $BD20: [8 Bit] Difficulty Level
//        0x00 > Easy
//        0x03 > Normal
//        0x07 > Hard


///Core
//Constant
//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


CharID = { 
                    0:0x00, //Haohmaru
                    1:0x01, //Nakoruru
                    2:0x02, //Hanzo
                    3:0x03, //Galford
                    4:0x04, //Wan-Fu
                    5:0x05, //Ukyo
                    6:0x06, //Kyoshiro
                    7:0x07, //Genan
                    8:"None", //[NONE]
                    9:0x09, //Jubei
                    10:0x0a,//Tamtam
                    11:0x0b//Charlotte
                    }  
                    
                    
CharName = { 
                    0:"Haohmaru", //Haohmaru
                    1:"Nakoruru", //Nakoruru
                    2:"Hanzo", //Hanzo
                    3:"Galford", //Galford
                    4:"Wan-Fu", //Wan-Fu
                    5:"Ukyo", //Ukyo
                    6:"Kyoshiro", //Kyoshiro
                    7:"Genan", //Genan
                    8:"None", //[NONE]
                    9:"Jubei", //Jubei
                    10:"Tamtam",//Tamtam
                    11:"Charlotte"//Charlotte
                    }  
                    
CheevProgTitle = { 
                    0:"Bushido Path", //Haohmaru
                    1:"Call of Nature", //Nakoruru
                    2:"Way of Shadows", //Hanzo
                    3:"American Ninja", //Galford
                    4:"China's Greatest General", //Wan-Fu
                    5:"Flower Swordsman", //Ukyo
                    6:"Dancing Blade", //Kyoshiro
                    7:"Claw of Evil", //Genan
                    8:"None", //[NONE]
                    9:"Demon Slayer", //Jubei
                    10:"Stone Protector",//Tamtam
                    11:"Nobless Oblige"//Charlotte
                    }  
                    
CheevProgTitleHard = { 
                    0:"Eternal Fight", //Haohmaru
                    1:"Hawk's Path", //Nakoruru
                    2:"Famous Spy", //Hanzo
                    3:"Evil's Bane", //Galford
                    4:"Bald Fury", //Wan-Fu
                    5:"One Strike Blade", //Ukyo
                    6:"Deadly Artist", //Kyoshiro
                    7:"King of Monster Pretender", //Genan
                    8:"None", //[NONE]
                    9:"Seasoned Slayer", //Jubei
                    10:"Mayan's Best",//Tamtam
                    11:"Blue Blood"//Charlotte
                    }                      
//----------------
//Variable
Difficulty = byte(0xbd20)
P1CharID = byte(0x9678)
InGameFlag = byte(0x967a)
VersusModeFlag = byte(0x969a)

RoundTimer = dword(0x602)
BonusGoal = byte(0x947d)
FightID = byte(0x943b)

P1VictoryFlag = byte(0x9697)
P2VictoryFlag = byte(0x9677)

//----------------
//Function
function InGame() => InGameFlag == 0xFF && VersusModeFlag == 0
function FightWon() => P1VictoryFlag == 0 && prev(P1VictoryFlag) == 1

function ArcadeProg(Character)
{
    achievement(title = CheevProgTitle[Character],
                description = "Complete Arcade mode with "+ CharName[Character] + " [Any Difficulty, No Char switching on Continue]",
                points = 5,
                trigger = InGame()
                       && P1CharID == Character
                       && FightWon()
                       && FightID == 0x0c
                       && once(P1CharID == Character && InGame() && FightID == 0 && P1VictoryFlag == 2 && P2VictoryFlag == 2) // Start of arcade mode
                       && never(P1CharID != Character && InGame()) // Reset for chosing another fighter
                )
}

function ArcadeProgHard(Character)
{
    achievement(title = CheevProgTitleHard[Character],
                description = "Complete Arcade mode in Hard Difficulty with "+ CharName[Character] + " [Any Difficulty, No Char switching on Continue]",
                points = 25,
                trigger = InGame()
                       && P1CharID == Character
                       && FightWon()
                       && FightID == 0x0c
                       && once(P1CharID == Character && InGame() && FightID == 0 && P1VictoryFlag == 2 && P2VictoryFlag == 2) // Start of arcade mode
                       && never(P1CharID != Character && InGame()) // Reset for chosing another fighter
                       && Difficulty == 7
                )
}
//----------------
///Achievement Code
// Progression

for i in range (0,7)
ArcadeProg(i)

for i in range (9,11)
ArcadeProg(i)


for i in range (0,7)
ArcadeProgHard(i)

for i in range (9,11)
ArcadeProgHard(i)

achievement(title = "Samurai Chamion",
                description = "Complete Arcade mode with a single credit",
                points = 10,
                trigger = trigger_when(InGame()
                       && FightWon()
                       && FightID == 0x0c)
                       && once(InGame() && FightID == 0 && P1VictoryFlag == 2 && P2VictoryFlag == 2) // Start of arcade mode
                       && never(P2VictoryFlag == 0 && prev(P2VictoryFlag) == 1) // Reset on game over
                )
                
                
achievement(title = "Ultimate Shodown",
                description = "Complete Arcade mode in Hard Difficulty with a single credit",
                points = 50,
                trigger = trigger_when(InGame()
                       && FightWon()
                       && FightID == 0x0c)
                       && Difficulty == 7
                       && once(InGame() && FightID == 0 && P1VictoryFlag == 2 && P2VictoryFlag == 2) // Start of arcade mode
                       && never(P2VictoryFlag == 0 && prev(P2VictoryFlag) == 1) // Reset on game over
                       && never(Difficulty != 7)
                )

achievement(title = "Strawman",
                description = "Beat any Bonus Game",
                points = 3,
                trigger = InGame()
                       && (FightID == 0x03 || FightID == 0x06 || FightID == 0x0c)
                       && RoundTimer > 0
                       && BonusGoal == 0
                       && prev(BonusGoal) == 1
                )
                
achievement(title = "Hat Trick",
                description = "Beat all three Bonus Game in a single Arcade Run",
                points = 5,
                trigger = InGame()
                       && once(FightID == 0x03 
                       && RoundTimer > 0
                       && BonusGoal == 0
                       && prev(BonusGoal) == 1)
                       && once(FightID == 0x06 
                       && RoundTimer > 0
                       && BonusGoal == 0
                       && prev(BonusGoal) == 1)
                       && once(FightID == 0x0c 
                       && RoundTimer > 0
                       && BonusGoal == 0
                       && prev(BonusGoal) == 1)
                       && never(FightID == 0) // Reset on new arcade run
                )                
