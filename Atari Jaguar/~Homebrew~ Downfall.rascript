// ~Homebrew~ Downfall
// #ID = 22522


// 20230216 Version - Sines

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



// $004BAC: [16 Bit] BE -> Power Up timer
// $0052EE: [16 Bits] BE -> Score Display
// $0052EF: ?? Part of the scoring display
//          00 > 255
// $1FC186: [8 Bit] Consistent "In game" value
//          d9 > Title Screen
//          c1 > In game


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
InGameIndicator = byte(0x1FC186) 
TitleScreen = byte(0x1FC186) == 0xd9

Score = word_be(0x0052EE)

//----------------
//Function
function DeathCheck() => repeated(50, Score == prev(Score)) && prev(InGameIndicator) == 0xc1 && TitleScreen //Check score has not changed for the last 50 frames, previous screen was in game and current screen is on title screen
function GetFruit() => Score == prev(Score) +100 // Fruits give you 100 points on grab

function ScoreProg(title,points,ScoreGoal)
{
 achievement(title = title,
                description = "Reach "+ ScoreGoal +" points in one life",
                points = points,
                trigger = 
                (   never(DeathCheck())
                   && Score >= ScoreGoal
                   && prev(Score) < ScoreGoal
                )
              )
}

function ScoreProgNoFruits(title,points,ScoreGoal)
{
 achievement(title = title,
                description = "Reach "+ ScoreGoal +" points in one life without collecting any fruits",
                points = points,
                trigger = 
                (   never(DeathCheck())
                   && Score >= ScoreGoal
                   && prev(Score) < ScoreGoal
                   && disable_when(GetFruit(), until=(Score == 0))
                )
              )
}

function FruitGet(title,points,fruitsNB)
{
 achievement(title = title,
                description = "Collect "+fruitsNB +" Fruits in one life",
                points = points,
                trigger = 
                (   never(DeathCheck())
                   && tally(fruitsNB,GetFruit())
                )
              )
}

//----------------

///Achievement Code

ScoreProg("DOWN",2,500)
ScoreProg("FALL",Baby,1000)
ScoreProg("NOT UP",Easy,2500)
ScoreProg("DEPTH",Medium,5000)

ScoreProgNoFruits("PATIENCE",Baby,1000)
ScoreProgNoFruits("LONG WAY",Easy,2500)
ScoreProgNoFruits("JAGUAR POWER",Medium,5000)

FruitGet("TASTY",Free,2)
FruitGet("YUMMY",Baby,10)
FruitGet("YUM YUM",Easy,25)
FruitGet("DOCTOR AWAY",Medium,50)

 achievement(title = "IMPRESSIVE",
                description = "Die with a Score of 11" ,
                points = Baby,
                trigger = 
                (   never(Score == 0)
                   && repeated(50,Score == 11)
                   && InGameIndicator == 0xc1

                )
              )
              
              
//----------------

///Leaderboard

leaderboard(
    title = "Down the Rabbit Hole",
    description = "How deep does it go ?",
    start  = Score > 0,
    cancel = always_false(),
    submit = DeathCheck(),
    value = Score,
    format = "VALUE"
)
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
