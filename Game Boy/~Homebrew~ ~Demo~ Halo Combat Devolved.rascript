// ~Homebrew~ ~Demo~ Halo: Combat Devolved
// #ID = 23796

// 20230328 Version - Sines


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

// $C52A: [16 Bit] Room ID
//        5c9d > main menu
//        52b7 > Cortana Room
//        563e > Assault Rifle
//        c52a > Beautiful fire
//        4000> mandatory fight
//        6388 > Big splat
//        54c5 > before end screen
//        5153 > end screen
// $C617: [8 Bit] Button Pressed
//        Bit 0 | Right
//        Bit 1 | Left
//        Bit 2 | Up
//        Bit 3 | Down
//        Bit 4 | A
//        Bit 5 | B
// $C91B: [8 Bit] Main Menu Select
//        00 > Campaign
//        01 > Continue
//        02 > Missions
//        ff > In game
// $CB9D: [8 Bit] Health
// $CB9F: [8 Bit] Event Bitflags
//        01 > Got the Magnum
//        02 > Got the Assault Rifle
// $CBA9: [8 Bit] Bitflags
//        Bit 0 | Get Cortana
// $CC21: [8 Bit] Enemy 1 Killed Flag
// $CC25: [8 Bit] Enemy 2 Killed Flag
// $CC29: [8 Bit] Enemy 3 Killed Flag
// $CC4F: [8 Bit] Enemy 4 Killed Flag
// $CC53: [8 Bit] Enemy 5 Killed Flag
// $CC57: [8 Bit] Enemy 6 Killed Flag
// $CC5B: [8 Bit] Enemy 7 Killed Flag
// $CC79: [8 Bit] Enemy 8 Killed Flag
// $CC7D: [8 Bit] Enemy 9 Killed Flag
// $CC95: [8 Bit] Enemy 10 Killed Flag
// $CCA7: [8 Bit] Enemy 12 Killed Flag
// $CCAB: [8 Bit] Enemy 11 Killed Flag
// $CCAF: [8 Bit] Enemy 13 Killed Flag
// $CCCD: [8 Bit] Enemy 14 Killed Flag
// $CCD1: [8 Bit] Enemy 15 Killed Flag
// $CCDD: [8 Bit] Enemy 25 Killed Flag
// $CCE1: [8 Bit] Enemy 24 Killed Flag
// $CCE5: [8 Bit] Enemy 23 Killed Flag
// $CCFD: [8 Bit] Enemy 26 Killed Flag
// $CD01: [8 Bit] Enemy 27 Killed Flag
// $CD05: [8 Bit] Enemy 28 Killed Flag
// $CD31: [8 Bit] Enemy 31 Killed Flag MANDATORY
// $CD37: [8 Bit] Enemy 32 Killed Flag MANDATORY
// $CD3D: [8 Bit] Enemy 33 Killed Flag MANDATORY
// $CD43: [8 Bit] Enemy 34 Killed Flag MANDATORY
// $CD49: [8 Bit] Enemy 35 Killed Flag MANDATORY
// $CD5F: [8 Bit] Enemy 37 Killed Flag
// $CD63: [8 Bit] Enemy 36 Killed Flag
// $CD67: [8 Bit] Enemy 38 Killed Flag
// $CD6B: [8 Bit] Enemy 39 Killed Flag
// $CD8B: [8 Bit] Enemy 40 Killed Flag
// $CD8F: [8 Bit] Enemy 41 Killed Flag
// $CD93: [8 Bit] Enemy 42 Killed Flag
// $CD97: [8 Bit] Enemy 43 Killed Flag
// $CD9B: [8 Bit] Enemy 44 Killed Flag
// $CDCF: [8 Bit] Enemy 45 Killed Flag
// $CDD3: [8 Bit] Enemy 46 Killed Flag
// $CDDB: [8 Bit] Enemy 48 Killed Flag
// $CDE3: [8 Bit] Enemy 50 Killed Flag
// $CDEB: [8 Bit] Enemy 47 Killed Flag
// $CDEF: [8 Bit] Enemy 49 Killed Flag
// $CE15: [8 Bit] Enemy 51 Killed Flag
// $CE21: [8 Bit] Enemy 53 Killed Flag
// $CE25: [8 Bit] Enemy 54 Killed Flag
// $CE29: [8 Bit] Enemy 52 Killed Flag
// $CE2D: [8 Bit] Enemy 55 Killed Flag
// $CE63: [8 Bit] Enemy 56 Killed Flag
// $CE7B: [8 Bit] Enemy 30 Killed Flag
// $CE7F: [8 Bit] Enemy 29 Killed Flag
// $CE9B: [8 Bit] Enemy 16 Killed Flag
// $CEA5: [8 Bit] Enemy 18 Killed Flag
// $CEAD: [8 Bit] Enemy 19 Killed Flag
// $CEB5: [8 Bit] Enemy 20 Killed Flag
// $CEB9: [8 Bit] Enemy 21 Killed Flag
// $CEBD: [8 Bit] Enemy 17 Killed Flag
// $CEDB: [8 Bit] Enemy 59 Killed Flag
// $CEDF: [8 Bit] Enemy 57 Killed Flag
// $CEE3: [8 Bit] Enemy 58 Killed Flag
// $CF23: [8 Bit] Enemy 60 Killed Flag
// $CF27: [8 Bit] Enemy 61 Killed Flag

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
RoomID = word(0xc52a)
MainMenu = RoomID == 0x5c9d
EndScreen = RoomID == 0x5153
GameOver = RoomID == 0x4e97

Life = byte(0xcb9d)

AllKillFlags = byte(0xCC21) + byte(0xCC25) + byte(0xCC29) + byte(0xCC4f) + byte(0xCC53) + byte(0xCC57) + byte(0xCC5b) + byte(0xCC79) + byte(0xCC7d) + byte(0xCC95) + byte(0xCCa7) + byte(0xCCab) + byte(0xCCAF) + byte(0xCCCD) + byte(0xCCD1) + byte(0xCCDD) + byte(0xCCE1) + byte(0xCCE5) + byte(0xCCFD) + byte(0xCD01) + byte(0xCD05) + byte(0xCD31) + byte(0xCD37) + byte(0xCD3D) + byte(0xCD43) + byte(0xCD49) + byte(0xCD5F) + byte(0xCD63) + byte(0xCD67) + byte(0xCD6B) + byte(0xCD8B) + byte(0xCD8F) + byte(0xCD93) + byte(0xCD97) + byte(0xCD9B) + byte(0xCDCF) + byte(0xCDD3) + byte(0xCDDB) + byte(0xCDE3) + byte(0xCDEB) + byte(0xCDEF) + byte(0xCE15) + byte(0xCE21) + byte(0xCE25) + byte(0xCE29) + byte(0xCE2D) + byte(0xCE63) + byte(0xCE7B) + byte(0xCE7F) + byte(0xCE9B) + byte(0xCEA5) + byte(0xCEAD) + byte(0xCEB5) + byte(0xCEB9) + byte(0xCEBD) + byte(0xCEDB) + byte(0xCEDF) + byte(0xCEE3) + byte(0xCF23) + byte(0xCF27)    
//----------------
//Function
function StartCheck() => once(RoomID == 0x4d1b && Life == 0)  // First screen after selecting Campaign
function DamagelessCheck() => prev(Life) > Life
function EndGame() => EndScreen && Life > 0
//----------------

///Achievement Code
// Progression
achievement(title = "Thaw Him Out !",
                description = "Wake up, things are exploding !" ,
                points = 1,
                trigger = 
                            Life == 0
                         && EndScreen
                         && prev(RoomID) == 0x4d1b
)

achievement(title = "Mission: Protect Cortana",
                description = "You now have your mission !" ,
                points = 1,
                trigger = 
                            Life > 0
                         && byte(0xcba9) == 1
                         && prev(byte(0xcba9)) == 0
                         && RoomID == 0x52b7
)


achievement(title = "Fully Decked Out",
                description = "Get all your weapons, you will need them" ,
                points = 1,
                trigger = 
                            Life > 0
                         && byte(0xCB9F) == 2
                         && prev(byte(0xCB9F)) < 2
                         && RoomID == 0x563e
)

achievement(title = "Clear the Room",
                description = "Survive the Alien ambush and continue your path" ,
                points = 2,
                trigger = 
                            Life > 0
                         && byte(0xcd31) == 1 && byte(0xcd37) ==1 && byte(0xcd3d) ==1 && byte(0xcd43) ==1 && byte(0xcd49) ==1 
                         && (prev(byte(0xcd31)) == 0 || prev(byte(0xcd37)) ==0 || prev(byte(0xcd3d)) ==0 || prev(byte(0xcd43)) ==0 || prev(byte(0xcd49)) ==0 )
                         && RoomID == 0x4000
)

achievement(title = "Now the Fun Begin",
                description = "Escape the Pillar of Autumn" ,
                points = 5,
                trigger = EndGame()
                       && prev(RoomID) == 0x54c5
)


achievement(title = "Master Chief",
                description = "Escape the Pillar of Autumn without taking any health damage" ,
                points = 5,
                trigger = trigger_when(EndGame()
                       && prev(RoomID) == 0x54c5)
                       && StartCheck()
                       && never(DamagelessCheck())
)

achievement(title = "Master Zen",
                description = "Escape the Pillar of Autumn killing only the mandatory aliens from the ambush" ,
                points = 5,
                trigger = trigger_when(EndGame()
                       && prev(RoomID) == 0x54c5)
                       && StartCheck()
                       && never(AllKillFlags > 5)
)

achievement(title = "Xenos Hater",
                description = "Kill at least 50 Aliens before escaping" ,
                points = 5,
                trigger = StartCheck()
                       && measured(AllKillFlags == 50)
                       && prev(AllKillFlags) < 50
                       && prev(AllKillFlags) > 40
)
// Leaderboard 
//leaderboard(
//    title = "Pillar of Autumn Last Flight",
//    description = "Escape the Pillar of Autumn as fast as possible",
//    start  = StartCheck(),
//    cancel = MainMenu || GameOver,
//    submit = EndGame(),
//    value = Score,
//    format = "FRAMES"
//   





