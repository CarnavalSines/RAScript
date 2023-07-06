// Pachinko
// #ID = 6819

// 20230706 Version - Sines

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

// $006E: [8 Bit] BCD Timer Seconds
// $006F: [8 Bit] BCD Timer Minutes
// $0070: [8 Bit] BCD Timer Hours
// $0071: [16 Bit] BCD Balls Count
// $00F9: [8 Bit] Probable graphical data valu
//        Can be used as an in-game check
//        00 > Game Over / Main Menu
//        0x10 > In-Game
// $0165: [8 Bit] Left Claw flag
//        00 > Closed
//        01 > Open
// $0166: [8 Bit] Right Claw flag
//        00 > Closed
//        01 > Open
// $016A: [8 Bit] BCD Slot machine Left number
// $016B: [8 Bit] BCD Slot machine Middle number
// $016C: [8 Bit] BCD Slot machine Right number
// $0172: [8 Bit] LUCKY Mode flag
//        00 > Off
//        01 > On
// $0173: [8 Bit] Timer
//        Used by various part
//        In combination with LUCKY Flag indicate how long it will stay open


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
InGame = byte(0xf9)
Balls = bcd(word(0x71))
LeftClaw = byte(0x165)
RightClaw = byte(0x166)
LUCKY = byte(0x172)
TimeHour = bcd(byte(0x70))

//----------------
//Function


//----------------

///Achievement Code
// Progression
achievement(title = "Hi, I’m Nicolas Cage and This Is a Song for You",
                description = "Double your initial Ball count",
                points = 2,
                trigger = 
                            InGame == 0x10
                         && Balls >= 100 
                         && prev(Balls) < 100
                         
                         
)

achievement(title = "TRIPLETS ?",
                description = "Triple your initial Ball count",
                points = 3,
                trigger = 
                            InGame == 0x10
                         && Balls >= 150 
                         && prev(Balls) < 150
                         
                         
)

achievement(title = "F E V E R",
                description = "Get a total of 300 Balls or more",
                points = 5,
                trigger = 
                            InGame == 0x10
                         && Balls >= 300 
                         && prev(Balls) < 300
                         
                         
)

achievement(title = "I Love PACHINKO",
                description = "Get a total of 500 Balls or more",
                points = 5,
                trigger = 
                            InGame == 0x10
                         && Balls >= 500 
                         && prev(Balls) < 500
                         
                         
)

achievement(title = "I’m Having Good Luck",
                description = "Get a total of 700 Balls or more",
                points = 10,
                trigger = 
                            InGame == 0x10
                         && Balls >= 700 
                         && prev(Balls) < 700
                         
                         
)

achievement(title = "I Don’t Understand...",
                description = "Get a total of 1000 Balls or more",
                points = 25,
                trigger = 
                            InGame == 0x10
                         && Balls >= 1000 
                         && prev(Balls) < 1000
                         
                         
)

achievement(title = "Lucky !",
                description = "Get 10 Lucky Fever in one game",
                points = 25,
                trigger = 
                            InGame == 0x10
                         && tally(10,LUCKY == 1 && prev(LUCKY)==0)
                         && never(InGame == 0)
                         
                         
)

achievement(title = "Sweet Peanut Butter",
                description = "Activate the Left Claw 5 times in one game",
                points = 5,
                trigger = 
                            InGame == 0x10
                         && tally(5,LeftClaw == 1 && prev(LeftClaw)==0)
                         && never(InGame == 0)
                         
                         
)

achievement(title = "So, You’re Twins ?",
                description = "Activate the Right Claw 5 times in one game",
                points = 5,
                trigger = 
                            InGame == 0x10
                         && tally(5,RightClaw == 1 && prev(RightClaw)==0)
                         && never(InGame == 0)
                         
                         
)

// leaderboard
leaderboard(
    title = "Master Gambler",
    description = "Get the highest number of balls you can by the 1h in-game mark",
    start  = TimeHour==1 && prev(TimeHour)==0,
    cancel = always_false(),
    submit = always_true(),
    value = Balls,
    format = "VALUE"
)   