// Space Invaders
// #ID = 14873
// 20230924 Version - Sines

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

// $00D0: [8 Bit] Lives settings
//        Default 3
// $00D5: [8 Bit] Bonus Life Pts configuration
//        Default at 1500 (0x00)
// $00E0: [16 Bit] Score (hexa)
//        Loop back to 0 after reaching 0xffff
// $0110: [8 Bit] Inputs flags
//        Bit 0 | Right
//        Bit 1 | Left
//        Bit 2 | Down
//        Bit 3 | Up
//        Bit 4 | ?
//        Bit 5 | Start
//        Bit 6 | A
//        Bit 7 | B
// $0220: [8 Bit] GameState
//        0x01 > In Game
//        0x0b > 1P/2P transition on losing life
//        0xae > Game Over
//        0x9d > Demo Mode
// $0806: [8 Bit] Game Mode
//        0x20 > 1P
//        0x01 > 2P
// $0820: [8 Bit] P1 Lives
//        Start at 3
//        Game Over on reaching 0
// $0821: [8 Bit] P2 Lives
//        Start at 3
//        Game Over when both reach 0
// $0822: [8 Bit] Current Round
//        Start at 0x00



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
CurrentLevel = byte(0x822)
RemainingLives = byte(0x820)


Score = word(0xe0)
GameState = byte(0x220)
Ingame = GameState == 1
SelectGame = GameState == 0x82
GameMode = byte(0x0806)
P1Mode = GameMode == 0x20
LifeSetting = byte(0xd0) // default 0x03
BonusSetting = byte(0xd4) // default 0x00


//----------------
//Function
function DeathlessCheck() => prev(RemainingLives) > RemainingLives
function GameOver() => RemainingLives == 0 && prev(RemainingLives) == 1
function DefaultSettingCheck() => LifeSetting == 0x03 && BonusSetting == 0
function AlienKilled() => Score > prev(Score)
function UFOKilled() => Score >= prev(Score) + 5 // UFO minimum 50 pts

function Progression(points,title,levelgoal)
{
    achievement(title = title,
                description = "Clear Board " + levelgoal,
                points = points,
                trigger = 
                            Ingame // InGame
                         && prior(CurrentLevel) == levelgoal-1
                         && CurrentLevel == levelgoal
                         && RemainingLives > 0
                         && P1Mode
                         && DefaultSettingCheck()
                         
)
}

function ProgressionNoDeath(points,title,levelgoal)
{
    achievement(title = title,
                description = "Clear Board " + levelgoal + " without losing a single life",
                points = points,
                trigger = 
                            Ingame // InGame
                        // && disable_when(DeathlessCheck(), until=SelectGame)
                         && once(CurrentLevel == 0 && Score == 0 && RemainingLives == 3 && P1Mode && LifeSetting == 0x03 && Ingame)
                         && never(DeathlessCheck())
                         && prior(CurrentLevel) == levelgoal-1
                         && CurrentLevel == levelgoal
                         && RemainingLives > 0
                         && DefaultSettingCheck()
                         
)
}

function UFOShoot(points,title,hitsgoal)
{
    achievement(title = title,
                description = "Shoot down " + hitsgoal + " UFOs in one play",
                points = points,
                trigger = 
                            Ingame // InGame
                         && measured(repeated(hitsgoal, UFOKilled()))
                         && RemainingLives > 0
                         && P1Mode
                         && DefaultSettingCheck()
                         && never(SelectGame)
                         
)
}
//----------------

///Achievement Code
Progression(2,"First Contact",1)
Progression(5,"They Came from Outer Space",3)
Progression(5,"Hostile Takeover",5)
Progression(10,"Calibration Not Needed",8)
Progression(25,"Invaders Must Die",10)

ProgressionNoDeath(5,"Rookie's Luck",1)
ProgressionNoDeath(10,"Familiar Rythm",3)
ProgressionNoDeath(10,"Hit and Run",5)
ProgressionNoDeath(25,"Sharpshooter",8)
ProgressionNoDeath(50,"Galactic Hero",10)

UFOShoot(2,"Bullseye",1)
UFOShoot(3,"Needle Thread",3)
UFOShoot(5,"Bionic Precision",5)

    achievement(title = "Reinforcements",
                description = "Get your first bonus life at 1500 pts ",
                points = 2,
                trigger = 
                            Ingame // InGame
                         && RemainingLives > 0
                         && P1Mode
                         && DefaultSettingCheck()
                         && RemainingLives > prev(RemainingLives)
                         
)




// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Best Xenos Hunter killboard",
    start  = RemainingLives==0 && prev(RemainingLives) > 0 && P1Mode && DefaultSettingCheck(),
    cancel = always_false(),
    submit = always_true(),
    value = Score*10,
    format = "VALUE"
)

