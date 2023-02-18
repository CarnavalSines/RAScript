// Viper
// #ID = 22529


// 20230217 Version - Sines

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


// $0878: [16 Bit] BCD Display Score
//        Max 9999, loop back to 0
// $087A: [8 Bit] Viper's Direction
//        00 > Right
//        01 > Up
//        02 > Left
//        03 > Down
//        Can be used to check OnlyLeft / OnlyRight turns challenge
//        Only left > Increment 0-3
//        Only right > Decrement 3-0
// $087B: [8 Bit] Viper Speed
//        0 - 9
// $08FD: [8 Bit] Demo Indicator
//        00 > In play
//        FF > Demo
// $08FE: [8 Bit] Mouse Value
//        Varies 1~9
// $097E: [8 Bit] Obstacle Level
//        0 > A
//        1 > B
//        2 > C
//        3 > D
// $097F: [8 Bit] Mouse Speed
//        0 - 9
// $09FA: [8 Bit] Vipers Left (Lives) value
//        Stays at 0 during Demo
//        ff on boot

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
Score = bcd(word(0x0878)) // BCD Display
ViperSpeed = byte(0x087b)
MouseSpeed = byte(0x097f)
ObstacleValue = byte(0x097e)
LifeCounter = byte(0x09fa)
ViperDirection = byte(0x087a)
InDemo = byte(0x08fd) == 0xff
InGame = byte(0x08fd) == 0
//----------------
//Function
function LifeLost() => prev(LifeCounter) > LifeCounter
function TurningLeft() => (prev(ViperDirection) > ViperDirection)  || (prev(ViperDirection) == 3 && ViperDirection == 0) // Check increase in direction value or that it reset from 3 to 0
function TurningRight() => (prev(ViperDirection) < ViperDirection)  || (prev(ViperDirection) == 0 && ViperDirection == 3) // Check decrease in direction value or that it reset from 0 to 3
function MouseEaten() => prev(Score) < Score //Score only increase when eating a new mouse

function ScoreProgOneLife(title,points,ScoreGoal)
{
 achievement(title = title,
                description = "Reach "+ ScoreGoal +" points in one life",
                points = points,
                trigger = 
                (   never(LifeLost()) // Lose 1 life
                   && once(prev(LifeCounter) == 0) // Check the delta at the start of the game
                   && disable_when(InDemo, until = InGame) // Pause in Demo mode
                   && Score >= ScoreGoal
                   && prev(Score) < ScoreGoal
                )
              )
}

function ScoreProgOneCC(title,points,ScoreGoal)
{
 achievement(title = title,
                description = "Reach "+ ScoreGoal +" points in one session",
                points = points,
                trigger = 
                (   never(LifeCounter == 0) // GameOver
                   && once(prev(LifeCounter) == 0) // Check the delta at the start of the game
                   && disable_when(InDemo, until = InGame)
                   && Score >= ScoreGoal
                   && prev(Score) < ScoreGoal
                )
              )
}              
function MouseProgOneCC(title,points,MouseNB)
{
 achievement(title = title,
                description = "Eat "+ MouseNB +" mouses in one session",
                points = points,
                trigger = 
                (   never(LifeCounter == 0) // GameOver
                   && once(prev(LifeCounter) == 0) // Check the delta at the start of the game
                   && disable_when(InDemo, until = InGame)
                   && tally(MouseNB,MouseEaten())
                )
              )
              
}              
//----------------

///Achievement Code
ScoreProgOneLife("Viperidae",2,50)
ScoreProgOneLife("Viperinae",5,100)
ScoreProgOneLife("Azemiopinae",10,200)
ScoreProgOneLife("Crotalinae",25,300)

ScoreProgOneCC("Aetheris",3,250)
ScoreProgOneCC("Bitis",5,500)
ScoreProgOneCC("Causus",10,1000)

 achievement(title = "Apex Predator",
                description = "Eat 50 mouses in one session [Challenge Factor: Viper Speed 4 or above, Mouse Speed 9, Obstacle C or above]",
                points = 10,
                trigger = 
                (   never(LifeCounter == 0) // GameOver
                   && once(prev(LifeCounter) == 0) // Check the delta at the start of the game
                   && disable_when(InDemo, until = InGame)
                   && trigger_when(tally(50,MouseEaten()))
                   && ViperSpeed >= 0x4
                   && MouseSpeed == 0x9
                   && ObstacleValue >= 0x2
                 )
              )
//----------------

///Leaderboard
leaderboard(
    title = "Solid Viper",
    description = "High Score",
    start  = tally(400,Score > 0) && InGame && LifeCounter != 255,
    cancel = always_false(),
    submit = LifeCounter == 0 && prev(LifeCounter) > 0,
    value = Score,
    format = "VALUE"
)