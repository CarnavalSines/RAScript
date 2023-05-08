// ~Homebrew~ Extreme Volleyball Infernal League
// #ID = 24230

// 20230508 Version - Sines


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

// $0C2B: [8 Bit] P1 Button Press
//        Bit 0 | Up
//        Bit 1 | Down
//        Bit 2 | Left
//        Bit 3 | Right
//        Bit 4 | B
//        Bit 5 | A
// $0C6C: [8 Bit] P1 Life Display
//        Start at 0x05
// $0C6D: [8 Bit] P2 Life Display
//        Start at 0x05
// $0C7E: [8 Bit] P1 Life
//        Start at 0x05
// $0C7F: [8 Bit] P2 Life
//        Start at 0x05
// $0CB6: [8 Bit] P1 Item
//        00 > None
//        01 > Fireball
//        02 > Super Jump
//        03 > Ball Control
//        04 > Helper
//        05 > Heavy Weight (Enemy Debuff)
//        06 > Super Speed
// $0CB7: [8 Bit] P2 Item
// $0E24: [8 Bit] Char ID
//        Utterly useless
// $0E2D: [8 Bit] In game flag
//        Switch from 00 to 01 on char select
//        stay at 01 on retreat / game over
// $0E31: [8 Bit] Menu Select
//        0x00 > Main Menu / Arcade
//        0x01 > 2 Players
//        0x02 > Options
// $0E3D: [8 Bit] Current Match number
// $0F07: [8 Bit] Score 1
//        X000000
// $0F08: [8 Bit] Score 2
//        0X00000
// $0F09: [8 Bit] Score 3
//        00X0000
// $0F0A: [8 Bit] Score 4
//        000X000
// $0F0B: [8 Bit] Score 5
//        0000X00
// $0F0C: [8 Bit] Score 6
//        00000X0
// $0F0D: [8 Bit] Score 7
//        000000X
// $1FE6: [8 Bit] Life Counter
//        Start at 0x02, decrease on match lost
//        Last life at 0x00
//        Next loss after that is game over

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
ButtonB = bit5(0x0c2b)  // used for items
P1Item = byte(0x0cb6)
MenuID = byte(0x0e30) // 00 for main menu / arcade
MatchID = byte(0x0e3d)

P1Life = byte(0x0c7e)
P2Life = byte(0x0c7f)
LifeCounter = byte(0x1fe6)
Score = (byte(0x0f06) * 1000000) + (byte(0x0f07) * 100000) + (byte(0x0f08) * 10000) + (byte(0x0f09) * 1000) + (byte(0x0f0a) * 100) + (byte(0x0f0b) * 10) + byte(0x0f0c)

//----------------
//Function
function MatchWin() => P1Life > 0 && LifeCounter > 0 && P2Life == 0 && prev(P2Life) > 0
function Deathless() => LifeCounter < prev(LifeCounter)
function GameWon() => word(0x0e3e) == 0x100d && prev(word(0x0e3e)) != 0x100d

function MatchClear(points,match)
{
    achievement(title = "Tower Climber "+match+1,
                description = "Finish round "+match+1,
                points = points,
                trigger = 
                            MatchID == match
                         && MatchWin()
                         && MenuID == 0
                         
)
}


//----------------

///Achievement Code
// Progression

for i in range (0,3)
MatchClear(2,i)
MatchClear(3,4)
MatchClear(5,5)

    achievement(title = "EVIL Must Die",
                description = "Win the tournament without losing a single match",
                points = 10,
                trigger = 
                            MatchID == 5
                         && MatchWin()
                         && MenuID == 0
                         && once(MatchID == 0 && MenuID == 0 && P1Life == 5 && LifeCounter == 2)
                         && never(Deathless())
)

    achievement(title = "Power of GOD and Anime",
                description = "Win a match with a Perfect",
                points = 5,
                trigger = 
                            MatchWin()
                         && MenuID == 0
                         && P1Life == 5
)

    achievement(title = "Raw Volley Skills",
                description = "Win the tournament without using any items (Can be collected, just not used)",
                points = 10,
                trigger = 
                            MatchID == 5
                         && MatchWin()
                         && MenuID == 0
                         && once(MatchID == 0 && MenuID == 0 && P1Life == 5 && LifeCounter == 2 && P2Life == 5)
                         && never(prev(P1Item)>0 && P1Item==0 && ButtonB==1)
)

    achievement(title = "Better Than the Devs",
                description = "Beat the game dev default High Score of 42285",
                points = 5,
                trigger = 
                            Score >= 42285
                         && prev(Score) < 42285
                         && byte(0x0e2c) == 1 // InGame Flag
)
// leaderboard
leaderboard(
    title = "HighScore",
    description = "Prove your might !",
    start  = GameWon(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
