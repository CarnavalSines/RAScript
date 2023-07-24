// ~Homebrew~ Frostbite
// #ID = 25263
// 20230723 Version - Sines

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
// $0110: [8 Bit] Current Level
// $0115: [8 Bit] Mode Select
//        Bit 0 | InGame > 00 Off / 01 On
//        Bit 1 | Graphics Coleco / Original > 00 > Original / 01 Coleco
//        Bit 3 | 1P / 2P > 00 1P / 01 2P
//        Bit 4 | Normal / Advanced > 00 Normal / 01 Advanced
//        Bit 5 | Music On / Off
//        Bit 6 | Player 2 Turn
//        Bit 7 | Launching Play
// $0116: [8 Bit] Score * 10
// $0117: [8 Bit] Score * 2560
// $0118: [8 Bit] Temperature (Timer)
// $0119: [8 Bit] Life Count
//        0xff on Game Over
// $011A: [8 Bit] Current Igloo bricks
//        0x10 > Igloo is ready

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
CurrentLevel = byte(0x110)

InGame = bit0(0x115)
GraphicMode = bit1(0x115)
PlayerMode = bit3(0x115)
AdvancedFlag = bit4(0x115)

Score = byte(0x116) * 10 + byte(0x117) * 2560
Timer = byte(0x118)
LifeCount = byte(0x119) // 0xff on game over

IglooBrick = byte(0x11a) // 0x10 on Igloo done



//----------------
//Function
function GameOver() => LifeCount == 0xff && prev(LifeCount) == 00
function Damageless() => (LifeCount < prev(LifeCount)) || GameOver()

//----------------
///Achievement Code
// Progression
achievement(title = "Varied Level Design",
                description = "Complete the Second level, you now have seen all levels variant !",
                points = 2,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && CurrentLevel == 2
                         && prev(CurrentLevel) == 1

                         
)

achievement(title = "Innocence End",
                description = "Complete Level 6, you fought off your first bear. Get used to it, they are now a level fixture !",
                points = 3,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && CurrentLevel == 6
                         && prev(CurrentLevel) == 5

                         
)

achievement(title = "Ice Rider",
                description = "Complete Level 10, you are getting pretty good at this !",
                points = 5,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && CurrentLevel == 0xb
                         && prev(CurrentLevel) == 0xa

                         
)


achievement(title = "Bringer of Heat",
                description = "Complete Level 15, things are not slowing down !",
                points = 10,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && CurrentLevel == 0x10
                         && prev(CurrentLevel) == 0x0f

                         
)

achievement(title = "Tutorial Expert",
                description = "Starting a new game in Normal mode complete all the non-Advanced (no bear) levels under 90 seconds",
                points = 10,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && AdvancedFlag == 0
                         && LifeCount != 0xff 
                         && trigger_when(CurrentLevel == 0x05
                         && prev(CurrentLevel) == 0x04
                         && never(InGame == 0))
                         && once(prev(bit7(0x115))==1 && PlayerMode == 0 && AdvancedFlag == 0) // GameStart
                         && never(repeated(5400,InGame == 1))

                         
)

achievement(title = "Slippery Eel",
                description = "Starting a new game in Normal mode complete all the non-Advanced (no bear) without dying",
                points = 10,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && AdvancedFlag == 0
                         && LifeCount != 0xff 
                         && trigger_when(CurrentLevel == 0x5
                         && prev(CurrentLevel) == 0x04)
                         && never(InGame == 0)
                         && once(prev(bit7(0x115))==1 && PlayerMode == 0 && AdvancedFlag == 0) // GameStart
                         && never(Damageless())

                         
)

achievement(title = "The Domination of Man over Nature",
                description = "In Any Level Mode complete up to Level 10 without dying ",
                points = 25,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && trigger_when(CurrentLevel == 0xb
                         && prev(CurrentLevel) == 0xa
                         && CurrentLevel >= 5)
                         && never(InGame == 0)
                         && once(prev(bit7(0x115))==1 && PlayerMode == 0) // GameStart
                         && never(Damageless())

                         
)

achievement(title = "Retro Cubed",
                description = "Yo Dawg I herd you liked retro so I put a retro achievement in your retro game ! Complete Level 10 while playing on Original Graphics",
                points = 10,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && GraphicMode == 0
                         && LifeCount != 0xff 
                         && CurrentLevel == 0xb
                         && prev(CurrentLevel) == 0xa

                         
)

achievement(title = "Basic Brick",
                description = "Get a Score of 10 000 or more",
                points = 5,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && Score >= 10000
                         && prev(Score) < 10000

                         
)

achievement(title = "Serious Student",
                description = "Get a Score of 20 000 or more",
                points = 10,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && Score >= 20000
                         && prev(Score) < 20000

                         
)

achievement(title = "Surpassing the Old Masters",
                description = "Get a Score of 40 000 or more",
                points = 10,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && Score >= 40000
                         && prev(Score) < 40000

                         
)

achievement(title = "New School of Thoughts",
                description = "Get a Score of 80 000 or more",
                points = 25,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && Score >= 80000
                         && prev(Score) < 80000

                         
)

achievement(title = "Architectural Genius",
                description = "Get a Score of 120 000 or more",
                points = 50,
                trigger = 
                            InGame == 1
                         && PlayerMode == 0   
                         && LifeCount != 0xff 
                         && Score >= 120000
                         && prev(Score) < 120000

                         
)
// leaderboard
leaderboard(
    title = "High Score",
    description = "Show who's the best Igloo Architect !",
    start  = GameOver() && InGame == 1 && PlayerMode == 0,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
