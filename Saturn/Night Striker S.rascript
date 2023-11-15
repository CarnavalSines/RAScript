// Night Striker S
// #ID = 20385

// 2023115 Version - Sines

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


// $00B840: [8 Bit] Controller Detection Flag
//          00 > Regular Controller
//          01 > 3D Control Pad
// $00B84C: [8 Bit] Input Flags 1
// $00B84D: [8 Bit] Input Flags 2
// $01E4EE: [8 Bit] Shield Value
// $01F564: [8 Bit] Cycle Shot Fired
//          Goes 0x00 to 0x3e
//          Could be use to check for pacifism goal
// $020707: [8 Bit] Boss Fight Flag
//          0x02 > Fighting Boss
// $020709: [8 Bit] Boss Health
//          > Need to find something else for Stage H boss
// $03297A: [8 Bit] Pacifist Flag
//          Increase by 1 for each consecutive Stage Clear as Pacifist
//          Reset to 0 otherwise
// $032A6E: [8 Bit] Stage Clear Flag
// $032A7E: [8 Bit] Boss fight Flag
//          Use in priority
// $032AE6: [8 Bit] Level ID
//          0x1e > Extra Game Stage 1
// $032B00: [16 Bit] Upper Half Score Value
//          x65536 multiplicator
// $032B02: [16 Bit] Lower Half Score Value
// $032B36: [8 Bit] Boss Timer
// $032B44: [8 Bit] Shoot Speed
//          00 > Low
//          01 > High
// $032B45: [8 Bit] Difficulty Mode
//          00 > Easy
//          01 > Normal
//          02 > Hard
//          03 > VHard
// $032B46: [8 Bit] Control
//          00 > Normal
//          01 > Reverse
// $032B47: [8 Bit] Recovery
//          00 > Low
//          01 > Middle
//          02 > High
// $032B49: [8 Bit] Auto Neutral
//          00 > On
//          01 > Off
///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

StageName = {
    0: "A",
    1: "B",
    2: "C",
    3: "D",
    4: "E",
    5: "F",
    6: "G",
    7: "H",
    8: "I",
    9: "J",
    0xa: "K",
    0xb: "L",
    0xc: "M",
    0xd: "N",
    0xe: "O",
    0xf: "P",
    0x10: "Q",
    0x11: "R",
    0x12: "S",
    0x13: "T",
    0x14: "U",
    0x1e: "Special 1",
    0x1f: "Special 2",        
    0x20: "Special 3",
    0x21: "Special 4",
    0x22: "Special 5",
    0x23: "Special 6",
    0x24: "Ending"
}
//----------------
//Variable
ControllerFlag = byte(0xB840)
ShieldValue = byte(0x1e4ee)
PacifistFlag = byte(0x3297a)
StageClearFlag = byte(0x32a6e)
LevelID = byte(0x32ae6)
UpperScore = word(0x32b00)
LowerScore = word(0x32b02)
BossTimer = byte(0x32b36)
DifficultyMode = byte(0x32b45)
ContinueCounter = byte(0x032a4a)

HiScore = (UpperScore * 65536) + LowerScore
HiScoreNameCountdown = byte(0x032b0c)
//----------------
//Function
function StageClear(Stage,points) // Regular stage completion, considered done on stage transition         
{
    achievement(title = "Stage "+ StageName[Stage]+ " Clear !",
                description = "Clear Stage " + StageName[Stage]+ " in any difficulty" ,
                points = points,
                trigger = 
                ShieldValue != 0xff
                && StageClearFlag == 1
                && prev(StageClearFlag) == 0
                && LevelID == Stage
                && ControllerCheatCheck()
                )
}

function StageClearHard(Stage,points) // Regular stage completion, considered done on stage transition         
{
    achievement(title = "Veteran Driver "+ StageName[Stage],
                description = "Clear Stage " + StageName[Stage]+ " on Very Hard difficulty" ,
                points = points,
                trigger = 
                ShieldValue != 0xff
                && StageClearFlag == 1
                && prev(StageClearFlag) == 0
                && LevelID == Stage
                && DifficultyMode == 3
                && ControllerCheatCheck()
                )
}

function ControllerCheatCheck() => disable_when(ControllerFlag != 0, until=ControllerFlag == 1)

function HiScoreLeaderboard(Stage)
{
    leaderboard(
    title = "Ending Path "+StageName[Stage]+" HighScore",
    description = "Complete a run in Stage "+StageName[Stage]+" with the Highest Score",
    start  = LevelID == Stage && HiScoreSubmit() && ControllerFlag == 0,
    cancel = always_false(),
    submit = always_true(),
    value = HiScore,
    format = "VALUE"

)   
}    

function HiScoreSubmit() => HiScoreNameCountdown == 0x39 && prev(HiScoreNameCountdown) == 0x30
//----------------
///Achievement Code
// Progression
for i in range(0,2)
StageClear(i,2)

for i in range(3,9)
StageClear(i,3)

for i in range(10,14)
StageClear(i,5)

for i in range(15,20)
StageClear (i,10)

for i in range(15,20)
StageClearHard (i,25)

    achievement(title = "Thorough Cleaning",
                description = "Finish a full run by having killed all the bosses (No Boss Timer = 0)" ,
                points = 10,
                trigger = 
                ShieldValue != 0xff
                && repeated(6,StageClearFlag == 1 && prev(StageClearFlag) == 0 && BossTimer > 0)
                && never((LevelID == 0 || LevelID == 0x1e ) && HiScore == 0)
                && ControllerCheatCheck()
                )

    achievement(title = "Extra Mission",
                description = "Clear Stage 6 of Extra Mode in any difficulty" ,
                points = 10,
                trigger = 
                ShieldValue != 0xff
                && StageClearFlag == 1
                && prev(StageClearFlag) == 0
                && LevelID == 0x23
                && ControllerCheatCheck()
                )

    achievement(title = "The Last Run",
                description = "Clear Stage 6 of Extra Mode on Very Hard difficulty" ,
                points = 25,
                trigger = 
                ShieldValue != 0xff
                && StageClearFlag == 1
                && prev(StageClearFlag) == 0
                && LevelID == 0x23
                && DifficultyMode == 3
                && ControllerCheatCheck()
                )
                
    achievement(title = "Pacifist",
                description = "Finish a stage while obtaining the Pacifist bonus" ,
                points = 5,
                trigger = 
                ShieldValue != 0xff
                && StageClearFlag == 1 
                && PacifistFlag > 0
                && PacifistFlag != prev(PacifistFlag)
                && ControllerCheatCheck()
                )                
                
                
    achievement(title = "Absolute Pacifist",
                description = "Finish a stage past the 2nd Tier (Stage D and above, no Extra Game) while obtaining the Pacifist bonus on Very Hard Difficulty" ,
                points = 10,
                trigger = 
                ShieldValue != 0xff
                && StageClearFlag == 1 
                && PacifistFlag > 0
                && PacifistFlag != prev(PacifistFlag)
                && ControllerCheatCheck()
                && LevelID > 2
                && LevelID < 0x1e
                ) 
                
    achievement(title = "Drive",
                description = "Finish a full run in Original Game Very Hard Mode without using any continues" ,
                points = 50,
                trigger = 
                ShieldValue != 0xff
                && StageClearFlag == 1 
                && prev(StageClearFlag) == 0
                && ControllerCheatCheck()
                && (LevelID == 15 || LevelID == 16|| LevelID == 17|| LevelID == 18|| LevelID == 19|| LevelID == 20)
                && ContinueCounter == 0
                && DifficultyMode == 3
                )  
                
    achievement(title = "Extra Drive",
                description = "Finish a full run in Extra Game Very Hard Mode without using any continues" ,
                points = 50,
                trigger = 
                ShieldValue != 0xff
                && StageClearFlag == 1 
                && prev(StageClearFlag) == 0
                && ControllerCheatCheck()
                && LevelID == 0x23
                && ContinueCounter == 0
                && DifficultyMode == 3
                )                
                
///Leaderboards Data          


    leaderboard(
    title = "Global HighScore",
    description = "Complete a run in any non Extra Mode ending with the Highest Score",
    start  = (LevelID == 15 || LevelID == 16|| LevelID == 17|| LevelID == 18|| LevelID == 19|| LevelID == 20) && HiScoreSubmit() && ControllerFlag == 0,
    cancel = always_false(),
    submit = always_true(),
    value = HiScore,
    format = "VALUE"

)  


for i in range(15,20)
HiScoreLeaderboard (i)

    leaderboard(
    title = "Extra Game HighScore",
    description = "Complete the Extra Game mode with the Highest Score",
    start  = LevelID == 0x24 && HiScoreSubmit() && ControllerFlag == 0,
    cancel = always_false(),
    submit = always_true(),
    value = HiScore,
    format = "VALUE"

)   






      
