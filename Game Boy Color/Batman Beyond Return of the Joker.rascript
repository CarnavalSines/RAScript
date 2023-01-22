// Batman Beyond: Return of the Joker
// #ID = 8571
// 20230122 Version - Sines

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


// $CAB6: [8 Bit] Button Press
//        Bit 0 | A
//        Bit 1 | B
//        Bit 2 | Select
//        Bit 3 | Start > Stays on when game is paused
//        Bit 4 | Right
//        Bit 5 | Left
//        Bit 6 | Up
//        Bit 7 | Down
// $CAD6: [8 Bit] Stage ID
//        0xff on Start Menu
// $CAD7: [8 Bit] Room ID
//        Also work as cinematic ID

// $CAF6: [8 Bit] Batman Health
// $CAF7: [8 Bit] Live Counter
// $CAF8: [8 Bit] Current Enemy Health
// $CB03: [16 Bit] Main Menu Timer
//        Start Demo mode when reaching 0x0000
// $CB1B: [8 Bit] Menu Select Position
//        0x01 When in Password mode
// $CB25: [8 Bit] Horizontal Screen Scroll
// $CB27: [8 Bit] Vertical Screen Scroll
// $CBB8: [8 Bit] During Alert mode, Enemy Reinforcement Count
// $CBB9: [8 Bit] During Alert Mode, Enemy on Screen Count
// $CBBA: [8 Bit] Equipped Item ID
//        0x00 Unarmed
//        0x01 Nunchaku
//        0x2 Discus
//        0x03 Boots
//        0x04 Shield
//        0x05 Staff
// $CBBD: [8 Bit] Alert Mode
//        Bit 0 | Alert Mode ON/OFF
// $CBE2: [8 Bit] Nunchaku Count
// $CBE3: [8 Bit] Discus Count
// $CBE4: [8 Bit] Boots Count
// $CBE5: [8 Bit] Shield Count
// $CBE6: [8 Bit] Staff Count
// $CBEE: [8 Bit] Language Select
//        0x00 > English
//        0x01 > French
//        0x02 > German
// $EAF7: [Memory Block] Multiple Enemies Health Memory
//        Save each individual enemy health value to an 8 block for tracking when fighting multiple enemies at once



///Core
//Constant
//Quick points distribution
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

StageStartID = {
    0: 0x02,
    1: 0x10,
    2: 0x1e,
    3: 0x2f, //Stage ID == 0x04
}


StageEndID = {
    0: 0x0d,
    1: 0x1c,
    2: 0x2c,
    3: 0x43, //Stage ID == 0x03
}


StageBossRoomID = {
    0: 0x0c, //Bonk Fight
    1: 0x1b, //Woof Fight
    2: 0x2b, //Ghoul Fight
    3: 0x42, //Joker Fight
}

StagePreBossRoomID = {
    0: 0x0a, //Bonk Fight
    1: 0x19, //Woof Fight
    2: 0x29, //Ghoul Fight   SceneName [Stage]
    3: 0x40, //Joker Fight
}

//----------------
//Variable
StageID = byte(0xcad6) //Start at 0x00 on Stage 1. Stage ID = 0x04 at the start of Stage 4 then 0x03 during the Warehouse part 'till the end
RoomID = byte (0xcad7)
BatmanHealth = byte(0xcaf6)
BatmanLive = byte(0xcaf7)
CurrentEnemyHealth = byte(0xcaf8)
EquippedID = byte(0xcbba)

//----------------
//Function
function DamageTaken() => prev(BatmanHealth) > BatmanHealth
function LiveLost() => prev(BatmanLive) > BatmanLive
function Respawn() => prior(BatmanLive) == 1 && BatmanLive == 0 //On loss of last live, respawn in the same room but reset enemy HP. Relevant for damageless cheevo
function NakedBatFail() => EquippedID != 0 // Relevant for Naked Bat cheevo
function MainMenu() => RoomID == 0 && StageID == 0xff 
function PasswordMenu() => MainMenu() && byte(0xcb1b) == 1 // Value when entering password. Second argument is changed to 0 if player backs out of password menu and select normal "Start"


function StageProg(title,Stage,points)
{
    achievement(title = title,
                description = "Complete Stage " + (Stage+1),
                points = points,
                trigger = once(RoomID == StageStartID[Stage]) //First mapID 
                          && RoomID == StageEndID[Stage] //Stage End dialogue
                          && StageID == Stage
                          && never(PasswordMenu()) //No loading the stage and going back to menu to enter a password and bypass the level
                )
                   
}
//----------------


///Achievement Code
// Progression
// Misc Challenge


// Progression
//------
StageProg("Hi-Tech Robbery",0,Easy)

StageProg("New Joker in Town",1,Easy)

StageProg("Past Sins",2,Medium)

StageProg("The Last Laugh",3,Medium)


// Misc Challenge
achievement(title = "True Successor",
                description = "Finish the game from start to finish in a single session. No Password, Continue OK",
                points = Hard,
                trigger = once(RoomID == StageStartID[0]) //First mapID 
                          && once(RoomID == StageStartID[1])
                          && once(RoomID == StageStartID[2])
                          && once(RoomID == StageStartID[3])
                          && trigger_when(RoomID == StageEndID[3] //Stage End dialogue
                          && StageID == 3)
                          && never(PasswordMenu()) //No loading the stage and going back to menu to enter a password and bypass the level
                )
                
achievement(title = "Beyond Batman",
                description = "Finish the game from start to finish in a single session without losing a life. No Password, no Continue",
                points = Challenge,
                trigger = once(RoomID == StageStartID[0])  //First mapID 
                          && once(RoomID == StageStartID[1])
                          && once(RoomID == StageStartID[2])
                          && once(RoomID == StageStartID[3])
                          && trigger_when(RoomID == StageEndID[3] //Stage End dialogue
                          && StageID == 3)
                          && never(PasswordMenu()) //No loading the stage and going back to menu to enter a password and bypass the level
                          && never(LiveLost())
                )

achievement(title = "Naked Bat VS Bonk",
                description = "Defeat Bonk damageless without any equipment on. Retry on Continue",
                points = Easy,
                trigger = (once(RoomID == StagePreBossRoomID[0] || Respawn() )) //Hit at the last room you can get before the boss OR reset on Respawn
                          && once(byte(0xd08a) !=0 && RoomID == StageBossRoomID[0])  // Check Boss Health get loaded
                          && trigger_when(RoomID == StageEndID[0] //Stage End dialogue
                          && StageID == 0)
                          && never(DamageTaken())
                          && never(NakedBatFail())
                )
                
achievement(title = "Naked Bat VS Woof",
                description = "Defeat Woof damageless without any equipment on. Retry on Continue",
                points = Easy,
                trigger = (once(RoomID == StagePreBossRoomID[1] || Respawn())) //Hit at the last room you can get before the boss OR reset on Respawn
                          && once(byte(0xd08a) !=0 && RoomID == StageBossRoomID[1])  // Check Boss Health get loaded
                          && trigger_when(RoomID == StageEndID[1] //Stage End dialogue
                          && StageID == 1)
                          && never(DamageTaken())
                          && never(NakedBatFail())
                )
                
achievement(title = "Naked Bat VS Ghoul",
                description = "Defeat Ghoul damageless without any equipment on. Retry on Continue",
                points = Medium,
                trigger = (once(RoomID == StagePreBossRoomID[2] || Respawn())) //Hit at the last room you can get before the boss OR reset on Respawn
                          && once(byte(0xd08a) !=0 && RoomID == StageBossRoomID[2])  // Check Boss Health get loaded
                          && trigger_when(RoomID == StageEndID[2] //Stage End dialogue
                          && StageID == 2)
                          && never(DamageTaken())
                          && never(NakedBatFail())
                )
                
achievement(title = "Naked Bat VS the Joker",
                description = "Defeat Joker damageless without any equipment on. Retry on Continue",
                points = Medium,
                trigger = (once(RoomID == StagePreBossRoomID[3] || Respawn())) //Hit at the last room you can get before the boss OR reset on Respawn
                          && once(byte(0xd08a) !=0 && RoomID == StageBossRoomID[3])  // Check Boss Health get loaded
                          && trigger_when(RoomID == StageEndID[3] //Stage End dialogue
                          && StageID == 3)
                          && never(DamageTaken())
                          && never(NakedBatFail())
                )
///Leaderboards Data

//----------------
