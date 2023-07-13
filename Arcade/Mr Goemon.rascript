// Mr. Goemon
// #ID = 12311
// 20230713 Version - Sines

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

// $0601: [8 Bit] Dipswtich Credit per Coin
//        Default 1
// $0603: [8 Bit] Dipswtich Lives
//        Default 3
// $0605: [8 Bit] Dipswtich First bonus Life
//        At Score >= Value * 10k
//        Default 2
// $0606: [8 Bit] Dipswtich Subsequent bonus Lives
//        At Score >= Value * 10k
//        Default 6
// $0607: [8 Bit] Dipswtich Difficulty
//        Easy > 00
//        Normal > 04
//        Hard > 08
//        Very Hard > 0c
// $07A2: [8 Bit] BCD Credits
// $07A3: [8 Bit] Timer
//        Countdown on main menu until demo start
// $07FD: [8 Bit] BCD Timer Bonus * 10
// $07FE: [8 Bit] BCD Timer Bonus * 1
// $0900: [8 Bit] Score BCD * 10000
// $0901: [8 Bit] Score BCD * 100
// $0902: [8 Bit] Score BCD * 1
// $091E: [8 Bit] In Game Flag
//        00 > Main Menu / Demo
//        01 > Playing
// $09B0: [8 Bit] LifeCount
//        Start at 03
//        Game Over at 00
// $09DD: [8 Bit] Goemon state
//        00 > Normal
//        03 > Grabbed
//        0x80 > Dying
// $09E0: [8 Bit] Input Bitflags
//        Bit 0 | Left
//        Bit 1 | Right
//        Bit 2 | Up
//        Bit 3 | Right
//        Bit 4 | B > Pipe Attack
//        Bit 5 | A > Throw Attack
// $09EE: [8 Bit] Level subpart ID
//        00 > First Part
//        01 > Second part (post gold steal)
//        02 > Boss Fight
// $09F2: [8 Bit] Level timer indicator
//        Start at 0x00
//        Stay at 0 during demo
//        milisecond counter
//        0x00 > 0x3f
// $09F3: [8 Bit] Level timer indicator
//        Start at 0x00
//        Stay at 0 during demo
//        Seconds counter
// $10DE: [8 Bit] Stage Number (Display only)
// $21C7: [16 Bit] Moon Sprite ID
//        0xff96 > Full Moon
//        0x7d31 > Moon attacked


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable
DipSwitchLives = byte(0x603) // Default 3
DipSwitchBonus1 = byte(0x605) // Default 2
DipSwitchBonus2 = byte(0x606) // Default 6
DipSwitchDifficulty = byte(0x607) // 4 normal > 0x0c VHard 

TimeBonus = bcd(byte(0x7fd)) *10 + bcd(byte(0x7fe))
Score = bcd(byte(0x900)) * 10000 + bcd(byte(0x901)) * 100 + bcd(byte(0x902))
LifeCount = byte(0x09b0)
GoemonPipe = bit4(0x9e0)
GoemonThrow = bit5(0x9e0)

StageID = byte(0x10de)
StageSubID = byte(0x9ee)
LevelTimer = byte(0x9f3) * 100 + byte(0x9f2)
MoonSprite = word(0x21c7)
Credit = bcd(byte(0x7a2))

//----------------
//Function
function GameOver() => LevelTimer > 0 && LifeCount == 0 && prev(LifeCount) == 1
function Deathless() => LifeCount < prev(LifeCount)
function DipSwitchNormal() => DipSwitchLives == 3 && DipSwitchBonus1 == 4 && DipSwitchBonus2 == 8 && DipSwitchDifficulty >= 0x04
function DipSwitchVHard() => DipSwitchLives == 3 && DipSwitchBonus1 == 4 && DipSwitchBonus2 == 8 && DipSwitchDifficulty == 0x0c
function LevelEndCheck() => repeated(60,LevelTimer == prev(LevelTimer) && never(LevelTimer > prev(LevelTimer)))
function Pacifist() => GoemonPipe == 1 || GoemonThrow == 1
function MoonBreak() => MoonSprite == 0x7d31 && prev(MoonSprite) == 0xff96

//----------------
///Achievement Code
// Progression
achievement(title = "Configuration Info",
                description = "Unless specified otherwise all achievements require the following configuration: Default Lives = 3, Bonus Lives = First at 40K pts subsequent at 80K pts, Difficulty = Normal OR Above",
                points = 0,
                trigger = 
                            Credit > 0
                         && prev(Credit) == 0  
                         
)

// --- --- --- Level 1
achievement(title = "Call me Mister",
                description = "Reach Gold in Level 1",
                points = 2,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageSubID == 0
                         && StageID == 1
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

achievement(title = "Streching Legs",
                description = "Complete Level 1",
                points = 3,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageSubID == 2
                         && StageID == 1
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

achievement(title = "Break the Moon: The first Rabbit",
                description = "Destroy the moon in Level 1",
                points = 2,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageID == 1
                         && LifeCount > 0
                         && MoonBreak()
                         
)

achievement(title = "Just a Thief in the Night",
                description = "Complete Level 1 without ever attacking",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && trigger_when(StageSubID == 2
                         && StageID == 1
                         && LifeCount > 0
                         && LevelEndCheck())
                         && once(StageID == 1 && StageSubID == 0 && LevelTimer == 0)
                         && never(Pacifist())
                         && never(StageID != 1)
                         
)

achievement(title = "Slippery Thief",
                description = "Complete Level 1 without losing a life",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && trigger_when(StageSubID == 2
                         && StageID == 1
                         && LifeCount > 0
                         && LevelEndCheck())
                         && once(StageID == 1 && StageSubID == 0 && LevelTimer == 0)
                         && never(Deathless())
                         && never(StageID != 1)
                         
)

achievement(title = "Hardened Robber",
                description = "Complete Level 1 on Very Hard",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchVHard()   
                         && StageSubID == 2
                         && StageID == 1
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

//achievement(title = "Oni Slayer",
  //              description = "Kill one Oni in the Boss zone of Level 1",
    //            points = 2,
      //          trigger = 
        //                    LevelTimer > 1
          //               && DipSwitchNormal()   
            //             && StageSubID == 2
              //           && StageID == 1
                //         && LifeCount > 0
                  //       && Score == prev(Score) + 1600
                         
//)
// --- --- --- Level 2
achievement(title = "Nothing Mystical",
                description = "Reach Gold in Level 2",
                points = 2,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageSubID == 0
                         && StageID == 2
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

achievement(title = "Passing through Town",
                description = "Complete Level 2",
                points = 3,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageSubID == 2
                         && StageID == 2
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

achievement(title = "Break the Moon: Inaba amateur",
                description = "Destroy the moon in Level 2",
                points = 3,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageID == 2
                         && LifeCount > 0
                         && MoonBreak()
                         
)

achievement(title = "Pacifist Follower",
                description = "Complete Level 2 without ever attacking",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && trigger_when(StageSubID == 2
                         && StageID == 2
                         && LifeCount > 0
                         && LevelEndCheck())
                         && once(StageID == 2 && StageSubID == 0 && LevelTimer == 0)
                         && never(Pacifist())
                         && never(StageID != 2)
                         
)

achievement(title = "Somber Shadow",
                description = "Complete Level 2 without losing a life",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && trigger_when(StageSubID == 2
                         && StageID == 2
                         && LifeCount > 0
                         && LevelEndCheck())
                         && once(StageID == 2 && StageSubID == 0 && LevelTimer == 0)
                         && never(Deathless())
                         && never(StageID != 2)
                         
)

achievement(title = "Not a People Person",
                description = "Complete Level 2 on Very Hard",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchVHard()   
                         && StageSubID == 2
                         && StageID == 2
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

//achievement(title = "Seaside Vacations",
  //              description = "Kill three enemies in the Boss zone of Level 2",
    //            points = 3,
      //          trigger = 
        //                    LevelTimer > 1
          //               && DipSwitchNormal()   
            //             && StageSubID == 2
              //           && StageID == 2
                //         && LifeCount > 0
                  //       && repeated(3,Score == prev(Score) + 200)
                         
//)
// --- --- --- Level 3
achievement(title = "You Can do It !",
                description = "Reach Gold in Level 3",
                points = 2,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageSubID == 0
                         && StageID == 3
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

achievement(title = "Sakura Forest",
                description = "Complete Level 3",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageSubID == 2
                         && StageID == 3
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

achievement(title = "Break the Moon: Lacking Signal",
                description = "Destroy the moon in Level 3",
                points = 3,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageID == 3
                         && LifeCount > 0
                         && MoonBreak()
                         
)

achievement(title = "Enjoying Nature",
                description = "Complete Level 3 without ever attacking",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && trigger_when(StageSubID == 2
                         && StageID == 3
                         && LifeCount > 0
                         && LevelEndCheck())
                         && once(StageID == 3 && StageSubID == 0 && LevelTimer == 0)
                         && never(Pacifist())
                         && never(StageID != 3)
                         
)

achievement(title = "Hidden Trees",
                description = "Complete Level 3 without losing a life",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && trigger_when(StageSubID == 2
                         && StageID == 3
                         && LifeCount > 0
                         && LevelEndCheck())
                         && once(StageID == 3 && StageSubID == 0 && LevelTimer == 0)
                         && never(Deathless())
                         && never(StageID != 3)
                         
)

achievement(title = "Crime Payday",
                description = "Complete Level 3 on Very Hard",
                points = 10,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchVHard()   
                         && StageSubID == 2
                         && StageID == 3
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

//achievement(title = "Tengu Hater",
  //              description = "Kill one Tengu in the Boss zone of Level 3",
    //            points = 5,
      //          trigger = 
        //                    LevelTimer > 1
          //               && DipSwitchNormal()   
            //             && StageSubID == 2
              //           && StageID == 3
                //         && LifeCount > 0
                  //       && Score == prev(Score) + 1600
                         
//)
// --- --- --- Level 4
achievement(title = "Great Adventure",
                description = "Reach Gold in Level 4",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageSubID == 0
                         && StageID == 4
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

achievement(title = "The Great Heist",
                description = "Complete Level 4",
                points = 10,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageSubID == 2
                         && StageID == 4
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

achievement(title = "Break the Moon: No Cheese ?",
                description = "Destroy the moon in Level 4",
                points = 5,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && StageID == 4
                         && LifeCount > 0
                         && MoonBreak()
                         
)

achievement(title = "Eyes on the Prize",
                description = "Complete Level 4 without ever attacking",
                points = 10,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && trigger_when(StageSubID == 2
                         && StageID == 4
                         && LifeCount > 0
                         && LevelEndCheck())
                         && once(StageID == 4 && StageSubID == 0 && LevelTimer == 0)
                         && never(Pacifist())
                         && never(StageID != 4)
                         
)

achievement(title = "Last Step",
                description = "Complete Level 4 without losing a life",
                points = 10,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && trigger_when(StageSubID == 2
                         && StageID == 4
                         && LifeCount > 0
                         && LevelEndCheck())
                         && once(StageID == 4 && StageSubID == 0 && LevelTimer == 0)
                         && never(Deathless())
                         && never(StageID != 4)
                         
)

achievement(title = "Ninja Central",
                description = "Complete Level 4 on Very Hard",
                points = 25,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchVHard()   
                         && StageSubID == 2
                         && StageID == 4
                         && LifeCount > 0
                         && LevelEndCheck()
                         
)

//achievement(title = "The Last Guardian",
  //              description = "Kill one Golden Guardian in the Boss zone of Level 4",
    //            points = 5,
      //          trigger = 
        //                    LevelTimer > 1
          //               && DipSwitchNormal()   
            //             && StageSubID == 2
              //           && StageID == 4
                //         && LifeCount > 0
                  //       && Score == prev(Score) + 1600
                         
//)
// --- --- --- Game Wide
achievement(title = "Second Wind",
                description = "Reach a Score of 40k or more in a single loop",
                points = 10,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && LifeCount > 0
                         && StageID > 0
                         && StageID < 5
                         && Score >= 40000
                         
                         
)

achievement(title = "Young Ninja",
                description = "Reach a Score of 60k or more in a single loop",
                points = 25,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && LifeCount > 0
                         && StageID > 0
                         && StageID < 5
                         && Score >= 60000
                         
                         
)

achievement(title = "The Golden Run",
                description = "Reach a Score of 80k or more in a single loop",
                points = 50,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && LifeCount > 0
                         && StageID > 0
                         && StageID < 5
                         && Score >= 80000
                         
                         
)

achievement(title = "Big Numbers",
                description = "Reach a Score of 100k in a single credit",
                points = 25,
                trigger = 
                            LevelTimer > 1
                         && DipSwitchNormal()   
                         && LifeCount > 0
                         && StageID > 0
                         && Score >= 100000
                         
                         
)

// leaderboard
leaderboard(
    title = "High Score",
    description = "Who's the best Thief in all of Japan ?",
    start  = GameOver() && DipSwitchNormal(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   

leaderboard(
    title = "High Score Loop 1",
    description = "Who's the most efficient Thief in all of Japan ?",
    start  = DipSwitchNormal() && StageID == 5 && prev(StageID) == 0x10,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
