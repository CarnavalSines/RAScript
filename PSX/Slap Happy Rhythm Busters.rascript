// Slap Happy Rhythm Busters
// #ID = 20397
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


// $07A172: [8 Bit] Difficulty Level
//          00 > 04
//          02 is default
// $07A176: [8 Bit] Damage Level
//          00 > 04
//          02 is default
// $07A17A: [8 Bit] Fight Count
//          00 > 02
//          01 is default
// $07A17E: [8 Bit] Time Limit
//          00 > 03
//          01 is default
// $07A182: [8 Bit] Vibration On/Off
//          00 > On
//          01 > Off
// $07A186: [8 Bit] Music Volume
//          00 > 04
//          04 is default
// $07A18A: [8 Bit] Sound Effect Volume
//          00 > 04
//          04 is default
// $07A18E: [8 Bit] Sound Option
//          00 > Stereo
//          01 > Mono
// $07A192: [8 Bit] Auto-Save
//          00 > On
//          01 > Off
// $07A1A0: [8 Bit] Sledge Unlock Flag
// $07A1AC: [8 Bit] Baron Volt Unlock Flag
// $07A1AD: [8 Bit] Dark Ramos Unlock Flag
// $07A1AE: [8 Bit] Chad Gram Unlock Flag
// $07A1AF: [8 Bit] Frosty Unlock Flag
// $07A1B0: [8 Bit] Tom Tom Unlock Flag
// $07A1B1: [8 Bit] Marcantile Unlock Flag
// $07A1B2: [8 Bit] Stealth Unlock Flag
// $07A1B3: [8 Bit] Rude Boy Unlock Flag
// $07A1B4: [8 Bit] Jakoo Unlock Flag
// $07A214: [8 Bit] DJ Practice Sledge Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A215: [8 Bit] DJ Practice Sledge Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A216: [8 Bit] DJ Practice Trash Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A217: [8 Bit] DJ Practice Trash Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A218: [8 Bit] DJ Practice Mia Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A219: [8 Bit] DJ Practice Mia Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A21A: [8 Bit] DJ Practice Oreg Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A21B: [8 Bit] DJ Practice Oreg Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A21C: [8 Bit] DJ Practice Nitro Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A21D: [8 Bit] DJ Practice Nitro Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A21E: [8 Bit] DJ Practice Garia Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A21F: [8 Bit] DJ Practice Garia Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A220: [8 Bit] DJ Practice Vivian Roxy Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A221: [8 Bit] DJ Practice Vivia Roxy Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A222: [8 Bit] DJ Practice Ramos Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A223: [8 Bit] DJ Practice Ramos Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A224: [8 Bit] DJ Practice Zekoo Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A225: [8 Bit] DJ Practice Zekoo Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A226: [8 Bit] DJ Practice Holemon Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A227: [8 Bit] DJ Practice Holemon Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A228: [8 Bit] DJ Practice April Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A229: [8 Bit] DJ Practice April Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A22A: [8 Bit] DJ Practice Euri Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A22B: [8 Bit] DJ Practice Euri Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A22C: [8 Bit] DJ Practice Baron Volt Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A22D: [8 Bit] DJ Practice Baron Volt Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A22E: [8 Bit] DJ Practice Dark Ramos Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A22F: [8 Bit] DJ Practice Dark Ramos Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A230: [8 Bit] DJ Practice Chad Gram Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A231: [8 Bit] DJ Practice Chad Gram Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A232: [8 Bit] DJ Practice Frosty Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A233: [8 Bit] DJ Practice Frosty Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A234: [8 Bit] DJ Practice Tom Tom Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A235: [8 Bit] DJ Practice Tom Tom Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A236: [8 Bit] DJ Practice Marcantile Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A237: [8 Bit] DJ Practice Marcantile Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A238: [8 Bit] DJ Practice Stealth Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A239: [8 Bit] DJ Practice Stealth Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A23A: [8 Bit] DJ Practice Rude Boy Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A23B: [8 Bit] DJ Practice Rude Boy Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A23C: [8 Bit] DJ Practice Jakoo Easy
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $07A23D: [8 Bit] DJ Practice Jakoo Hard
//          00 > Nothing
//          01 > Clear
//          02 > Perfect
// $08435C: [16 Bit] Map ID
// $084BA8: [8 Bit] Player1 ID
//          0x00 > Frosty
//          0x01 > Jakoo
//          0x02 > Baron-Volt
//          0x03 > Sledge
//          0x04 > Chad-Gram
//          0x05 > Ramos
//          0x06 > Mia
//          0x07 > Oreg 
//          0x08 > Nitro
//          0x09 > Euri
//          0x0a > Holemon
//          0x0b > Trash
//          0x0c > April
//          0x0d > Garia
//          0x0e > Zekoo
//          0x0f > Vivian-Roxy
//          0x10 > Marcantile
//          0x11 > Tom Tom
//          0x12 > Dark Ramos
//          0x13 > Rude Boy
//          0x14 > Stealth
// $084FE2: [8 Bit] Fever Flag
// $08501A: [8 Bit] Round Timer
//          Start at 0x3c
// $085020: [8 Bit] Arcade Mode Progression
//          Start at 00
//          07 Final fight
//          08 Credit Roll
// $085052: [8 Bit] Current Round
//          Start at 0
//          Round == Max +1 in arcade mode for selecting your new adversary
// $0850B0: [8 Bit] P1 Life
//          Max 0x80
// $0850B2: [8 Bit] P1 Red Life > Life that can recover after a hit
// $0850E0: [8 Bit] P2 Life
//          Max 0x80
// $0850E2: [8 Bit] P1 Red Life > Life that can recover after a hit


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
CharID = byte(0x084BA8)
FeverFlag = byte(0x084FE2)
ArcadeProgression = byte(0x085020)
CreditRoll = ArcadeProgression == 8

Difficulty = byte(0x07A172) // Default 2
DamageLevel = byte(0x07A176) // Default 2
FightCount = byte(0x07A17A) // Default 1
TimeLimit = byte(0x07A17E) // Default 1

ModeID = byte(0x084190)
ArcadeMode = ModeID == 0
DJPracticeMode = ModeID == 3


CharName = { 
                    0:"Frosty",
                    1:"Jakoo",
                    2:"Baron-Volt",
                    3:"Sledge",
                    4:"Chad-Gram",
                    5:"Ramos",
                    6:"Mia",
                    7:"Oreg",
                    8:"Nitro",
                    9:"Euri",
                    10:"Holemon",
                    11:"Trash",
                    12:"April",
                    13:"Garia",
                    14:"Zekoo",
                    15:"Vivian-Roxy",
                    16:"Marcantile",
                    17:"Tom Tom",
                    18:"Dark Ramos",
                    19:"Rude Boy",
                    20:"Stealth"
                    }  
                    
CheevoName = { 
                    0:"Hee-Ho",
                    1:"Dark Hado",
                    2:"Mad Science",
                    3:"Hammer Fist",
                    4:"Chad Walk",
                    5:"Lead DJ",
                    6:"NotChun",
                    7:"Taxi Driver",
                    8:"Big Boy",
                    9:"Rollerblade",
                    10:"Faceplate",
                    11:"I'm the Trash Man",
                    12:"'Merica",
                    13:"Zoning Power",
                    14:"Bushido",
                    15:"Two For One",
                    16:"Dance With the Wolves",
                    17:"Stand Power",
                    18:"Troubled Past",
                    19:"No Need to be Rude",
                    20:"Unknown"
                    }                    
                    
DJPerfect = byte(0x07A214) + byte(0x07A215) + byte(0x07A216) + byte(0x07A217) + byte(0x07A218) + byte(0x07A219) + byte(0x07A21A) + byte(0x07A21B) + byte(0x07A21C) + byte(0x07A21D) + byte(0x07A21E) + byte(0x07A21F) + byte(0x07A220) + byte(0x07A221) + byte(0x07A222) + byte(0x07A223) + byte(0x07A224) + byte(0x07A225) + byte(0x07A226) + byte(0x07A227) + byte(0x07A228) + byte(0x07A229) + byte(0x07A22A) + byte(0x07A22B) + byte(0x07A22C) + byte(0x07A22D) + byte(0x07A22E) + byte(0x07A22F) + byte(0x07A230) + byte(0x07A231) + byte(0x07A232) + byte(0x07A233) + byte(0x07A234) + byte(0x07A235) + byte(0x07A236) + byte(0x07A237) + byte(0x07A238) + byte(0x07A239) + byte(0x07A23A) + byte(0x07A23B) + byte(0x07A23C) + byte(0x07A23D)
                    
//----------------
//Function
function DefaultConf() => Difficulty >= 2 && DamageLevel >=2 && FightCount >= 1 && TimeLimit == 1
function HardModeConf() => Difficulty == 4 && DamageLevel >=2 && FightCount >= 1 && TimeLimit == 1

function ArcadeProg(Character,points)
{
    achievement(title = CheevoName[Character],
                description = "Complete the Arcade Mode with "+ CharName[Character] + " [Default Settings]",
                points = points,
                trigger = DefaultConf()
                       && CharID == Character
                       && ArcadeMode
                       && prev(ArcadeProgression) == 7
                       && CreditRoll
                )
}

function ArcadeProgHard(Character,points)
{
    achievement(title = CharName[Character] + " Fight Master",
                description = "Complete the Arcade Mode with "+ CharName[Character] + " [Difficulty Level = 5 / Other Settings on Default]",
                points = points,
                trigger = HardModeConf()
                       && CharID == Character
                       && ArcadeMode
                       && prev(ArcadeProgression) == 7
                       && CreditRoll
                )
}

function ArcadeProgFever(Character,points)
{
    achievement(title = CharName[Character] + " Fever Mode",
                description = "In Arcade Mode trigger Fever Mode with "+ CharName[Character],
                points = points,
                trigger = CharID == Character
                       && ArcadeMode
                       && prev(FeverFlag) == 0
                       && FeverFlag == 1
                )
}
//----------------
///Achievement Code
// Progression
for i in range(0,20)
    ArcadeProg(i,5)
    
for i in range(0,20)
    ArcadeProgHard(i,10)
    
for i in range(0,20)
    ArcadeProgFever(i,2)   
    
achievement(title = "DJ Pro",
                description = "Clear every challenges of DJ Practice Mode",
                points = 25,
                trigger = DJPracticeMode
                && byte(0x07A214) >=1
&& byte(0x07A215) >=1
&& byte(0x07A216) >=1
&& byte(0x07A217) >=1
&& byte(0x07A218) >=1
&& byte(0x07A219) >=1
&& byte(0x07A21A) >=1
&& byte(0x07A21B) >=1
&& byte(0x07A21C) >=1
&& byte(0x07A21D) >=1
&& byte(0x07A21E) >=1
&& byte(0x07A21F) >=1
&& byte(0x07A220) >=1
&& byte(0x07A221) >=1
&& byte(0x07A222) >=1
&& byte(0x07A223) >=1
&& byte(0x07A224) >=1
&& byte(0x07A225) >=1
&& byte(0x07A226) >=1
&& byte(0x07A227) >=1
&& byte(0x07A228) >=1
&& byte(0x07A229) >=1
&& byte(0x07A22A) >=1
&& byte(0x07A22B) >=1
&& byte(0x07A22C) >=1
&& byte(0x07A22D) >=1
&& byte(0x07A22E) >=1
&& byte(0x07A22F) >=1
&& byte(0x07A230) >=1
&& byte(0x07A231) >=1
&& byte(0x07A232) >=1
&& byte(0x07A233) >=1
&& byte(0x07A234) >=1
&& byte(0x07A235) >=1
&& byte(0x07A236) >=1
&& byte(0x07A237) >=1
&& byte(0x07A238) >=1
&& byte(0x07A239) >=1
&& byte(0x07A23A) >=1
&& byte(0x07A23B) >=1
&& byte(0x07A23C) >=1
&& byte(0x07A23D) >=1
)

achievement(title = "Rythm Buster",
                description = "Perfect every challenges of DJ Practice Mode",
                points = 50,
                trigger = DJPracticeMode
                && measured(DJPerfect == 84)
                && prev(DJPerfect) < 84
                && prev(DJPerfect) >= 82
                
)                       
                 