// Arthur to Astaroth no Nazo Makaimura: Incredible Toons
// #ID = 25891

// 20231203 Version - Sines

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



// $1DA84E: potential victory flag
// $1DA852: [8 Bit] Level ID
// $1DA864: [8 Bit] Bitflags Level Clear 3
//          Bit 0 | Level 17
//          Bit 1 | Level 18
//          Bit 2 | Level 19
//          Bit 3 | Level 20 -> Background Transition
//          Bit 4 | Level 21
//          Bit 5 | Level 22
//          Bit 6 | Level 23
//          Bit 7 | Level 24
// $1DA865: [8 Bit] Bitflags Level Clear 4
//          Bit 0 | Level 25 -> Background Transition
//          Bit 1 | Level 26
//          Bit 2 | Level 27
//          Bit 3 | Level 28
//          Bit 4 | Level 29
//          Bit 5 | Level 30 -> Background Transition
//          Bit 6 | Level 31
//          Bit 7 | Level 32
// $1DA866: [8 Bit] Bitflags Level Clear
//          Bit 0 | Level 1
//          Bit 1 | Level 2
//          Bit 2 | Level 3
//          Bit 3 | Level 4
//          Bit 4 | Level 5 -> Background Transition
//          Bit 5 | Level 6
//          Bit 6 | Level 7
//          Bit 7 | Level 8
// $1DA867: [8 Bit] Bitflags Level Clear 2
//          Bit 0 | Level 9
//          Bit 1 | Level 10 -> Background Transition
//          Bit 2 | Level 11
//          Bit 3 | Level 12
//          Bit 4 | Level 13
//          Bit 5 | Level 14
//          Bit 6 | Level 15 -> Background Transition
//          Bit 7 | Level 16
// $1DA868: [8 Bit] Bitflags Level Clear 7
//          Bit 0 | Level 49
//          Bit 1 | Level 50 -> Background Transition
//          Bit 2 | Level 51
//          Bit 3 | Level 52
//          Bit 4 | Level 53
//          Bit 5 | Level 54
//          Bit 6 | Level 55 -> Background Transition
//          Bit 7 | Level 56
// $1DA869: [8 Bit] Bitflags Level Clear 8
//          Bit 0 | Level 57
//          Bit 1 | Level 58
//          Bit 2 | Level 59
//          Bit 3 | Level 60 -> Background Transition
//          Bit 4 | Level 61
//          Bit 5 | Level 62
//          Bit 6 | Level 63
//          Bit 7 | Level 64
// $1DA86A: [8 Bit] Bitflags Level Clear 5
//          Bit 0 | Level 33
//          Bit 1 | Level 34
//          Bit 2 | Level 35 -> Background Transition
//          Bit 3 | Level 36
//          Bit 4 | Level 37
//          Bit 5 | Level 38
//          Bit 6 | Level 39
//          Bit 7 | Level 40 -> Background Transition
// $1DA86B: [8 Bit] Bitflags Level Clear 6
//          Bit 0 | Level 41
//          Bit 1 | Level 42
//          Bit 2 | Level 43
//          Bit 3 | Level 44
//          Bit 4 | Level 45 -> Background Transition
//          Bit 5 | Level 46
//          Bit 6 | Level 47
//          Bit 7 | Level 48
// $1DA86C: [8 Bit] Bitflags Level Clear 11
//          Bit 0 | Level 81
//          Bit 1 | Level 82
//          Bit 2 | Level 83
//          Bit 3 | Level 84
//          Bit 4 | Level 85 -> Background Transition
//          Bit 5 | Level 86
//          Bit 6 | Level 87
//          Bit 7 | Level 88
// $1DA86D: [8 Bit] Bitflags Level Clear 12
//          Bit 0 | Level 89
//          Bit 1 | Level 90 -> Background Transition
//          Bit 2 | Level 91
//          Bit 3 | Level 92
//          Bit 4 | Level 93
//          Bit 5 | Level 94
//          Bit 6 | Level 95 -> Background Transition
//          Bit 7 | Level 96
// $1DA86E: [8 Bit] Bitflags Level Clear 9
//          Bit 0 | Level 65 -> Background Transition
//          Bit 1 | Level 66
//          Bit 2 | Level 67
//          Bit 3 | Level 68
//          Bit 4 | Level 69
//          Bit 5 | Level 70 -> Background Transition
//          Bit 6 | Level 71
//          Bit 7 | Level 72
// $1DA86F: [8 Bit] Bitflags Level Clear 10
//          Bit 0 | Level 73
//          Bit 1 | Level 74
//          Bit 2 | Level 75 -> Background Transition
//          Bit 3 | Level 76
//          Bit 4 | Level 77
//          Bit 5 | Level 78
//          Bit 6 | Level 79
//          Bit 7 | Level 80 -> Background Transition
// $1DA870: [16 Bit] Arbitrary value flag that stays at 0xffff during regular gameplay, used for boot protection
// $1DA872: [8 Bit] Bitflags Level Clear 13
//          Bit 0 | Level 97
//          Bit 1 | Level 98
//          Bit 2 | Level 99
//          Bit 3 | Level 100
//          Remaining bits always at 1
// $1DEB0C: [8 Bit]
//          Animation ID for victory screen
//          Clear on 0x1d > 0x1e


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

LevelIDFlag = {
                    1:bit0(0x1da866),
                    2:bit1(0x1da866),
                    3:bit2(0x1da866),
                    4:bit3(0x1da866),
                    5:bit4(0x1da866),
                    6:bit5(0x1da866),
                    7:bit6(0x1da866),
                    8:bit7(0x1da866),
                    9:bit0(0x1da867),
                    10:bit1(0x1da867),
                    11:bit2(0x1da867),
                    12:bit3(0x1da867),
                    13:bit4(0x1da867),
                    14:bit5(0x1da867),
                    15:bit6(0x1da867),
                    16:bit7(0x1da867),
                    17:bit0(0x1da864),
                    18:bit1(0x1da864),
                    19:bit2(0x1da864),
                    20:bit3(0x1da864),
                    21:bit4(0x1da864),
                    22:bit5(0x1da864),
                    23:bit6(0x1da864),
                    24:bit7(0x1da864),
                    25:bit0(0x1da865),
                    26:bit1(0x1da865),
                    27:bit2(0x1da865),
                    28:bit3(0x1da865),
                    29:bit4(0x1da865),
                    30:bit5(0x1da865),
                    31:bit6(0x1da865),
                    32:bit7(0x1da865),
                    33:bit0(0x1da86a),
                    34:bit1(0x1da86a),
                    35:bit2(0x1da86a),
                    36:bit3(0x1da86a),
                    37:bit4(0x1da86a),
                    38:bit5(0x1da86a),
                    39:bit6(0x1da86a),
                    40:bit7(0x1da86a),
                    41:bit0(0x1da86b),
                    42:bit1(0x1da86b),
                    43:bit2(0x1da86b),
                    44:bit3(0x1da86b),
                    45:bit4(0x1da86b),
                    46:bit5(0x1da86b),
                    47:bit6(0x1da86b),
                    48:bit7(0x1da86b),
                    49:bit0(0x1da868),
                    50:bit1(0x1da868),
                    51:bit2(0x1da868),
                    52:bit3(0x1da868),
                    53:bit4(0x1da868),
                    54:bit5(0x1da868),
                    55:bit6(0x1da868),
                    56:bit7(0x1da868),
                    57:bit0(0x1da869),
                    58:bit1(0x1da869),
                    59:bit2(0x1da869),
                    60:bit3(0x1da869),
                    61:bit4(0x1da869),
                    62:bit5(0x1da869),
                    63:bit6(0x1da869),
                    64:bit7(0x1da869),
                    65:bit0(0x1da86e),
                    66:bit1(0x1da86e),
                    67:bit2(0x1da86e),
                    68:bit3(0x1da86e),
                    69:bit4(0x1da86e),
                    70:bit5(0x1da86e),
                    71:bit6(0x1da86e),
                    72:bit7(0x1da86e),
                    73:bit0(0x1da86f),
                    74:bit1(0x1da86f),
                    75:bit2(0x1da86f),
                    76:bit3(0x1da86f),
                    77:bit4(0x1da86f),
                    78:bit5(0x1da86f),
                    79:bit6(0x1da86f),
                    80:bit7(0x1da86f),
                    81:bit0(0x1da86c),
                    82:bit1(0x1da86c),
                    83:bit2(0x1da86c),
                    84:bit3(0x1da86c),
                    85:bit4(0x1da86c),
                    86:bit5(0x1da86c),
                    87:bit6(0x1da86c),
                    88:bit7(0x1da86c),
                    89:bit0(0x1da86d),
                    90:bit1(0x1da86d),
                    91:bit2(0x1da86d),
                    92:bit3(0x1da86d),
                    93:bit4(0x1da86d),
                    94:bit5(0x1da86d),
                    95:bit6(0x1da86d),
                    96:bit7(0x1da86d),
                    97:bit0(0x1da872),
                    98:bit1(0x1da872),
                    99:bit2(0x1da872),
                    100:bit3(0x1da872)
                }


//----------------
//Variable

LevelID = byte(0x1da852) // start at 0 for level 1
BootProtection = word(0x1da870)


//Function
function BootProtect() => repeated(60, BootProtection == 0xffff) && never(BootProtection != 0xffff)
function Progression(Title,Points,Level)
{
    achievement(title = Title,
                description = "Clear Puzzles "+ Level+" through "+Level+4+".",
                points = Points,
                trigger = 
                           BootProtect()
                        && (LevelIDFlag[Level] + LevelIDFlag[Level+1] + LevelIDFlag[Level+2] + LevelIDFlag[Level+3] + LevelIDFlag[Level+4]) == 5
                        && prev((LevelIDFlag[Level] + LevelIDFlag[Level+1] + LevelIDFlag[Level+2] + LevelIDFlag[Level+3] + LevelIDFlag[Level+4])) == 4
                      //  && never(prior((LevelIDFlag[Level] + LevelIDFlag[Level+1] + LevelIDFlag[Level+2] + LevelIDFlag[Level+3] + LevelIDFlag[Level+4]))==0)
                )
}



Progression("Slow Beginning",3,1)
Progression("Knightly Ambition",3,6)
Progression("Battle of Minds",3,11)
Progression("Fish Hunter",3,16)
Progression("Learning the Ropes",3,21)
Progression("Grand Journey",5,26)
Progression("Jazzy Puzzling",5,31)
Progression("Destination Castle",5,36)
Progression("Thinking with Portals",5,41)
Progression("Test of Might",5,46)
Progression("Who Dares Wins",5,51)
Progression("Shrimple as That",5,56)
Progression("Aces High",5,61)
Progression("Garanteed Guide Free Unlock",5,66)
Progression("I Saw a Squirrel Today",5,71)
Progression("Paper Plane",5,76)
Progression("Chocolate Cookie",10,81)
Progression("The Greatest Achievement",10,86)
Progression("Two Minutes to Midnight",10,91)
Progression("2nd Loop Clear !",25,96)


// Rich Presence (test)
rich_presence_conditional_display(
    BootProtection != 0xffff,
    "|| Prepare to be Dazzled by Dastardly Puzzles ! ||"
)    
    

rich_presence_display(
    "|| Trying to solve Puzzle {0} ||",
    rich_presence_value("Puzzle", LevelID+1)
)









