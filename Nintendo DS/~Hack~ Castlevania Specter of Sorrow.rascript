// ~Hack~ Castlevania: Specter of Sorrow
// #ID = 22850
// 20230331 Version - Sines

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
// $0CA95C: [32 Bit] Horizontal Position
// $0CA960: [32 Bit] Vertical Position
//          Jumping Puzzle Tower Start point: 0x00b2f000
// $0CA9CC: [8 Bit] Animation ID
//          Multiple addresses work together in that area but can be used for Dive Kick detection
//          
//          00 > Still
//          01 > Up (Taunt)
//          10 > Divekick Straight Down
//          11 > Divekick left / right
//          16 > Regular Attack
//          18 > Chair Taunt
//          0e > Backdash
// $0CAA74: [8 Bit] Current Character ID
//          00 > Soma (or Main Menu)
//          01 > Specter Knight
// $0F6E40: [32 Bit] Map Data Start
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
//          01 > Specter Knight
// $0F740C: [16 Bit] Current Level
// $0F7410: [16 Bit] Current HP
// $0F7414: [16 Bit] Current MP
// $0F7418: [16 Bit] Red Soul Equipped
//          01 > Coin (Time Stop)
//          13 > Flame Shield
//          32  > Scythe
//          33 > Skelly Summon
// $0F75A8: [16 Bit] Room ID
//          Flying Armor: 24a8
//          Balore: 2a68
// $10AA50: [16 Bit] Save Data - Map Completion
//          Goes 0 - 0x3e8 (1000 dec)
//          The "." displayed on game load is ignored
//          Only update when game is saved
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
//ShovelRegularAttack = CharacterAnimationID == 0xc

ShovelKnight = CharacterID == 1

GameMode = byte(0xf7256)
ShovelMode = GameMode == 1

EquippedAbility = byte(0xf7418)
CurrentHP = word(0xf7410)
CurrentMP = word(0x0f7414)
CurrentLevel = word(0x0f740c)


RoomID = word(0xf75a8)

PauseCheck = byte(0xc07f0)

ArenaTimer = dword(0x0ca404)
VerticalPosition = dword(0x0ca960)

MapCompletion = word(0x10aa50)

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
			0:"Propeller Free", 
			1:"Bigger Target", 
			2:"Bad Joke", 
			3:"Clipped Wings", 
			4:"Hair Loss",
			5:"Puppet Ballet",
			6:"Close Quarters",
			7:"Even Fish Die",
			8:"Time's Up",
			9:"Blast to the Past",
			10:"Better in Red",
			11:"The Flame Above",
			12:"Courtesy Call",
			13:"The Better Plague",
			14:"Dimension Merge"
}

BossKillCheevoNameChallenge = { 
			0:"Down to Business", 
			1:"Aim for the Eye", 
			2:"Not Laughing Anymore", 
			3:"Dead Dove", 
			4:"Shine Cutter",
			5:"Cut Strings",
			6:"Long Fall, Quick Death",
			7:"Scythe Fishing",
			8:"Time Cut Short",
			9:"Death Wings",
			10:"Bad Luck",
			11:"Hell's Inferno",
			12:"True Death",
			13:"The Last Plague",
			14:"Bad Night, Worst Knight"
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
BossKillProgression(2,i)

for i in range (2,5)
BossKillProgression(3,i)

for i in range (6,9)
BossKillProgression(5,i)

for i in range (10,13)
BossKillProgression(10,i)

BossKillProgression(25,14)

// Boss Challenge

    achievement(title = BossKillCheevoNameChallenge[0],
                description = "Defeat " + BossKillName[0] +" in under 1 minute [Max Level: " + BossKillLevelLimit[0] + "]",
                points = 3,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[0] == 1
                         && prev(BossKillFlag[0]) == 0)
                         && RoomID == BossRoomID[0]
                         && once(prev(RoomID)==0x006728 && CurrentLevel <= BossKillLevelLimit[0]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[0] && CurrentLevel > BossKillLevelLimit[0])
                         && never(repeated(3600, RoomID == BossRoomID[0]))
                )

    achievement(title = BossKillCheevoNameChallenge[1],
                description = "Defeat " + BossKillName[1] +" in under 1 minute [Max Level: " + BossKillLevelLimit[1] + "]",
                points = 3,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[1] == 1
                         && prev(BossKillFlag[1]) == 0)
                         && RoomID == BossRoomID[1]
                         && once(prev(RoomID)==0x00eae8 && CurrentLevel <= BossKillLevelLimit[1]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[1] && CurrentLevel > BossKillLevelLimit[1])
                         && never(repeated(3600, RoomID == BossRoomID[1]))

                )
                
    achievement(title = BossKillCheevoNameChallenge[2],
                description = "Defeat " + BossKillName[2] +" in under 1 minute [Max Level: " + BossKillLevelLimit[2] + "]",
                points = 3,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[2] == 1
                         && prev(BossKillFlag[2]) == 0)
                         && RoomID == BossRoomID[2]
                         && once(prev(RoomID)==0x00138c && CurrentLevel <= BossKillLevelLimit[2]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[2] && CurrentLevel > BossKillLevelLimit[2])
                         && never(repeated(3600, RoomID == BossRoomID[2]))

                )                
                
                
    achievement(title = BossKillCheevoNameChallenge[3],
                description = "Defeat " + BossKillName[3] +" in under 1 minute [Max Level: " + BossKillLevelLimit[3] + "]",
                points = 5,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[3] == 1
                         && prev(BossKillFlag[3]) == 0)
                         && RoomID == BossRoomID[3]
                         && once(prev(RoomID)==0x006c1c && CurrentLevel <= BossKillLevelLimit[3]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[3] && CurrentLevel > BossKillLevelLimit[3])
                         && never(repeated(3600, RoomID == BossRoomID[3]))

                )                

    achievement(title = BossKillCheevoNameChallenge[4],
                description = "Defeat " + BossKillName[4] +" in under 1:30 minute [Max Level: " + BossKillLevelLimit[4] + "]",
                points = 5,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[4] == 1
                         && prev(BossKillFlag[4]) == 0)
                         && RoomID == BossRoomID[4]
                         && (once(prev(RoomID)==0x00fb6c && CurrentLevel <= BossKillLevelLimit[4]) || once(prev(RoomID)==0x002ddc && CurrentLevel <= BossKillLevelLimit[4])) //previous room memory for reset
                         && never(RoomID !=BossRoomID[4] && CurrentLevel > BossKillLevelLimit[4])
                         && never(repeated(5400, RoomID == BossRoomID[4]))
 
                )   
                
    achievement(title = BossKillCheevoNameChallenge[5],
                description = "Defeat " + BossKillName[5] +" in under 2 minutes [Max Level: " + BossKillLevelLimit[5] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[5] == 1
                         && prev(BossKillFlag[5]) == 0)
                         && RoomID == BossRoomID[5]
                         && once(prev(RoomID)==0x008ac0 && CurrentLevel <= BossKillLevelLimit[5]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[5] && CurrentLevel > BossKillLevelLimit[5])
                         && never(repeated(7200, RoomID == BossRoomID[5]))

                )     
                
     achievement(title = BossKillCheevoNameChallenge[6],
                description = "Defeat " + BossKillName[6] +" in under 2 minutes [Max Level: " + BossKillLevelLimit[6] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[6] == 1
                         && prev(BossKillFlag[6]) == 0)
                         && RoomID == BossRoomID[6]
                         && once(prev(RoomID)==0x002a20 && CurrentLevel <= BossKillLevelLimit[6]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[6] && CurrentLevel > BossKillLevelLimit[6])
                         && never(repeated(7200, RoomID == BossRoomID[6]))
                            

                )                  
                
     achievement(title = BossKillCheevoNameChallenge[7],
                description = "Defeat " + BossKillName[7] +" in under 2 minute [Max Level: " + BossKillLevelLimit[7] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[7] == 1
                         && prev(BossKillFlag[7]) == 0)
                         && RoomID == BossRoomID[7]
                         && (once(prev(RoomID)==0x001120 && CurrentLevel <= BossKillLevelLimit[7]) || once(prev(RoomID)==0x7960c && CurrentLevel <= BossKillLevelLimit[7])) //previous room memory for reset
                         && never(RoomID !=BossRoomID[7] && CurrentLevel > BossKillLevelLimit[7])
                         && never(repeated(7200, RoomID == BossRoomID[7]))
  
                )                  
                
     achievement(title = BossKillCheevoNameChallenge[8],
                description = "Defeat " + BossKillName[8] +" in under 2 minutes [Max Level: " + BossKillLevelLimit[8] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[8] == 1
                         && prev(BossKillFlag[8]) == 0)
                         && RoomID == BossRoomID[8]
                         && once(prev(RoomID)==0x00cc84 && CurrentLevel <= BossKillLevelLimit[8]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[8] && CurrentLevel > BossKillLevelLimit[8])
                         && never(repeated(7200, RoomID == BossRoomID[8]))

                )                      
                
     achievement(title = BossKillCheevoNameChallenge[9],
                description = "Defeat " + BossKillName[9] +" in under 2 minutes [Max Level: " + BossKillLevelLimit[9] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[9] == 1
                         && prev(BossKillFlag[9]) == 0)
                         && RoomID == BossRoomID[9]
                         && never(DamagelessCheck())
                         && once(prev(RoomID)==0x003cf8 && CurrentLevel <= BossKillLevelLimit[9]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[9] && CurrentLevel > BossKillLevelLimit[9])
                         && never(repeated(7200, RoomID == BossRoomID[9]))

                )                  
                
     achievement(title = BossKillCheevoNameChallenge[10],
                description = "Defeat " + BossKillName[10] +" in under 3 minutes [Max Level: " + BossKillLevelLimit[10] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[10] == 1
                         && prev(BossKillFlag[10]) == 0)
                         && RoomID == BossRoomID[10]
                         && once(prev(RoomID)==0x008de0 && CurrentLevel <= BossKillLevelLimit[10]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[10] && CurrentLevel > BossKillLevelLimit[10])
                         && never(repeated(10800, RoomID == BossRoomID[10]))

                )                    
     achievement(title = BossKillCheevoNameChallenge[11],
                description = "Defeat " + BossKillName[11] +" in under 4 minutes [Max Level: " + BossKillLevelLimit[11] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[11] == 1
                         && prev(BossKillFlag[11]) == 0)
                         && RoomID == BossRoomID[11]
                         && once(prev(RoomID)==0x00dd40 && CurrentLevel <= BossKillLevelLimit[11]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[11] && CurrentLevel > BossKillLevelLimit[11])
                         && never(repeated(14400, RoomID == BossRoomID[11]))

                )                    
                
     achievement(title = BossKillCheevoNameChallenge[12],
                description = "Defeat " + BossKillName[12] +" in under 4 minutes [Max Level: " + BossKillLevelLimit[12] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[12] == 1
                         && prev(BossKillFlag[12]) == 0)
                         && RoomID == BossRoomID[12]
                         && once(prev(RoomID)==0x003c80 && CurrentLevel <= BossKillLevelLimit[12]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[12] && CurrentLevel > BossKillLevelLimit[12])
                         && never(repeated(14400, RoomID == BossRoomID[12]))
 
                )                      
                
                
    achievement(title = BossKillCheevoNameChallenge[13],
                description = "Defeat " + BossKillName[13] +" in under 2 minutes [Max Level: " + BossKillLevelLimit[13] + "]",
                points = 10,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[13] == 1
                         && prev(BossKillFlag[13]) == 0)
                         && RoomID == BossRoomID[13]
                         && once(prev(RoomID)==0x007b6c && CurrentLevel <= BossKillLevelLimit[13]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[13] && CurrentLevel > BossKillLevelLimit[13])
                         && never(repeated(7200, RoomID == BossRoomID[13]))

                )                   
                
     achievement(title = BossKillCheevoNameChallenge[14],
                description = "Defeat " + BossKillName[14] +" in under 3 minutes [Max Level: " + BossKillLevelLimit[14] + "]",
                points = 25,
                trigger = 
                            Ingame
                         && Shovelry()
                         && SaveProtection()
                         && trigger_when(BossKillFlag[14] == 1
                         && prev(BossKillFlag[14]) == 0)
                         && RoomID == BossRoomID[14]
                         && once(prev(RoomID)==0x00e9dc && CurrentLevel <= BossKillLevelLimit[14]) //previous room memory for reset
                         && never(RoomID !=BossRoomID[14] && CurrentLevel > BossKillLevelLimit[14])
                         && never(repeated(10800, RoomID == BossRoomID[14]))

                ) 

// Misc
     achievement(title = "Death Lord",
                description = "Complete the Boss Rush as Specter Knight in 9 minute or less",
                points = 25,
                trigger = 
                            ShovelKnight
                         && Ingame
                         && RoomID == 0x000808
                         && prior(RoomID) == 0x58
                         && ArenaTimer < 32400
                )  
                
                
     achievement(title = "Tower Master",
                description = "After Gergoth is defeated, climb to the top of the Tower using only the jumping puzzle and enter the room on the left [Start is on the bottom layer of the Tower]",
                points = 10,
                trigger = 
                            ShovelKnight
                         && Ingame
                         && trigger_when((RoomID == 0xc790)
                         && prev(RoomID) == 0xfd00)
                         && BossKillFlag[6] == 1 // Gergoth is dead == puzzle available
                         && once(RoomID == 0xfd00 && VerticalPosition == 0x00b2f000) // In the puzzle room at the bottom
                         && never(RoomID == 0xcc40)
                         && never(RoomID == 0x2a20)
                         && never(RoomID == 0xd9f0)
                         && never(RoomID == 0xe7a0)
                         && never(RoomID == 0xf550)
                         && never(RoomID == 0x5030)
                         && never(RoomID == 0x34d0)
                         && never(RoomID == 0x4280)
                         
                )   
                
     achievement(title = "Tourist",
                description = "Discover at least 25% of the Castle [Trigger on saving data]",
                points = 5,
                trigger = 
                            ShovelKnight
                         && Ingame
                         && MapCompletion >= 250
                         && prev(MapCompletion) < 250
                         && prev(RoomID) != 0
                         
                )         
                
                
     achievement(title = "Explorer",
                description = "Discover at least 50% of the Castle [Trigger on saving data]",
                points = 5,
                trigger = 
                            ShovelKnight
                         && Ingame
                         && MapCompletion >= 500
                         && prev(MapCompletion) < 500
                         && prev(RoomID) != 0
                         
                )     
                
     achievement(title = "Castle Connoisseur",
                description = "Discover at least 75% of the Castle [Trigger on saving data]",
                points = 10,
                trigger = 
                            ShovelKnight
                         && Ingame
                         && MapCompletion >= 750
                         && prev(MapCompletion) < 750
                         && prev(RoomID) != 0
                         
                ) 
                
     achievement(title = "DiveKick Grand Master",
                description = "Discover 100% of the Castle [Trigger on saving data]",
                points = 25,
                trigger = 
                            ShovelKnight
                         && Ingame
                         && MapCompletion >= 1000
                         && prev(MapCompletion) < 1000
                         && prev(RoomID) != 0
                         
                )
                
// Leaderboard 
leaderboard(
    title = "Speedkill: "+ BossKillName[0],
    description = "Give them a quick death",
    start  = BossKillFlag[0] == 0 && RoomID == BossRoomID[0] && ShovelKnight,
    cancel = RoomID != BossRoomID[0],
    submit = BossKillFlag[0] == 1,
    value = measured(RoomID == BossRoomID[0]),
    format = "FRAMES"
)                   

leaderboard(
    title = "Speedkill: "+ BossKillName[1],
    description = "Give them a quick death",
    start  = BossKillFlag[1] == 0 && RoomID == BossRoomID[1] && ShovelKnight,
    cancel = RoomID != BossRoomID[1],
    submit = BossKillFlag[1] == 1,
    value = measured(RoomID == BossRoomID[1]),
    format = "FRAMES"
)                 

leaderboard(
    title = "Speedkill: "+ BossKillName[2],
    description = "Give them a quick death",
    start  = BossKillFlag[2] == 0 && RoomID == BossRoomID[2] && ShovelKnight,
    cancel = RoomID != BossRoomID[2],
    submit = BossKillFlag[2] == 1,
    value = measured(RoomID == BossRoomID[2]),
    format = "FRAMES"
)             

leaderboard(
    title = "Speedkill: "+ BossKillName[3],
    description = "Give them a quick death",
    start  = BossKillFlag[3] == 0 && RoomID == BossRoomID[3] && ShovelKnight,
    cancel = RoomID != BossRoomID[3],
    submit = BossKillFlag[3] == 1,
    value = measured(RoomID == BossRoomID[3]),
    format = "FRAMES"
) 

leaderboard(
    title = "Speedkill: "+ BossKillName[4],
    description = "Give them a quick death",
    start  = BossKillFlag[4] == 0 && RoomID == BossRoomID[4] && ShovelKnight,
    cancel = RoomID != BossRoomID[4],
    submit = BossKillFlag[4] == 1,
    value = measured(RoomID == BossRoomID[4]),
    format = "FRAMES"
)      

leaderboard(
    title = "Speedkill: "+ BossKillName[5],
    description = "Give them a quick death",
    start  = BossKillFlag[5] == 0 && RoomID == BossRoomID[5] && ShovelKnight,
    cancel = RoomID != BossRoomID[5],
    submit = BossKillFlag[5] == 1,
    value = measured(RoomID == BossRoomID[5]),
    format = "FRAMES"
)       

leaderboard(
    title = "Speedkill: "+ BossKillName[6],
    description = "Give them a quick death",
    start  = BossKillFlag[6] == 0 && RoomID == BossRoomID[6] && ShovelKnight,
    cancel = RoomID != BossRoomID[6],
    submit = BossKillFlag[6] == 1,
    value = measured(RoomID == BossRoomID[6]),
    format = "FRAMES"
)       

leaderboard(
    title = "Speedkill: "+ BossKillName[7],
    description = "Give them a quick death",
    start  = BossKillFlag[7] == 0 && RoomID == BossRoomID[7] && ShovelKnight,
    cancel = RoomID != BossRoomID[7],
    submit = BossKillFlag[7] == 1,
    value = measured(RoomID == BossRoomID[7]),
    format = "FRAMES"
)       

leaderboard(
    title = "Speedkill: "+ BossKillName[8],
    description = "Give them a quick death",
    start  = BossKillFlag[8] == 0 && RoomID == BossRoomID[8] && ShovelKnight,
    cancel = RoomID != BossRoomID[8],
    submit = BossKillFlag[8] == 1,
    value = measured(RoomID == BossRoomID[8]),
    format = "FRAMES"
)       

leaderboard(
    title = "Speedkill: "+ BossKillName[9],
    description = "Give them a quick death",
    start  = BossKillFlag[9] == 0 && RoomID == BossRoomID[9] && ShovelKnight,
    cancel = RoomID != BossRoomID[9],
    submit = BossKillFlag[9] == 1,
    value = measured(RoomID == BossRoomID[9]),
    format = "FRAMES"
)       

leaderboard(
    title = "Speedkill: "+ BossKillName[10],
    description = "Give them a quick death",
    start  = BossKillFlag[10] == 0 && RoomID == BossRoomID[10] && ShovelKnight,
    cancel = RoomID != BossRoomID[10],
    submit = BossKillFlag[10] == 1,
    value = measured(RoomID == BossRoomID[10]),
    format = "FRAMES"
)       

leaderboard(
    title = "Speedkill: "+ BossKillName[11],
    description = "Give them a quick death",
    start  = BossKillFlag[11] == 0 && RoomID == BossRoomID[11] && ShovelKnight,
    cancel = RoomID != BossRoomID[11],
    submit = BossKillFlag[11] == 1,
    value = measured(RoomID == BossRoomID[11]),
    format = "FRAMES"
)       

  leaderboard(
    title = "Speedkill: "+ BossKillName[12],
    description = "Give them a quick death",
    start  = BossKillFlag[12] == 0 && RoomID == BossRoomID[12] && ShovelKnight,
    cancel = RoomID != BossRoomID[12],
    submit = BossKillFlag[12] == 1,
    value = measured(RoomID == BossRoomID[12]),
    format = "FRAMES"
)         


leaderboard(
    title = "Speedkill: "+ BossKillName[13],
    description = "Give them a quick death",
    start  = BossKillFlag[13] == 0 && RoomID == BossRoomID[13] && ShovelKnight,
    cancel = RoomID != BossRoomID[13],
    submit = BossKillFlag[13] == 1,
    value = measured(RoomID == BossRoomID[13]),
    format = "FRAMES"
)      

leaderboard(
    title = "Speedkill: "+ BossKillName[14],
    description = "Give them a quick death",
    start  = BossKillFlag[14] == 0 && RoomID == BossRoomID[14] && ShovelKnight,
    cancel = RoomID != BossRoomID[14],
    submit = BossKillFlag[14] == 1,
    value = measured(RoomID == BossRoomID[14]),
    format = "FRAMES"
)       


leaderboard(
    title = "Speedkill: Arena",
    description = "Give them ALL a quick death",
    start  = RoomID == 0xaea8 && ShovelKnight,
    cancel = CurrentHP == 0,
    submit = RoomID == 0x808 && prev(RoomID) == 0x58,
    value = ArenaTimer,
    format = "FRAMES"
)                 