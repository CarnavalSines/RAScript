// Mr. Driller: Drill till you Drop [Subset - All Gold Medals]
// #ID = 23906
// 20230613 Version - Sines

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


// $1E1290: [8 Bit] Bitflag Mission Mode Clear
//          Bit 0 | Rabbit unlock
//          Bit 1~7 | Mission 1~7
// $1E1291: [8 Bit] Bitflag Mission Mode Clear
//          Bit 0~7 | Mission 8~15
// $1E12A2: [16 Bit] Susumu Stage 1 Clear Status (Status switch before results menu)
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12AA: [16 Bit] Susumu Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12B2: [16 Bit] Susumu Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12BA: [16 Bit] Susumu Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12C2: [16 Bit] Susumu Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12CA: [16 Bit] Susumu Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12D2: [16 Bit] Susumu Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12DA: [16 Bit] Susumu Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12E2: [16 Bit] Susumu Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12EA: [16 Bit] Susumu Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12F2: [16 Bit] Susumu Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E12FA: [16 Bit] Susumu Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1302: [16 Bit] Susumu Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E130A: [16 Bit] Susumu Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1312: [16 Bit] Susumu Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E132A: [16 Bit] Anna Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1332: [16 Bit] Anna Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E133A: [16 Bit] Anna Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1342: [16 Bit] Anna Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E134A: [16 Bit] Anna Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1352: [16 Bit] Anna Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E135A: [16 Bit] Anna Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1362: [16 Bit] Anna Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E136A: [16 Bit] Anna Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1372: [16 Bit] Anna Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E137A: [16 Bit] Anna Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1382: [16 Bit] Anna Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E138A: [16 Bit] Anna Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1392: [16 Bit] Anna Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E139A: [16 Bit] Anna Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13B2: [16 Bit] Puchi Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13BA: [16 Bit] Puchi Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13C2: [16 Bit] Puchi Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13CA: [16 Bit] Puchi Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13D2: [16 Bit] Puchi Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13DA: [16 Bit] Puchi Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13E2: [16 Bit] Puchi Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13EA: [16 Bit] Puchi Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13F2: [16 Bit] Puchi Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E13FA: [16 Bit] Puchi Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1402: [16 Bit] Puchi Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E140A: [16 Bit] Puchi Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1412: [16 Bit] Puchi Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E141A: [16 Bit] Puchi Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1422: [16 Bit] Puchi Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E143A: [16 Bit] Holinger-Z Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1442: [16 Bit] Holinger-Z Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E144A: [16 Bit] Holinger-Z Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1452: [16 Bit] Holinger-Z Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E145A: [16 Bit] Holinger-Z Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1462: [16 Bit] Holinger-Z Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E146A: [16 Bit] Holinger-Z Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1472: [16 Bit] Holinger-Z Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E147A: [16 Bit] Holinger-Z Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1482: [16 Bit] Holinger-Z Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E148A: [16 Bit] Holinger-Z Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1492: [16 Bit] Holinger-Z Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E149A: [16 Bit] Holinger-Z Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14A2: [16 Bit] Holinger-Z Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14AA: [16 Bit] Holinger-Z Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14C2: [16 Bit] Taizo Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14CA: [16 Bit] Taizo Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14D2: [16 Bit] Taizo Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14DA: [16 Bit] Taizo Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14E2: [16 Bit] Taizo Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14EA: [16 Bit] Taizo Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14F2: [16 Bit] Taizo Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E14FA: [16 Bit] Taizo Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1502: [16 Bit] Taizo Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E150A: [16 Bit] Taizo Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1512: [16 Bit] Taizo Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E151A: [16 Bit] Taizo Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1522: [16 Bit] Taizo Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E152A: [16 Bit] Taizo Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1532: [16 Bit] Taizo Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E154A: [16 Bit] Ataru Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1552: [16 Bit] Ataru Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E155A: [16 Bit] Ataru Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1562: [16 Bit] Ataru Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E156A: [16 Bit] Ataru Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1572: [16 Bit] Ataru Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E157A: [16 Bit] Ataru Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1582: [16 Bit] Ataru Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E158A: [16 Bit] Ataru Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1592: [16 Bit] Ataru Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E159A: [16 Bit] Ataru Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15A2: [16 Bit] Ataru Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15AA: [16 Bit] Ataru Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15B2: [16 Bit] Ataru Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15BA: [16 Bit] Ataru Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15D2: [16 Bit] Rabbit Stage 1 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15DA: [16 Bit] Rabbit Stage 2 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15E2: [16 Bit] Rabbit Stage 3 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15EA: [16 Bit] Rabbit Stage 4 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15F2: [16 Bit] Rabbit Stage 5 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E15FA: [16 Bit] Rabbit Stage 6 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1602: [16 Bit] Rabbit Stage 7 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E160A: [16 Bit] Rabbit Stage 8 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1612: [16 Bit] Rabbit Stage 9 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E161A: [16 Bit] Rabbit Stage 10 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1622: [16 Bit] Rabbit Stage 11 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E162A: [16 Bit] Rabbit Stage 12 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1632: [16 Bit] Rabbit Stage 13 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E163A: [16 Bit] Rabbit Stage 14 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $1E1642: [16 Bit] Rabbit Stage 15 Clear Status
//          01 > Bronze Medal
//          02 > Silver Medal
//          03 > Gold Medal
// $24AB68: [8 Bit] Menu ID
//          0x13 > Main Menu
//          0x17 > Dristone Select
//          0x17 > Mission Mode Select
//          0x18 > Time Attack Select
//          0xe0 > Mission Mode In-Game
//          0xa0 > Game Over (Win or Lose)
// $FFE00C: [32 Bit] BE | ASCII Game ID
//          0x4b445256 | KDRV > EU ID

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
Header = dword_be(0xFFE00C) == 0x4b445256 // Mr Driller DSi EU header
InGame = byte(0x24ab68) == 0xe0


Susumu = { 
			0: word(0x1e12a2),
			1: word(0x1e12aa),
			2: word(0x1e12b2),
			3: word(0x1e12ba),
			4: word(0x1e12c2),
			5: word(0x1e12ca),
			6: word(0x1e12d2),
			7: word(0x1e12da),
			8: word(0x1e12e2),
			9: word(0x1e12ea),
			10: word(0x1e12f2),
			11: word(0x1e12fa),
			12: word(0x1e1302),
			13: word(0x1e130a),
			14: word(0x1e1312)
}


Anna = { 
			0: word(0x1e132a),
			1: word(0x1e1332),
			2: word(0x1e133a),
			3: word(0x1e1342),
			4: word(0x1e134a),
			5: word(0x1e1352),
			6: word(0x1e135a),
			7: word(0x1e1362),
			8: word(0x1e136a),
			9: word(0x1e1372),
			10: word(0x1e137a),
			11: word(0x1e1382),
			12: word(0x1e138a),
			13: word(0x1e1392),
			14: word(0x1e139a)
}

Puchi = { 
			0: word(0x1e13b2),
			1: word(0x1e13ba),
			2: word(0x1e13c2),
			3: word(0x1e13ca),
			4: word(0x1e13d2),
			5: word(0x1e13da),
			6: word(0x1e13e2),
			7: word(0x1e13ea),
			8: word(0x1e13f2),
			9: word(0x1e13fa),
			10: word(0x1e1402),
			11: word(0x1e140a),
			12: word(0x1e1412),
			13: word(0x1e141a),
			14: word(0x1e1422)
}

HolingerZ = { 
			0: word(0x1e143a),
			1: word(0x1e1442),
			2: word(0x1e144a),
			3: word(0x1e1452),
			4: word(0x1e145a),
			5: word(0x1e1462),
			6: word(0x1e146a),
			7: word(0x1e1472),
			8: word(0x1e147a),
			9: word(0x1e1482),
			10: word(0x1e148a),
			11: word(0x1e1492),
			12: word(0x1e149a),
			13: word(0x1e14a2),
			14: word(0x1e14aa)
}

Taizo = { 
			0: word(0x1e14c2),
			1: word(0x1e14ca),
			2: word(0x1e14d2),
			3: word(0x1e14da),
			4: word(0x1e14e2),
			5: word(0x1e14ea),
			6: word(0x1e14f2),
			7: word(0x1e14fa),
			8: word(0x1e1502),
			9: word(0x1e150a),
			10: word(0x1e1512),
			11: word(0x1e151a),
			12: word(0x1e1522),
			13: word(0x1e152a),
			14: word(0x1e1532)
}

Ataru = { 
			0: word(0x1e154a),
			1: word(0x1e1552),
			2: word(0x1e155a),
			3: word(0x1e1562),
			4: word(0x1e156a),
			5: word(0x1e1572),
			6: word(0x1e157a),
			7: word(0x1e1582),
			8: word(0x1e158a),
			9: word(0x1e1592),
			10: word(0x1e159a),
			11: word(0x1e15a2),
			12: word(0x1e15aa),
			13: word(0x1e15b2),
			14: word(0x1e15ba)
}

Rabbit = { 
			0: word(0x1e15d2),
			1: word(0x1e15da),
			2: word(0x1e15e2),
			3: word(0x1e15ea),
			4: word(0x1e15f2),
			5: word(0x1e15fa),
			6: word(0x1e1602),
			7: word(0x1e160a),
			8: word(0x1e1612),
			9: word(0x1e161a),
			10: word(0x1e1622),
			11: word(0x1e162a),
			12: word(0x1e1632),
			13: word(0x1e163a),
			14: word(0x1e1642)
}

RomanNumeral = { 
			0: "I",
			1: "II",
			2: "III",
			3: "IV",
			4: "V",
			5: "VI",
			6: "VII",
			7: "VIII",
			8: "IX",
			9: "X",
			10: "XI",
			11: "XII",
			12: "XIII",
			13: "XIV",
			14: "XV"
}

function GoldMedal(points,Level,Character,String)
{
    achievement(title = String +" - Gold Medal "+ RomanNumeral[Level],
                description = "In Mission Mode playing as "+ String+ " obtain a Gold Medal for mission " + Level+1,
                points = points,
                trigger = 
                            Header
                         && InGame
                         && prev(Character[Level]) < 3
                         && Character[Level] == 3


                )
}

//----------------
///Achievement Code
// Progression

//Susumu
for i in range (0,2)
GoldMedal(3,i,Susumu,"Susumu")

for i in range (3,5)
GoldMedal(5,i,Susumu,"Susumu")

for i in range (6,11)
GoldMedal(10,i,Susumu,"Susumu")

for i in range (12,14)
GoldMedal(25,i,Susumu,"Susumu")

//Anna
for i in range (0,2)
GoldMedal(3,i,Anna,"Anna")

for i in range (3,5)
GoldMedal(5,i,Anna,"Anna")

for i in range (6,11)
GoldMedal(10,i,Anna,"Anna")

for i in range (12,14)
GoldMedal(25,i,Anna,"Anna")


//Puchi
for i in range (0,2)
GoldMedal(3,i,Puchi,"Puchi")

for i in range (3,5)
GoldMedal(5,i,Puchi,"Puchi")

for i in range (6,11)
GoldMedal(10,i,Puchi,"Puchi")

for i in range (12,14)
GoldMedal(25,i,Puchi,"Puchi")

//HolingerZ
for i in range (0,2)
GoldMedal(3,i,HolingerZ,"Holinger - Z")

for i in range (3,5)
GoldMedal(5,i,HolingerZ,"Holinger - Z")

for i in range (6,11)
GoldMedal(10,i,HolingerZ,"Holinger - Z")

for i in range (12,14)
GoldMedal(25,i,HolingerZ,"Holinger - Z")

//Taizo
for i in range (0,2)
GoldMedal(3,i,Taizo,"Taizo")

for i in range (3,5)
GoldMedal(5,i,Taizo,"Taizo")

for i in range (6,11)
GoldMedal(10,i,Taizo,"Taizo")

for i in range (12,14)
GoldMedal(25,i,Taizo,"Taizo")


//Ataru
for i in range (0,2)
GoldMedal(3,i,Ataru,"Ataru")

for i in range (3,5)
GoldMedal(5,i,Ataru,"Ataru")

for i in range (6,11)
GoldMedal(10,i,Ataru,"Ataru")

for i in range (12,14)
GoldMedal(25,i,Ataru,"Ataru")

//Rabbit
for i in range (0,2)
GoldMedal(2,i,Rabbit,"Rabbit")

for i in range (3,5)
GoldMedal(3,i,Rabbit,"Rabbit")

for i in range (6,11)
GoldMedal(5,i,Rabbit,"Rabbit")

for i in range (12,14)
GoldMedal(10,i,Rabbit,"Rabbit")

