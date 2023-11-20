// Saturn Bomberman Fight!!
// #ID = 6989


// 20231120 Version - Sines

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


// $13F0C9: [8 Bit] Continue ? Countdown
// $1422B0: [8 Bit] Battle Mode Config Time
//          00 > 60s
//          01 > 99s
//          02 > Infinite
// $143AE0: [8 Bit] Time Countdown 0X"0
// $143AE1: [8 Bit] Time Countdown 00"X
// $143AE2: [8 Bit] Time Countdown 00"0X (Not displayed)
// $143AE3: [8 Bit] Time Countdown X0"0
// $143BE8: [8 Bit] Battle Mode Victories
//          Count victories streak, reset on char change
//          Update on new Win screen
// $143C91: [8 Bit] Battle Mode Config Minibon
//          00 > Off
//          01 > On
//          "Revenge" mode in Battle mode that allow you to respawn in a mini size with limited actions available
// $143C98: [8 Bit] P1 Char
//          00 > Shirobon
//          01 > Kurobon
//          02 > Honey
//          03 > Kotetsu
//          04 > Baguro
//          05 > Combatant #12
//          06 > Golem Bomber
//          07 > Pegi Jr.
//          08 > Radibom
//          09 > Puipui
//          0x0a > Mami
//          0x0b > Lewysia
//          0x0c > Denta
//          0x0d > Pump
//          0x0e > Deral
// $145DD1: [8 Bit] Story Mode Config Time
//          00 > 60s
//          01 > 99s
//          02 > Infinite
// $14A852: [8 Bit] Battle Mode Selection
//          For 2P > 0x01 == VS CPU
//          For 3P > 0x02 == VS CPU
//          For 4P > 0x03 == VS CPU
// $14A8C2: [8 Bit] Battle Mode Config Nb of Rounds
//          00 > 1
//          01 > 3
//          02 > 5
//          How many rounds are required to win for Battle Mode
// $14A8C3: [8 Bit] Mode ID
//          00 > Battle Mode (in battle and victory screen only)
//          01 > Story Mode
//          02 > Survival Mode
//          03 > How to Play
// $14A8C9: [8 Bit] P1 Handicap (Stars)
//          Default == 0x02
// $159CF1: [8 Bit] Story Mode Config Rank
//          00 > Easy
//          01 > Normal
//          02 > Hard
// $15FE21: [8 Bit] Battle Mode Config Shuffle
//          00 > Off
//          01 > On
//          Shuffle starting position each round
// $15FF36: [8 Bit] P1 Power-up
//          00 > No Power-up
//          02 > Max Flame
//          03 > Line Bomb
//          04 > Tower Bomb
//          05 > Hasty
//          06 > Reverse
// $15FF45: [8 Bit] Battle Mode Number of P1 Round Won
// $15FF50: [16 Bit] P1 Health
//          Start at 0x100
// $160000: [16 Bit] P2 Health
//          Start at 0x100
// $1600B0: [16 Bit] P3 Health
//          Start at 0x100
// $160160: [16 Bit] P4 Health
//          Start at 0x100
// $1601C1: [8 Bit] Nb of Players
//          01 > 1P Mode (Story or Survival)
//          02 > 2P Battle Mode
//          03 > 3P Battle Mode
//          04 > 4P Battle Mode
// $1601C3: [8 Bit] Current Stage
//          Cap at 0x08, need to check for this + Enemy Health == 0 for credit roll



//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CharName = {
    0: "Shirobon",
    1: "Kurobon",
    2: "Honey",
    3: "Kotetsu",
    4: "Baguro",
    5: "Combatant #12",
    6: "Golem Bomber",
    7: "Pegi Jr.",
    8: "Radibom",
    9: "Puipui",
    0xa: "Mami",
    0xb: "Lewysia",
    0xc: "Denta",
    0xd: "Pump",
    0xe: "Deral"
}

StoryCheevoName = {
    0: "Of Bomb And Men",
    1: "Dark Horse",
    2: "Suffering from Success",
    3: "S I M P",
    4: "Purple M&M's",
    5: "Triangle Face",
    6: "Mind of Stone, Heart of Gold",
    7: "Everyone Love Penguins",
    8: "What Am I Fighting For ?",
    9: "BANANA",
    0xa: "Wholesome Ending",
    0xb: "Plight of the People",
    0xc: "Bounty Hunter",
    0xd: "Death from Above",
    0xe: "Virtuous Fighter"
}

BattleCheevoName = {
    0: "JoJo Posing",
    1: "Eternal Rival",
    2: "Huntress",
    3: "Movie Buff",
    4: "Great Singer",
    5: "Skill Tricks",
    6: "Previously, on Bomberman",
    7: "Animal Documentary",
    8: "Bomberman Kart",
    9: "B A N A N A",
    0xa: "Moe Gap",
    0xb: "City Pop",
    0xc: "Iconic Pose",
    0xd: "Beach Episode",
    0xe: "3D Polygons"
}

//----------------
//Variable
P1CharID = byte(0x143c98)
P1Handicap = byte(0x14a8c9) // default 2
ModeID = byte(0x14a8c3)
StoryModeDifficulty = byte(0x159cf1)
StoryModeConfigTime = byte(0x145dd1)
HorseFlag = byte(0x15ff46)

P1Health = word(0x15ff50)
P2Health = word(0x160000)
P3Health = word(0x1600b0)
P4Health = word(0x160160)

NbPlayers = byte(0x1601c1)
CurrentStage = byte(0x1601c3)

///BattleMode
VictoryStreak = byte(0x143be8)
BattleModeSelection = byte(0x14a852)
BattleModeNbRound = byte(0x14a8c2)
BattleModeRoundWon = byte(0x15ff45)
BattleModeConfigTime = byte(0x1422b0)
BattleModeMinibon = byte(0x143c91)




//----------------
//Function
function P1Win() => P1Health > 0 && (P2Health + P3Health + P4Health) == 0 && prev((P2Health + P3Health + P4Health)) > 0

function StoryClear(Char,NbBattles)      
{
    achievement(title = StoryCheevoName[Char],
                description = "Clear Story Mode with " + CharName[Char]+ " in any difficulty" ,
                points = 5,
                trigger = 
                   ModeID == 1
                && BattleModeRoundWon == NbBattles
                && prev(BattleModeRoundWon) == NbBattles - 1
                && P1Health > 0
                && P1CharID == Char
                )
}


function BattleModeStreak(Char,Streak,pts)      
{
    achievement(title = BattleCheevoName[Char],
                description = "Reach a " + Streak + " Victories Streak in Battle Mode with " + CharName[Char]+ " in any difficulty" ,
                points = pts,
                trigger = 
                   ModeID == 0
                && VictoryStreak == Streak
                && prev(VictoryStreak) == Streak - 1
                && P1CharID == Char
                && ((NbPlayers == 2 && BattleModeSelection == 1)
                || (NbPlayers == 3 && BattleModeSelection == 2)
                || (NbPlayers == 4 && BattleModeSelection == 3))
                )
}

//----------------
///Achievement Code
// Progression
for i in range (0,4)
StoryClear(i,8)

for i in range (5,6)
StoryClear(i,7)

StoryClear(7,8)

for i in range (8,11)
StoryClear(i,7)

for i in range (12,14)
StoryClear(i,8)

    achievement(title = "Against All Odds",
                description = "Clear Story Mode any characters in Hard Mode, 0 Star Handicap" ,
                points = 25,
                trigger = 
                   (ModeID == 1
                && P1Health > 0
                && P1Handicap == 0
                && StoryModeDifficulty == 2)
                && (((P1CharID == 0 || P1CharID == 1 || P1CharID == 2 || P1CharID == 3 || P1CharID == 4 || P1CharID == 7 || P1CharID == 12 || P1CharID == 13 || P1CharID == 14) 
                && BattleModeRoundWon == 8 && prev(BattleModeRoundWon) == 7)
                || ((P1CharID == 5 || P1CharID == 6 || P1CharID == 8 || P1CharID == 9 || P1CharID == 10 || P1CharID == 11) 
                && BattleModeRoundWon == 7 && prev(BattleModeRoundWon)==6)))
                
 
    achievement(title = "Mami's Secret Costume",
                description = "Clear Story Mode with Mami in Hard Mode, Time 60s and never losing once" ,
                points = 10,
                trigger = 
                   ModeID == 1
                && CurrentStage == 7
                && BattleModeRoundWon == 7
                && prev(BattleModeRoundWon) == 6
                && P1CharID == 10
                && StoryModeDifficulty == 2
                && StoryModeConfigTime == 0
                ) 
                
                
    achievement(title = "Lewysia's Secret Costume",
                description = "Clear Story Mode with Lewysia in Hard Mode, Time 60s and never losing once" ,
                points = 10,
                trigger = 
                   ModeID == 1
                && CurrentStage == 7
                && BattleModeRoundWon == 7
                && prev(BattleModeRoundWon) == 6
                && P1CharID == 11
                && StoryModeDifficulty == 2
                && StoryModeConfigTime == 0
                )                 
// Battle Mode
for i in range(0,3)
BattleModeStreak(i,6,10)
                
BattleModeStreak(4,4,5)                
BattleModeStreak(5,6,10)                
BattleModeStreak(6,8,10)                
                
for i in range(7,8)
BattleModeStreak(i,3,3)                
                
BattleModeStreak(9,6,10)                
                
for i in range(10,14)                
BattleModeStreak(i,3,3)                
                
                
// Survival Mode
    achievement(title = "Survival of the Fittest",
                description = "Finish the 50 rounds of the Survival Mode" ,
                points = 25,
                trigger = 
                   ModeID == 2
                && BattleModeRoundWon == 50
                && prev(BattleModeRoundWon) == 49
                )                    
                
                
    achievement(title = "Project Manhattan",
                description = "Finish the 50 rounds of the Survival Mode with a handicap of 1 Star or less to unlock the Deca Bomb Mode" ,
                points = 50,
                trigger = 
                   ModeID == 2
                && BattleModeRoundWon == 50
                && prev(BattleModeRoundWon) == 49
                && P1Handicap <= 1

                )                   
                
                
                
                
                
                
                
                
                
