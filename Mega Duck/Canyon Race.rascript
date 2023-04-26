// ~Homebrew~ Canyon Racer
// #ID = 24082
// 20230418 Version - Sines

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


// $C40C: [8 Bit] Current Dodging Wave
//        Starts at 0, increment by 1 when 0xc40d reach 00
//        Signaled in-game by a small jingle
//        Max at 0x0F but loops continue afterward
// $C40D: [8 Bit] Nb Rocks left to dodge in Current Wave
//        Increment 0xc40c when reaching 00
// $C419: [8 Bit] Horizontal Position
//        0x44 on Spawn / Middle
//        0x00 Far Left
//        0x88 Far Right
// $C41B: [8 Bit] Vertical Position
//        0x70 on Spawn (Bottom Screen)
//        0x28 Max (Top Screen)
// $C41E: [8 Bit] Can be used for jump detection
//        10 > Normal
//        11 > Jumping
// $C451: [8 Bit] Not moving indicator
//        00 on Main Menu, Pause, Respawn
//        02 while playing
// $C456: [32-bit BCD] Current score
//        -- Game does not display the (ten thousands) place; hitting 10,000 shows as 00000 in-game, but is tracked properly in the memory. The 5th digit does, however, show the (one hundred thousands) value in the (ten thousands) place if player reaches over 100,000
// $C4C2: [8 Bit] Life Counter
// $C4C8: [8 Bit] State indicator
//        01 > Main Menu
//        02 > How to Play
//        03 > Game Start
//        04 > Playing
//        05 > Game Over


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
CurrentWave = byte(0xC40C)
RocksLeftWave = byte(0xC40D)

LifeCounter = byte(0xC4C2)
GameState = byte(0xC4C8)
InGame = GameState == 4
Score = bcd(dword(0xC456))
//----------------
//Function
function GameOver() => GameState == 5 && LifeCounter == 0 && prev(GameState) == 4


function Progression(points,title,levelgoal)
{
    achievement(title = title,
                description = "Complete Wave " + levelgoal+1,
                points = points,
                trigger = 
                            InGame // InGame
                         && prev(CurrentWave) == levelgoal
                         && prev(RocksLeftWave) == 1
                         && CurrentWave == levelgoal+1
                         && LifeCounter > 0
                         
)
}

//----------------

///Achievement Code
Progression(2,"The First Wave",0)
Progression(2,"Getting the Hang of It",1)
Progression(2,"Canyon Enthusthiast",2)
Progression(2,"Weaver Amateur",3)
Progression(3,"Great Control",4)
Progression(3,"Endurance Dodger",5)
Progression(3,"Rock Hater",6)
Progression(3,"Jumping for Dear Life",7)
Progression(5,"Bob and Weave",8)
Progression(5,"Settling In",9)
Progression(5,"Routine by Now",10)
Progression(5,"The End is Near",11)
Progression(10,"Objective: Survive",12)
Progression(10,"Tasting the Wave",13)
//Progression(10,"Sultan of Weave",14)
    achievement(title = "Sultan of Weave",
                description = "Complete Wave 15",
                points = 10,
                trigger = 
                            InGame // InGame
                         && CurrentWave == 15
                         && prev(RocksLeftWave) == 1
                         && prev(CurrentWave) == 15
                         && RocksLeftWave == 10
                         && LifeCounter > 0
)
// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Dodge for as long as possible, getting points with every rocks avoided",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
