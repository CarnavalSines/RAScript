// ~Homebrew~Toadally Awesome Game
// #ID = 25187
// 20230714 Version - Sines

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


// $3DA8: [8 Bit] Bitflag
//        Bit 4 | Pause Menu
// $3DB0: [8 Bit] Level 1 Status
//        00 > Locked
//        01 > Unlocked
//        03 > Completed
// $3DB1: [8 Bit] Level 2 Status
//        00 > Locked
//        01 > Unlocked
//        03 > Completed
// $3DB2: [8 Bit] Level 3 Status
//        00 > Locked
//        01 > Unlocked
//        03 > Completed
// $3DB3: [8 Bit] Level 4 Status
//        00 > Locked
//        01 > Unlocked
//        03 > Completed
// $3DB4: [8 Bit] Level 5 Status
//        00 > Locked
//        01 > Unlocked
//        03 > Completed
// $3DB5: [8 Bit] Level 6 Status
//        00 > Locked
//        01 > Unlocked
//        03 > Completed
// $3DB6: [8 Bit] Level 7 Status
//        00 > Locked
//        01 > Unlocked
//        03 > Completed
// $3DB7: [8 Bit] Level 8 Status
//        00 > Locked
//        01 > Unlocked
//        03 > Completed
// $3DC0: [8 Bit] Level Select ID
//        Change on menu selection, stable during level
// $4A58: [16 Bit] Turn Count
// $4A60: [8 Bit] Wheel Use Remaining
// $5404: [8 Bit] Level is Over flag
//        00 > No
//        01 > Yes
// $5DDC: [8 Bit] Health
//        Start at 6 (3 Hearth * 2 halves)


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
LevelID = byte(0x3dc0)
TurnCount = word(0x4a58)
WheelCount = byte(0x4a60)
Health = byte(0x5ddc)

LevelDoneFlag = byte(0x5408)


//----------------
//Function
function Perfect() => Health == 6 && WheelCount == 5
function LevelDone() => LevelDoneFlag == 0x64 && prev(LevelDoneFlag) == 0 && TurnCount > 0
function LevelClear(Level)
{
    achievement(title="Level " + Level+1 + " Complete !",
                description = "Complete Level " + Level+1,
                points = 3,
                trigger = LevelID == Level
                       && LevelDone()
)              
}

function LevelClearPerfect(Level,Turns)
{
    achievement(title="Smartest Toad Challenge: Level " + Level+1,
                description = "Complete Level " + Level+1 + " without using the Wheel, without taking any damage and in "+ Turns +" Moves or less",
                points = 5,
                trigger = LevelID == Level
                       && LevelDone()
                       && Perfect()
                       && TurnCount <= Turns
)              
}
//----------------
///Achievement Code
// Progression
for i in range (0,7)
LevelClear(i)

// Challenge
LevelClearPerfect(0,7)
LevelClearPerfect(1,12)
LevelClearPerfect(2,32)
LevelClearPerfect(3,20)
LevelClearPerfect(4,24)
LevelClearPerfect(5,25)
LevelClearPerfect(6,30)
LevelClearPerfect(7,32)
// leaderboard