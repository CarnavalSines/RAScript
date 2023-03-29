// ~Hack~ Castlevania: Sora, Donald & Neku in Dawn of Sorrow
// #ID = 23792

// 20230329 Version - Sines

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

// $000000: --- --- ---
//          Hack of Dawn of Sorrow
//          Most the notes are lifted from the original game, credit to the respective dev
//          --- --- ---
// $09ED10: [8 Bit] Music id
// $0C07E8: [8 Bit] Game State
//          02 Game
//          04 Main Menu
//          09 Game Start
//          0a In-game menu
//          0b Wireless mode
//          0c Maxim Shop
//          0d Sophia Shop
//          0e Sound Mode
//          0f Sound Config
//          10 Boss Rush
//          11 Enemy Set Mode
//          12 Sonia Mode
//          13 Anime
//          15 Booting the game
// $0C07F0: [8 Bit] Pause State
//          00 > Normal
//          01 > Pause
// $0CA9CC: [8 Bit] Animation ID
//          Multiple addresses work together in that area but can be used for Dive Kick detection
//          01 > Still Soma
//          15 > Taunt (up, Sora)
//          10 > Fly (Sora)
//          11 > Regular Attack (Also special attack with A button, Soma)
//          13 > Regular Attack in the air Sora
//          14 / 1b > Dive Kick Sora
//          16 > Magic Attack
//          0f > L Dodge Sora
//          --- ---
//          00 > Still Donald
//          01 > Taunt (up Donald)
//          02 > Crouch Donald
//          04 > Jump Donald
//          05 > Backdash dodge Donald
//          06 > Regular Attack Donald
//          07 > Magic Donald
//          --- ---
//          00 > Still Neku
//          01 > Taunt (up Neku)
//          03 / 04 / 05 > Jump Neku
//          06 > hippogryph jump
//          07 > Dash Neku
//          08 > Regular Attack Donald
//          0a / 0c > Magic Donald
// $0CAA74: [8 Bit] Current Character ID
//          00 > Soma (or Main Menu)
//          01 > Sora
//          02 > Donald
//          03 > Neku
// $0F703C: [32 Bit] In-game timer (Frames)
//          60fps
// $0F715C: [8 Bit] Bitflag Enemy Data
//          Bit 5 | Flying Armor
//          Bit 6 | Balore
//          Bit 7 | Malphas
// $0F715D: [8 Bit] Bitflag Enemy Data
//          Bit 0 | Dmitrii
//          Bit 1 | Dario
//          Bit 2 | Puppet Master
//          Bit 3 | Rahab
//          Bit 4 | Gergoth
//          Bit 5 | Zephyr
//          Bit 6 | Bat Company
//          Bit 7 | Paranoia
// $0F715E: [8 Bit] Bitflag Enemy Data
//          Bit 0 | Aguni
//          Bit 1 | Death
//          Bit 2 | Abaddon
//          Bit 4 | Soma
//          Bit 5 | Soma 2nd Form
// $0F7256: [8 Bit] Game Mode
//          00 > Soma (regular)
//          01 > KH
// $0F740C: [16 Bit] Current Level
// $0F7410: [16 Bit] Current HP
// $0F7414: [16 Bit] Current MP
// $0F7418: [16 Bit] Red Soul Equipped
//          06 > Fireball
//          32 > Lightning Soma
//          33 > Ice Soma
//          34 > Flight Soma
//          --- ---
//          2f > Fireball Donald
//          30 > Ice Donald
//          31 > Lightning Donald
//          --- ---
//          2e > Light Ball
//          2d > Light Arrows
// $0F75A8: [16 Bit] Room ID


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
GameState = byte(0xc07e8)
Ingame = GameState == 2
BossRush = GameState == 0x10

CharacterID = byte(0xcaa74)
CharacterAnimationID = byte(0xca9cc)
ShovelRegularAttack = CharacterAnimationID == 0xc

Sora = CharacterID == 1
Donald = CharacterID == 2
Neku = CharacterID == 3

GameMode = byte(0xf7256)
KHMode = GameMode == 1

EquippedAbility = byte(0xf7418)
CurrentHP = word(0xf7410)
CurrentMP = word(0x0f7414)
CurrentLevel = word(0x0f740c)

RoomID = word(0xf75a8)

PauseCheck = byte(0xc07f0)

BossRoomID = { 
			0:0x0024a8, 
			1:0x002a68, 
			2:0x00508c, 
			3:0x00475c, 
			4:0x0027bc,
			5:0x00f6f0,
			6:0x00fd00,
			7:0x001f00,
			8:0x00a984,
			9:0x004f28,
			10:0x004c60,
			11:0x00c960,
			12:0x00f920,
			13:0x00891c,
			14:0x00aca4
}


BossKillFlag = { 
			0:bit5(0xf715c),
			1:bit6(0xf715c), 
			2:bit0(0xf715d), 
			3:bit7(0xf715c), 
			4:bit1(0xf715d),
			5:bit2(0xf715d),
			6:bit4(0xf715d),
			7:bit3(0xf715d),
			8:bit5(0xf715d),
			9:bit6(0xf715d),
			10:bit7(0xf715d),
			11:bit0(0xf715e),
			12:bit1(0xf715e),
			13:bit2(0xf715e),
			14:bit5(0xf715e)
}

BossKillName = { 
			0:"Flying Armor", 
			1:"Balore", 
			2:"Dmitrii", 
			3:"Malphas", 
			4:"Dario",
			5:"Puppet Master",
			6:"Gergoth",
			7:"Rahab",
			8:"Zephyr",
			9:"Bat Company",
			10:"Paranoia",
			11:"Aguni",
			12:"Death",
			13:"Abaddon",
			14:"Somacula"
}


BossKillCheevoName = { 
			0:"Air Pirate", 
			1:"Hitbox Crusher", 
			2:"Laughing Stock", 
			3:"Decadraven", 
			4:"Red Nocturne",
			5:"Leechgrave Disciple",
			6:"Tower Master",
			7:"Emo Puffer",
			8:"Time Stinger",
			9:"Vespertilio Canor",
			10:"Reflecting Jester",
			11:"Wanabee Reaper",
			12:"Master Reaper",
			13:"Locust Lord",
			14:"Is That You Ansem ?"
}


BossKillCheevoNameChallenge = { 
			0:"New Keyblade Wielder", 
			1:"When You Walk Away", 
			2:"Out of Mana", 
			3:"Stupid Bird", 
			4:"Dealing with the Noise",
			5:"Superior Reach",
			6:"T-Rex Attack",
			7:"Like Duck to Water",
			8:"Time Sensitive",
			9:"Burn it Up",
			10:"Introspection",
			11:"Fighting Fire with Fire",
			12:"Inner Darkness",
			13:"Plague of Locus",
			14:"The Hack End With You"
}

BossKillLevelLimit = { 
			0:1, 
			1:10, 
			2:15, 
			3:15, 
			4:15,
			5:20,
			6:20,
			7:20,
			8:25,
			9:25,
			10:30,
			11:35,
			12:40,
			13:45,
			14:50
}

BossRushCheevoName = { 
			1:"Keyblade Master", 
			2:"Archmage", 
			3:"Legendary Player", 
}
//----------------
//Function
function SaveProtection() => prev(RoomID) != 0 // Only true while loading a save from the menu, should prevent false positive triggers
function KHCheck() => (Sora || Donald || Neku) && KHMode

function DamagelessCheck() => prev(CurrentHP) > CurrentHP
function ManalessCheck() => prev(CurrentMP) > CurrentMP

function BossKillProgression(points,BossID)
{
    achievement(title = BossKillCheevoName[BossID],
                description = "Defeat " + BossKillName[BossID],
                points = points,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && BossKillFlag[BossID] == 1
                         && prev(BossKillFlag[BossID]) == 0
                         && RoomID == BossRoomID[BossID]
                )
}

//----------------
///Achievement Code
// Progression
for i in range (0,1)
BossKillProgression(3,i)

for i in range (2,5)
BossKillProgression(5,i)

for i in range (6,13)
BossKillProgression(10,i)

BossKillProgression(25,14)
// Boss Challenge / Deathless

    achievement(title = BossKillCheevoNameChallenge[0],
                description = "Defeat " + BossKillName[0] +" damageless and without using any MP as Sora [Max Level: " + BossKillLevelLimit[0] + "]",
                points = 3,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[0] == 1
                         && prev(BossKillFlag[0]) == 0)
                         && RoomID == BossRoomID[0]
                         && never(repeated(2,prev(CurrentHP) > CurrentHP))
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x006728 && CurrentLevel <= BossKillLevelLimit[0] && Sora) //previous room memory for reset
                  //       && never(Sora)
                         && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[0] && CurrentLevel > BossKillLevelLimit[0])
                )

    achievement(title = BossKillCheevoNameChallenge[1],
                description = "Defeat " + BossKillName[1] +" damageless and without using any MP as Sora [Max Level: " + BossKillLevelLimit[1] + "]",
                points = 3,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[1] == 1
                         && prev(BossKillFlag[1]) == 0)
                         && RoomID == BossRoomID[1]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x00eae8 && CurrentLevel <= BossKillLevelLimit[1]) //previous room memory for reset
                  //       && never(Sora)
                         && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[1] && CurrentLevel > BossKillLevelLimit[1])
                )
                
    achievement(title = BossKillCheevoNameChallenge[2],
                description = "Defeat " + BossKillName[2] +" damageless and without using any MP as Donald [Max Level: " + BossKillLevelLimit[2] + "]",
                points = 3,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[2] == 1
                         && prev(BossKillFlag[2]) == 0)
                         && RoomID == BossRoomID[2]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x00138c && CurrentLevel <= BossKillLevelLimit[2]) //previous room memory for reset
                         && never(Sora)
                    //     && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[2] && CurrentLevel > BossKillLevelLimit[2])
                )                
                
                
    achievement(title = BossKillCheevoNameChallenge[3],
                description = "Defeat " + BossKillName[3] +" damageless and without using any MP as Sora [Max Level: " + BossKillLevelLimit[3] + "]",
                points = 5,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[3] == 1
                         && prev(BossKillFlag[3]) == 0)
                         && RoomID == BossRoomID[3]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x006c1c && CurrentLevel <= BossKillLevelLimit[3])
                      //   && never(Sora)
                         && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[3] && CurrentLevel > BossKillLevelLimit[3])

                )                

    achievement(title = BossKillCheevoNameChallenge[4],
                description = "Defeat " + BossKillName[4] +" damageless and without using any MP as Neku [Max Level: " + BossKillLevelLimit[4] + "]",
                points = 5,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[4] == 1
                         && prev(BossKillFlag[4]) == 0)
                         && RoomID == BossRoomID[4]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && (once(prev(RoomID)==0x00fb6c && CurrentLevel <= BossKillLevelLimit[4]) || once(prev(RoomID)==0x002ddc && CurrentLevel <= BossKillLevelLimit[4])) //previous room memory for reset
                         && never(Sora)
                         && never(Donald)
                     //    && never(Neku)
                         && never(RoomID !=BossRoomID[4] && CurrentLevel > BossKillLevelLimit[4])
                )   
                
    achievement(title = BossKillCheevoNameChallenge[5],
                description = "Defeat " + BossKillName[5] +" damageless as Neku [Max Level: " + BossKillLevelLimit[5] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[5] == 1
                         && prev(BossKillFlag[5]) == 0)
                         && RoomID == BossRoomID[5]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x008ac0 && CurrentLevel <= BossKillLevelLimit[5]) //previous room memory for reset
                         && never(Sora)
                         && never(Donald)
                   //      && never(Neku)
                         && never(RoomID !=BossRoomID[5] && CurrentLevel > BossKillLevelLimit[5])
                )     
                
     achievement(title = BossKillCheevoNameChallenge[6],
                description = "Defeat " + BossKillName[6] +" damageless as Sora [Max Level: " + BossKillLevelLimit[6] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[6] == 1
                         && prev(BossKillFlag[6]) == 0)
                         && RoomID == BossRoomID[6]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x002a20 && CurrentLevel <= BossKillLevelLimit[6]) //previous room memory for reset
                    //     && never(Sora)
                         && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[6] && CurrentLevel > BossKillLevelLimit[6])
                )                  
                
     achievement(title = BossKillCheevoNameChallenge[7],
                description = "Defeat " + BossKillName[7] +" damageless as Donald [Max Level: " + BossKillLevelLimit[7] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[7] == 1
                         && prev(BossKillFlag[7]) == 0)
                         && RoomID == BossRoomID[7]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x001120 && CurrentLevel <= BossKillLevelLimit[7]) //previous room memory for reset
                         && never(Sora)
                    //     && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[7] && CurrentLevel > BossKillLevelLimit[7])
                )                  
                
     achievement(title = BossKillCheevoNameChallenge[8],
                description = "Defeat " + BossKillName[8] +" damageless and without using any MP as Neku [Max Level: " + BossKillLevelLimit[8] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[8] == 1
                         && prev(BossKillFlag[8]) == 0)
                         && RoomID == BossRoomID[8]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x00cc84 && CurrentLevel <= BossKillLevelLimit[8]) //previous room memory for reset
                         && never(Sora)
                         && never(Donald)
                     //    && never(Neku)
                         && never(RoomID !=BossRoomID[8] && CurrentLevel > BossKillLevelLimit[8])
                )                      
                
     achievement(title = BossKillCheevoNameChallenge[9],
                description = "Defeat " + BossKillName[9] +" damageless as Donald [Max Level: " + BossKillLevelLimit[9] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[9] == 1
                         && prev(BossKillFlag[9]) == 0)
                         && RoomID == BossRoomID[9]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x003cf8 && CurrentLevel <= BossKillLevelLimit[9]) //previous room memory for reset
                         && never(Sora)
                      //   && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[9] && CurrentLevel > BossKillLevelLimit[9])
                )                  
                
     achievement(title = BossKillCheevoNameChallenge[10],
                description = "Defeat " + BossKillName[10] +" damageless as Sora [Max Level: " + BossKillLevelLimit[10] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[10] == 1
                         && prev(BossKillFlag[10]) == 0)
                         && RoomID == BossRoomID[10]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x008de0 && CurrentLevel <= BossKillLevelLimit[10]) //previous room memory for reset
                   //     && never(Sora)
                         && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[10] && CurrentLevel > BossKillLevelLimit[10])
                )                    
     achievement(title = BossKillCheevoNameChallenge[11],
                description = "Defeat " + BossKillName[11] +" damageless as Donald [Max Level: " + BossKillLevelLimit[11] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[11] == 1
                         && prev(BossKillFlag[11]) == 0)
                         && RoomID == BossRoomID[11]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x00dd40 && CurrentLevel <= BossKillLevelLimit[11]) //previous room memory for reset
                         && never(Sora)
                    //     && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[11] && CurrentLevel > BossKillLevelLimit[11])
                )                    
                
     achievement(title = BossKillCheevoNameChallenge[12],
                description = "Defeat " + BossKillName[12] +" damageless and without using any MP as Neku [Max Level: " + BossKillLevelLimit[12] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[12] == 1
                         && prev(BossKillFlag[12]) == 0)
                         && RoomID == BossRoomID[12]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x003c80 && CurrentLevel <= BossKillLevelLimit[12]) //previous room memory for reset
                         && never(Sora)
                         && never(Donald)
                    //     && never(Neku)
                         && never(RoomID !=BossRoomID[12] && CurrentLevel > BossKillLevelLimit[12])
                )                      
                
                
    achievement(title = BossKillCheevoNameChallenge[13],
                description = "Defeat " + BossKillName[13] +" damageless as Donald only equipped with the FireBall ability [Max Level: " + BossKillLevelLimit[13] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[13] == 1
                         && prev(BossKillFlag[13]) == 0)
                         && RoomID == BossRoomID[13]
                         && never(DamagelessCheck())
                   //      && never(ManalessCheck())
                         && once(prev(RoomID)==0x007b6c && CurrentLevel <= BossKillLevelLimit[13]) //previous room memory for reset
                         && never(Sora)
                     //    && never(Donald)
                         && never(Neku)
                         && never(RoomID !=BossRoomID[13] && CurrentLevel > BossKillLevelLimit[13])
                         && never(EquippedAbility != 0x2f)
                )                   
                
     achievement(title = BossKillCheevoNameChallenge[14],
                description = "Defeat " + BossKillName[14] +" damageless as Neku [Max Level: " + BossKillLevelLimit[14] + "]",
                points = 25,
                trigger = 
                            Ingame
                         && KHCheck()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[14] == 1
                         && prev(BossKillFlag[14]) == 0)
                         && RoomID == BossRoomID[14]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x00e9dc && CurrentLevel <= BossKillLevelLimit[14]) //previous room memory for reset
                         && never(Sora)
                         && never(Donald)
                     //    && never(Neku)
                         && never(RoomID !=BossRoomID[14] && CurrentLevel > BossKillLevelLimit[14])
                )                  
                                                
/// Boss Rush

     achievement(title = "A Whole New World",
                description = "Compleat the Boss Rush as any non-Soma character",
                points = 5,
                trigger = 
                            (Sora || Donald || Neku)
                         && Ingame
                         && RoomID == 0x000808
                         && prior(RoomID) == 0x58
                )  
                
     achievement(title = "Keyblade Master",
                description = "Compleat the Boss Rush as Sora only",
                points = 10,
                trigger = 
                            Sora
                         && Ingame
                         && trigger_when(RoomID == 0x000808
                         && prior(RoomID) == 0x58)
                         && once(Sora && RoomID == 0xaea8)
                         && never(Donald)
                         && never(Neku)
                )  
                
     achievement(title = "Archmage",
                description = "Compleat the Boss Rush as Donald only",
                points = 10,
                trigger = 
                            Donald
                         && Ingame
                         && trigger_when(RoomID == 0x000808
                         && prior(RoomID) == 0x58)
                         && once(Donald && RoomID == 0xaea8)
                         && never(Sora)
                         && never(Neku)
                )     
     achievement(title = "Legendary Player",
                description = "Compleat the Boss Rush as Neku only",
                points = 10,
                trigger = 
                            Neku
                         && Ingame
                         && trigger_when(RoomID == 0x000808
                         && prior(RoomID) == 0x58)
                         && once(Neku && RoomID == 0xaea8)
                         && never(Sora)
                         && never(Donald)
                )                  
                
                
                