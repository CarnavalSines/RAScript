// SD Gundam: Operation U.C.
// #ID = 4965
// 20230207 Version - Sines

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



// $C07A: [8 Bit] Live Counter
//        Goes from 1 to 3 on Game Over
// $C360: Don't work as ID, cursor position
// $C368: ??
// $C46A: [8 Bit] Mode Selected
//        00 > Main Menu / UC Mode
//        01 > Continue
//        02 > VS Mode
//        03 > Survival Mode
// $C476: X Not flag
// $C47B: [8 Bit] Bitflags UC Mode
//        Bit 3 | Gundam CCA Mode Unlocked
//        Bit 4 | Gundam Done 1
//        Bit 5 | Guncannon Done 2
//        Bit 6 | Guntank Done 3
//        Bit 7 | GM Done 4
// $C47C: [8 Bit] Bitflags UC Mode
//        Bit 0 | Rick Dias Done 5
//        Bit 1 | Hyaku Shiki Done 2
//        Bit 2 | MKII/Zeta Story mode Done 1
//        Bit 3 | Methuss Done 4
//        Bit 4 | Mk II Z Gundam Done 3
//        Bit 5 | Zeta Gundam Done 6
//        Bit 6 | Hyaku Shiki ZZ Mode Done
//        Bit 7 | Mk II Gundam ZZ Mode Done
// $C47D: [8 Bit] Bitflags UC Mode
//        Bit 0 | Z / ZZ Gundam Story mode Done 1
//        Bit 1 | Z Gundam ZZ Mode Done 3
//        Bit 2 | ZZ Gundam Done 5
//        Bit 3 | CCA Story Mode Done
// $C47E: [8 Bit] Bitflags UC Mode
//        Bit 1 | Ball
//        Bit 2 | Dijeh
//        Bit 3 | Methuss ZZ mode
// $C48C: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Gundam
//        Bit 1 | Guncannon
//        Bit 2 | Guntank
//        Bit 3 | GM
//        Bit 4 | Ball (Space)
//        Bit 5 | Zeta Gundam Z version
//        Bit 6 | Zeta Gundam ZZ version
// $C48D: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Gundam Mk II Titan Colors version
//        Bit 1 | Gundam Mk II Z version
//        Bit 2 | Gundam Mk II Super Gundam Z version
//        Bit 3 | Gundam Mk II (Elle Vianno) ZZ version
//        Bit 5 | Methus
//        Bit 6 | Hyaku Shiki Z version
//        Bit 7 | Hyaku Shiki ZZ version
// $C48E: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Rick Dias
//        Bit 1 | Dijeh
//        Bit 2 | ZZ Gundam
//        Bit 3 | Re-GZ
//        Bit 4 | Zaku I
//        Bit 5 | Zaku II (A)
//        Bit 6 | Zaku II (B)
//        Bit 7 | Zaku II (C)
// $C48F: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Zaku II Commander Type
//        Bit 1 | Zaku II Commander Type White version
//        Bit 2 | Desert Zaku Blue version
//        Bit 3 | Desert Zaku
//        Bit 4 | Gouf
//        Bit 5 | Gouf (Ramba Ral)
//        Bit 6 | Rick Dom
//        Bit 7 | Rick Dom Space version
// $C490: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Gogg
//        Bit 1 | Z'Gok
//        Bit 2 | Z'Gok Char version
//        Bit 3 | Acguy
//        Bit 4 | Gyan
//        Bit 5 | Gelgoog
//        Bit 6 | Gelgoog Commander Type
//        Bit 7 | Gelgoog (Anavel Gato)
// $C491: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Gelgoog Commander Type Char version
//        Bit 1 | Gelgoog Commander Type
//        Bit 2 | Bolinoak Sammahn
//        Bit 3 | Qubeley (Haman Karn)
//        Bit 4 | Qubeley Mk II (Elpeo Ple)
//        Bit 5 | Qubeley Mk II (Ple Two)
//        Bit 7 | Hizack
// $C492: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Hizack EFF version
//        Bit 1 | Hizack Custom version
//        Bit 2 | Base Jabber
//        Bit 3 | GM II
//        Bit 4 | GM Cannon
//        Bit 5 | GM Sniper
//        Bit 6 | Galbaldy Beta
//        Bit 7 | Marasai
// $C493: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Gaplant
//        Bit 1 | Asshimar
//        Bit 2 | Gabthley
//        Bit 3 | Hambrabi
//        Bit 4 | Byarlant Custom colors
//        Bit 5 | Byarlant
//        Bit 6 | Barzam
//        Bit 7 | Galluss J
// $C494: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Zssa
//        Bit 1 | Gaza C
//        Bit 2 | Gaza D
//        Bit 3 | Ga-Zowm
//        Bit 4 | R-Jarja
//        Bit 5 | Bawoo (Glemy Toto)
//        Bit 6 | Bawoo
//        Bit 7 | Dowadge
// $C495: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Dowadge Custom
//        Bit 1 | Sturm Dias
//        Bit 2 | Jamru Fin
//        Bit 3 | ReGelg
//        Bit 4 | Gazu-L
//        Bit 5 | Gazu-R
//        Bit 6 | Geze
//        Bit 7 | Geze (Yazan)
// $C496: [8 Bit] Bitflags Survival Mode
//        Bit 0 | Jegan
//        Bit 1 | Geara Doga Custom
//        Bit 2 | Geara Doga
//        Bit 3 | Small Mobile Suit
//        Bit 4 | Medium Mobile Suit
//        Bit 5 | Nu Gundam
//        Bit 6 | Sazabi
//        Bit 7 | Zock
// $C497: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Zeong
//        Bit 1 | Zakrello
//        Bit 2 | Messala
//        Bit 3 | Pallas Athena
//        Bit 4 | Hamma Hamma
//        Bit 5 | Hamma Hamma Shield version
//        Bit 6 | Dreissen
//        Bit 7 | Zaku III
// $C498: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | Zaku III Custom
//        Bit 1 | Geymark
//        Bit 2 | Doven Wolf
//        Bit 3 | Jagd Doga (Gyunei Guss)
//        Bit 4 | Jagd Doga (Quess Paraya)
//        Bit 5 | Grublo
//        Bit 6 | Elmeth
//        Bit 7 | Bygro
// $C499: [8 Bit] Bitflags Survival Mode Clear
//        Bit 0 | The O
//        Bit 1 | Baund Doc (Gates Capa)
//        Bit 2 | Baund Doc (Rosamia Badam)
//        Bit 3 | Baund Doc (Jerid Messa)
//        Bit 4 | Gundam G3
//        Bit 5 | Rick Dias Black version
//        Bit 6 | ZZ Gundam Enhanced version
// $C49E: [8 Bit] Part of credit roll timer
// $D203: [8 Bit] Mech ID
// $D217: [8 Bit] Current Life
//        Max 0x80


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CampaignBitFlagUnlock = { // Campaign mode bitflags, missing Sazabi because it doesn't unlock anything >> Will be covered manually similar to 1CC achievements
                    0:bit3(0xc47b), // CCA Mode Unlocked
                    1:bit4(0xc47b), // Gundam Done
                    2:bit5(0xc47b), // Guncannon Done
                    3:bit6(0xc47b), // Guntank Done
                    4:bit7(0xc47b), // GM Done
                    5:bit0(0xc47c), // Rick Dias Z Done
                    6:bit1(0xc47c), // Hyaku Shiki Z Done
                    7:bit2(0xc47c), // Z Main Campaign Done
                    8:bit3(0xc47c), // Methuss Z Done
                    9:bit4(0xc47c), // Mk II Z Done
                    10:bit5(0xc47c), // Zeta Gundam Done
                    11:bit6(0xc47c), // Hyaku Shiki ZZ Done
                    12:bit7(0xc47c), // Mk II ZZ Done
                    13:bit0(0xc47d), // ZZ Main Campaign Done
                    14:bit1(0xc47d), // Zeta Gundam ZZ Done
                    15:bit2(0xc47d), // ZZ Gundam Done
                    16:bit3(0xc47d), // Nu Gundam Done
                    17:bit1(0xc47e), // Ball (Gundam) Done
                    18:bit2(0xc47e), // Dijeh (Z) Done
                    19:bit3(0xc47e)  // Methuss (ZZ) Done
                    }
                    
CampaignBitFlagDescription = { // 
                    0:"Not supposed to appear",
                    1:"Gundam", // Gundam Done
                    2:"Guncannon", // Guncannon Done
                    3:"Guntank", // Guntank Done
                    4:"GM", // GM Done
                    5:"Rick Dias", // Rick Dias Z Done
                    6:"Hyaku Shiki in the Zeta Era", // Hyaku Shiki Z Done
                    7:"main story Zeta Gundam", // Z Main Campaign Done
                    8:"Methuss in the Zeta Era", // Methuss Z Done
                    9:"Gundam Mk II in the Zeta Era", // Mk II Z Done
                    10:"Zeta Gundam in the Zeta Era", // Zeta Gundam Done
                    11:"Hyaku Shiki in the ZZ Era", // Hyaku Shiki ZZ Done
                    12:"Gundam Mk II in the ZZ Era", // Mk II ZZ Done
                    13:"main story ZZ Gundam", // ZZ Main Campaign Done
                    14:"Zeta Gundam in the ZZ Era", // Zeta Gundam ZZ Done
                    15:"ZZ Gundam", // ZZ Gundam Done
                    16:"Nu Gundam", // Nu Gundam Done
                    17:"Ball", // Ball (Gundam) Done
                    18:"Dijeh", // Dijeh (Z) Done
                    19:"Methuss",  // Methuss (ZZ) Done
                    20:"Sazabi"
                    }  
                    
CampaignBitFlagName = { // 
                    0:"Not supposed to appear",
                    1:"The White Devil", // Gundam Done
                    2:"The Sarcastic Ace", // Guncannon Done
                    3:"Oldtype Support", // Guntank Done
                    4:"Mass-Produced Powerhouse", // GM Done
                    5:"AEUG First Mech", // Rick Dias Z Done
                    6:"The Bitter Laugh", // Hyaku Shiki Z Done
                    7:"Transcending Times", // Z Main Campaign Done
                    8:"Transformable Prototype", // Methuss Z Done
                    9:"Stolen Successor", // Mk II Z Done
                    10:"Flying Gundam", // Zeta Gundam Done
                    11:"Alternative Captain", // Hyaku Shiki ZZ Done
                    12:"Loyalty of Shangri-La", // Mk II ZZ Done
                    13:"It's Not an Anime !", // ZZ Main Campaign Done
                    14:"Crafty Fox", // Zeta Gundam ZZ Done
                    15:"Silent Voice", // ZZ Gundam Done
                    16:"Not Just for Show", // Nu Gundam Done
                    17:"The Little Ball That Could", // Ball (Gundam) Done
                    18:"Return of the Devil", // Dijeh (Z) Done
                    19:"Short Lived Support",  // Methuss (ZZ) Done
                    20:"The Last Duel"
                    }             
                    
CampaignMechID1CC = { // 
                    0:"Still not supposed to appear",
                    1:0x0, // Gundam Done
                    2:0x1, // Guncannon Done
                    3:0x2, // Guntank Done
                    4:0x3, // GM Done
                    5:0x10, // Rick Dias Z Done 
                    6:0xe, // Hyaku Shiki Z Done
                    7:0x5, // Z Main Campaign Done MANUAL CHEEVO
                    8:0xd, // Methuss Z Done MANUAL CHEEVO
                    9:0x9, // Mk II Z Done
                    10:0x5, // Zeta Gundam Done MANUAL CHEEVO
                    11:0xf, // Hyaku Shiki ZZ Done
                    12:0xb, // Mk II ZZ Done
                    13:0x12, // ZZ Main Campaign Done MANUAL CHEEVO
                    14:0x6, // Zeta Gundam ZZ Done
                    15:0x12, // ZZ Gundam Done MANUAL CHEEVO
                    16:0x55, // Nu Gundam Done
                    17:0x4, // Ball (Gundam) Done
                    18:0x11, // Dijeh (Z) Done
                    19:0xd,  // Methuss (ZZ) Done MANUAL CHEEVO
                    20:0x56
                    }
                    
CampaignCursorPos1CC = { // 
                    0:"Not supposed to appear",
                    1:0x0, // Gundam Done
                    2:0x1, // Guncannon Done
                    3:0x2, // Guntank Done
                    4:0x3, // GM Done
                    5:0x4, // Rick Dias Z Done
                    6:0x1, // Hyaku Shiki Z Done
                    7:0x0, // Z Main Campaign Done
                    8:0x3, // Methuss Z Done
                    9:0x2, // Mk II Z Done
                    10:0x5, // Zeta Gundam Done
                    11:0x3, // Hyaku Shiki ZZ Done
                    12:0x1, // Mk II ZZ Done
                    13:0x0, // ZZ Main Campaign Done
                    14:0x2, // Zeta Gundam ZZ Done
                    15:0x4, // ZZ Gundam Done
                    16:0x0, // Nu Gundam Done
                    17:0x4, // Ball (Gundam) Done
                    18:0x6, // Dijeh (Z) Done
                    19:0x5,  // Methuss (ZZ) Done
                    20:0x1
                    }  
                    
CampaignBitFlagName1CC = { // 
                    0:"Still not supposed to appear",
                    1:"The Last Shooting", // Gundam Done
                    2:"Spy Hunter", // Guncannon Done
                    3:"Reliable & Solid", // Guntank Done
                    4:"Federation's Pride", // GM Done
                    5:"New Suits, Old Tricks", // Rick Dias Z Done
                    6:"The Comet's Prowess", // Hyaku Shiki Z Done
                    7:"Heir to the Stars", // Z Main Campaign Done
                    8:"Love Power", // Methuss Z Done
                    9:"Not Just an Upgrade", // Mk II Z Done
                    10:"Waverider Crash", // Zeta Gundam Done
                    11:"Leadership Potential", // Hyaku Shiki ZZ Done
                    12:"Friend Protector", // Mk II ZZ Done
                    13:"Neo Zeon's Ender", // ZZ Main Campaign Done
                    14:"Foxy Ace", // Zeta Gundam ZZ Done
                    15:"Built For Power", // ZZ Gundam Done
                    16:"Beyond the Time", // Nu Gundam Done
                    17:"Against All Odds", // Ball (Gundam) Done
                    18:"Tired of War", // Dijeh (Z) Done
                    19:"Short Lived Support",  // Methuss (ZZ) Done
                    20:"Red Comet's Tail"
                    }
                    
SurvivalBitFlagUnlockEasy = { // 3 Points survival mode unlock
                    0:bit0(0xc48c), // Gundam 
                    1:bit5(0xc48c), // Zeta Gundam Z
                    2:bit6(0xc48c), // Zeta Gundam ZZ
                    3:bit1(0xc48e), // Dijeh
                    4:bit2(0xc48e), // ZZ Gundam
                    5:bit3(0xc491), // Qubeley Haman
                    6:bit4(0xc491), // Qubeley Mk II Elpeo Ple
                    7:bit5(0xc491), // Qubeley Mk II Ple Two
                    8:bit7(0xc491), // Hizack
                    9:bit0(0xc492), // Hizack EFF Version
                    10:bit1(0xc492), // Hizack Custom
                    11:bit4(0xc493), // Byarlant Custom Colors
                    12:bit5(0xc493), // Byarlant
                    13:bit5(0xc494), // Bawoo (Glemy Toto)
                    14:bit6(0xc494), // Bawoo
                    15:bit4(0xc495), // Gazu-L
                    16:bit5(0xc495), // Gazu-R
                    17:bit5(0xc496), // Nu Gundam
                    18:bit6(0xc496), // Sazabi
                    19:bit7(0xc496), // Zock
                    20:bit0(0xc497), // Zeong
                    21:bit7(0xc497), // Zaku III
                    22:bit1(0xc498), // Geymark
                    23:bit3(0xc498), // Jagd Doga (Gyuney Guss)
                    24:bit4(0xc498), // Jagd Doga (Quess Paraya)
                    25:bit6(0xc498), // Elmeth
                    26:bit4(0xc499), // Gundam G3
                    27:bit6(0xc499)  // ZZ Gundam Enhanced
                   
                    }   
                    
SurvivalBitFlagNameEasy = { 
                    0:"Gundam",
                    1:"Zeta Gundam Z",
                    2:"Zeta Gundam ZZ",
                    3:"Dijeh",
                    4:"ZZ Gundam",
                    5:"Qubeley Haman",
                    6:"Qubeley Mk II Elpeo Ple",
                    7:"Qubeley Mk II Ple Two",
                    8:"Hizack",
                    9:"Hizack EFF Version",
                    10:"Hizack Custom",
                    11:"Byarlant Custom Colors",
                    12:"Byarlant",
                    13:"Bawoo (Glemy Toto)",
                    14:"Bawoo",
                    15:"Gazu-L",
                    16:"Gazu-R",
                    17:"Nu Gundam",
                    18:"Sazabi",
                    19:"Zock",
                    20:"Zeong",
                    21:"Zaku III",
                    22:"Geymark",
                    23:"Jagd Doga (Gyuney Guss)",
                    24:"Jagd Doga (Quess Paraya)",
                    25:"Elmeth",
                    26:"Gundam G3",
                    27:"ZZ Gundam Enhanced"
                    }  

SurvivalBitFlagUnlockMedium = { // 5 Points survival mode unlock
                    0:bit1(0xc48c), // Guncannon
                    1:bit3(0xc48c), // GM
                    2:bit0(0xc48d), // Gundam Mk II Titan Colors version
                    3:bit1(0xc48d), // Gundam Mk II Z version
                    4:bit2(0xc48d), // Gundam Mk II Super Gundam Z version
                    5:bit3(0xc48d), // Gundam Mk II (Elle Vianno) ZZ version
                    6:bit5(0xc48d), // Methus
                    7:bit6(0xc48d), // Hyaku Shiki Z version
                    8:bit7(0xc48d), // Hyaku Shiki ZZ version
                    9:bit0(0xc48e), // Rick Dias
                    10:bit3(0xc48e), // Re-GZ
                    11:bit5(0xc48e), // Zaku II (A)
                    12:bit6(0xc48e), // Zaku II (B)
                    13:bit7(0xc48e), // Zaku II (C)
                    14:bit0(0xc48f), // Zaku II Commander Type Char version
                    15:bit1(0xc48f), // Zaku II Commander Type White version
                    16:bit2(0xc48f), // Desert Zaku Blue version
                    17:bit3(0xc48f), // Desert Zaku
                    18:bit4(0xc48f), // Gouf
                    19:bit5(0xc48f), // Gouf (Ramba Ral)
                    20:bit6(0xc48f), // Rick Dom
                    21:bit7(0xc48f), // Rick Dom Space version
                    22:bit1(0xc490), // Z'Gok
                    23:bit2(0xc490), // Z'Gok Char version
                    24:bit4(0xc490), // Gyan
                    25:bit5(0xc490), // Gelgoog
                    26:bit6(0xc490), // Gelgoog Commander Type Char version
                    27:bit7(0xc490), // Gelgoog (Anavel Gato)
                    28:bit0(0xc491), // Gelgoog Commander Type Space Char version
                    29:bit1(0xc491), // Gelgoog Commander Type Space version
                    30:bit2(0xc491), // Bolinoak Sammahn
                    31:bit2(0xc492), // Base Jabber
                    32:bit3(0xc492), // GM II
                    33:bit4(0xc492), // GM Cannon
                    34:bit5(0xc492), // GM Sniper
                    35:bit6(0xc492), // Galbaldy Beta           
                    36:bit7(0xc492), // Marasai
                    37:bit2(0xc493), // Gabthley
                    38:bit6(0xc493), // Barzam
                    39:bit7(0xc493), // Gallus J
                    40:bit0(0xc494), // Zssa
                    41:bit1(0xc494), // Gaza C
                    42:bit3(0xc494), // Ga-Zowm
                    43:bit4(0xc494), // R-Jarja
                    44:bit7(0xc494), // Dowadge
                    45:bit0(0xc495), // Dowadge Custom
                    46:bit1(0xc495), // Sturm Dias
                    47:bit3(0xc495), // ReGelg
                    48:bit0(0xc496), // Jegan
                    49:bit1(0xc496), // Geara Doga Custom
                    50:bit2(0xc496), // Geara Doga
                    51:bit2(0xc497), // Messala
                    52:bit3(0xc497), // Pallas Athena
                    53:bit4(0xc497), // Hamma Hamma
                    54:bit5(0xc497), // Hamma Hamma Shield version
                    55:bit6(0xc497), // Dreissen
                    56:bit0(0xc498), // Zaku III Custom
                    57:bit2(0xc498), // Doven Wolf
                    58:bit1(0xc499), // Baund Doc (Gates Capa)
                    59:bit2(0xc499), // Baund Doc (Rosamia Badam)
                    60:bit3(0xc499), // Baund Doc (Jerid Messa)
                    61:bit5(0xc499), // Rick Dias Black version
                    62:bit0(0xc499) // The 0
                    }  

SurvivalBitFlagNameMedium = {
                    0:"Guncannon",
                    1:"GM",
                    2:"Gundam Mk II Titan Colors version",
                    3:"Gundam Mk II Z version",
                    4:"Gundam Mk II Super Gundam Z version",
                    5:"Gundam Mk II (Elle Vianno) ZZ version",
                    6:"Methus",
                    7:"Hyaku Shiki Z version",
                    8:"Hyaku Shiki ZZ version",
                    9:"Rick Dias",
                    10:"Re-GZ",
                    11:"Zaku II (A)",
                    12:"Zaku II (B)",
                    13:"Zaku II (C)",
                    14:"Zaku II Commander Type Char version",
                    15:"Zaku II Commander Type White version",
                    16:"Desert Zaku Blue version",
                    17:"Desert Zaku",
                    18:"Gouf",
                    19:"Gouf (Ramba Ral)",
                    20:"Rick Dom",
                    21:"Rick Dom Space version",
                    22:"Z'Gok",
                    23:"Z'Gok Char version",
                    24:"Gyan",
                    25:"Gelgoog",
                    26:"Gelgoog Commander Type Char version",
                    27:"Gelgoog (Anavel Gato)",
                    28:"Gelgoog Commander Type Space Char version",
                    29:"Gelgoog Commander Type Space version",
                    30:"Bolinoak Sammahn",
                    31:"Base Jabber",
                    32:"GM II",
                    33:"GM Cannon",
                    34:"GM Sniper",
                    35:"Galbaldy Beta",           
                    36:"Marasai",
                    37:"Gabthley",
                    38:"Barzam",
                    39:"Gallus J",
                    40:"Zssa",
                    41:"Gaza C",
                    42:"Ga-Zowm",
                    43:"R-Jarja",
                    44:"Dowadge",
                    45:"Dowadge Custom",
                    46:"Sturm Dias",
                    47:"ReGelg",
                    48:"Jegan",
                    49:"Geara Doga Custom",
                    50:"Geara Doga",
                    51:"Messala",
                    52:"Pallas Athena",
                    53:"Hamma Hamma",
                    54:"Hamma Hamma Shield version",
                    55:"Dreissen",
                    56:"Zaku III Custom",
                    57:"Doven Wolf",
                    58:"Baund Doc (Gates Capa)",
                    59:"Baund Doc (Rosamia Badam)",
                    60:"Baund Doc (Jerid Messa)",
                    61:"Rick Dias Black version",
                    62:"The 0"
                    }  

SurvivalBitFlagUnlockHard = { // 10 Points survival mode unlock
                    0:bit2(0xc48c), // Guntank 
                    1:bit4(0xc48c), // Ball
                    2:bit4(0xc48e), // Zaku I
                    3:bit0(0xc490), // Gogg
                    4:bit3(0xc490), // Acguy
                    5:bit0(0xc493), // Gaplant
                    6:bit1(0xc493), // Asshimar
                    7:bit3(0xc493), // Hambrabi
                    8:bit2(0xc494), // Gaza D
                    9:bit2(0xc495), // Jamru Fin
                    10:bit6(0xc495), // Geze
                    11:bit7(0xc495), // Geze (Yazan)
                    12:bit3(0xc496), // Small Mobile Suit
                    13:bit4(0xc496), // Medium Mobile Suit
                    14:bit1(0xc497), // Zakrello
                    15:bit5(0xc498), // Grublo
                    16:bit7(0xc498), // Bygro
                    }                       
                    
SurvivalBitFlagNameHard = { 
                    0:"Guntank",
                    1:"Ball",
                    2:"Zaku I",
                    3:"Gogg",
                    4:"Acguy",
                    5:"Gaplant",
                    6:"Asshimar",
                    7:"Hambrabi",
                    8:"Gaza D",
                    9:"Jamru Fin",
                    10:"Geze",
                    11:"Geze (Yazan)",
                    12:"Small Mobile Suit",
                    13:"Medium Mobile Suit",
                    14:"Zakrello",
                    15:"Grublo",
                    16:"Bygro"                    
                    }                      
//----------------
//Variable

LifeCounter = byte(0xc07a)  // 0 on emulator reset, 3 on start campaign, 1>3 on game over
CursorPosition = byte(0xc360) // Only useable for single session, value stays in memory while playing but reset on main menu and doesn't shift in Continue selection.
MechID = byte(0xd203) 
ModeSelected = byte(0xc46a)
CampaignMode = ModeSelected == 0 // 0 on new game from start, 1 on continue
ContinueMode = ModeSelected == 1
VSMode = ModeSelected == 2
SurvivalMode = ModeSelected == 3
CreditRoll = byte(0xc49e) // Part of the countdown that start on credit roll until you're back on the main menu
CursorID = byte(0xc360) //Stay fixed during gameplay, can be used for duplicate ID campaign issues
MainMenuTimer = byte(0x00c372) // Only Active on the main menu, frozen in Campaign


//----------------
//Function
function Continue() => LifeCounter == 0x3 && prev(LifeCounter) == 0x1 // Goes from 1 to 3 on Game Over, without being set to 0
function CreditCheck() => repeated(10,CreditRoll != prev(CreditRoll))// && never(repeated(10,CreditRoll == prev(CreditRoll)))// While in campaign mode, check that the CreditRoll value change for 10 frames > Only happen on end of campaign. Should be short enough to still trigger if players spam the button to skip the credits
                                                                                                                           // Reset the hits if credits are not rolling for 10frames, should prevent false positive triggers
function CheevoCampaignClear(variable,points)
{
    achievement(title = CampaignBitFlagName[variable],
                description = "Pilot the " + CampaignBitFlagDescription[variable] + " and complete the campaign scenario",
                points = points,
                trigger = 
                (CampaignMode || ContinueMode) // Straight Campaign or Continue OK
                && prev(CampaignBitFlagUnlock[variable]) == 0 // Bitflag Off
                && CampaignBitFlagUnlock[variable] == 1 // Bitflag On
                )
}

function CheevoCampaignClearSazabi() // Sazabi being the very last unlock in the game has no bitflag associated
{
    achievement(title = CampaignBitFlagName[20],
                description = "Pilot the " + CampaignBitFlagDescription[20] + " and complete the campaign scenario",
                points = Easy,
                trigger = 
                (CampaignMode || ContinueMode) // Straight Campaign or Continue OK
                && CreditCheck() // Checking for credit rolls due to lack of associated bitflags
                && MechID == CampaignMechID1CC[20] // Samething, checking for the mech ID
                )
}

function CheevoCampaignClear1CC(variable,points)
{
    achievement(title = CampaignBitFlagName1CC[variable],
                description = "Pilot the " + CampaignBitFlagDescription[variable] + " and complete the campaign scenario [No Game Over, No Continue]. Reset Emulator or Select a different mode once to retry.",
                points = points,
                trigger = 
                CampaignMode
                && never(repeated(10,MainMenuTimer != prev(MainMenuTimer)))
                && once(CursorID == CampaignCursorPos1CC[variable] && MechID == CampaignMechID1CC[variable])
                && CreditCheck() // Potentially unlock already done so check for the credit rolls
                && disable_when(Continue(), until=(ModeSelected != 0) ) // Freeze achievement on Game Over, Reset by moving around in the main menu
                )
}

function CheevoSurvivalEasy(variable)
{
    achievement(title = "Survival Mode: " + SurvivalBitFlagNameEasy[variable],
                description = "Complete the Survival Mode with the " + SurvivalBitFlagNameEasy[variable] ,
                points = Baby,
                trigger = 
                SurvivalMode // Survival Mode
                && prev(SurvivalBitFlagUnlockEasy[variable]) == 0 // Bitflag Off
                && SurvivalBitFlagUnlockEasy[variable] == 1 // Bitflag On
                )
}

function CheevoSurvivalMedium(variable)
{
    achievement(title = "Survival Mode: " + SurvivalBitFlagNameMedium[variable],
                description = "Complete the Survival Mode with the " + SurvivalBitFlagNameMedium[variable] ,
                points = Easy,
                trigger = 
                SurvivalMode // Survival Mode
                && prev(SurvivalBitFlagUnlockMedium[variable]) == 0 // Bitflag Off
                && SurvivalBitFlagUnlockMedium[variable] == 1 // Bitflag On
                )
}

function CheevoSurvivalHard(variable)
{
    achievement(title = "Survival Mode: " + SurvivalBitFlagNameHard[variable],
                description = "Complete the Survival Mode with the " + SurvivalBitFlagNameHard[variable] ,
                points = Medium,
                trigger = 
                SurvivalMode // Survival Mode
                && prev(SurvivalBitFlagUnlockHard[variable]) == 0 // Bitflag Off
                && SurvivalBitFlagUnlockHard[variable] == 1 // Bitflag On
                )
}
//----------------

///Achievement Code
// Progression
// Misc Challenge
// --- --- --- UC Campaign Clear
// Gundam 79' Era
for i in range(1,2)
    CheevoCampaignClear(i,Medium)
CheevoCampaignClear(3,Hard)
CheevoCampaignClear(4,Medium)
CheevoCampaignClear(17,Hard)
    
// Zeta Era
CheevoCampaignClear(7,Medium)
CheevoCampaignClear(6,Medium)
CheevoCampaignClear(9,Medium)
CheevoCampaignClear(8,Medium)
CheevoCampaignClear(5,Medium)
CheevoCampaignClear(10,Medium)
CheevoCampaignClear(18,Baby)

// ZZ Era
CheevoCampaignClear(13,Medium)
CheevoCampaignClear(12,Medium)
CheevoCampaignClear(14,Medium)
CheevoCampaignClear(11,Medium)
CheevoCampaignClear(15,Medium)
CheevoCampaignClear(19,Easy)

// CCA Era
CheevoCampaignClear(16,Medium)
CheevoCampaignClearSazabi()
// --- --- --- UC Campaign Clear 1CC
for i in range(1,2)
    CheevoCampaignClear1CC(i,Medium)
CheevoCampaignClear1CC(3,Hard)
CheevoCampaignClear1CC(4,Medium)
CheevoCampaignClear1CC(17,Hard)
    
// Zeta Era
CheevoCampaignClear1CC(7,Medium)
CheevoCampaignClear1CC(6,Medium)
CheevoCampaignClear1CC(9,Medium)
CheevoCampaignClear1CC(8,Medium)
CheevoCampaignClear1CC(5,Medium)
CheevoCampaignClear1CC(10,Medium)
CheevoCampaignClear1CC(18,Baby)

// ZZ Era
CheevoCampaignClear1CC(13,Medium)
CheevoCampaignClear1CC(12,Medium)
CheevoCampaignClear1CC(14,Medium)
CheevoCampaignClear1CC(11,Medium)
CheevoCampaignClear1CC(15,Medium)
CheevoCampaignClear1CC(19,Easy)

// CCA Era
CheevoCampaignClear1CC(16,Medium)
CheevoCampaignClear1CC(20,Medium)
// --- --- --- Survival    
for i in range(0,27)
    CheevoSurvivalEasy(i)
    
for i in range(0,62)
    CheevoSurvivalMedium(i)    

for i in range(0,16)
    CheevoSurvivalHard(i) 

//----------------
//Misc Challenge         

//----------------

