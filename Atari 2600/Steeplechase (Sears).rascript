// Steeplechase
// #ID = 22536


// 20230218 Version - Sines

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


// $0004: [8 Bit] Race Select
//        1~6
// $0007: [8 Bit] Internal Timer
// $0011: [8 Bit] Horse 4 Sprite ID (Player 1)
//        Normal values
//        0x00 > Normal run sprite
//        0x30 > Normal run sprite
//        0x60 > Normal run sprite
//        0x90 > Jump
//        0xc0 > Descending phase of the jump
//        
//        0x5e > Touched the hurdle
// $0013: [8 Bit] Horse 3 Sprite ID (Player 2)
// $0015: [8 Bit] Horse 2 Sprite ID (Player 3)
// $0017: [8 Bit] Horse 1 Sprite ID (Player 4)
// $001D: [8 bit] Horizontal Position Player 1
//        0x85 on Win
// $001E: [8 bit] Horizontal Position Player 2
//        0x85 on Win
// $001F: [8 bit] Horizontal Position Player 3
//        0x85 on Win
// $0020: [8 bit] Horizontal Position Player 4
//        0x85 on Win
// $0059: [8 Bit] BCD Race Timer (seconds)
// $005A: [8 Bit] Race Timer (minutes)
// $006F: [8 Bit] Paddle Level Player 1
//        Dictate Jump height
//        0~3, 3 being highest
// $0070: [8 Bit] Paddle Level Player 2
//        Dictate Jump height
//        0~3, 3 being highest
// $0071: [8 Bit] Paddle Level Player 3
//        Dictate Jump height
//        0~3, 3 being highest
// $0072: [8 Bit] Paddle Level Player 4
//        Dictate Jump height
//        0~3, 3 being highest
// $0074: [8 Bit] Human Controlled Horse
//        Bit 6 | Controller 2 (3rd Horse Red)
//        Bit 7 | Controller 1 (4th Horse Yellow)
// $0075: [8 Bit] Race Start
//        00 > In menus
//        FF > In Race

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
FailHurdle = byte(0x11) == 0x5e
RaceSelection = byte(0x4)

Player1Human = bit7(0x74) == 1
Player2Human = bit6(0x74) == 1
Player3Human = bit3(0x74) == 1
Player4Human = bit2(0x74) == 1

RacePosition1 = byte(0x01d)
RacePosition2 = byte(0x01e)
RacePosition3 = byte(0x01f)
RacePosition4 = byte(0x020)

TimeOver = byte(0x5a) == 3
//----------------
//Function

function P1RaceWin() => Player1Human && RacePosition1 == 0x85 && byte(0x5a) < 3 && byte(0x75) == 0xff
function P2RaceWin() => Player2Human && RacePosition2 == 0x85 && byte(0x5a) < 3 && byte(0x75) == 0xff

function RaceProg(Title,Race,points)
{
 achievement(title = Title,
                description = "Win race "+ Race +" only controlling Player 1 (Yellow horse)",
                points = points,
                trigger = 
                (   once(RaceSelection == Race && prev(byte(0x75)) == 0 && byte(0x75) == 0xff && byte(0x59) == 0) // Check the start of the race
                   && never(TimeOver) // Automatic loss for everyone if reaching 3min
                   && never(Player2Human)
                   && never(Player3Human)
                   && never(Player4Human)
                   && P1RaceWin()
                   && never(RaceSelection != Race)
                   && never(repeated(200,byte(0x1) == 0xf7)) // Reset if the time is frozen for 20 frames (occurs on win and game over)
                )
              )
}
//----------------
///Achievement Code

RaceProg("Walk in the Park",1,2)
RaceProg("Trot in the Park",2,5)
RaceProg("Gallop in the Park",3,10)
RaceProg("Walk in the Wilds",4,3)
RaceProg("Trot in the Wilds",5,5)
RaceProg("Gallop in the Wilds",6,10)

 achievement(title = "Perfect Line",
                description = "Win any race without hitting any hurdles only controlling Player 1 (Yellow horse)",
                points = 10,
                trigger = 
                (   once(prev(byte(0x75)) == 0 && byte(0x75) == 0xff && byte(0x59) == 0) // Check the start of the race
                   && never(TimeOver) // Automatic loss for everyone if reaching 3min
                   && never(Player2Human)
                   && never(Player3Human)
                   && never(Player4Human)
                   && P1RaceWin()
                   && never(byte(0x11) == 0x5e ) // Fail sprite id for player 1
                   && never(repeated(200,byte(0x1) == 0xf7)) // Reset if the time is frozen for 20 frames (occurs on win and game over)
                 )
                )
                
 achievement(title = "Stable Master",
                description = "Win any race controlling Player 1 (Yellow horse) AND Player 2 (Red horse). Need to win with Player 1 or Player 2 and having the other horse be a close second",
                points = 25,
                trigger = 
                (   once(prev(byte(0x75)) == 0 && byte(0x75) == 0xff && byte(0x59) == 0) // Check the start of the race
                   && never(TimeOver) // Automatic loss for everyone if reaching 3min
                   && never(Player3Human)
                   && never(Player4Human)
                   && ((P1RaceWin() && RacePosition2 >= 0x70) || (P2RaceWin() && RacePosition1 >=0x70 )
                   && never(repeated(200,byte(0x1) == 0xf7)) // Reset if the time is frozen for 20 frames (occurs on win and game over)
                    )
                 )
                )
                 
//----------------

///Leaderboard
