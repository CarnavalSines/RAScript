// ~Hack~ Castlevania: Dawn of Shovel
// #ID = 22847
// 20230327 Version - Sines

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
// $0CA9CC: [8 Bit] Animation ID
//          Multiple addresses work together in that area but can be used for Dive Kick detection
//          00 > Still
//          01 > Crouch
//          05 > Taunt (up, shovel raised)
//          0b > Gryphon Jump
//          0c > Regular Attack (Also special attack with A button)
//          08 > Dive Kick
// $0CAA74: [8 Bit] Current Character ID
//          00 > Soma (or Main Menu)
//          01 > Shovel Knight
// $0F703C: [32 Bit] In-game timer (Frames)
//          60fps
// $0F7256: [8 Bit] Game Mode
//          00 > Soma (regular)
//          01 > Shovel Knight
// $0F737C: [16 Bit] ATK
// $0F740C: [16 Bit] Current Level
// $0F7410: [16 Bit] Current HP
// $0F7412: [16 Bit] Max HP
// $0F7414: [16 Bit] Current MP
// $0F7416: [16 Bit] Max MP
// $0F7418: [16 Bit] Red Soul Equipped
//          06 > Throwing Anchor
//          12 > Chaos Sphere
//          2a > Flare Wand
// $0F75A8: [32 Bit] Room ID
// $11504C: [16 Bit] Area ID ?

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

ShovelKnight = CharacterID == 1

GameMode = byte(0xf7256)
ShovelMode = GameMode == 1

EquippedAbility = byte(0xf7418)
CurrentHP = word(0xf7410)
CurrentMP = word(0x0f7414)

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
			0:"Armor Knight", 
			1:"Giant Knight", 
			2:"The Knight Who Laugh", 
			3:"Crow Knight", 
			4:"Flame Knight",
			5:"Puppet Knight",
			6:"Laser Knight",
			7:"Fish Knight",
			8:"Time Knight",
			9:"Bat Knight",
			10:"Mirror Knight",
			11:"Dragon Knight",
			12:"Death Knight",
			13:"Insect Knight",
			14:"Dark Knight"
}

BossKillCheevoNameChallenge = { 
			0:"It's Shovel Time !", 
			1:"Hoppity Hop", 
			2:"The Last Laugh", 
			3:"Murder of Crow", 
			4:"Turning Up the Heat",
			5:"Master of Puppets",
			6:"Long Fall",
			7:"Holding Breath",
			8:"Emerald Splash",
			9:"Parting Company",
			10:"Mirror Master",
			11:"Dragon Slayer",
			12:"Reap What you Sow",
			13:"Plague of Locus",
			14:"Good Night, Bad Knight"
}


//----------------
//Function
function SaveProtection() => prev(RoomID) != 0 // Only true while loading a save from the menu, should prevent false positive triggers
function Shovelry() => ShovelKnight && ShovelMode

function DamagelessCheck() => prev(CurrentHP) > CurrentHP
function ManalessCheck() => prev(CurrentMP) > CurrentMP

function BossKillProgression(points,BossID)
{
    achievement(title = BossKillCheevoName[BossID],
                description = "Defeat " + BossKillName[BossID],
                points = points,
                trigger = 
                            Ingame
                         && Shovelry()
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
                description = "Defeat " + BossKillName[0] +" damageless and without using any MP",
                points = 3,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[0] == 1
                         && prev(BossKillFlag[0]) == 0)
                         && RoomID == BossRoomID[0]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x006728) //previous room memory for reset
                )

    achievement(title = BossKillCheevoNameChallenge[1],
                description = "Defeat " + BossKillName[1] +" damageless using only Shovel Knight Pogo attack (divekick)",
                points = 3,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[1] == 1
                         && prev(BossKillFlag[1]) == 0)
                         && RoomID == BossRoomID[1]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x00eae8) //previous room memory for reset
                         && never(ShovelRegularAttack)
                )
                
    achievement(title = BossKillCheevoNameChallenge[2],
                description = "Defeat " + BossKillName[2] +" damageless using only Shovel Knight Pogo attack (divekick)",
                points = 3,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[2] == 1
                         && prev(BossKillFlag[2]) == 0)
                         && RoomID == BossRoomID[2]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x00138c) //previous room memory for reset
                         && never(ShovelRegularAttack)
                )                
                
                
    achievement(title = BossKillCheevoNameChallenge[3],
                description = "Defeat " + BossKillName[3] +" damageless and without using any MP",
                points = 5,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[3] == 1
                         && prev(BossKillFlag[3]) == 0)
                         && RoomID == BossRoomID[3]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x006c1c) //previous room memory for reset
                     //    && never(ShovelRegularAttack)
                )                

    achievement(title = BossKillCheevoNameChallenge[4],
                description = "Defeat " + BossKillName[4] +" damageless using only Shovel Knight Pogo attack (divekick)",
                points = 5,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[4] == 1
                         && prev(BossKillFlag[4]) == 0)
                         && RoomID == BossRoomID[4]
                         && never(DamagelessCheck())
                         && never(ManalessCheck())
                         && once(prev(RoomID)==0x00fb6c) //previous room memory for reset
                         && never(ShovelRegularAttack)
                )   
                
    achievement(title = BossKillCheevoNameChallenge[5],
                description = "Defeat " + BossKillName[5] +" damageless",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[5] == 1
                         && prev(BossKillFlag[5]) == 0)
                         && RoomID == BossRoomID[5]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x008ac0) //previous room memory for reset
                    //     && never(ShovelRegularAttack)
                )     
                
     achievement(title = BossKillCheevoNameChallenge[6],
                description = "Defeat " + BossKillName[6] +" damageless",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[6] == 1
                         && prev(BossKillFlag[6]) == 0)
                         && RoomID == BossRoomID[6]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x002a20) //previous room memory for reset
                    //     && never(ShovelRegularAttack)
                )                  
                
     achievement(title = BossKillCheevoNameChallenge[7],
                description = "Defeat " + BossKillName[7] +" damageless",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[7] == 1
                         && prev(BossKillFlag[7]) == 0)
                         && RoomID == BossRoomID[7]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x001120) //previous room memory for reset
                    //     && never(ShovelRegularAttack)
                )                  
                
     achievement(title = BossKillCheevoNameChallenge[8],
                description = "Defeat " + BossKillName[8] +" damageless without using the regular shovel attack and only equipped with the Chaos Sphere relic [MP usage OK]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[8] == 1
                         && prev(BossKillFlag[8]) == 0)
                         && RoomID == BossRoomID[8]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x00cc84) //previous room memory for reset
                         && never(ShovelRegularAttack)
                         && never(EquippedAbility!=0x12)
                )                      
                
     achievement(title = BossKillCheevoNameChallenge[9],
                description = "Defeat " + BossKillName[9] +" damageless",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[9] == 1
                         && prev(BossKillFlag[9]) == 0)
                         && RoomID == BossRoomID[9]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x003cf8) //previous room memory for reset
                    //     && never(ShovelRegularAttack)
                )                  
                
     achievement(title = BossKillCheevoNameChallenge[10],
                description = "Defeat " + BossKillName[10] +" damageless and never using the Pause button",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[10] == 1
                         && prev(BossKillFlag[10]) == 0)
                         && RoomID == BossRoomID[10]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x008de0) //previous room memory for reset
                    //     && never(ShovelRegularAttack)
                        && never(PauseCheck==1)
                )                    
     achievement(title = BossKillCheevoNameChallenge[11],
                description = "Defeat " + BossKillName[11] +" damageless",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[11] == 1
                         && prev(BossKillFlag[11]) == 0)
                         && RoomID == BossRoomID[11]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x00dd40) //previous room memory for reset
                    //     && never(ShovelRegularAttack)
                )                    
                
     achievement(title = BossKillCheevoNameChallenge[12],
                description = "Defeat " + BossKillName[12] +" damageless",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[12] == 1
                         && prev(BossKillFlag[12]) == 0)
                         && RoomID == BossRoomID[12]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x003c80) //previous room memory for reset
                    //     && never(ShovelRegularAttack)
                )                      
                
                
    achievement(title = BossKillCheevoNameChallenge[13],
                description = "Defeat " + BossKillName[13] +" using only Shovel Knight Pogo attack (divekick) [MP usage OK]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[13] == 1
                         && prev(BossKillFlag[13]) == 0)
                         && RoomID == BossRoomID[13]
                   //      && never(DamagelessCheck())
                   //      && never(ManalessCheck())
                         && once(prev(RoomID)==0x007b6c) //previous room memory for reset
                         && never(ShovelRegularAttack)
                )                   
                
     achievement(title = BossKillCheevoNameChallenge[14],
                description = "Defeat " + BossKillName[14] +" damageless",
                points = 25,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[14] == 1
                         && prev(BossKillFlag[14]) == 0)
                         && RoomID == BossRoomID[14]
                         && never(DamagelessCheck())
                    //     && never(ManalessCheck())
                         && once(prev(RoomID)==0x00e9dc) //previous room memory for reset
                    //     && never(ShovelRegularAttack)
                )                  
                                                
/// Boss Rush

     achievement(title = "Order of No Quarter",
                description = "Compleat the Boss Rush as Shovel Knight",
                points = 25,
                trigger = 
                            ShovelKnight
                         && Ingame
                         && RoomID == 0x000808
                         && prior(RoomID) == 0x58
                )  







