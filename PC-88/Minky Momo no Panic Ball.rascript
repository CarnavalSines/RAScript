// Minky Momo no Panic Ball
// #ID = 23554
// 20230323 Version - Sines

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


// $2773: [8 Bit] Remaining Objects to catch before next level (0 on level end)
// $3398: [16 Bit] Score * 10
// $339A: [8 Bit] Current Level
// $339B: [8 Bit] Lives remaining
// $339E: [8 Bit] Vertical Position
//        8f > On the ground
// $339F: [8 Bit] Horizontal Position
//        1b > Default middle
//        03 ~ 0x32 Far Left to Far Right
// $7FFD: [8 Bit] Minky State
//        0xde on main menu

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
CurrentLevel = byte(0x339a)
RemainingObjects = byte(0x2773)
RemainingLives = byte(0x339b)


Score = word(0x3398)
MinkyState = byte(0x7ffd)
MainMenu = MinkyState == 0xde
Ingame = MinkyState != 0xde

//----------------
//Function
function DeathlessCheck() => prev(RemainingLives) > RemainingLives
function NewGameStart() => once(CurrentLevel == 1 && RemainingObjects == 0x0a && RemainingLives == 4) || once(prev(CurrentLevel) != 1 && CurrentLevel == 1)
function GameOver() => RemainingLives == 0 && prev(RemainingLives) == 1

function Progression(points,title,levelgoal)
{
    achievement(title = title,
                description = "Complete level " + levelgoal,
                points = points,
                trigger = 
                            Ingame // InGame
                         && prev(CurrentLevel) == levelgoal
                         && prev(RemainingObjects) == 0
                         && CurrentLevel == levelgoal+1
                         && RemainingLives > 0
                         
)
}

function ProgressionNoDeath(points,title,levelgoal)
{
    achievement(title = title,
                description = "Reach and complete level " + levelgoal + " without losing a single life",
                points = points,
                trigger = 
                            Ingame // InGame
                         && NewGameStart()
                         && never(DeathlessCheck())
                         && prev(CurrentLevel) == levelgoal
                         && prev(RemainingObjects) == 0
                         && CurrentLevel == levelgoal+1
                         && RemainingLives > 0
                         
)
}
//----------------

///Achievement Code
Progression(2,"Big Company",1)
Progression(3,"November's End",2)
Progression(5,"Speedy Animal",3)
Progression(5,"Spooky Music",4)
Progression(5,"Up for a Loop",5)
Progression(5,"Still Here ?",6)
Progression(5,"High-Tech Graphism",7)
Progression(10,"The Power of PC88",8)
Progression(10,"Clearly GOTY",9)
Progression(10,"Technically Goes on Forever You Know ?",10)

ProgressionNoDeath(2,"Ohno.jpeg",1)
ProgressionNoDeath(3,"Eh It’s Not That Bad",2)
ProgressionNoDeath(10,"Scratch That, It Is That Bad",5)
ProgressionNoDeath(25,"Almost There",7)
ProgressionNoDeath(25,"The Classic RA Experience",10)

// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Gotta Collect 'em All !",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score*10,
    format = "VALUE"
)   




