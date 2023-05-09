// ~Homebrew~ Scooternia
// #ID = 24300

// 20230509 Version - Sines

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


// $72FD: [8 Bit] Pause Flag
//        00 > Off
//        01 > Pause
// $8616: [8 Bit] Horizontal position (Sprite data)
//        0x4c > Far Left
//        0x00 > Middle (on spawn)
//        0xb6 > Far Right
// $86f7: [8 Bit] Ingame / Main Menu useable value
//        Likely sprite data
//        03 > Main Menu (Game start, Game Over)
//        00 > In game  
// $894E: [8 Bit] Life Counter
//        Start at 03
//        Game Over at 00
// $894F: [8 Bit] Score
// $8950: [8 Bit] Score part 2
//        Final score calc is 0x8950 * 256 + 0x894f


///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable
PauseFlag = byte(0x72FD) // 1 on pause
HorizontalPosition = byte(0x8616) // 0c4c on far left
InGame = byte(0x86f7) // Decrease 3 - 0 on going ingame. Increase 0 - 3 on going back to main menu after gameover
LifeCounter = byte(0x894E)
Score = byte(0x894F) + (byte(0x8950) * 256) //0xff on boot, need some antiflicker protection

//----------------
//Function
function GameOver() => LifeCounter == 0 && prev(LifeCounter) == 1 && InGame == 0
function Progression(points,score)
{
    achievement(title = "Point reached "+score,
                description = "Reach "+score,
                points = points,
                trigger = 
                            InGame == 0
                         && LifeCounter > 0
                         && prev(Score) < score
                         && Score >= score
                         && Score < score+10 // some protection
                         
)
}
//----------------

///Achievement Code
// Progression
Progression(2,10)
Progression(2,25)
Progression(3,50)
Progression(5,100)
Progression(10,200)
    achievement(title = "Commiefornia",
                description = "Stay on the Far Left lane for 30sec in a row without pausing",
                points = 5,
                trigger = 
                            InGame == 0
                         && LifeCounter > 0  
                         && once(repeated(1800, HorizontalPosition == (0x4c)))
                         && never(HorizontalPosition != 0x4c)
                         && never(PauseFlag == 1)
                         && disable_when(LifeCounter < prev(LifeCounter), HorizontalPosition ==0)
               )  
    achievement(title = "Great Start",
                description = "Reach 50 Pts without dying [Retry on GameOver]",
                points = 5,
                trigger = 
                            InGame == 0
                         && prev(Score) < 50
                         && Score >= 50
                         && LifeCounter == 3
               )                    
               
// leaderboard
leaderboard(
    title = "Radical Board",
    description = "Show how RAD you are by getting the most points !",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   






