// Mr. Driller: Drill till you Drop (DSi)
// #ID = 22323
// 20230416 Version - Sines

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


// $08FCF8: ?? Potential Ingame / Mission Fail / Mission Success Flags
// $08FCFC: [32 Bit] Mission Mode Play Time timer
// $0998C0: [8 Bit] Potential "In stage" flag
//          00 > Menu
//          01 > Digging
// $09C32C: [8 Bit] Stage Select ID
// $09C330: [8 Bit] Display Only Stage Status
//          01 > Clear
//          02 > Bronze Medal
//          03 > Silver Medal
//          04 > Gold Medal
// $09C334: [8 Bit] Chara Select ID
//          00 Susumu
//          01 Anna
//          02 Puchi
//          03 Holinger-Z
//          04 Taizo
//          05 Ataru
//          06 Rabbit
// $09C338: [8 Bit] Level Select (Time Attack)
//          00 Normal
//          01 Reverse
// $1E160C: [32 Bit] Mileage points
// $1E1610: [8 Bit] Bitflag - Mission Mode Stage Clear 1
//          Bit 0 | All Stages Cleared Flag - Unlock RABBIT
//          Bit 1 | Mission 1
//          Bit 2 | Mission 2
//          Bit 3 | Mission 3
//          Bit 4 | Mission 4
//          Bit 5 | Mission 5
//          Bit 6 | Mission 6
//          Bit 7 | Mission 7
// $1E1611: [8 Bit] Bitflag - Mission Mode Stage Clear 2
//          Bit 0 | Mission 8
//          Bit 1 | Mission 9
//          Bit 2 | Mission 10
//          Bit 3 | Mission 11
//          Bit 4 | Mission 12
//          Bit 5 | Mission 13
//          Bit 6 | Mission 14
//          Bit 7 | Mission 15
// $1E1614: [8 Bit] Barrier Upgrade
//          00 > 03
// $1E1615: [8 Bit] Life Up Upgrade
//          00 > 03
// $1E1616: [8 Bit] Air Booster Upgrade
//          00 > 03
// $1E1617: [8 Bit] Speed Up Upgrade
// $1E1622: [8 Bit] Susumu Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E162A: [8 Bit] Susumu Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1632: [8 Bit] Susumu Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E163A: [8 Bit] Susumu Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1642: [8 Bit] Susumu Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E164A: [8 Bit] Susumu Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1652: [8 Bit] Susumu Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E165A: [8 Bit] Susumu Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1662: [8 Bit] Susumu Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E166A: [8 Bit] Susumu Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1672: [8 Bit] Susumu Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E167A: [8 Bit] Susumu Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1682: [8 Bit] Susumu Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E168A: [8 Bit] Susumu Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1692: [8 Bit] Susumu Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1698: [16 Bit] Susumu Stage 16 Depth Record
// $1E16A0: [16 Bit] Susumu Stage 17 Depth Record
// $1E16AA: [8 Bit] Anna Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16B2: [8 Bit] Anna Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16BA: [8 Bit] Anna Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16C2: [8 Bit] Anna Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16CA: [8 Bit] Anna Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16D2: [8 Bit] Anna Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16DA: [8 Bit] Anna Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16E2: [8 Bit] Anna Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16EA: [8 Bit] Anna Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16F2: [8 Bit] Anna Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E16FA: [8 Bit] Anna Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1702: [8 Bit] Anna Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E170A: [8 Bit] Anna Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1712: [8 Bit] Anna Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E171A: [8 Bit] Anna Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1720: [16 Bit] Anna Stage 16 Depth Record
// $1E1728: [16 Bit] Anna Stage 17 Depth Record
// $1E1732: [8 Bit] Puchi Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E173A: [8 Bit] Puchi Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1742: [8 Bit] Puchi Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E174A: [8 Bit] Puchi Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1752: [8 Bit] Puchi Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E175A: [8 Bit] Puchi Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1762: [8 Bit] Puchi Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E176A: [8 Bit] Puchi Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1772: [8 Bit] Puchi Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E177A: [8 Bit] Puchi Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1782: [8 Bit] Puchi Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E178A: [8 Bit] Puchi Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1792: [8 Bit] Puchi Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E179A: [8 Bit] Puchi Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17A2: [8 Bit] Puchi Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17A8: [16 Bit] Puchi Stage 16 Depth Record
// $1E17B0: [16 Bit] Puchi Stage 17 Depth Record
// $1E17BA: [8 Bit] Holinger-Z Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17C2: [8 Bit] Holinger-Z Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17CA: [8 Bit] Holinger-Z Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17D2: [8 Bit] Holinger-Z Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17DA: [8 Bit] Holinger-Z Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17E2: [8 Bit] Holinger-Z Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17EA: [8 Bit] Holinger-Z Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17F2: [8 Bit] Holinger-Z Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E17FA: [8 Bit] Holinger-Z Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1802: [8 Bit] Holinger-Z Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E180A: [8 Bit] Holinger-Z Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1812: [8 Bit] Holinger-Z Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E181A: [8 Bit] Holinger-Z Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1822: [8 Bit] Holinger-Z Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E182A: [8 Bit] Holinger-Z Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1830: [16 Bit] Holinger-Z Stage 16 Depth Record
// $1E1838: [16 Bit] Holinger-Z Stage 17 Depth Record
// $1E1842: [8 Bit] Taizo Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E184A: [8 Bit] Taizo Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1852: [8 Bit] Taizo Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E185A: [8 Bit] Taizo Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1862: [8 Bit] Taizo Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E186A: [8 Bit] Taizo Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1872: [8 Bit] Taizo Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E187A: [8 Bit] Taizo Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1882: [8 Bit] Taizo Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E188A: [8 Bit] Taizo Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1892: [8 Bit] Taizo Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E189A: [8 Bit] Taizo Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18A2: [8 Bit] Taizo Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18AA: [8 Bit] Taizo Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18B2: [8 Bit] Taizo Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18B8: [16 Bit] Taizo Stage 16 Depth Record
// $1E18C0: [16 Bit] Taizo Stage 17 Depth Record
// $1E18CA: [8 Bit] Ataru Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18D2: [8 Bit] Ataru Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18DA: [8 Bit] Ataru Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18E2: [8 Bit] Ataru Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18EA: [8 Bit] Ataru Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18F2: [8 Bit] Ataru Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E18FA: [8 Bit] Ataru Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1902: [8 Bit] Ataru Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E190A: [8 Bit] Ataru Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1912: [8 Bit] Ataru Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E191A: [8 Bit] Ataru Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1922: [8 Bit] Ataru Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E192A: [8 Bit] Ataru Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1932: [8 Bit] Ataru Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E193A: [8 Bit] Ataru Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1940: [16 Bit] Ataru Stage 16 Depth Record
// $1E1948: [16 Bit] Ataru Stage 17 Depth Record
// $1E1952: [8 Bit] Rabbit Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E195A: [8 Bit] Rabbit Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1962: [8 Bit] Rabbit Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E196A: [8 Bit] Rabbit Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1972: [8 Bit] Rabbit Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E197A: [8 Bit] Rabbit Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1982: [8 Bit] Rabbit Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E198A: [8 Bit] Rabbit Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1992: [8 Bit] Rabbit Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E199A: [8 Bit] Rabbit Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E19A2: [8 Bit] Rabbit Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E19AA: [8 Bit] Rabbit Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E19B2: [8 Bit] Rabbit Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E19BA: [8 Bit] Rabbit Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E19C2: [8 Bit] Rabbit Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E19C8: [16 Bit] Rabbit Stage 16 Depth Record
// $1E19D0: [16 Bit] Rabbit Stage 17 Depth Record
// $1E19D4: [8 Bit] Bitflag - Time Attack Stage Clear
//          Bit 0 | Stage A
//          Bit 1 | Stage B
//          Bit 2 | Stage C
//          Bit 3 | Stage D
//          Bit 4 | Stage E
//          Bit 5 | Stage F
//          Bit 6 | Stage G
//          Bit 7 | Stage H
// $1E19D5: [8 Bit] Bitflag - Time Attack Stage Clear 2
//          Bit 0 | Stage I
//          Bit 1 | Stage J
//          Bit 2 | Reverse Stage A
//          Bit 3 | Reverse Stage B
//          Bit 4 | Reverse Stage C
//          Bit 5 | Reverse Stage D
//          Bit 6 | Reverse Stage E
//          Bit 7 | Reverse Stage F
// $1E19D6: [8 Bit] Bitflag - Time Attack Stage Clear 3
//          Bit 0 | Reverse Stage G
//          Bit 1 | Reverse Stage H
//          Bit 2 | Reverse Stage I
//          Bit 3 | Reverse Stage J
//          Bit 4 | ??
// $1E1BB8: [8 Bit] Bitflag - Dristone Mode Stage Clear
//          Bit 0 | Stage 1
//          Bit 1 | Stage 2
//          Bit 2 | Stage 3
//          Bit 3 | Stage 4
// $1E1BCC: [16 Bit] Dristone Mode Stage 5 Depth Record
// $1E48C4: [8 Bit] Menu ID
//          0x19 > Start Menu
//          0x14 > Manual
//          0x13 > Mode Select
//          0x17 > Mission Mode Select
//          0x08 > Mission Mode In-Game
//          0x18 > Time Attack Select
//          0x0a > Time Attack In-Game
//          0x15 > Dristone Select
//          0x06 > Dristone In-Game
//          0x11 > Game Over (Win or Lose)
// $2779A0: [32 Bit] Current Depth
// $278780: [8 Bit] ?? Mission Success animation ?
//          Stay at 00 during gameplay, switch to 01 then 02 on reaching the goal.
//          5e on End Screen
// $2787A0: [32 Bit] Mission Mode Current Depth
// $2787BC: [8 Bit] Mission Mode Air Meter
// $2787C6: [8 Bit] Mission Mode Live Counter
//          Display Max out at 11
// $2C911C: [8 Bit] Dristone Mode Air Meter
// $FFE00C: [32 Bit] BE | ASCII Game ID
//          0x4b445245 | KDRE > US ID


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
Header = dword_be(0xFFE00C) == 0x4b445245 // Mr Driller DSi US header
CharacterID = byte(0x09c334)
StageID = byte(0x09c32c)
ReverseMode = byte(0x09c338) // 00 Normal > 01 Reverse

MenuID = byte(0x1E48C4)
BarrierUpgrade = byte(0x1E1614) // 00 - 03 max
LifeUpgrade = byte(0x1E1615)
AirUpgrade = byte(0x1E1616)
SpeedUpgrade = byte(0x1E1617)


MissionClearFlag = { 
			0: bit1(0x1E1610),
			1: bit2(0x1E1610),
			2: bit3(0x1E1610),
			3: bit4(0x1E1610),
			4: bit5(0x1E1610),
			5: bit6(0x1E1610),
			6: bit7(0x1E1610),
			7: bit0(0x1E1611),
			8: bit1(0x1E1611),
			9: bit2(0x1E1611),
			10: bit3(0x1E1611),
			11: bit4(0x1E1611),
			12: bit5(0x1E1611),
			13: bit6(0x1E1611),
			14: bit7(0x1E1611)
}

MissionLevel = { 
			0:"The First Dig",
			1:"Digging Through",
			2:"A Casual Dig",
			3:"Digging Upwards",
			4:"A Serious Dig",
			5:"Meet The X-Blocks!",
			6:"Deadly Blocks",
			7:"A Skilful Dig",
			8:"Mind Your Head !",
			9:"A Focused Dig",
			10:"Air Comes First",
			11:"Digging Master",
			12:"Expert Driller",
			13:"Speedy Driller",
			14:"Digging to the End"
}

TimeAttackClearFlag = { 
			0: bit0(0x1E19D4),
			1: bit1(0x1E19D4),
			2: bit2(0x1E19D4),
			3: bit3(0x1E19D4),
			4: bit4(0x1E19D4),
			5: bit5(0x1E19D4),
			6: bit6(0x1E19D4),
			7: bit7(0x1E19D4),
			8: bit0(0x1E19D5),
			9: bit1(0x1E19D5),
			10: bit2(0x1E19D5), // First reverse stage
			11: bit3(0x1E19D5),
			12: bit4(0x1E19D5),
			13: bit5(0x1E19D5),
			14: bit6(0x1E19D5),
			15: bit7(0x1E19D5),
			16: bit0(0x1E19D6),
			17: bit1(0x1E19D6),
			18: bit2(0x1E19D6),
			19: bit3(0x1E19D6)
}

TimeAttackLevel = { 
			0:"Stage A",
			1:"Stage B",
			2:"Stage C",
			3:"Stage D",
			4:"Stage E",
			5:"Stage F",
			6:"Stage G",
			7:"Stage H",
			8:"Stage I",
			9:"Stage J",
			10:"Reverse Stage A",
			11:"Reverse Stage B",
			12:"Reverse Stage C",
			13:"Reverse Stage D",
			14:"Reverse Stage E",
			15:"Reverse Stage F",
			16:"Reverse Stage G",
			17:"Reverse Stage H",
			18:"Reverse Stage I",
			19:"Reverse Stage J"
}
DristoneClearFlag = { 
			0: bit0(0x1E1BB8),
			1: bit1(0x1E1BB8),
			2: bit2(0x1E1BB8),
			3: bit3(0x1E1BB8),
}

DristoneLevel = { 
			0:"Beginner",
			1:"Easy",
			2:"Normal",
			3:"Expert"
}

Susumu16 = word(0x1E1698)
Susumu17 = word(0x1E16A0)

Anna16 = word(0x1E1720)
Anna17 = word(0x1E1728)

Puchi16 = word(0x1E17A8)
Puchi17 = word(0x1E17B0)

Holinger16 = word(0x1E1830)
Holinger17 = word(0x1E1838)

Taizo16 = word(0x1E18B8)
Taizo17 = word(0x1E18C0)

Ataru16 = word(0x1E1940)
Ataru17 = word(0x1E1948)

Rabbit16 = word(0x1E19C8)
Rabbit17 = word(0x1E19D0)




//----------------
//Function

function NoUpgrade() => BarrierUpgrade == 0 && LifeUpgrade == 0 && AirUpgrade == 0 && SpeedUpgrade == 0

function MissionProg(points,LevelID)
{
    achievement(title = MissionLevel[LevelID],
                description = "Clear " + MissionLevel[LevelID],
                points = points,
                trigger = 
                            Header
                         && MenuID == 0x08
                         && prev(MissionClearFlag[LevelID]) == 0
                         && MissionClearFlag[LevelID] == 1
                         && StageID == LevelID

                )
}

function TimeAttackProg(points,LevelID)
{
    achievement(title = "Time Master: "+ TimeAttackLevel[LevelID],
                description = "Clear " + TimeAttackLevel[LevelID]+ " in Time Attack Mode",
                points = points,
                trigger = 
                            Header
                         && MenuID == 0x0a
                         && prev(TimeAttackClearFlag[LevelID]) == 0
                         && TimeAttackClearFlag[LevelID] == 1

                )
}       

function DristoneProg(points,LevelID)
{
    achievement(title = "Dig Dug: "+ DristoneLevel[LevelID] + " mode",
                description = "Clear the " + DristoneLevel[LevelID]+ " Stage in Dristone Mode",
                points = points,
                trigger = 
                            Header
                         && MenuID == 0x06
                         && prev(DristoneClearFlag[LevelID]) == 0
                         && DristoneClearFlag[LevelID] == 1

                )
}      
//----------------
///Achievement Code
// Progression
for i in range (0,2)
    MissionProg(2,i)

for i in range (3,5)   
    MissionProg(3,i) 
    
for i in range (6,8)   
    MissionProg(5,i)     
    
for i in range (9,12)   
    MissionProg(10,i)   
    
for i in range (13,14)   
    MissionProg(25,i)  
    
    achievement(title = "Mr Rabbit",
                description = "Unlock RABBIT by clearing all Missions",
                points = 10,
                trigger = 
                            Header
                         && MenuID == 0x08
                         && prev(byte(0x1E1610)) == 0
                         && byte(0x1E1610) == 1
                )      
                
    achievement(title = "Endless Driller I",
                description = "Drill down more than 1000m in Endless I with any character",
                points = 25,
                trigger = 
                            Header
                         && StageID == 0x0f   
                         && MenuID == 0x11
                         && (
                         	   (prev(Susumu16) <= 0x3e8 && Susumu16 > 0x3e8) 
                         	|| (prev(Anna16) <= 0x3e8 && Anna16 > 0x3e8) 
                         	|| (prev(Puchi16) <= 0x3e8 && Puchi16 > 0x3e8) 
                         	|| (prev(Holinger16) <= 0x3e8 && Holinger16 > 0x3e8) 
                         	|| (prev(Taizo16) <= 0x3e8 && Taizo16 > 0x3e8) 
                         	|| (prev(Ataru16) <= 0x3e8 && Ataru16 > 0x3e8) 
                         	|| (prev(Rabbit16) <= 0x3e8 && Rabbit16 > 0x3e8)
                         	)
                ) 
                
    achievement(title = "Master Driller I",
                description = "Drill down more than 2000m in Endless I with any character",
                points = 25,
                trigger = 
                            Header
                         && StageID == 0x0f   
                         && MenuID == 0x11
                         && (
                         	   (prev(Susumu16) <= 0x7d0 && Susumu16 > 0x7d0) 
                         	|| (prev(Anna16) <= 0x7d0 && Anna16 > 0x7d0) 
                         	|| (prev(Puchi16) <= 0x7d0 && Puchi16 > 0x7d0) 
                         	|| (prev(Holinger16) <= 0x7d0 && Holinger16 > 0x7d0) 
                         	|| (prev(Taizo16) <= 0x7d0 && Taizo16 > 0x7d0) 
                         	|| (prev(Ataru16) <= 0x7d0 && Ataru16 > 0x7d0) 
                         	|| (prev(Rabbit16) <= 0x7d0 && Rabbit16 > 0x7d0)
                         	)
                )         
                
    achievement(title = "Endless Driller II",
                description = "Drill down more than 800m in Endless II with any character",
                points = 25,
                trigger = 
                            Header
                         && StageID == 0x10   
                         && MenuID == 0x11
                         && (
                         	   (prev(Susumu17) <= 0x320 && Susumu17 > 0x320) 
                         	|| (prev(Anna17) <= 0x320 && Anna17 > 0x320) 
                         	|| (prev(Puchi17) <= 0x320 && Puchi17 > 0x320) 
                         	|| (prev(Holinger17) <= 0x320 && Holinger17 > 0x320) 
                         	|| (prev(Taizo17) <= 0x320 && Taizo17 > 0x320) 
                         	|| (prev(Ataru17) <= 0x320 && Ataru17 > 0x320) 
                         	|| (prev(Rabbit17) <= 0x320 && Rabbit17 > 0x320)
                         	)
                )                 

    achievement(title = "Master Driller II",
                description = "Drill down more than 1600m in Endless II with any character",
                points = 25,
                trigger = 
                            Header
                         && StageID == 0x10   
                         && MenuID == 0x11
                         && (
                         	   (prev(Susumu17) <= 0x640 && Susumu17 > 0x640) 
                         	|| (prev(Anna17) <= 0x640 && Anna17 > 0x640) 
                         	|| (prev(Puchi17) <= 0x640 && Puchi17 > 0x640) 
                         	|| (prev(Holinger17) <= 0x640 && Holinger17 > 0x640) 
                         	|| (prev(Taizo17) <= 0x640 && Taizo17 > 0x640) 
                         	|| (prev(Ataru17) <= 0x640 && Ataru17 > 0x640) 
                         	|| (prev(Rabbit17) <= 0x640 && Rabbit17 > 0x640)
                         	)
                )   
                
for i in range (0,7)
TimeAttackProg(5,i)    

for i in range (8,9)
TimeAttackProg(10,i) 

for i in range (10,14)
TimeAttackProg(10,i)    

for i in range (15,17)
TimeAttackProg(10,i)  

for i in range (18,19)
TimeAttackProg(25,i)          


for i in range (0,1)
    DristoneProg(5,i)       

for i in range (2,3)
    DristoneProg(10,i)     
    
    achievement(title = "Endless Explorer",
                description = "Drill down more than 800m in the Endless stage of Dristone mode ",
                points = 25,
                trigger = 
                            Header
                         && StageID == 0x04   
                         && MenuID == 0x11
                         && prev(word(0x1e1bcc)) <= 0x320
                         && word(0x1e1bcc) > 0x320
                         )
                         
    achievement(title = "Master Explorer",
                description = "Drill down more than 1600m in the Endless stage of Dristone mode ",
                points = 25,
                trigger = 
                            Header
                         && StageID == 0x04   
                         && MenuID == 0x11
                         && prev(word(0x1e1bcc)) <= 0x640
                         && word(0x1e1bcc) > 0x640
                         )                         
                     
    
