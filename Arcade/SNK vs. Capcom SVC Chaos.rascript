// SNK vs. Capcom: SVC Chaos
// #ID = 11769
// 20230917 Version - Sines

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



// $009C: LANGUAGE - AES
//        
//        00=Japonese
//        01=English
//        02=None
//        03=Spanish
// $009F: DIFFICULTY - AES
//        
//        00=Beginner
//        01=Easy
//        02=Normal (Default AES)
//        03=Arcade
//        04=Hard
//        05=Very Hard
//        06=Hardest
//        07=Expert
// $00A9: Config, Flash: ON=01, OFF=00
// $0104: SCREEN ID [16-Bits]
//        
//        0x1280=Select Player
//        0x0B00=Demo Game
//        0x0380=Mode Select
//        0x600=In Game
// $1352: Player 2, Character (Menu Only)
//        Player 2, Previous Gauge Level: 1-2
// $1353: Player 2, Current Gauge Level: 1-3
// $1369: Player 2, Gauge: 21=Start, 62=Maximum
// $15D2: Player 1, Character (Menu Only)
//        Player 1, Previous Gauge Level: 1-2
// $15D3: Player 1, Current Gauge Level: 1-3
// $15E9: Player 1, Gauge: 21=Start, 62=Maximum
// $A170: 1P CHAR IN GAME
// $A172: 1P - ANIMATION CHAR [16-Bits]
// $A193: FLAG BOMB
// $A1E9: P1 Gauge [Main]
// $A1EE: 1P LAST MOVE - [16 bit]
// $A238: PLAYER 1 - HP
//        
//        e0 = Full
//        01 = Slow
//        ff = K.O
// $A239: PLAYER 1 - HP K.O
// $A2B1: Player 1, Combo receiving from Opponent: 00 INC
// $A2E3: Player 1, Combo do to Opponent: FF DEC
// $A469: P2 Gauge [Main]
// $A4B8: CPU/P2 - HP
//        
//        e0 = Full
//        01 = Slow
//        ff = K.O
// $A4B9: CPU/P2 - HP FLAG K.O
// $A531: P1 Combo Hits
// $A556: FLAG EXPLOSION
// $A563: Player 2, Combo do to Opponent: FF DEC
// $A618: Config, Difficulty: 00-07
// $A619: Config, Difficulty: 00-07
// $A650: Config, Language: Jap=00, Eng=01, Spa=02
// $A651: Config, Language: Jap=00, Eng=01, Spa=02
// $A654: Config, Flash: ON=01, OFF=00
// $A655: Config, Flash: ON=01, OFF=00
// $AB98: Ingame, Time Attack: 0X0000
// $AB99: Ingame, Time Attack: X00000
// $AB9D: Ingame, Time Attack: 000X00
// $AB9E: Ingame, Time Attack: 00000X
// $AB9F: Ingame, Time Attack: 0000X0
// $ABDC: ARCADE PROGRESSION
//        
//        Each Stage completes a Bit is added
//        00 = STAGE 1
//        07=STAGE FINAL
//        08=ENDING GAME
// $ABDD: THE STAGES
//        
//        00=CITY DESERT
//        01=RAILWAY
//        02=CASTLE
//        03=FOREST
//        04=TEMPLE
//        05=ELECTRIC
//        06=GOUKI STAGE
//        07=WINDOW ATHENA
//        09=PRSON
// $AC15: TIME IN GAME
// $AC16: FLAGS IN BATTLE
//        
//        08/Bit3 = Fiighting
//        80/Bit7 = Match Over
// $AC22: MODE SELECT
//        
//        00=ARCADE
//        02=VERSUS
//        06=PRACTICE
// $AC23: INDICATOR BIOS
//        
//        Not consistent, don't use this.
//        
//        00=AES
//        02=MVS
// $AC31: 1P SELECT CHARATER
// $AC38: MARK VICTORY ROUND 2
//        
//        S=12
//        Sp=32
//        Sb=92
//        SS=13
//        SSp=33
//        SSb=93
//        V=11
//        Vp=31
//        Ex=14
// $AC39: MARK VICTORY ROUND 1
//        
//        S=12
//        Sp=32
//        Sb=92
//        SS=13
//        SSp=33
//        SSb=93
//        V=11
//        Vp=31
//        Ex=14
// $AC55: CPU/P2 - CHARATER IN GAME
// $AC58: 1P - ROUNDS WIN
// $AC59: CPU - ROUNDS WIN
// $CD6D: Select Screen, Timer: XX
// $CD6E: Select Screen, Timer: 0X
// $CD6F: Select Screen, Timer: X0
// $CD7C: Title Screen: FF=Passed
// $FD83: MVS Active Flag (bit7)
// $FD8A: SETTING SOFT DIP - MVS
//        (Demo Sound)
// $FD8B: SETTING SOFT DIP - MVS
//        (Play Time)
// $FD8C: SETTING SOFT DIP - MVS
//        (Difficulty)
// $FD8D: SETTING SOFT DIP - MVS
//        (Manual)
// $FD8E: SETTING SOFT DIP - MVS
//        (Game Mode)
// $FD8F: Config MVS, Credit/Level: 00-03
// $FD90: Config MVS, Blood/Flash: 00-03
// $FD91: Config MVS, Cont.Service: 00-02
// $FD92: Config MVS, Country : Other=00, USA=01
// $FD93: Config MVS, Language: Eng=00, Spa=01
// $FDB6: P2 - PLAYER
//        
//        00=Inative
//        01=Active
//        02=Continue
//        03=Game Over
// $FDB7: P1 - PLAYER
//        
//        00=Inactive
//        01=Active
//        02=Continue
//        03=Game Over
// $FE30: UNIBIOS - [32-Bits]
// $FFFE: Sheet - Character ID
//        
//        00=Kyo
//        01=Iori
//        02=Ryo
//        03=Terry
//        04=Mai
//        05=Kasumi
//        06=Kim
//        07=Mr.Karate
//        08=Choi
//        09=Erathqueke
//        0a=Gemjuvad
//        0b=Shiki
//        10=Ryo
//        11=Ken
//        12=Chun-Li
//        13=Guile
//        19=Gouki
//        14=Dhalsim
//        15=M.Bison (Balrog)
//        17=Sagat
//        18=Vega (M.Bison)
//        16=Balrog (Vega)
//        1a=Hugo
//        1b=Tabasa (Tessa)
//        1d=Demitri
//        0c=Geese
//        0d=Mars People
//        1c=Zero
//        0e=Goenitz
//        20=Orochi Iori
//        21=Mr Karate
//        0f=Athena
//        1e=Dan
//        22=Violet Ken
//        23=Shin Akuma
//        1f=Red Arremer

///Core
//Constant
//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CharID = { 
                    0:0x00,
                    1:0x01, 
                    2:0x02, 
                    3:0x03, 
                    4:0x04, 
                    5:0x05,
                    6:0x06, 
                    7:0x07,  
                    8:0x08, 
                    9:0x09, 
                    10:0x0a,
                    11:0x0b,
                    12:0x0c, 
                    13:0x0d, 
                    14:0x0e,
                    15:0x0f,
                    16:0x10,
                    17:0x11,
                    18:0x12,
                    19:0x13,
                    20:0x14,
                    21:0x15,
                    22:0x16,
                    23:0x17,
                    24:0x18,
                    25:0x19,
                    26:0x1a,
                    27:0x1b,
                    28:0x1c,
                    29:0x1d,
                    30:0x1e,
                    31:0x1f,
                    32:0x20,
                    33:0x21,
                    34:0x22,
                    35:0x23

                    }  
                    
                    
CharName = { 
                    0:"Kyo",
                    1:"Iori", 
                    2:"Ryo", 
                    3:"Terry", 
                    4:"Mai", 
                    5:"Kasumi", 
                    6:"Kim", 
                    7:"Mr. Karate",  
                    8:"Choi", 
                    9:"Earthquake", 
                    10:"Genjyuro",
                    11:"Shiki",
                    12:"Geese", 
                    13:"Mars People", 
                    14:"Goenitz",
                    15:"Athena NOT PLAYABLE",
                    16:"Ryu",
                    17:"Ken",
                    18:"Chun-Li",
                    19:"Guile",
                    20:"Dhalsim",
                    21:"Balrog (Boxer)",
                    22:"Vega (Claw)",
                    23:"Sagat",
                    24:"M.Bison (Dictator)",
                    25:"Akuma",
                    26:"Hugo",
                    27:"Tessa",
                    28:"Zero",
                    29:"Demitri",
                    30:"Dan",
                    31:"Red Arremer NOT PLAYABLE",
                    32:"Orochi Iori",
                    33:"Serious Mr Karate",
                    34:"Violent Ken",
                    35:"Shin Akuma"

                    } 
                    
                    
CheevProgTitle  = { 
                    0:"Kusanagi Heir",
                    1:"Violent Flame", 
                    2:"Invincible Dragon", 
                    3:"Hungry Wolf", 
                    4:"Alluring Ninja", 
                    5:"Grappling Beauty", 
                    6:"Defender of Justice", 
                    7:"Mysterious Tengu",  
                    8:"Dream Hunter", 
                    9:"Bulking Oni", 
                    10:"Hanafuda Slayer",
                    11:"Serpent Servant",
                    12:"Charismatic Evil", 
                    13:"Coming In Peace", 
                    14:"Heavenly Leader",
                    15:"Athena NOT PLAYABLE",
                    16:"That Guy from the Streets",
                    17:"Eternal Rival",
                    18:"Interpol Spinning Top",
                    19:"Merica",
                    20:"Stretchy Shaman",
                    21:"Fight Money",
                    22:"Spaniard's Vanity",
                    23:"Emperor of Thai",
                    24:"Psycho Powers",
                    25:"Power is Everything",
                    26:"Overwhelming Muscles",
                    27:"90% Hat",
                    28:"What is he Fighting For ?",
                    29:"Makai's Terror",
                    30:"Pink Shoto",
                    31:"Red Arremer NOT PLAYABLE",
                    32:"Serpent Corruption",
                    33:"No More Mr. Nice Karate",
                    34:"Bottled Anger",
                    35:"True Despair"

                    }                      
                    
                    
//----------------
//Variable
ScreenID = word(0x104) 
InGame = ScreenID == 0x600
CharSelect = ScreenID == 0x1280
P1CharID = byte(0xa170)
ArcadeProgFlag = byte(0xabdc) // 00 Stage 1 > 07 Final Stage > 08 Game Clear > 09 bonus fight (not counted in arcade clear)
ModeSelect = byte(0xac22) // 00 Arcade
P1State = byte(0xfdb7) // 00 Inactive > 01 Active > 02 Continue > 03 Game Over
P2State = byte(0xfdb6)


//----------------
//Function 
function ArcadeWon() => ArcadeProgFlag == 8 && prev(ArcadeProgFlag) == 7

function ArcadeProg(Character)
{
    achievement(title = CheevProgTitle[Character],
                description = "Complete Arcade mode with "+ CharName[Character] + " [Any Difficulty, No Char switching on Continue]",
                points = 5,
                trigger = ModeSelect == 0
                       && P1CharID == Character
                       && ArcadeWon()
                       && once(P1CharID == Character && CharSelect && ArcadeProgFlag == 0) // Start of arcade mode
                       && never(P1CharID != Character && InGame) // Reset for chosing another fighter and being in game
                       && P1State == 1
                       && never(P2State != 0)
                       && never(P1State == 3) // reset on Game Over
                )
}    



//----------------
///Achievement Code
// Progression

/// --- --- ---
///   Arcade
for i in range (0,14)
ArcadeProg(i)

for i in range (16,30)
ArcadeProg(i)

for i in range (32,35)
ArcadeProg(i)

















             