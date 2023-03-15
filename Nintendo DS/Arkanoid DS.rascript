// Arkanoid DS
// #ID = 22844
// 20230312 Version - Sines

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


// $221018: [8 Bit] Playing status
//          00 > Not in play (Round Clear or Continue)
//          01 > In play, start of round
// $22D310: [8 Bit] All Mode Configuration Control
//          00 > Control Pad
//          01 > Stylus
//          02 > Paddle
// $22D314: [8 Bit] Game Mode
//          00 > Clear Game
//          01 > Uranoid
//          02 > Quest Game
//          03 > VS Com
// $22D318: [8 Bit] All Mode Configuration Barrier
//          00 ~ 05
//          Default 03
// $22D31C: [8 Bit] Clear Game / Uranoid Configuration Difficulty
//          00 > Easy
//          01 > Normal
//          02 > Hard
// $22D334: [8 Bit] VS Com Mode
//          00 > Bust All
//          01 > Bust Color
// $22D344: [8 Bit] VS Com Configuration COM Level
//          01 ~ 08
// $22D348: [8 Bit] VS Com Configuration Matches
//          1 / 3 / 5
//          Default 03
// $22D34C: [8 Bit] VS Com Round number
// $22D350: [8 Bit] VS Com P1 Score
// $22D393: [8 Bit] Level Cleared Status
//          00 > In play, in Continue screen
//          01 > Round Clear
// $22D3A8: [8 Bit] Current Level
//          0x00 - 0x04 | World A
//          0x05 - 0x09 | World B
//          0x0a - 0x0e | World C
//          0x0f - 0x13 | World D
//          0x14 - 0x18 | World E
//          0x19 - 0x1d | World F
//          0x1e - 0x22 | World G
//          0x23 - 0x27 | World H
//          0x28 - 0x2c | World I
//          0x2d - 0x31 | World J
//          0x32 - 0x36 | World K
//          0x37 - 0x3b | World L
//          0x3c - 0x40 | World M
//          0x41 - 0x45 | World N
//          0x46 - 0x4a | World O
//          0x4b - 0x4f | World P
//          0x50 - 0x54 | World Q
//          0x55 - 0x59 | World R
//          0x5a - 0x5e | World S
//          0x5f - 0x63 | World T
//          0x64 - 0x68 | World U
//          0x69 - 0x6d | World V
//          0x6e - 0x72 | World W
//          0x73 - 0x77 | World X
//          0x78 - 0x7c | World Y
//          0x7d - 0x81 | World Z
//          0x82 - 0x86 | Wolrd V'
//          0x87 - 0x8b | World Z'
//          0x8c - 0x90 | World Alpha (Uranoid)
//          0x91 - 0x95 | World Beta (Uranoid)
//          0x96 - 0x9a | World Gamma (Uranoid)
//          0x9b - 0x9f | World Delta (Uranoid)
//          0xa0 - 0xa4 | World Epsilon (Uranoid)
//          0xa5 - 0xa9 | World Zeta (Uranoid)
//          0xaa - 0xae | World Eta (Uranoid)
//          0xaf - 0xb3 | World Theta (Uranoid)
//          0xb4 - 0xb8 | World Iota (Uranoid)
// $22D3AC: [8 Bit] Planet Number
//          0x00 > A
//          0x01 > B - C
//          0x02 > D - E - F
//          0x03 > G - H - I - J
//          0x04 > K - L - M - N - O
//          0x05 > P - Q - R - S - T - U
//          0x06 > V - W - X - Y - Z - V' - Z'
// $22D425: [8 Bit] Bitflags Shop Unlock
//          Bit 6 | BG Polka Dots A
//          Bit 7 | BG Polka Dots B
// $22D426: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Polka Dots C
//          Bit 1 | BG Polka Dots D
//          Bit 2 | BG Floral
//          Bit 3 | BG Silhouette A
//          Bit 4 | BG Silhouette B
//          Bit 5 | BG Silhouette C
//          Bit 6 | BG Checkers A
//          Bit 7 | BG Checkers B
// $22D427: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Checkers C
//          Bit 1 | BG Checkers D
//          Bit 2 | BG Leopard A
//          Bit 3 | BG Leopard B
//          Bit 4 | BG Leopard C
//          Bit 5 | BG Leopard D
//          Bit 6 | BG Butterfly
//          Bit 7 | BG Camouflage A
// $22D428: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Camouflage B
//          Bit 1 | BG Camouflage C
//          Bit 2 | BG Camouflage D
//          Bit 3 | BG Stripes A
//          Bit 4 | BG Stripes B
//          Bit 5 | BG Stripes C
//          Bit 6 | BG Stripes D
//          Bit 7 | BG Stripes E
// $22D429: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Stripes F
//          Bit 1 | BG Stripes G
//          Bit 2 | BG Rose A
//          Bit 3 | BG Rose B
//          Bit 4 | BG Rose C
//          Bit 5 | BG Rose D
//          Bit 6 | BG Ananke Satellite
//          Bit 7 | BG Rhea Satellite
// $22D42A: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Kronos Satellite
//          Bit 1 | BG Artemis Satellite
//          Bit 2 | BG Neith Satellite
//          Bit 3 | BG Operon Satellite
//          Bit 4 | BG Idana Satellite
//          Bit 5 | BG Deimos Satellite
//          Bit 6 | BG Arkanoid Satellite
//          Bit 7 | BG Heart A
// $22D42B: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Heart B
//          Bit 1 | BG Heart C
//          Bit 2 | BG Heart D
//          Bit 3 | BG Alien A
//          Bit 4 | BG Alien B
//          Bit 5 | BG Alien C
//          Bit 6 | BG Alien D
//          Bit 7 | BG Alien E
// $22D42C: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Alien F
//          Bit 1 | BG Alien G
//          Bit 2 | BG Alien H
//          Bit 3 | BG Alien I
//          Bit 4 | BG Alien J
//          Bit 5 | BG Alien K
//          Bit 6 | BG Alien L
//          Bit 7 | BG Alien M
// $22D42D: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Alien N
//          Bit 1 | BG Alien O
//          Bit 2 | BG Alien P
//          Bit 3 | BG Living Machine
//          Bit 4 | BG Space
//          Bit 5 | BG Spring
//          Bit 6 | BG Summer
//          Bit 7 | BG Autumn
// $22D42E: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Winter
//          Bit 1 | BG Stellar Cavern
//          Bit 2 | BG Moutain Region A
//          Bit 3 | BG Machine City
//          Bit 4 | BG Van Allen Belt
//          Bit 5 | BG Mountain Region B
//          Bit 6 | BG Mechanoid A
//          Bit 7 | BG Mechanoid B
// $22D42F: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Bub A
//          Bit 1 | BG Bub B
//          Bit 2 | BG Lost Magic
//          Bit 3 | BG Navigator
//          Bit 4 | BG Exit
//          Bit 5 | BG The Legend of Kage
//          Bit 6 | BG Patoraco
//          Bit 7 | BG Constellation
// $22D430: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | BG Disco Alien
//          Bit 1 | BG Dancing Alien
//          Bit 2 | BG Tropical Fish
//          Bit 3 | BG Dolphin
//          Bit 4 | ?? On by default
//          Bit 6 | Frame Temple
//          Bit 7 | Frame Wood
// $22D431: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | Frame Frame A
//          Bit 1 | Frame Frame B
//          Bit 2 | Frame Ice
//          Bit 3 | Frame Silver
//          Bit 4 | Frame Beads
//          Bit 5 | Frame Flash
//          Bit 6 | Frame Pipe
//          Bit 7 | ?? On by default
// $22D432: [8 Bit] Bitflags Shop Unlock
//          Bit 1 | Block Title
//          Bit 2 | Block Metallic
//          Bit 3 | Block Jewel A
//          Bit 4 | Block Jewel B
//          Bit 5 | Block Bubble
//          Bit 6 | Block Invader
//          Bit 7 | Block Stone Tablet
// $22D433: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | ?? On by default
//          Bit 1 | Block Jelly
//          Bit 2 | Block Mark
//          Bit 3 | Sound Block Sound B
//          Bit 4 | Sound Block Sound C
//          Bit 5 | Sound Block Sound D
//          Bit 6 | Sound Block Sound E
//          Bit 7 | Sound Block Sound F
// $22D434: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | Sound Block Sound G
//          Bit 1 | Sound Block Sound H
//          Bit 2 | Sound Block Sound I
//          Bit 3 | Sound Block Sound J
//          Bit 4 | Sound Block Sound K
//          Bit 5 | Sound Block Sound L
//          Bit 6 | ?? On by default
//          Bit 7 | ?? On by default
// $22D435: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | ?? On by default
//          Bit 1 | ?? On by default
//          Bit 2 | ?? On by default
//          Bit 3 | ?? On by default
//          Bit 4 | ?? On by default
//          Bit 5 | ?? On by default
//          Bit 6 | Sound BGM A
//          Bit 7 | Sound BGM B
// $22D437: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | Blue Vaus
//          Bit 1 | Pink Vaus
//          Bit 2 | Yellow Vaus
//          Bit 3 | Vaus Slime
//          Bit 4 | Vaus Flash
//          Bit 5 | Vaus Gold
//          Bit 6 | Vaus Crystal
//          Bit 7 | Vaus Wood
// $22D438: [8 Bit] Bitflags Shop Unlock
//          Bit 0 | Vaus Wing
//          Bit 1 | Vaus 1
//          Bit 2 | Classic Vaus
//          Bit 3 | ??
//          Bit 4 | ??
//          Bit 5 | ??
//          Bit 6 | ??
//          Bit 7 | ??
// $22D464: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | A-1
//          Bit 1 | A-2
//          Bit 2 | A-3
//          Bit 3 | A-4
//          Bit 4 | A-5
//          Bit 5 | B-1
//          Bit 6 | B-2
//          Bit 7 | B-3
// $22D465: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | B-4
//          Bit 1 | B-5
//          Bit 2 | C-1
//          Bit 3 | C-2
//          Bit 4 | C-3
//          Bit 5 | C-4
//          Bit 6 | C-5
//          Bit 7 | D-1
// $22D466: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | D-2
//          Bit 1 | D-3
//          Bit 2 | D-4
//          Bit 3 | D-5
//          Bit 4 | E-1
//          Bit 5 | E-2
//          Bit 6 | E-3
//          Bit 7 | E-4
// $22D467: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | E-5
//          Bit 1 | F-1
//          Bit 2 | F-2
//          Bit 3 | F-3
//          Bit 4 | F-4
//          Bit 5 | F-5
//          Bit 6 | G-1
//          Bit 7 | G-2
// $22D468: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | G-3
//          Bit 1 | G-4
//          Bit 2 | G-5
//          Bit 3 | H-1
//          Bit 4 | H-2
//          Bit 5 | H-3
//          Bit 6 | H-4
//          Bit 7 | H-5
// $22D469: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | I-1
//          Bit 1 | I-2
//          Bit 2 | I-3
//          Bit 3 | I-4
//          Bit 4 | I-5
//          Bit 5 | J-1
//          Bit 6 | J-2
//          Bit 7 | J-3
// $22D46A: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | J-4
//          Bit 1 | J-5
//          Bit 2 | K-1
//          Bit 3 | K-2
//          Bit 4 | K-3
//          Bit 5 | K-4
//          Bit 6 | K-5
//          Bit 7 | L-1
// $22D46B: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | L-2
//          Bit 1 | L-3
//          Bit 2 | L-4
//          Bit 3 | L-5
//          Bit 4 | M-1
//          Bit 5 | M-2
//          Bit 6 | M-3
//          Bit 7 | M-4
// $22D46C: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | M-5
//          Bit 1 | N-1
//          Bit 2 | N-2
//          Bit 3 | N-3
//          Bit 4 | N-4
//          Bit 5 | N-5
//          Bit 6 | O-1
//          Bit 7 | O-2
// $22D46D: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | O-3
//          Bit 1 | O-4
//          Bit 2 | O-5
//          Bit 3 | P-1
//          Bit 4 | P-2
//          Bit 5 | P-3
//          Bit 6 | P-4
//          Bit 7 | P-5
// $22D46E: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Q-1
//          Bit 1 | Q-2
//          Bit 2 | Q-3
//          Bit 3 | Q-4
//          Bit 4 | Q-5
//          Bit 5 | R-1
//          Bit 6 | R-2
//          Bit 7 | R-3
// $22D46F: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | R-4
//          Bit 1 | R-5
//          Bit 2 | S-1
//          Bit 3 | S-2
//          Bit 4 | S-3
//          Bit 5 | S-4
//          Bit 6 | S-5
//          Bit 7 | T-1
// $22D470: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | T-2
//          Bit 1 | T-3
//          Bit 2 | T-4
//          Bit 3 | T-5
//          Bit 4 | U-1
//          Bit 5 | U-2
//          Bit 6 | U-3
//          Bit 7 | U-4
// $22D471: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | U-5
//          Bit 1 | V-1
//          Bit 2 | V-2
//          Bit 3 | V-3
//          Bit 4 | V-4
//          Bit 5 | V-5
//          Bit 6 | W-1
//          Bit 7 | W-2
// $22D472: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | W-3
//          Bit 1 | W-4
//          Bit 2 | W-5
//          Bit 3 | X-1
//          Bit 4 | X-2
//          Bit 5 | X-3
//          Bit 6 | X-4
//          Bit 7 | X-5
// $22D473: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Y-1
//          Bit 1 | Y-2
//          Bit 2 | Y-3
//          Bit 3 | Y-4
//          Bit 4 | Y-5
//          Bit 5 | Z-1
//          Bit 6 | Z-2
//          Bit 7 | Z-3
// $22D474: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Z-4
//          Bit 1 | Z-5
//          Bit 2 | V'-1
//          Bit 3 | V'-2
//          Bit 4 | V'-3
//          Bit 5 | V'-4
//          Bit 6 | V'-5
//          Bit 7 | Z'-1
// $22D475: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Z'-2
//          Bit 1 | Z'-3
//          Bit 2 | Z'-4
//          Bit 3 | Z'-5
//          Bit 4 | Alpha-1
//          Bit 5 | Alpha-2
//          Bit 6 | Alpha-3
//          Bit 7 | Alpha-4
// $22D476: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Alpha-5
//          Bit 1 | Beta-1
//          Bit 2 | Beta-2
//          Bit 3 | Beta-3
//          Bit 4 | Beta-4
//          Bit 5 | Beta-5
//          Bit 6 | Gamma-1
//          Bit 7 | Gamma-2
// $22D477: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Gamma-3
//          Bit 1 | Gamma-4
//          Bit 2 | Gamma-5
//          Bit 3 | Delta-1
//          Bit 4 | Delta-2
//          Bit 5 | Delta-3
//          Bit 6 | Delta-4
//          Bit 7 | Delta-5
// $22D478: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Epsilon-1
//          Bit 1 | Epsilon-2
//          Bit 2 | Epsilon-3
//          Bit 3 | Epsilon-4
//          Bit 4 | Epsilon-5
//          Bit 5 | Zeta-1
//          Bit 6 | Zeta-2
//          Bit 7 | Zeta-3
// $22D479: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Zeta-4
//          Bit 1 | Zeta-5
//          Bit 2 | Eta-1
//          Bit 3 | Eta-2
//          Bit 4 | Eta-3
//          Bit 5 | Eta-4
//          Bit 6 | Eta-5
//          Bit 7 | Theta-1
// $22D47A: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Theta-2
//          Bit 1 | Theta-3
//          Bit 2 | Theta-4
//          Bit 3 | Theta-5
//          Bit 4 | Iota-1
//          Bit 5 | Iota-2
//          Bit 6 | Iota-3
//          Bit 7 | Iota-4
// $22D47B: [8 Bit] Quest Mode Completion Flags
//          Bit 0 | Iota-5
// $22D498: [32 Bits] Game Points
// $22D778: [8 Bit] Options Menu - BGM Volume
//          0 - 0xa
// $22D77C: [8 Bit] Options Menu - SE Volume
//          0 - 0xa
// $22D780: [8 Bit] Options Menu - Player Speed
//          1 - 8
// $23CBC2: menu stuff
// $257A58: 8bit barrier strenght 3 (def pointer)
// $262458: [8 Bit] Barrier Strenght
// $265678: [8 Bit] Barrier Strenght 2 (Pointer ?)

///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50



FirstWorldLevel = { 
			0:0x00, //a
			1:0x05, //b
			2:0x0a, //c
			3:0x0f, //d
			4:0x14,
			5:0x19,
			6:0x1e,
			7:0x23,
			8:0x28,
			9:0x2d,
			10:0x32,
			11:0x37,
			12:0x3c,
			13:0x41,
			14:0x46,
			15:0x4b,
			16:0x50,
			17:0x55,
			18:0x5a,
			19:0x5f,
			20:0x64,
			21:0x69,
			22:0x6e,
			23:0x73,
			24:0x78,
			25:0x7d,
			26:0x82,
			27:0x87,
			28:0x8c, // Uranoid Worlds
			29:0x91,
			30:0x96,
			31:0x9b,
			32:0xa0,
			33:0xa5,
			34:0xaa,
			35:0xaf,
			36:0xb4
}

WorldName = { 
			0:"A",
			1:"B",
			2:"C",
			3:"D",
			4:"E",
			5:"F",
			6:"G",
			7:"H",
			8:"I",
			9:"J",
			10:"K",
			11:"L",
			12:"M",
			13:"N",
			14:"O",
			15:"P",
			16:"Q",
			17:"R",
			18:"S",
			19:"T",
			20:"U",
			21:"V",
			22:"W",
			23:"X",
			24:"Y",
			25:"Z",
			26:"V'",
			27:"Z'",
			28:"Alpha",
			29:"Beta",
			30:"Gamma",
			31:"Delta",
			32:"Epsilon",
			33:"Zeta",
			34:"Eta",
			35:"Theta",
			36:"Iota"

}


//----------------
//Variable
PlayingStatus = byte(0x221018) // 00 Not in Play (from round clear OR Continue) > 01 Playing (All modes)
//LevelClearFlag = byte(0x22d393) // 00 Not cleared, 01 Cleared

//GameMode = byte(0x22d314) // 00 Clear game 01 Uranoid 02 Quest 03 VS Com
//VSComGameMode = byte(0x22d334) // 00 Bust All 01 Bust Color

//ControlStyle = byte(0x22d310)


//BarrierConf = byte(0x22d318) // 3 is Default

//DifficultyMode = byte(0x22d31c) // 1 (normal) is Default
//VSComDifficultyMode = byte(0x22d344) // 1 - 8
//VSComMatchConf = byte(0x22d348) // 1 / 3 / 5
//VSComRound = byte(0x22d34c)
//VSComP1Win = byte(0x22d350) // Nb of win by P1

//LevelID = byte(0x22d3a8) // Used for Clear Mode and Uranoid Mode
ContinueScreen = byte(0xc4edc) // 0x16 on Continue

MainPointer= tbyte(0x0c3758) // Fucking pointer man

BarrierPointer = MainPointer + 0xffa038 // // Offset ffa038 16752696 > negative offset 5fc8 2277208
BarrierManip = BarrierPointer - 16777216 // 24b mask
BarrierConf = tbyte(BarrierManip)

ControlPointer = MainPointer + 0xffa030
ControlManip = ControlPointer - 16777216
ControlStyle = tbyte(ControlManip)
StylusControl = ControlStyle == 1

GameModePointer = MainPointer + 0xffa034
GameModeManip = GameModePointer - 16777216
GameMode = tbyte(GameModeManip)

DifficultyPointer = MainPointer + 0xffa03c
DifficultyManip = DifficultyPointer - 16777216
DifficultyMode = tbyte(DifficultyManip)

LevelClearPointer = MainPointer + 0xffa0b3
LevelClearManip = LevelClearPointer - 16777216
LevelClearFlag = tbyte(LevelClearManip)

LevelIDPointer = MainPointer + 0xffa0c8
LevelIDManip = LevelIDPointer - 16777216
LevelID = tbyte(LevelIDManip)

VSComModePointer = MainPointer + 0xffa054
VSComModeManip = VSComModePointer - 16777216
VSComGameMode = tbyte(VSComModeManip)

VSComDifficultyModePointer = MainPointer + 0xffa064
VSComDifficultyModeManip = VSComDifficultyModePointer - 16777216
VSComDifficultyMode = tbyte(VSComDifficultyModeManip)

VSComMatchConfPointer = MainPointer + 0xffa068
VSComMatchConfManip = VSComMatchConfPointer - 16777216
VSComMatchConf = tbyte(VSComMatchConfManip)

VSComP1WinPointer = MainPointer + 0xffa070
VSComP1WinManip = VSComP1WinPointer - 16777216
VSComP1Win = tbyte(VSComP1WinManip)

VSComRoundPointer = MainPointer + 0xffa07c
VSComRoundManip = VSComRoundPointer - 16777216
VSComRound = tbyte(VSComRoundManip)



// --- --- --- --- --- ---
// Quest mode stuff

QuestPointer1 = MainPointer + 0xffa184
QuestAddress1 = QuestPointer1 - 16777216
QuestPointer2 = MainPointer + 0xffa185
QuestAddress2 = QuestPointer2 - 16777216
QuestPointer3 = MainPointer + 0xffa186
QuestAddress3 = QuestPointer3 - 16777216
QuestPointer4 = MainPointer + 0xffa187
QuestAddress4 = QuestPointer4 - 16777216
QuestPointer5 = MainPointer + 0xffa188
QuestAddress5 = QuestPointer5 - 16777216
QuestPointer6 = MainPointer + 0xffa189
QuestAddress6 = QuestPointer6 - 16777216
QuestPointer7 = MainPointer + 0xffa18a
QuestAddress7 = QuestPointer7 - 16777216
QuestPointer8 = MainPointer + 0xffa18b
QuestAddress8 = QuestPointer8 - 16777216
QuestPointer9 = MainPointer + 0xffa18c
QuestAddress9 = QuestPointer9 - 16777216
QuestPointer10 = MainPointer + 0xffa18d
QuestAddress10 = QuestPointer10 - 16777216
QuestPointer11 = MainPointer + 0xffa18e
QuestAddress11 = QuestPointer11 - 16777216
QuestPointer12 = MainPointer + 0xffa18f
QuestAddress12 = QuestPointer12 - 16777216
QuestPointer13 = MainPointer + 0xffa190
QuestAddress13 = QuestPointer13 - 16777216
QuestPointer14 = MainPointer + 0xffa191
QuestAddress14 = QuestPointer14 - 16777216
QuestPointer15 = MainPointer + 0xffa192
QuestAddress15 = QuestPointer15 - 16777216
QuestPointer16 = MainPointer + 0xffa193
QuestAddress16 = QuestPointer16 - 16777216
QuestPointer17 = MainPointer + 0xffa194
QuestAddress17 = QuestPointer17 - 16777216
QuestPointer18 = MainPointer + 0xffa195
QuestAddress18 = QuestPointer18 - 16777216
QuestPointer19 = MainPointer + 0xffa196
QuestAddress19 = QuestPointer19 - 16777216
QuestPointer20 = MainPointer + 0xffa197
QuestAddress20 = QuestPointer20 - 16777216
QuestPointer21 = MainPointer + 0xffa198
QuestAddress21 = QuestPointer21 - 16777216
QuestPointer22 = MainPointer + 0xffa199
QuestAddress22 = QuestPointer22 - 16777216
QuestPointer23 = MainPointer + 0xffa19a
QuestAddress23 = QuestPointer23 - 16777216
QuestPointer24 = MainPointer + 0xffa19b
QuestAddress24 = QuestPointer24 - 16777216

QuestModeA = bit0(QuestAddress1) + bit1(QuestAddress1) + bit2(QuestAddress1) + bit3(QuestAddress1) + bit4(QuestAddress1) 
QuestModeB = bit5(QuestAddress1) + bit6(QuestAddress1) + bit7(QuestAddress1) + bit0(QuestAddress2) + bit1(QuestAddress2)
QuestModeC = bit2(QuestAddress2) + bit3(QuestAddress2) + bit4(QuestAddress2) + bit5(QuestAddress2) + bit6(QuestAddress2)
QuestModeD = bit7(QuestAddress2) + bit0(QuestAddress3) + bit1(QuestAddress3) + bit2(QuestAddress3) + bit3(QuestAddress3)
QuestModeE = bit4(QuestAddress3) + bit5(QuestAddress3) + bit6(QuestAddress3) + bit7(QuestAddress3) + bit0(QuestAddress4)
QuestModeF = bit1(QuestAddress4) + bit2(QuestAddress4) + bit3(QuestAddress4) + bit4(QuestAddress4) + bit5(QuestAddress4)
QuestModeG = bit6(QuestAddress4) + bit7(QuestAddress4) + bit0(QuestAddress5) + bit1(QuestAddress5) + bit2(QuestAddress5)
QuestModeH = bit3(QuestAddress5) + bit4(QuestAddress5) + bit5(QuestAddress5) + bit6(QuestAddress5) + bit7(QuestAddress5)
QuestModeI = bit0(QuestAddress6) + bit1(QuestAddress6) + bit2(QuestAddress6) + bit3(QuestAddress6) + bit4(QuestAddress6)
QuestModeJ = bit5(QuestAddress6) + bit6(QuestAddress6) + bit7(QuestAddress6) + bit0(QuestAddress7) + bit1(QuestAddress7)
QuestModeK = bit2(QuestAddress7) + bit3(QuestAddress7) + bit4(QuestAddress7) + bit5(QuestAddress7) + bit6(QuestAddress7)
QuestModeL = bit7(QuestAddress7) + bit0(QuestAddress8) + bit1(QuestAddress8) + bit2(QuestAddress8) + bit3(QuestAddress8)
QuestModeM = bit4(QuestAddress8) + bit5(QuestAddress8) + bit6(QuestAddress8) + bit7(QuestAddress8) + bit0(QuestAddress9)
QuestModeN = bit1(QuestAddress9) + bit2(QuestAddress9) + bit3(QuestAddress9) + bit4(QuestAddress9) + bit5(QuestAddress9)
QuestModeO = bit6(QuestAddress9) + bit7(QuestAddress9) + bit0(QuestAddress10) + bit1(QuestAddress10) + bit2(QuestAddress10)
QuestModeP = bit3(QuestAddress10) + bit4(QuestAddress10) + bit5(QuestAddress10) + bit6(QuestAddress10) + bit7(QuestAddress10)
QuestModeQ = bit0(QuestAddress11) + bit1(QuestAddress11) + bit2(QuestAddress11) + bit3(QuestAddress11) + bit4(QuestAddress11)
QuestModeR = bit5(QuestAddress11) + bit6(QuestAddress11) + bit7(QuestAddress11) + bit0(QuestAddress12) + bit1(QuestAddress12)
QuestModeS = bit2(QuestAddress12) + bit3(QuestAddress12) + bit4(QuestAddress12) + bit5(QuestAddress12) + bit6(QuestAddress12)
QuestModeT = bit7(QuestAddress12) + bit0(QuestAddress13) + bit1(QuestAddress13) + bit2(QuestAddress13) + bit3(QuestAddress13)
QuestModeU = bit4(QuestAddress13) + bit5(QuestAddress13) + bit6(QuestAddress13) + bit7(QuestAddress13) + bit0(QuestAddress14)
QuestModeV = bit1(QuestAddress14) + bit2(QuestAddress14) + bit3(QuestAddress14) + bit4(QuestAddress14) + bit5(QuestAddress14)
QuestModeW = bit6(QuestAddress14) + bit7(QuestAddress14) + bit0(QuestAddress15) + bit1(QuestAddress15) + bit2(QuestAddress15)
QuestModeX = bit3(QuestAddress15) + bit4(QuestAddress15) + bit5(QuestAddress15) + bit6(QuestAddress15) + bit7(QuestAddress15)
QuestModeY = bit0(QuestAddress16) + bit1(QuestAddress16) + bit2(QuestAddress16) + bit3(QuestAddress16) + bit4(QuestAddress16)
QuestModeZ = bit5(QuestAddress16) + bit6(QuestAddress16) + bit7(QuestAddress16) + bit0(QuestAddress17) + bit1(QuestAddress17)
QuestModeVPrime = bit2(QuestAddress17) + bit3(QuestAddress17) + bit4(QuestAddress17) + bit5(QuestAddress17) + bit6(QuestAddress17)
QuestModeZPrime = bit7(QuestAddress17) + bit0(QuestAddress18) + bit1(QuestAddress18) + bit2(QuestAddress18) + bit3(QuestAddress18)

QuestModeAlpha = bit4(QuestAddress18) + bit5(QuestAddress18) + bit6(QuestAddress18) + bit7(QuestAddress18) + bit0(QuestAddress19)
QuestModeBeta = bit1(QuestAddress19) + bit2(QuestAddress19) + bit3(QuestAddress19) + bit4(QuestAddress19) + bit5(QuestAddress19)
QuestModeGamma = bit6(QuestAddress19) + bit7(QuestAddress19) + bit0(QuestAddress20) + bit1(QuestAddress20) + bit2(QuestAddress20)
QuestModeDelta = bit3(QuestAddress20) + bit4(QuestAddress20) + bit5(QuestAddress20) + bit6(QuestAddress20) + bit7(QuestAddress20)
QuestModeEpsilon = bit0(QuestAddress21) + bit1(QuestAddress21) + bit2(QuestAddress21) + bit3(QuestAddress21) + bit4(QuestAddress21)
QuestModeZeta = bit5(QuestAddress21) + bit6(QuestAddress21) + bit7(QuestAddress21) + bit0(QuestAddress22) + bit1(QuestAddress22)
QuestModeEta = bit2(QuestAddress22) + bit3(QuestAddress22) + bit4(QuestAddress22) + bit5(QuestAddress22) + bit6(QuestAddress22)
QuestModeTheta = bit7(QuestAddress22) + bit0(QuestAddress23) + bit1(QuestAddress23) + bit2(QuestAddress23) + bit3(QuestAddress23)
QuestModeIota = bit4(QuestAddress23) + bit5(QuestAddress23) + bit6(QuestAddress23) + bit7(QuestAddress23) + bit0(QuestAddress24)

QuestModeCheck = { 
			0:QuestModeA, 
			1:QuestModeB, 
			2:QuestModeC, 
			3:QuestModeD, 
			4:QuestModeE,
			5:QuestModeF,
			6:QuestModeG,
			7:QuestModeH,
			8:QuestModeI,
			9:QuestModeJ,
			10:QuestModeK,
			11:QuestModeL,
			12:QuestModeM,
			13:QuestModeN,
			14:QuestModeO,
			15:QuestModeP,
			16:QuestModeQ,
			17:QuestModeR,
			18:QuestModeS,
			19:QuestModeT,
			20:QuestModeU,
			21:QuestModeV,
			22:QuestModeW,
			23:QuestModeX,
			24:QuestModeY,
			25:QuestModeZ,
			26:QuestModeVPrime,
			27:QuestModeZPrime,
			28:QuestModeAlpha, // Uranoid Worlds
			29:QuestModeBeta,
			30:QuestModeGamma,
			31:QuestModeDelta,
			32:QuestModeEpsilon,
			33:QuestModeZeta,
			34:QuestModeEta,
			35:QuestModeTheta,
			36:QuestModeIota
}

ShopPointer1 = MainPointer + 0xffa144
ShopAddress1 = ShopPointer1 - 16777216
ShopPointer2 = MainPointer + 0xffa145
ShopAddress2 = ShopPointer2 - 16777216
ShopPointer3 = MainPointer + 0xffa146
ShopAddress3 = ShopPointer3 - 16777216
ShopPointer4 = MainPointer + 0xffa147
ShopAddress4 = ShopPointer4 - 16777216
ShopPointer5 = MainPointer + 0xffa148
ShopAddress5 = ShopPointer5 - 16777216
ShopPointer6 = MainPointer + 0xffa149
ShopAddress6 = ShopPointer6 - 16777216
ShopPointer7 = MainPointer + 0xffa14a
ShopAddress7 = ShopPointer7 - 16777216
ShopPointer8 = MainPointer + 0xffa14b
ShopAddress8 = ShopPointer8 - 16777216
ShopPointer9 = MainPointer + 0xffa14c
ShopAddress9 = ShopPointer9 - 16777216
ShopPointer10 = MainPointer + 0xffa14d
ShopAddress10 = ShopPointer10 - 16777216
ShopPointer11 = MainPointer + 0xffa14e
ShopAddress11 = ShopPointer11 - 16777216
ShopPointer12 = MainPointer + 0xffa14f
ShopAddress12 = ShopPointer12 - 16777216
ShopPointer13 = MainPointer + 0xffa150
ShopAddress13 = ShopPointer13 - 16777216
ShopPointer14 = MainPointer + 0xffa151
ShopAddress14 = ShopPointer14 - 16777216
ShopPointer15 = MainPointer + 0xffa152
ShopAddress15 = ShopPointer15 - 16777216
ShopPointer16 = MainPointer + 0xffa153
ShopAddress16 = ShopPointer16 - 16777216
ShopPointer17 = MainPointer + 0xffa154
ShopAddress17 = ShopPointer17 - 16777216
ShopPointer18 = MainPointer + 0xffa155
ShopAddress18 = ShopPointer18 - 16777216
ShopPointer19 = MainPointer + 0xffa156
ShopAddress19 = ShopPointer19 - 16777216
ShopPointer20 = MainPointer + 0xffa157
ShopAddress20 = ShopPointer20 - 16777216
ShopPointer21 = MainPointer + 0xffa158
ShopAddress21 = ShopPointer21 - 16777216

CustomisationBG = bitcount(ShopAddress1) + bitcount(ShopAddress2) + bitcount(ShopAddress3) + bitcount(ShopAddress4) + bitcount(ShopAddress5) + bitcount(ShopAddress6) + bitcount(ShopAddress7) + bitcount(ShopAddress8) + bitcount(ShopAddress9) + bitcount(ShopAddress10) + bitcount(ShopAddress11) + bitcount(ShopAddress12) + bit0(ShopAddress13) + bit1(ShopAddress13) + bit2(ShopAddress13) + bit3(ShopAddress13)
CustomisationFrame = bit4(ShopAddress13) + bit5(ShopAddress13) + bit6(ShopAddress13) + bit7(ShopAddress13) + bit0(ShopAddress14) + bit1(ShopAddress14) + bit2(ShopAddress14) + bit3(ShopAddress14) + bit4(ShopAddress14) + bit5(ShopAddress14) + bit6(ShopAddress14)
CustomisationBlock = bit7(ShopAddress14) + bitcount(ShopAddress15) + bit0(ShopAddress16) + bit1(ShopAddress16)
CustomisationSound = bit2(ShopAddress16) + bit3(ShopAddress16) + bit4(ShopAddress16) + bit5(ShopAddress16) + bit6(ShopAddress16) + bit7(ShopAddress16) + bitcount(ShopAddress17) + bitcount(ShopAddress18) + bit0(ShopAddress19) + bit1(ShopAddress19) + bit2(ShopAddress19)
CustomisationVaus = bit3(ShopAddress19) + bit4(ShopAddress19) + bit5(ShopAddress19) + bit6(ShopAddress19) + bit7(ShopAddress19) + bitcount(ShopAddress20) + bit0(ShopAddress21) + bit1(ShopAddress21) + bit2(ShopAddress21)

//----------------
//Function
function GameOver() => prev(ContinueScreen) != 0x16 && ContinueScreen == 0x16 // Continue? Screen pop-up
function StageQuit() => prev(ContinueScreen) !=0x1a && ContinueScreen == 0x1a
function StageCleared() => prev(PlayingStatus) == 1 && PlayingStatus == 0 && prev(LevelClearFlag) == 0 && LevelClearFlag == 1 // Round Clear status

function LastLevelCheck(Level) => LevelID == FirstWorldLevel[Level] + 4 // Every world has five levels
function VSComWin() => GameMode == 3 && VSComMatchConf == 3 && VSComP1Win == 2 && prev(VSComP1Win) < 2 // Check you won 2 points in Bo3 (can trigger during the match, it's normal)

function ClearModeProgression(points,levelID)
{
    achievement(title = "Zone " + WorldName[levelID] + " Clear",
                description = "In Clear Mode beat Zone " + WorldName[levelID] + " [Normal Difficulty or above, Barrier Strength: 3]",
                points = points,
                trigger = 
                            GameMode == 0 // Clear Mode
                         && BarrierConf == 3
                         && DifficultyMode >= 1
                         && LastLevelCheck(levelID)
                         && StageCleared()
                )
}

function ClearModeProgression1CC(points,levelID)
{
    achievement(title = "Zone " + WorldName[levelID] + " Space Master",
                description = "In Clear Mode beat Zone " + WorldName[levelID] + " in a single session without using any Continues [Normal Difficulty or above, Barrier Strength: 0]",
                points = points,
                trigger = 
                            GameMode == 0 // Clear Mode
                         && BarrierConf == 0
                         && DifficultyMode >= 1
                         && once(LevelID == FirstWorldLevel[levelID])
                         && LastLevelCheck(levelID)
                         && StageCleared()
                         && never(GameOver())
                         && never(StageQuit())
                )
}

function UranoidModeProgression(points,levelID)
{
    achievement(title = "Beyond the event Horizon: " + WorldName[levelID] + " Clear",
                description = "In Uranoid Mode beat Zone " + WorldName[levelID] + " [Normal Difficulty or above, Barrier Strength: 3]",
                points = points,
                trigger = 
                            GameMode == 1 // Uranoid Mode
                         && BarrierConf == 3
                         && DifficultyMode >= 1
                         && LastLevelCheck(levelID)
                         && StageCleared()
                )
}


function UranoidModeProgression1CC(points,levelID)
{
    achievement(title = "Space Hegemony: Perfect " + WorldName[levelID],
                description = "In Uranoid Mode beat Zone " + WorldName[levelID] + " in a single session without using any Continues [Normal Difficulty or above, Barrier Strength: 0]",
                points = points,
                trigger = 
                            GameMode == 1 // Uranoid Mode
                         && BarrierConf == 0
                         && DifficultyMode >= 1
                         && once(LevelID == FirstWorldLevel[levelID])
                         && LastLevelCheck(levelID)
                         && StageCleared()
                         && never(GameOver())
                         && never(StageQuit())
                )
}

function QuestModeWorldClear(points,levelID)
{
    achievement(title = "Alien on a Mission: Zone " + WorldName[levelID] + " Completionist ",
                description = "Complete all the missions of Zone " + WorldName[levelID] + " in Quest Mode",
                points = points,
                trigger = 
                            GameMode == 2 // Quest Mode
                         && prev(QuestModeCheck[levelID]) < 5
                         && prev(QuestModeCheck[levelID]) > 0 // To avoid bootup false positive
                         && QuestModeCheck[levelID] == 5
                )
}

function VSComCompletionBustAll(points,ComLevel)
{
    achievement(title = "Bustin’ Makes Me Feel Good - Level " + ComLevel,
                description = "Beat the Computer Level " + ComLevel + " in VS Com Bust All Mode [Best of 3 Rounds]",
                points = points,
                trigger = 
                            GameMode == 3 // VS Com Mode
                         && VSComGameMode == 0 // Bust All Mode   
                         && VSComMatchConf == 3 // Bo3
                         && VSComDifficultyMode == ComLevel // AI Level
                         && prev(VSComP1Win) == 1 // Delta check victory points goes from 1 to 2
                         && VSComP1Win == 2
                )
}

function VSComCompletionBustColor(points,ComLevel)
{
    achievement(title = "Rainbow Destroyer - Level " + ComLevel,
                description = "Beat the Computer Level " + ComLevel + " in VS Com Bust Color Mode [Best of 3 Rounds]",
                points = points,
                trigger = 
                            GameMode == 3 // VS Com Mode
                         && VSComGameMode == 1 // Bust Color Mode   
                         && VSComMatchConf == 3 // Bo3
                         && VSComDifficultyMode == ComLevel // AI Level
                         && prev(VSComP1Win) == 1 // Delta check victory points goes from 1 to 2
                         && VSComP1Win == 2
                )
}
//----------------

///Achievement Code
// Progression Clear Mode
ClearModeProgression(2,0)
for i in range (1,2)
    ClearModeProgression(3,i)
for i in range (3,10)
    ClearModeProgression(5,i)    
for i in range (11,20)
    ClearModeProgression(10,i)
for i in range (21,27)
    ClearModeProgression(25,i)    
    
    
// Progression Uranoid Mode
for i in range (28,30)
    UranoidModeProgression(5,i)
for i in range (31,33)
    UranoidModeProgression(10,i)    
for i in range (34,36)
    UranoidModeProgression(25,i)    

// Progression Quest Mode
QuestModeWorldClear(2,0)
for i in range (1,2)
    QuestModeWorldClear(3,i)
for i in range (3,9)
    QuestModeWorldClear(5,i)    
for i in range (10,20)
    QuestModeWorldClear(10,i)
for i in range (21,27)
    QuestModeWorldClear(25,i)  
for i in range (28,33)
    QuestModeWorldClear(10,i)
for i in range (34,36)
    QuestModeWorldClear(25,i)   

// VS Com Fights
/// Bust All
for i in range (1,3)
    VSComCompletionBustAll(3,i)
for i in range (4,6)
    VSComCompletionBustAll(5,i)
for i in range (7,8)
    VSComCompletionBustAll(10,i)    

/// Bust Color
for i in range (1,3)
    VSComCompletionBustColor(3,i)
for i in range (4,6)
    VSComCompletionBustColor(5,i)
for i in range (7,8)
    VSComCompletionBustColor(10,i)    
// Deathless Challenges
/// Clear Mode
ClearModeProgression1CC(3,0)
for i in range (1,2)
    ClearModeProgression1CC(5,i)
for i in range (3,9)
    ClearModeProgression1CC(5,i)    
for i in range (10,20)
    ClearModeProgression1CC(10,i)
for i in range (21,27)
    ClearModeProgression1CC(50,i)    

/// Uranoid Mode
for i in range (28,30)
    UranoidModeProgression1CC(5,i)
for i in range (31,33)
    UranoidModeProgression1CC(10,i)    
for i in range (34,36)
    UranoidModeProgression1CC(50,i)   
// Shopping Completion
achievement(title = "Art Gallery",
                description = "Collect all the custom Backgrounds",
                points = 10,
                trigger = 
                            measured(CustomisationBG == 100)
                         && prev(CustomisationBG) < 100
                         && prev(CustomisationBG) > 0
                )

achievement(title = "All About Framing",
                description = "Collect all the custom Frames",
                points = 10,
                trigger = 
                            measured(CustomisationFrame == 11)
                         && prev(CustomisationFrame) < 11
                         && prev(CustomisationFrame) > 0
                )
                
achievement(title = "Changeling",
                description = "Collect all the custom Blocks",
                points = 10,
                trigger = 
                            measured(CustomisationBlock == 11)
                         && prev(CustomisationBlock) < 11
                         && prev(CustomisationBlock) > 0
                )     
                
achievement(title = "Audiophile",
                description = "Collect all the custom BGMs and Sounds",
                points = 10,
                trigger = 
                            measured(CustomisationSound == 25)
                         && prev(CustomisationSound) < 25
                         && prev(CustomisationSound) > 0
                )   
                
achievement(title = "Space Hangar",
                description = "Collect all the custom Vaus",
                points = 10,
                trigger = 
                            measured(CustomisationVaus == 16)
                         && prev(CustomisationVaus) < 16
                         && prev(CustomisationVaus) > 0
                )                  
// Misc Challenge

achievement(title = "The Dev Favorite Gimmick: Alternative Controls !",
                description = "In Clear Mode beat Zone A in a single session without using any Continues with Stylus Controls [Normal Difficulty or above, Barrier Strength: 0]",
                points = 3,
                trigger = 
                            GameMode == 0 // Clear Mode
                         && StylusControl   
                         && BarrierConf == 0
                         && DifficultyMode >= 1
                         && once(LevelID == FirstWorldLevel[0])
                         && LastLevelCheck(0)
                         && StageCleared()
                         && never(GameOver())
                         && never(StageQuit())
                )
                
                
              
