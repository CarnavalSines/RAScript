// Super Robot Pinball
// #ID = 15635

// 20230529 Version - Sines

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

// $C000: [8 Bit] Bitflag Endless Mode
//        Bit 0 | Endless Mode Table 1 available
//        Bit 1 | Endless Mode Table 2 available
// $C003: [8 Bit] Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C004: [8 Bit] Guncannon Data
//        0x00 > No data
//        0x80 > Data
// $C005: [8 Bit] Guntank Data
//        0x00 > No data
//        0x80 > Data
// $C006: [8 Bit] Gundam Mk II Data
//        0x00 > No data
//        0x80 > Data
// $C007: [8 Bit] Hyaku Shiki Data
//        0x00 > No data
//        0x80 > Data
// $C008: [8 Bit] Zeta Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C009: [8 Bit] ZZ Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C00A: [8 Bit] Nu Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C00C: [8 Bit] Gundam Wing Data
//        0x00 > No data
//        0x80 > Data
// $C00D: [8 Bit] Deathscythe Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C00E: [8 Bit] Heavyarms Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C00F: [8 Bit] Sandrock Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C010: [8 Bit] Shenlong Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C011: [8 Bit] Wing Zero Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C012: [8 Bit] Xabungle Data
//        0x00 > No data
//        0x80 > Data
// $C013: [8 Bit] Walker Gallia Data
//        0x00 > No data
//        0x80 > Data
// $C014: [8 Bit] Dunbine Data
//        0x00 > No data
//        0x80 > Data
// $C015: [8 Bit] Billbine Data
//        0x00 > No data
//        0x80 > Data
// $C016: [8 Bit] L-Gaim Data
//        0x00 > No data
//        0x80 > Data
// $C017: [8 Bit] L-Gaim Mk II Data
//        0x00 > No data
//        0x80 > Data
// $C018: [8 Bit] Daitarn 3 Data
//        0x00 > No data
//        0x80 > Data
// $C019: [8 Bit] Zambot 3 Data
//        0x00 > No data
//        0x80 > Data
// $C01A: [8 Bit] Mazinger Z Data
//        0x00 > No data
//        0x80 > Data
// $C01B: [8 Bit] Great Mazinger Data
//        0x00 > No data
//        0x80 > Data
// $C01C: [8 Bit] Grendizer Data
//        0x00 > No data
//        0x80 > Data
// $C01D: [8 Bit] Getter 1 Data
//        0x00 > No data
//        0x80 > Data
// $C01E: [8 Bit] Getter 2 Data
//        0x00 > No data
//        0x80 > Data
// $C01F: [8 Bit] Getter 3 Data
//        0x00 > No data
//        0x80 > Data
// $C020: [8 Bit] Getter Dragon Data
//        0x00 > No data
//        0x80 > Data
// $C021: [8 Bit] Getter Liger Data
//        0x00 > No data
//        0x80 > Data
// $C022: [8 Bit] Getter Poseidon Data
//        0x00 > No data
//        0x80 > Data
// $C023: [8 Bit] Shin Getter 1 Data
//        0x00 > No data
//        0x80 > Data
// $C024: [8 Bit] Shin Getter 2 Data
//        0x00 > No data
//        0x80 > Data
// $C025: [8 Bit] Shin Getter 3 Data
//        0x00 > No data
//        0x80 > Data
// $C026: [8 Bit] Combatler V Data
//        0x00 > No data
//        0x80 > Data
// $C027: [8 Bit] Voltes V Data
//        0x00 > No data
//        0x80 > Data
// $C028: [8 Bit] Dancouga Data
//        0x00 > No data
//        0x80 > Data
// $C02A: [8 Bit] Raideen Data
//        0x00 > No data
//        0x80 > Data
// $C02B: [8 Bit] EVA - 00 Data
//        0x00 > No data
//        0x80 > Data
// $C02C: [8 Bit] EVA - 01 Data
//        0x00 > No data
//        0x80 > Data
// $C02D: [8 Bit] EVA - 02 Data
//        0x00 > No data
//        0x80 > Data
// $C02E: [8 Bit] Zeong Data
//        0x00 > No data
//        0x80 > Data
// $C030: [8 Bit] Qubeley Data
//        0x00 > No data
//        0x80 > Data
// $C031: [8 Bit] The 0 Data
//        0x00 > No data
//        0x80 > Data
// $C032: [8 Bit] Psycho Gundam Data
//        0x00 > No data
//        0x80 > Data
// $C034: [8 Bit] Hamma Hamma Data
//        0x00 > No data
//        0x80 > Data
// $C035: [8 Bit] Queen Mansa Data
//        0x00 > No data
//        0x80 > Data
// $C036: [8 Bit] Geymalk Data
//        0x00 > No data
//        0x80 > Data
// $C037: [8 Bit] Zaku III Data
//        0x00 > No data
//        0x80 > Data
// $C039: [8 Bit] Alpha Azieru Data
//        0x00 > No data
//        0x80 > Data
// $C03A: [8 Bit] Sazabi Data
//        0x00 > No data
//        0x80 > Data
// $C03B: [8 Bit] Jagd Doga Data
//        0x00 > No data
//        0x80 > Data
// $C03C: [8 Bit] Epyon Data
//        0x00 > No data
//        0x80 > Data
// $C03D: [8 Bit] Government Data
//        0x00 > No data
//        0x80 > Data
// $C03E: [8 Bit] Doran Data
//        0x00 > No data
//        0x80 > Data
// $C03F: [8 Bit] Brockary Data
//        0x00 > No data
//        0x80 > Data
// $C040: [8 Bit] Gallaba Data
//        0x00 > No data
//        0x80 > Data
// $C041: [8 Bit] Leprechaun Data
//        0x00 > No data
//        0x80 > Data
// $C043: [8 Bit] Zwarth Data
//        0x00 > No data
//        0x80 > Data
// $C044: [8 Bit] Ashura Temple Data
//        0x00 > No data
//        0x80 > Data
// $C045: [8 Bit] A-Taul V Data
//        0x00 > No data
//        0x80 > Data
// $C046: [8 Bit] Auge Data
//        0x00 > No data
//        0x80 > Data
// $C047: [8 Bit] Don Zauser Data
//        0x00 > No data
//        0x80 > Data
// $C049: [8 Bit] Benmel Data
//        0x00 > No data
//        0x80 > Data
// $C04A: [8 Bit] Mileena Data
//        0x00 > No data
//        0x80 > Data
// $C04C: [8 Bit] Bandok Data
//        0x00 > No data
//        0x80 > Data
// $C04D: [8 Bit] Heldyne Data
//        0x00 > No data
//        0x80 > Data
// $C04E: [8 Bit] Deathcain Data
//        0x00 > No data
//        0x80 > Data
// $C04F: [8 Bit] Jenoba M9 Data
//        0x00 > No data
//        0x80 > Data
// $C051: [8 Bit] Rhine X1 Data
//        0x00 > No data
//        0x80 > Data
// $C052: [8 Bit] Gusios Beta III Data
//        0x00 > No data
//        0x80 > Data
// $C053: [8 Bit] Dark General Data
//        0x00 > No data
//        0x80 > Data
// $C054: [8 Bit] Marquis Janus Data
//        0x00 > No data
//        0x80 > Data
// $C055: [8 Bit] Pikadron Data
//        0x00 > No data
//        0x80 > Data
// $C057: [8 Bit] Gingin Data
//        0x00 > No data
//        0x80 > Data
// $C059: [8 Bit] King Gori Data
//        0x00 > No data
//        0x80 > Data
// $C05A: [8 Bit] Gilgilgan Data
//        0x00 > No data
//        0x80 > Data
// $C05B: [8 Bit] Battleship Dai Data
//        0x00 > No data
//        0x80 > Data
// $C05C: [8 Bit] Sigu Data
//        0x00 > No data
//        0x80 > Data
// $C05E: [8 Bit] Kochouki Data
//        0x00 > No data
//        0x80 > Data
// $C05F: [8 Bit] Tekkouki Data
//        0x00 > No data
//        0x80 > Data
// $C061: [8 Bit] Dragonsaurus Data
//        0x00 > No data
//        0x80 > Data
// $C063: [8 Bit] Gyukenki Data
//        0x00 > No data
//        0x80 > Data
// $C064: [8 Bit] Big Garuda Data
//        0x00 > No data
//        0x80 > Data
// $C066: [8 Bit] Magma Demon Data
//        0x00 > No data
//        0x80 > Data
// $C067: [8 Bit] Orleana Data
//        0x00 > No data
//        0x80 > Data
// $C068: [8 Bit] Big Sirius Data
//        0x00 > No data
//        0x80 > Data
// $C069: [8 Bit] Skullrook Data
//        0x00 > No data
//        0x80 > Data
// $C06A: [8 Bit] Godor Data
//        0x00 > No data
//        0x80 > Data
// $C06C: [8 Bit] Namazungo Data
//        0x00 > No data
//        0x80 > Data
// $C06D: [8 Bit] Desire Data
//        0x00 > No data
//        0x80 > Data
// $C06E: [8 Bit] Fake Dancouga Data
//        0x00 > No data
//        0x80 > Data
// $C06F: [8 Bit] Zan Gaioh Data
//        0x00 > No data
//        0x80 > Data
// $C070: [8 Bit] Zorbados Data
//        0x00 > No data
//        0x80 > Data
// $C072: [8 Bit] Giant Sharkin Data
//        0x00 > No data
//        0x80 > Data
// $C073: [8 Bit] Gante Data
//        0x00 > No data
//        0x80 > Data
// $C074: [8 Bit] Barao Data
//        0x00 > No data
//        0x80 > Data
// $C075: [8 Bit] Sachiel Data
//        0x00 > No data
//        0x80 > Data
// $C077: [8 Bit] Zeruel Data
//        0x00 > No data
//        0x80 > Data
// $C078: [8 Bit] Desta Data - Table 1 boss
//        0x00 > No data
//        0x80 > Data
// $C079: [8 Bit] Pushkul Data - Table 2 boss
//        0x00 > No data
//        0x80 > Data
// $C07A: [8 Bit] Obu Data
//        0x00 > No data
//        0x80 > Data
// $C500: [8 Bit] Pinball Screen ID
//        00 > Main menu and Table 1
//        01 > Table 2
//        06 > Boss Fight Arena Table 2
//        07 > Boss Fight Arena Table 1
//        08 > Unique Boss Fight
// $C531: [32 Bit] Table High Score
// $C5B6: [8 Bit] Life Counter
// $C5C4: [8 Bit] Currently Scrambled Mech > Menu select value, do not use
//        Persist until new game or new scramble
//        00 > Raideen
//        01 > EVA-01
//        02 > Mazinger Z
//        03 > Combatler V
//        04 > Gundam
//        05 > Dancouga
//        06 > ZZ Gundam
// $C5F5: [8 Bit] Boss de-spawn timer
// $C6E0: [8 Bit] Number of Shot Down Enemies
// $C6E2: [8 Bit] Position 1 of enemy shot, each sprite has it's own ID (not noted because not usefull)
// $C830: [8 Bit] Current Mech being used
//        Value change on Scramble and consulting the Library entries
//        Persist until new scramble or new game
//        00 > Gundam
//        01 > Guncannon
//        02 > Guntank
//        03 > Gundam Mk II
//        04 > Hyaku Shiki
//        05 > Zeta Gundam
//        06 > ZZ Gundam
//        07 > Nu Gundam
//        08 > No number in library
//        09 > Gundam Wing
//        0a > Deatscythe Gundam
//        0b > Heavyarms Gundam
//        0c > Sandrock Gundam
//        0d > Shenlong Gundam
//        0e > Wing Zero Gundam
//        0f > Xabungle
//        10 > Walker Gallia
//        11 > Dunbine
//        12 > Billbine
//        13 > L-Gaim
//        14 > L-Gaim Mk II
//        15 > Daitarn 3
//        16 > Zambot 3
//        17 > Mazinger Z
//        18 > Great Mazinger
//        19 > Grendizer
//        1a > Getter 1
//        1b > Getter 2
//        1c > Getter 3
//        1d > Getter Dragon
//        1e > Getter Liger
//        1f > Getter Poseidon
//        20 > Shin Getter 1
//        21 > Shin Getter 2
//        22 > Shin Getter 3
//        23 > Combatler V
//        24 > Voltes V
//        25 > Dancouga
//        26 > No number in library
//        27 > Raideen
//        28 > EVA - 00
//        29 > EVA - 01
//        2a > EVA - 02
// $C832: [16 Bit] Player Health
//        Can be used to detect spawn
//        Stay at > 0 on boss kill
// $C8B4: [8 Bit] Current Boss fight
//        Value change on new boss and consulting the Library entries
//        Persist until new boss or new game
// $C8B7: [16 Bit] Boss Health
//        Can be used to detect spawn
//        delta health > 0 && health = 0 && boss timer > 0
//        then boss defeated
// $C958: [16 Bit] Unique Boss Fights Health (End of Table 1/2/Game bosses)
// $CA41: [8 Bit] Super Start flag detection
//        00 > No
//        01 > Yes
//        Press A on the last light lighting up at the start of a new ball
// $CB0A: [16 Bit] Mode indicator
//        Really two 8bit value next to each other but the indicator are context sensitive so it's easier to note them this way
//        0xHcb0a is the main Mode
//        0xHcb0b is the sub-mode associated
//        --- --- ---
//        0x0103 > Main Menu start
//        0x0203 > Main Menu select
//        
//        0x0104 > Pinball Start
//        0x0204 > Regular Pinball Play
//        0x0304 > End of Ball Bonus (Lost ball)
//        0x0404 > End of Ball Bonus Point Recap
//        0x0704 > Enemy Mech spawn || Also Scramble Phase
//        0x0804 > Pause during Pinball
//        0x0109 > Game Over Result Screen
//        
//        --- --- ---
//        0x0108 > Endless Mode Stage Select
// $CB8A: [8 Bit] Main Menu Select
//        00 > Normal
//        01 > Continue
//        02 > Endless Mode
//        03 > Library
//        04 > High Score
// $CC3D: [32 Bit] Normal Table Score 1
// $CC43: [8 Bit] Normal Table Score 1 Letter 1
//        00 > Empty (Only when inputting a new name)
//        01 > 0
//        02 > 1
//        03 > 2
//        04 > 3
//        05 > 4
//        06 > 5
//        07 > 6
//        08 > 7
//        09 > 8
//        0a > 9
//        0b > A
//        0c > B
//        0d > C
//        0e > D
//        0f > E
//        10 > F
//        11 > G
//        12 > H
//        13 > I
//        14 > J
//        15 > K
//        16 > L
//        17 > M
//        18 > N
//        19 > O
//        1a > P
//        1b > Q
//        1c > R
//        1d > S
//        1e > T
//        1f > U
//        20 > V
//        21 > W
//        22 > X
//        23 > Y
//        24 > Z
//        25 > .
//        26 > !
//        27 > ?
//        28 > Heart
//        29 > Star
// $CC44: [8 Bit] Normal Table Score 1 Letter 2
// $CC45: [8 Bit] Normal Table Score 1 Letter 3
// $CC4D: [32 Bit] Normal Table Score 2
// $CC5D: [32 Bit] Normal Table Score 3
// $CC6D: [32 Bit] Normal Table Score 4
// $CC7D: [32 Bit] Normal Table Score 5
// $CC8D: [32 Bit] First Table Score 1
// $CC9D: [32 Bit] First Table Score 2
// $CCAD: [32 Bit] First Table Score 3
// $CCBD: [32 Bit] First Table Score 4
// $CCCD: [32 Bit] First Table Score 5
// $CCDD: [32 Bit] Second Table Score 1
// $CCED: [32 Bit] Second Table Score 2
// $CCFD: [32 Bit] Second Table Score 3
// $CD0D: [32 Bit] Second Table Score 4
// $CD1D: [32 Bit] Second Table Score 5


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
RoundIndicator = byte(0xcae1) // Number of loop in the Normal Mode
MenuSelect = byte(0xcb8a)

EndlessModeFlags = byte(0xc000)
PinballScreenID = byte(0xc500)
Table1ID = PinballScreenID == 0
Table2ID = PinballScreenID == 1
BossFightArena1 = PinballScreenID == 7
BossFightArena2 = PinballScreenID == 6
BigBossArena = PinballScreenID == 8

CurrentScore = dword(0xc531)
LifeCounter = byte(0xc5b6)
ShotDownCounter = byte(0xc6e0)

SuperStartFlag = byte(0xca41)
PhaseIndicator = word(0xcb0a)
PinballStart = PhaseIndicator == 0x104
RegularPlay = PhaseIndicator == 0x204
GameDone = PhaseIndicator == 0x109

NormalModeHighScore = dword(0xcc3d)
Endless1HighScore = dword(0xcc8d)
Endless2HighScore = dword(0xccdd)
//EndlessTableCheck = byte(0xed30) > redundant with TableID
//----------------
//Function
function GameOver() => LifeCounter == 0 && GameDone

//----------------

///Achievement Code
         achievement(title = "Fiery Start",
                description = "At the start of a New Ball, Press A at the right time to get an explosive start",
                points = 1,
                trigger = 
                            SuperStartFlag == 1
                         && prev(SuperStartFlag) == 0   
                         && PhaseIndicator == 0x104
                         
                )    

         achievement(title = "Ace Pilot",
                description = "In any mode shoot down 60 enemies",
                points = 2,
                trigger = 
                            ShotDownCounter >= 0x60
                            && prev(ShotDownCounter) < 0x60
                            && prev(ShotDownCounter) > 0
                            && ShotDownCounter < 0xff
                           
                         
                )   
         achievement(title = "Great Ace Pilot",
                description = "In any mode shoot down 90 enemies",
                points = 3,
                trigger = 
                            ShotDownCounter >= 0x90
                            && prev(ShotDownCounter) < 0x90
                            && prev(ShotDownCounter) > 0
                            && ShotDownCounter < 0xff  
                            )
                
    achievement(title = "Classic Gundam",
                description = "Gather data on all Classical Gundam entries: Gundam, Guncannon, Guntank",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc003) + byte(0xc004) + byte(0xc005) == 384
                         && prev(byte(0xc003) + byte(0xc004) + byte(0xc005)) < 384
                )

    achievement(title = "Zeta Gundam",
                description = "Gather data on all Zeta Gundam entries: Gundam Mk II, Hyaku Shiki, Zeta Gundam",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc006) + byte(0xc007) + byte(0xc008) == 384
                         && prev(byte(0xc006) + byte(0xc007) + byte(0xc008)) < 384
                )
                
    achievement(title = "Late UC Gundam",
                description = "Gather data on all Late UC Gundam entries: ZZ Gundam & Nu Gundam",
                points = 3,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc009) + byte(0xc00a) == 256
                         && prev(byte(0xc009) + byte(0xc00a)) < 256
                )   
                
    achievement(title = "Gundam Wing",
                description = "Gather data on all Gundam Wing entries: Gundam Wing, Deathscythe Gundam, Heavyarms Gundam, Sandrock Gundam, Shenlong Gundam, Wing Zero Gundam",
                points = 10,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc00c) + byte(0xc00d) + byte(0xc00e) + byte(0xc00f) +  byte(0xc010) +  byte(0xc011) == 768
                         && prev(byte(0xc00c) + byte(0xc00d) + byte(0xc00e) + byte(0xc00f) +  byte(0xc010) +  byte(0xc011)) < 768
                )  
                
    achievement(title = "Xabungle",
                description = "Gather data on all Xabungle entries: Xabungle & Walker Gallia",
                points = 3,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc012) + byte(0xc013) == 256
                         && prev(byte(0xc012) + byte(0xc013)) < 256
                )     
                
    achievement(title = "Dunbine",
                description = "Gather data on all Dunbine entries: Dunbine & Billbine",
                points = 3,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc014) + byte(0xc015) == 256
                         && prev(byte(0xc014) + byte(0xc015)) < 256
                )                  
                
    achievement(title = "L-Gaim",
                description = "Gather data on all L-Gaim entries: L-Gaim & L-Gaim Mk II",
                points = 3,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc016) + byte(0xc017) == 256
                         && prev(byte(0xc016) + byte(0xc017)) < 256
                )                     
                
                
    achievement(title = "SRW Classics",
                description = "Gather data on the two SRW classics mechas: Daitarn 3 & Zambot 3",
                points = 3,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc018) + byte(0xc019) == 256
                         && prev(byte(0xc018) + byte(0xc019)) < 256
                )                     
                                
    achievement(title = "Mazinger",
                description = "Gather data on all Mazinger entries: Mazinger Z, Great Mazinger, Grendizer",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc01a) + byte(0xc01b) + byte(0xc01c) == 384
                         && prev(byte(0xc01a) + byte(0xc01b) + byte(0xc01c)) < 384
                )                
                
    achievement(title = "Classic Getter",
                description = "Gather data on all Classic Getter entries: Getter 1, Getter 2, Getter 3",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc01d) + byte(0xc01e) + byte(0xc01f) == 384
                         && prev(byte(0xc01d) + byte(0xc01e) + byte(0xc01f)) < 384
                )   
                
    achievement(title = "Getter Robo G",
                description = "Gather data on all Getter Robo G entries: Getter Dragon, Getter Liger, Getter Poseidon",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc020) + byte(0xc021) + byte(0xc022) == 384
                         && prev(byte(0xc020) + byte(0xc021) + byte(0xc022)) < 384
                )                   
                
    achievement(title = "Shin Getter",
                description = "Gather data on all Shin Getter entries: Shin Getter 1, Shin Getter 2, Shin Getter 3",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc023) + byte(0xc024) + byte(0xc025) == 384
                         && prev(byte(0xc023) + byte(0xc024) + byte(0xc025)) < 384
                )                   
                                
    achievement(title = "V Combo",
                description = "Gather data on the two V Combo mechas: Combatler V & Voltes V",
                points = 3,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc026) + byte(0xc027) == 256
                         && prev(byte(0xc026) + byte(0xc027)) < 256
                )                  
                
     achievement(title = "Unfortunate Stragglers",
                description = "Gather data on the two mechas with no other friends: Dancouga & Raideen",
                points = 3,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc028) + byte(0xc02a) == 256
                         && prev(byte(0xc028) + byte(0xc02a)) < 256
                )                  
                
    achievement(title = "Neon Genesis",
                description = "Gather data on all Evangelion entries: EVA - 00, EVA - 01, EVA 02",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x604
                         && byte(0xc02b) + byte(0xc02c) + byte(0xc02d) == 384
                         && prev(byte(0xc02b) + byte(0xc02c) + byte(0xc02d)) < 384
                )                
                
     achievement(title = "Anti-Gundam Squad",
                description = "Defeat the following enemies: Zeong, Quebeley, The O",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc02e) + byte(0xc030) + byte(0xc031) == 384
                         && prev(byte(0xc02e) + byte(0xc030) + byte(0xc031)) < 384
                )                 

     achievement(title = "Newtype Destroyers",
                description = "Defeat the following enemies: Psycho Gundam, Hamma Hamma, Queen Mansa",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc032) + byte(0xc034) + byte(0xc035) == 384
                         && prev(byte(0xc032) + byte(0xc034) + byte(0xc035)) < 384
                )                  
                
      achievement(title = "Space Ace",
                description = "Defeat the following enemies: Geymalk, Zaku III, Alpha Azieru",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc036) + byte(0xc037) + byte(0xc039) == 384
                         && prev(byte(0xc036) + byte(0xc037) + byte(0xc039)) < 384
                )                   

      achievement(title = "End of the Line",
                description = "Defeat the following enemies: Sazabi, Jagd Doga, Epyon",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc03a) + byte(0xc03b) + byte(0xc03c) == 384
                         && prev(byte(0xc03a) + byte(0xc03b) + byte(0xc03c)) < 384
                )      
                
      achievement(title = "Desert Walker",
                description = "Defeat the following enemies: Government, Doran, Brockary",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc03d) + byte(0xc03e) + byte(0xc03f) == 384
                         && prev(byte(0xc03d) + byte(0xc03e) + byte(0xc03f)) < 384
                )     
                
      achievement(title = "Aura Road",
                description = "Defeat the following enemies: Gallaba, Leprechaun, Zwarth",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc040) + byte(0xc041) + byte(0xc043) == 384
                         && prev(byte(0xc040) + byte(0xc041) + byte(0xc043)) < 384
                )                  
 
       achievement(title = "Common Gaim L",
                description = "Defeat the following enemies: Ashura Temple, A-Taul V, Auge",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc044) + byte(0xc045) + byte(0xc046) == 384
                         && prev(byte(0xc044) + byte(0xc045) + byte(0xc046)) < 384
                )   
                
       achievement(title = "One, Two, THREE",
                description = "Defeat the following enemies: Don Zauser, Benmel, Mileena",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc047) + byte(0xc049) + byte(0xc04a) == 384
                         && prev(byte(0xc047) + byte(0xc049) + byte(0xc04a)) < 384
                )                    
  
        achievement(title = "Child Murderers",
                description = "Defeat the following enemies: Bandok, Heldyne, Deathcain",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc04c) + byte(0xc04d) + byte(0xc04e) == 384
                         && prev(byte(0xc04c) + byte(0xc04d) + byte(0xc04e)) < 384
                )     
                
        achievement(title = "Neither God",
                description = "Defeat the following enemies: Jenoba M9, Rhine X1, Gusios Beta III",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc04f) + byte(0xc051) + byte(0xc052) == 384
                         && prev(byte(0xc04f) + byte(0xc051) + byte(0xc052)) < 384
                )  
                
        achievement(title = "Nor Devil",
                description = "Defeat the following enemies: Dark General, Marquis Janus, Pikadron",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc053) + byte(0xc054) + byte(0xc055) == 384
                         && prev(byte(0xc053) + byte(0xc054) + byte(0xc055)) < 384
                )    
                
        achievement(title = "Next Episode: Kouji Dies in a Volcano !",
                description = "Defeat the following enemies: Gingin, King Gori, Gilgilgan",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc057) + byte(0xc059) + byte(0xc05a) == 384
                         && prev(byte(0xc057) + byte(0xc059) + byte(0xc05a)) < 384
                )  
                
        achievement(title = "CHANGE GETTER",
                description = "Defeat the following enemies: Battleship Dai, Sigu, Kochouki",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc05b) + byte(0xc05c) + byte(0xc05e) == 384
                         && prev(byte(0xc05b) + byte(0xc05c) + byte(0xc05e)) < 384
                )   
                
        achievement(title = "Believe in Getter",
                description = "Defeat the following enemies: Tekkouki, Dragonsaurus, Gyukenki",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc05f) + byte(0xc061) + byte(0xc063) == 384
                         && prev(byte(0xc05f) + byte(0xc061) + byte(0xc063)) < 384
                )     
                
        achievement(title = "Of Man and Metal",
                description = "Defeat the following enemies: Big Garuda, Magma Demon, Orleana, Big Sirius",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc064) + byte(0xc066) + byte(0xc067) + byte(0xc068) == 512
                         && prev(byte(0xc064) + byte(0xc066) + byte(0xc067) + byte(0xc068)) < 512
                )     
                
        achievement(title = "By Our Power Combined",
                description = "Defeat the following enemies: Skullrook, Godor, Namazungo",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc069) + byte(0xc06a) + byte(0xc06c) == 384
                         && prev(byte(0xc069) + byte(0xc06a) + byte(0xc06c)) < 384
                )    
                
        achievement(title = "Beast Machine",
                description = "Defeat the following enemies: Desire, Fake Dancouga, Zan Gaioh, Zorbados",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc06d) + byte(0xc06e) + byte(0xc06f) + byte(0xc070) == 512
                         && prev(byte(0xc06d) + byte(0xc06e) + byte(0xc06f) + byte(0xc070)) < 512
                )   
                
        achievement(title = "Voice of an Angel",
                description = "Defeat the following enemies: Giant Sharkin, Gante, Barao",
                points = 5,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc072) + byte(0xc073) + byte(0xc074) == 384
                         && prev(byte(0xc072) + byte(0xc073) + byte(0xc074)) < 384
                )  
                
         achievement(title = "Get in the Robot",
                description = "Defeat the following enemies: Sachiel, Zeruel",
                points = 3,
                trigger = 
                            PhaseIndicator == 0x704
                         && byte(0xc075) + byte(0xc077) == 256
                         && prev(byte(0xc075) + byte(0xc077) ) < 256
                )   
                
         achievement(title = "New Face",
                description = "Defeat the Table 1 Boss, Desta",
                points = 5,
                trigger = 
                            BigBossArena
                         && byte(0xc078) == 0x80
                         && prev(byte(0xc078)) == 0
                )   
                
         achievement(title = "Phasing Menace",
                description = "Defeat the Table 2 Boss, Pushkul",
                points = 10,
                trigger = 
                            BigBossArena
                         && byte(0xc079) == 0x80
                         && prev(byte(0xc079)) == 0
                ) 
                
         achievement(title = "Back to Back",
                description = "Defeat the Final Boss, Obu",
                points = 25,
                trigger = 
                            BigBossArena
                         && byte(0xc07a) == 0x80
                         && prev(byte(0xc07a)) == 0
                )  
                
                
                
         achievement(title = "New Game +",
                description = "In Normal Mode complete Two Round without using the Save/Continue function",
                points = 25,
                trigger = 
                            RoundIndicator == 2
                         && prev(RoundIndicator) == 1   
                         && MenuSelect == 0
                         && PhaseIndicator == 0x504
                         
                )
                
              
         achievement(title = "Table 1 Champion",
                description = "In Endless Mode Table 1 beat the Rank 1 Score of 100 000 000. Trigger on Game Over",
                points = 10,
                trigger = 
                            Endless1HighScore > 100000000
                            && prev(Endless1HighScore) == 100000000
                         
                )  
                
         achievement(title = "Table 2 Champion",
                description = "In Endless Mode Table 1 beat the Rank 2 Score of 100 000 000. Trigger on Game Over",
                points = 10,
                trigger = 
                            Endless2HighScore > 100000000
                            && prev(Endless2HighScore) == 100000000
                         
                )  
                
         achievement(title = "Superboss Killer",
                description = "In any mode reach a score of 1 000 000 000",
                points = 50,
                trigger = 
                            CurrentScore >= 1000000000
                            && prev(CurrentScore) < 1000000000
                            && prev(CurrentScore) > 0
                            && CurrentScore < 0xffffffff
                           
                         
                )                   
//----------------

///Leaderboard

leaderboard(
    title = "Normal Mode HighScore",
    description = "AKA the Sarconius Leaderboard",
    start  = CurrentScore > 0 && MenuSelect == 0,
    cancel = MenuSelect != 0,
    submit = GameOver() && MenuSelect == 0,
    value = CurrentScore,
    format = "VALUE"
)

leaderboard(
    title = "Endless Table 1 HighScore",
    description = "Get the Highest Score on the Endless Table 1",
    start  = CurrentScore > 0 && MenuSelect == 2 && Table1ID,
    cancel = MenuSelect != 2 || Table2ID,
    submit = GameOver() && MenuSelect == 2 && Table1ID,
    value = CurrentScore,
    format = "VALUE"
)

leaderboard(
    title = "Endless Table 2 HighScore",
    description = "Get the Highest Score on the Endless Table 2",
    start  = CurrentScore > 0 && MenuSelect == 2 && Table2ID,
    cancel = MenuSelect != 2 || Table1ID,
    submit = GameOver() && MenuSelect == 2 && Table2ID,
    value = CurrentScore,
    format = "VALUE"
)