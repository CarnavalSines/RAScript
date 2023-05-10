// Congo Bongo
// #ID = 13484

// 20230510 Version - Sines

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

// $0061: [8 Bit] Game State
//        00 > New Round Start
//        03 > Game Over (Don't use, prone to flicker, use dead + 00 lives instead)
//        16 > In Game
//        18 > Dead
//        c1 > Bongo reached
//        c2 > Main Menu
// $0065: [24 Bit] Score BCD
// $0066: [8 Bit] Score 2 BCD *100
// $0067: [8 Bit] Score 3 BCD *1000
// $0068: [8 Bit] Round Number (loop)
// $0069: [8 Bit] Lives Remaining
//        0x02 > Start
//        Game Over when 0x00 AND Death trigger
// $006A: [8 Bit] Level Indicator
//        00 > First Level
//        FF > Second Level
// $006E: [16 Bit] Bonus Value
// $0084: [16 Bit] Score BCD *10
//        Display Only
// $0091: [8 Bit] Vertical Main char Position
//        9d > Bottom
//        00 > Top
// $0092: [8 Bit] Horizontal Main char Position
//        00 > Far Left
//        FF > Far Right


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
GameState = byte(0x0061)
Score = bcd(tbyte(0x0065))
RoundID = byte(0x0068)
LiveCounter = byte(0x0069) // Start at 2, gameover when 0 AND die

LevelOne = byte(0x006a) == 0
LevelTwo = byte(0x006a) == 0xFF

Bonus = bcd(word(0x006e))
VerticalPos = byte(0x91)
HorizontalPos = byte(0x92)
//----------------
//Function
function GameOver() => LiveCounter == 0 && GameState == 0x18
function Progression(points,round)
{
    achievement(title = "Beat round "+round,
                description = "Beat "+round,
                points = points,
                trigger = 
                            repeated(60,GameState == 0xc1
                         && LiveCounter > 0
                         && LevelTwo
                         && RoundID == round)
                         && never(RoundID == round+1)
                         && never(LevelOne)
                         
)
}

function ProgressionScore(points,score)
{
    achievement(title = "Reach score "+score,
                description = "Reach "+score,
                points = points,
                trigger = 
                            LiveCounter > 0
                         && Score >= score
                         && prev(Score) < score
                         
)
}

function ProgressionDeathless(points,round)
{
    achievement(title = "Beat no death round "+round,
                description = "Beat no death "+round,
                points = points,
                trigger = 
                            repeated(60,GameState == 0xc1
                         && LiveCounter > 0
                         && LevelTwo
                         && RoundID == round)
                         && once(RoundID == 1 && LiveCounter == 2)
                         && never(LiveCounter < prev(LiveCounter))
                         && never(RoundID == round+1)
                         && never(LevelOne)
                         
)
}

//----------------

///Achievement Code
// Progression
Progression(5,1)
Progression(5,2)
Progression(10,5)
Progression(10,10)

ProgressionScore(5,25000)
ProgressionScore(10,50000)
ProgressionScore(10,75000)
ProgressionScore(25,100000)

ProgressionDeathless(10,5)
ProgressionDeathless(25,10)

    achievement(title = "Wrong Game, Not Frogger",
                description = "In Round 1~3 avoid the top left island and use the nenuphar shortcut instead",
                points = 2,
                trigger = 
                            GameState == 0x16
                         && LiveCounter > 0
                         && LevelTwo
                         && RoundID == 1
                         && VerticalPos >= 0x70
                         && VerticalPos <= 0x78
                         && HorizontalPos >= 0xb4
                         && once(RoundID == 1 && LevelOne && GameState == 0xc1)
                         && never(LevelTwo && VerticalPos >= 0x27 && VerticalPos <= 0x38 && HorizontalPos >= 0x2a && HorizontalPos <=0x45)
                         && never (RoundID > 3)
                         
                         
)

    achievement(title = "No Fridge, Go For Fish",
                description = "In Round 1~3 avoid the right side and use the fish shortcut instead",
                points = 3,
                trigger = 
                            GameState == 0x16
                         && LiveCounter > 0
                         && LevelTwo
                         && RoundID == 1
                         && VerticalPos <= 0x41
                         && HorizontalPos >= 0x78
                         && HorizontalPos <= 0xb1
                         && once(RoundID == 1 && LevelOne && GameState == 0xc1)
                         && never(LevelTwo && VerticalPos >= 0x70 && VerticalPos <= 0x78 && HorizontalPos >= 0xb4)
                         && never (RoundID > 3)
                         
                         
)
// leaderboard
leaderboard(
    title = "Best Explorer",
    description = "Show who's the best explorer of them all",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
