// Tekken Card Challenge
// #ID = 2533
// 20240116 Version - Sines

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

// $00180A: [8 Bit] Main Menu Cursor
//          Value seems to stay fixed during gameplay after choosing, could be used for mode detection
//          00 > Adventure
//          01 > 1P Versus AI
//          02 > 1P vs 2P
//          03 > Connection
//          04 > Data thingy ?
// $00180C: [8 Bit] Screen ID
//          0x02 > Title Screen
//          0x1a > Main Menu
//          0x12 > Character Select
//          0x3c > Connectivity
//          0x08 > Fight Screen
//          
//          --- --- ---
//          0x2c > Adventure mode Character Select
//          0x38 > Adventure Char Intro Screen
//          0x06 > Adventure Overworld
//          0x44 > Adventure Exchange Screen
//          0x22 > Adventure Card Explanations
//          0x30 > Adventure Combo Change
//          0x16 > Adventure Deck Change
//          0x2c > Time Up!!
//          0x1e > Adventure Temple
// $00180E: [8 Bit] Subscreen ID
//          From 0x06
//          --- --- ---
//          0x0e > Go To Next World
//          0x16 > Combo Card Obtained
//          
//          From 0x38
//          --- --- ---
//          0x0a > Credit Roll
//          0x06 > Character Intro
//          
//          From 0x08
//          --- --- ---
//          0x1c > Perfect
// $0019CC: [8 Bit] 1P Mode Victory Nb
// $0019CD: [8 Bit] 1P Mode Defeat Nb
// $0019D2: [8 Bit] P1 CharID
//          00 > Jin
//          02 > Xiaoyu
//          04 > Hwoarang
//          06 > Eddy
//          08 > Law
//          0x0a > Paul
//          0x0c > Lei
//          0x0e > King
//          0x10 > Nina
//          0x12 > Yoshimitsu
//          0x14 > Kuma
//          0x16 > Panda
//          0x18 > Julia
//          0x1a > Gun Jack
//          0x1c > Bryan
//          0x1e > Heihachi
//          0x20 > Ogre
//          0x22 > Mokujin
//          0x24 > Anna
//          0x26 > Doctor. B.
//          0x28 > Crow
//          0x2a > Falcon (Not Playable)
//          0x2c > Hawk (Not Playable)
//          0x2e > Owl (Not Playable)
//          0x30 > True Ogre (Not Playable)
// $0019D3: [8 Bit] P1 Health
// $0019D5: [8 Bit] Move Picked
//          00 > Picking Move
//          01 > Move Confirmed
// $0019DC: [8 Bit] P1 Card Pick Order
//          Start at 0x00
// $0019F0: [8 Bit] Adventure Level
//          Cards unlock are tied to the level
//          0x0b > Level 12 == All Cards
// $0019F1: [8 Bit] Adventure Star Level
// $0019F6: [8 Bit] Start of Duplicate Card Nb
//          Normal 0~62 in overworld, value change when watched in other menus
// $001A02: [8 Bit] Combo Card 1 Flag
// $001A03: [8 Bit] Combo Card 2 Flag
// $001A04: [8 Bit] Combo Card 3 Flag
// $001A10: [8 Bit] P2 CharID
// $001A11: [8 Bit] P2 Health
// $001A4E: [8 Bit] Adventure Overworld Health
// $001A4F: [8 Bit] Adventure Step Counter
//          00 > Time Up
// $001A50: [8 Bit] Adventure Mode Overworld Sprite
//          Match with CharID
// $001A52: [8 Bit] Horizontal Position
//          Increment by 0x10 per step
// $001A54: [8 Bit] Vertical Position
//          Increment by 0x10 per step
// $001A57: [8 Bit] Song being played ID
// $001A5C: [8 Bit] Bitflags Adventure Mode Char Unlock
//          Bit 0 | Jin
//          Bit 1 | Xiaoyu
//          Bit 2 | Hwoarang
//          Bit 3 | Eddy
//          Bit 4 | Law
//          Bit 5 | Paul
//          Bit 6 | Lei
//          Bit 7 | King
// $001A5D: [8 Bit] Bitflags Adventure Mode Char Unlock
//          Bit 0 | Nina
//          Bit 1 | Yoshimitsu
//          Bit 2 | Kuma
//          Bit 3 | Panda
//          Bit 4 | Julia
//          Bit 5 | Gun Jack
//          Bit 6 | Bryan
//          Bit 7 | Heihachi
// $001A5E: [8 Bit] Bitflags Adventure Mode Char Unlock
//          Bit 0 | Ogre
//          Bit 1 | Mokujin
//          Bit 2 | Anna
//          Bit 3 | Doctor. B.
//          Bit 4 | Crow
// $001A75: [8 Bit] Adventure mode tileset
// $001A76: [8 Bit] Adventure Stage ID
//          Start at 0x00
// $001D80: [256 Byte] World Map Data Start
// $010185: [8 Bit] Bitflags Character Unlocks (Update on "Go To Next Stage")
//          Bit 0 | Jin (technically)
//          Bit 1 | Xiaoyu (technically)
//          Bit 2 | Hwoarang
//          Bit 3 | Eddy
//          Bit 4 | Law
//          Bit 5 | Paul
//          Bit 6 | Lei
//          Bit 7 | King
// $010186: [8 Bit] Bitflags Character Unlocks
//          Bit 0 | Nina
//          Bit 1 | Yoshimitsu
//          Bit 2 | Kuma
//          Bit 3 | Panda
//          Bit 4 | Julia
//          Bit 5 | Gun Jack
//          Bit 6 | Bryan
//          Bit 7 | Heihachi
// $010187: [8 Bit] Bitflags Character Unlocks
//          Bit 0 | Ogre
//          Bit 1 | Mokujin
//          Bit 2 | Anna
//          Bit 3 | Doctor. B.
//          Bit 4 | Crow
// $010234: [8 Bit] Save data Xiaoyu Adventure Combo Card 1
// $010235: [8 Bit] Save data Xiaoyu Adventure Combo Card 2
// $010236: [8 Bit] Save data Xiaoyu Adventure Combo Card 3
// $010240: [8 Bit] Save data Xiaoyu Adventure Special Card
// $010242: [8 Bit] Save data Xiaoyu Adventure Level
// $010244: [8 Bit] Save data Hwoarang Adventure Level
// $010256: [8 Bit] Save data Hwoarang Adventure Combo Card 1
// $010257: [8 Bit] Save data Hwoarang Adventure Combo Card 2
// $010258: [8 Bit] Save data Hwoarang Adventure Combo Card 3
// $010262: [8 Bit] Save data Hwoarang Adventure Special Card
// $010264: [8 Bit] Save data Hwoarang Adventure Stage
// $010266: [8 Bit] Save data Eddy Adventure Level
// $010288: [8 Bit] Save data Law Adventure Level
// $0102A8: [8 Bit] Save data Law Adventure Stage


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CharID = { 
                    0x00:"Jin",
                    0x02:"Xiaoyu",
                    0x04:"Hwoarang",
                    0x06:"Eddy",
                    0x08:"Law",
                    0x0a:"Paul",
                    0x0c:"Lei",
                    0x0e:"King",
                    0x10:"Nina",
                    0x12:"Yoshimitsu",
                    0x14:"Kuma",
                    0x16:"Panda",
                    0x18:"Julia",
                    0x1a:"Gun Jack",
                    0x1c:"Bryan",
                    0x1e:"Heihachi",
                    0x20:"Ogre",
                    0x22:"Mokujin",
                    0x24:"Anna",
                    0x26:"Doctor. B.",
                    0x28:"Crow",
                    0x2a:"Falcon",
                    0x2c:"Hawk",
                    0x2e:"Owl",
                    0x30:"True Ogre"

                    }  

CharIDAdventureUnlock = { 
                    0x00:bit0(0x1a5c),
                    0x02:bit1(0x1a5c),
                    0x04:bit2(0x1a5c),
                    0x06:bit3(0x1a5c),
                    0x08:bit4(0x1a5c),
                    0x0a:bit5(0x1a5c),
                    0x0c:bit6(0x1a5c),
                    0x0e:bit7(0x1a5c),
                    0x10:bit0(0x1a5d),
                    0x12:bit1(0x1a5d),
                    0x14:bit2(0x1a5d),
                    0x16:bit3(0x1a5d),
                    0x18:bit4(0x1a5d),
                    0x1a:bit5(0x1a5d),
                    0x1c:bit6(0x1a5d),
                    0x1e:bit7(0x1a5d),
                    0x20:bit0(0x1a5e),
                    0x22:bit1(0x1a5e),
                    0x24:bit2(0x1a5e),
                    0x26:bit3(0x1a5e),
                    0x28:bit4(0x1a5e)

                    }                      
//----------------
//Variable
ModeID = byte(0x180a)
AdventureMode = ModeID == 0

ScreenID = byte(0x180c)
TitleScreen = ScreenID == 0x02
FightScreen = ScreenID == 0x08
AdventureModeOverworld = ScreenID == 0x06

SubscreenID = byte(0x180e)
P1CharID = byte(0x19d2)
P2CharID = byte(0x1a10)
P1Health = byte(0x19d3)
P2Health = byte(0x1a11)

MovePicked = byte(0x19d5)
AdventureLevel = byte(0x19f0)
AdventureStageID = byte(0x1a76) // start at 0x00
AdventureStepCount = byte(0x1a4f)
ComboCard1 = byte(0x1a02)
ComboCard2 = byte(0x1a03)
ComboCard3 = byte(0x1a04)

//Function
function Perfect() => FightScreen && SubscreenID == 0x1c && prev(SubscreenID) != 0x1c
function CharUnlock(Char) => CharIDAdventureUnlock[Char] == 1 && prev(CharIDAdventureUnlock[Char]) == 0 && AdventureMode
function CheevoProg(Title,Points,Char)
{
    achievement(title=Title,
                description = "Finish Adventure Mode with " + CharID[Char] ,
                points = Points,
                trigger = ModeID == 0x05
                       && P1CharID == Char
                       && P1Health > 0
                       && P2CharID == 0x30
                       && P2Health == 0
                       && prev(P2Health) > 0
//                       && once(P1CharID == Char && AdventureLevel == 0 && AdventureStageID == 0 && AdventureModeOverworld)
//                       && never(P1CharID != Char && AdventureModeOverworld)

)              
}

function AdventureUnlock(Points,Char)
{
    achievement(title=CharID[Char]+ " Unlocked!",
                description = "Unlock " + CharID[Char] +" in Adventure Mode [Cheat Protected]",
                points = Points,
                trigger = ScreenID != 0x02
                       && CharIDAdventureUnlock[Char] == 1
                       && prev(CharIDAdventureUnlock[Char]) == 0
                       && (repeated(5,ScreenID == 0x06) 
                       || (prev(ScreenID) == 0x04 && prev(SubscreenID) == 0x0))
                       && never(ScreenID == 0x02)


)              
}
//----------------
///Achievement Code
// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
CheevoProg("Baby Face",10,0x00)
CheevoProg("Lethal Schoolgirl",10,0x02)
CheevoProg("Budding Rivalry",10,0x04)
CheevoProg("Dance Master",10,0x06)
CheevoProg("Fury of the Dragon",10,0x08)
CheevoProg("American Spirit",10,0x0a)
CheevoProg("Unassuming Detective",10,0x0c)
CheevoProg("Masked Jaguar",10,0x0e)
CheevoProg("Cold Professional",10,0x10)
CheevoProg("Ninja Leader",10,0x12)
CheevoProg("Forest Fire Expert",10,0x14)
CheevoProg("Bamboo Muncher",10,0x16)
CheevoProg("Planet Activist",10,0x18)
CheevoProg("Everyone Loves Robots",10,0x1a)
CheevoProg("Laughing Maniac",10,0x1c)
CheevoProg("Mishima Patriarch",10,0x1e)
CheevoProg("Mirror Match",25,0x20)
CheevoProg("Thousand Faces",10,0x22)
CheevoProg("Bitter Sister",10,0x24)
CheevoProg("Drinking on the Job",10,0x26)
CheevoProg("Tekken Force on the Job!",25,0x28)
// --- --- --- --- --- ---
// Unlocks
// --- --- --- --- --- ---
AdventureUnlock(1,0x00)
AdventureUnlock(1,0x02)
AdventureUnlock(1,0x04)
AdventureUnlock(1,0x06)
AdventureUnlock(5,0x08)
AdventureUnlock(1,0x0a)
AdventureUnlock(1,0x0c)
AdventureUnlock(5,0x0e)
AdventureUnlock(1,0x10)
AdventureUnlock(5,0x12)
AdventureUnlock(5,0x14)
AdventureUnlock(5,0x16)
AdventureUnlock(5,0x18)
AdventureUnlock(5,0x1a)
AdventureUnlock(5,0x1c)
AdventureUnlock(5,0x1e)
AdventureUnlock(10,0x20)
AdventureUnlock(5,0x22)
AdventureUnlock(5,0x24)
AdventureUnlock(5,0x26)
AdventureUnlock(10,0x28)
// --- --- --- --- --- ---
// Misc
// --- --- --- --- --- ---
    achievement(title="Rogue Tekken Master",
                description = "Finish Adventure Mode starting at Level 1 with the same Character and without any Game Over or Time Up",
                points = 50,
                trigger = trigger_when(ModeID == 0x05
                       && P1Health > 0
                       && P2CharID == 0x30
                       && P2Health == 0
                       && prev(P2Health) > 0
                       )
                       && once(AdventureLevel == 0 && AdventureStageID == 0 && AdventureModeOverworld)
                       && never(P1CharID != prev(P1CharID))
                       && never(P1Health == 0)
                       && never(AdventureStepCount == 0)

)   

    achievement(title="Never Stop Progressing",
                description = "In Adventure Mode exchange 10 Stars in a Temple to get a Level Up",
                points = 2,
                trigger = ScreenID == 0x1e
                       && AdventureLevel == prev(AdventureLevel)+1

)   

    achievement(title="Combo Beginner",
                description = "Obtain the 2 Combo Card in Adventure Mode",
                points = 1,
                trigger = ScreenID == 0x06
                       && SubscreenID == 0x16
                       && ComboCard1 == 1
                       && prev(ComboCard1) == 0


)   

    achievement(title="Intermediate Combo",
                description = "Obtain the 3 Combo Card in Adventure Mode",
                points = 2,
                trigger = ScreenID == 0x06
                       && SubscreenID == 0x16
                       && ComboCard2 == 1
                       && prev(ComboCard2) == 0


)   

    achievement(title="Next Step: 10 Hits Combo?",
                description = "Obtain the 4 Combo Card in Adventure Mode",
                points = 3,
                trigger = ScreenID == 0x06
                       && SubscreenID == 0x16
                       && ComboCard3 == 1
                       && prev(ComboCard3) == 0


)   

    achievement(title="Card Captor",
                description = "Collect all Cards on a single Character",
                points = 25,
                trigger = AdventureLevel >= 8
                       && ComboCard1 == 1
                       && ComboCard2 == 1
                       && ComboCard3 == 1


)   

    achievement(title="Perfection Incarnate",
                description = "Defeat a Rival in Adventure Mode without taking any damage",
                points = 10,
                trigger = ModeID == 0x04
                       && FightScreen
                       && SubscreenID == 0x1c
                       && prev(SubscreenID) != 0x1c


)

    achievement(title="Touch of Death",
                description = "Defeat a Rival in Adventure Mode in a single attack round",
                points = 10,
                trigger = ModeID == 0x04
                       && FightScreen
                       && once(MovePicked == 0 && P2Health == 0x50)
                       && MovePicked == 1
                       && P2Health == 0
                       && never(MovePicked == 0 && P2Health < 0x50)



)   
// Rich Presence