// Prince of Persia: The Sands of Time
// #ID = 2988

// 20231225 Version - Sines

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


// $181ED0: pin
// $181EF4: [32 Bit][PoP 1] Max Health
// $181EF8: [32 Bit][PoP 1] Health Display
// $181EFC: [32 Bit][PoP 1] Enemy Health Display
// $181F2C: [32 Bit][PoP 1] Level ID
//          0x0e >Last run to the princess
//          Switch to 0x00 upon reaching her
// $181F38: [32 Bit][PoP 1] Current Room ID
// $181F64: [32 Bit][PoP 1] Secondary timer part, -1 to 0x181f7c when reaching 0
// $181F7C: [32 Bit][PoP 1]Minutes remaining
//          Time has expired upon reaching 0
// $4EAF10: [ASCII] Current Language
//          english
//          french
//          spanish
// $66D380: [32 Bit] Character Data Pointer
//          +0x24c [32 Bit] Player Health
//          0x64 > Default
//          0x73 > Fountain 1
//          --- --- ---
//          +0x7b4 [32 Bit] Pause Flag
//          Goes to 0 during cutscene, prevents movement
//          +0x828 [32 Bit] Dagger of Time rewind activation flag
//          +0x85c [32 Bit] Sands Charge
//          +0x95c [32 Bit] Current amount of Sandcloud
//          Max 0x07 > +1 == New Sand Charge
// $9784C4: [32 Bit] Exact scope yet undefined Pointer
//          Probably a global pointer for some chain bs
//          Sometimes ASCII Map Pointer (+1D8)
//          
//          ASCII Levels reference Sheet for now
//          --- --- ---
//          0101_Entree
//          0102_Rempart
//          0201_CouloirAller
//          ACT_SandMan_01
//          1102_Corridor03_Next
// $B34304: [32 Bit] ASCII Map Pointer 1
//          +0x1D8=Level ASCII name
// $B5FAE4: [32 Bit] ASCII Map Pointer 2
//          +0x1D8=Level ASCII name
// $BE331C: --- --- ---
//          Starts of the fixed data block
//          --- --- ---
//          Character data is all pointed but it's generally in this area
// $BE6CD4: [8 Bit] Pin Flag (Best so far)
// $C66D44: [32 Bit] ASCII Map Pointer 3
//          +0x1D8=Level ASCII name
// $CE5144: [32 Bit] ASCII Map Pointer 4
//          +0x1D8=Level ASCII name
// $E2A0B4: [32 Bit] Scene ID
//          Can be used as a MapID for the code
//          0x00 > During loading screen (for save protection)
//          0x02 > Title Screen
// $E2A0BC: [8 Bit] Cutscene flag (not IG engine)
// $E414F0: [32 Bit] Float - Prince X Position
//          True for all 3, can't seem to get out-of-bound if value is manipulated to be greater than current boundary
// $E414F4: [32 Bit] Float - Prince Y Position
// $E414F8: [32 Bit] Float - Prince Z Position
// $E415A0: [32 Bit] Potential good MapID indicator


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

LanguageList = { 
                    0x6c676e65:"English",
                    0x6e657266:"Francais",
                    0x6e617073:"Espanol"

                    }  

//----------------
//Variable
/// Game Data
Language = dword(0x4eaf10)

CharDataPointer = dword(0x67190c)
PlayerHealth = dword(CharDataPointer)
PlayerMaxHealth = dword(CharDataPointer + 0x105c)
PauseFlag = dword(CharDataPointer + 0x568)
SandsCharge = dword(CharDataPointer + 0x610)
SandCloudCollection = dword(CharDataPointer + 0x710)
SandThingy = dword(CharDataPointer + 0x1090)
PrinceXPos = float(0xe414f0)
PrinceYPos = float(0xe414f4)
PrinceZPos = float(0xe414f8)
MapID = dword(0xe415a0)
FrenchMapID = dword(0xe4b930)
FrenchPrinceXPos = float(0xe4b880)
FrenchPrinceYPos = float(0xe4b884)
FrenchPrinceZPos = float(0xe4b888)
SpanishMapID = dword(0xe4ae60)
SpanishPrinceXPos = float(0xe4adb0)
SpanishPrinceYPos = float(0xe4adb4)
SpanishPrinceZPos = float(0xe4adb8)
SecondaryCutsceneFlag = byte(0xe2a0bc) //Not IG engine, backup value
MaxSandTank = dword(CharDataPointer + 0xb88)



/// PoP 1
OGPoPMaxHealth = dword(0x181ef4)
OGPoPDisplayHealth = dword(0x181ef8)
OGPoPEnemyHealth = dword(0x181efc)
OGPoPLevelID = dword(0x181f2c)
OGPoPRoomID = dword(0x181f38)
OGPoPMinTimer = dword(0x181f7c)

//Function
function CutsceneStart() => PauseFlag == 0 && once(prev(PauseFlag) == 1 && never(repeated(5,PauseFlag == 0)))
function CutsceneEnd() => PauseFlag == 1 && prev(PauseFlag) == 0
function PosCheck(XPos,YPos,ZPos) => PrinceXPos >= XPos - 1.0 && PrinceXPos <= XPos +1.0 && PrinceYPos >= YPos - 1.0 && PrinceYPos <= YPos +1.0 && PrinceZPos >= ZPos - 1.0 && PrinceZPos <= ZPos +1.0
function FrenchPosCheck(XPos,YPos,ZPos) => FrenchPrinceXPos >= XPos - 1.0 && FrenchPrinceXPos <= XPos +1.0 && FrenchPrinceYPos >= YPos - 1.0 && FrenchPrinceYPos <= YPos +1.0 && FrenchPrinceZPos >= ZPos - 1.0 && FrenchPrinceZPos <= ZPos +1.0
function SpanishPosCheck(XPos,YPos,ZPos) => SpanishPrinceXPos >= XPos - 1.0 && SpanishPrinceXPos <= XPos +1.0 && SpanishPrinceYPos >= YPos - 1.0 && SpanishPrinceYPos <= YPos +1.0 && SpanishPrinceZPos >= ZPos - 1.0 && SpanishPrinceZPos <= ZPos +1.0

function PosCheck2(XPos,YPos) => PrinceXPos >= XPos - 1.0 && PrinceXPos <= XPos +1.0 && PrinceYPos >= YPos - 1.0 && PrinceYPos <= YPos +1.0
function FrenchPosCheck2(XPos,YPos) => FrenchPrinceXPos >= XPos - 1.0 && FrenchPrinceXPos <= XPos +1.0 && FrenchPrinceYPos >= YPos - 1.0 && FrenchPrinceYPos <= YPos +1.0
function SpanishPosCheck2(XPos,YPos) => SpanishPrinceXPos >= XPos - 1.0 && SpanishPrinceXPos <= XPos +1.0 && SpanishPrinceYPos >= YPos - 1.0 && SpanishPrinceYPos <= YPos +1.0

function PosCheck2Extra(XPos,YPos) => PrinceXPos >= XPos - 3.0 && PrinceXPos <= XPos +3.0 && PrinceYPos >= YPos - 3.0 && PrinceYPos <= YPos +3.0
function FrenchPosCheck2Extra(XPos,YPos) => FrenchPrinceXPos >= XPos - 3.0 && FrenchPrinceXPos <= XPos +3.0 && FrenchPrinceYPos >= YPos - 3.0 && FrenchPrinceYPos <= YPos +3.0
function SpanishPosCheck2Extra(XPos,YPos) => SpanishPrinceXPos >= XPos - 3.0 && SpanishPrinceXPos <= XPos +3.0 && SpanishPrinceYPos >= YPos - 3.0 && SpanishPrinceYPos <= YPos +3.0

function PosCheckExtra(XPos,YPos,ZPos) => PrinceXPos >= XPos - 3.0 && PrinceXPos <= XPos +3.0 && PrinceYPos >= YPos - 3.0 && PrinceYPos <= YPos +3.0 && PrinceZPos >= ZPos - 3.0 && PrinceZPos <= ZPos +3.0
function FrenchPosCheckExtra(XPos,YPos,ZPos) => FrenchPrinceXPos >= XPos - 3.0 && FrenchPrinceXPos <= XPos +3.0 && FrenchPrinceYPos >= YPos - 3.0 && FrenchPrinceYPos <= YPos +3.0 && FrenchPrinceZPos >= ZPos - 3.0 && FrenchPrinceZPos <= ZPos +3.0
function SpanishPosCheckExtra(XPos,YPos,ZPos) => SpanishPrinceXPos >= XPos - 3.0 && SpanishPrinceXPos <= XPos +3.0 && SpanishPrinceYPos >= YPos - 3.0 && SpanishPrinceYPos <= YPos +3.0 && SpanishPrinceZPos >= ZPos - 3.0 && SpanishPrinceZPos <= ZPos +3.0

function Damageless() => PlayerHealth < prev(PlayerHealth) && PauseFlag == 1
function Rewind() => SandsCharge < prev(SandsCharge) && PauseFlag == 1
function SandCloudCollectCheck() => ((SandCloudCollection == prev(SandCloudCollection) +1) || (SandCloudCollection == 0 && prev(SandCloudCollection) == 0x07))
function SandChargeUpgrade(Tanks) => (SandCloudCollection == 0 && prev(SandCloudCollection) == 0x07) && SandsCharge == Tanks
function HealthUpgrade() => PlayerHealth > prev(PlayerHealth)
function SandThingyUpgrade(ThingyNum) => SandThingy == (ThingyNum * 2) && prev(SandThingy) == ((ThingyNum - 1) * 2)

//----------------
///Achievement Code

// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---

             
    achievement(title = "Greatest Heist",
                description = "Find the Dagger of Time",
                points = 2,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x0067737a && PosCheck(253,204,28))
                        || (FrenchMapID == 0x0067737a && FrenchPosCheck(253,204,28))
                        || (SpanishMapID == 0x0067737a && SpanishPosCheck(253,204,28)))
                )

    achievement(title = "Going Mad?",
                description = "Unleash the titular Sands and defeat your first corrupted guards",
                points = 2,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x003c392d && PosCheck(-6,32,6))
                        || (FrenchMapID == 0x003c392d && FrenchPosCheck(-6,32,6))
                        || (SpanishMapID == 0x003c392d && SpanishPosCheck(-6,32,6)))
                )

    achievement(title = "Is This Fantasy ?",
                description = "Continue your pursuit of the mystery girl",
                points = 2,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00483d36 && PosCheck(80,37,13))
                        || (FrenchMapID == 0x00483d36 && FrenchPosCheck(80,37,13))
                        || (SpanishMapID == 0x00483d36 && SpanishPosCheck(80,37,13)))
                )                

    achievement(title = "Not Alone Anymore",
                description = "Find Farah and reach the next Vision",
                points = 3,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x02484038 && PosCheck(119,41,-33))
                        || (FrenchMapID == 0x02484038 && FrenchPosCheck(119,41,-33))
                        || (SpanishMapID == 0x02484038 && SpanishPosCheck(119,41,-33)))
                )   

    achievement(title = "Azad Defense System",
                description = "Re-arm the Azad Defense System. Surely this won't cause problems for you",
                points = 3,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x003e3b31 && PosCheck(0,0,-4))
                        || (FrenchMapID == 0x003e3b31 && FrenchPosCheck(0,0,-4))
                        || (SpanishMapID == 0x003e3b31 && SpanishPosCheck(0,0,-4)))
                )   

    achievement(title = "Trap Gauntlet",
                description = "In a move no one saw coming, re-arming the Azad Defense System is causing you more problems. Enjoy the fresh outside air",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00302a24 && PosCheckExtra(75,58,4))
                        || (FrenchMapID == 0x00302a24 && FrenchPosCheckExtra(75,58,4))
                        || (SpanishMapID == 0x00302a24 && SpanishPosCheckExtra(75,58,4)))
                )   

    achievement(title = "Sins of the Son",
                description = "Eliminate what remain of your Father",
                points = 10,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x003c392d && PosCheck(-6,-18,2))
                        || (FrenchMapID == 0x003c392d && FrenchPosCheck(-6,-18,2))
                        || (SpanishMapID == 0x003c392d && SpanishPosCheck(-6,-18,2)))
                        
                )   

    achievement(title = "Team Works, Dream Works",
                description = "Make your way up and down the Tower with Farah",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x0055433b && PosCheckExtra(-126,-45,-31))
                        || (FrenchMapID == 0x0055433b && FrenchPosCheckExtra(-126,-45,-31))
                        || (SpanishMapID == 0x0055433b && SpanishPosCheckExtra(-126,-45,-31)))
                        
                )   

    achievement(title = "Royal Zoo",
                description = "Go on a date with Farah and enjoy rummaging through the Zoo",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00362c29 && PosCheck(0,0,-4))
                        || (FrenchMapID == 0x00362c29 && FrenchPosCheck(0,0,-4))
                        || (SpanishMapID == 0x00362c29 && SpanishPosCheck(0,0,-4)))
                        
                ) 

    achievement(title = "Promises of Steel",
                description = "Advance deeper into the Baths and spot something promising",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00302c27 && PosCheckExtra(-106,79,-38))
                        || (FrenchMapID == 0x00302c27 && FrenchPosCheckExtra(-106,79,-38))
                        || (SpanishMapID == 0x00302c27 && SpanishPosCheckExtra(-106,79,-38)))
                        
                )        

    achievement(title = "King's Blade",
                description = "Find a new Sword, giving you the ability to destroy cracked walls",
                points = 10,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00302c27 && PosCheck(-106,81,-28))
                        || (FrenchMapID == 0x00302c27 && FrenchPosCheck(-106,81,-28))
                        || (SpanishMapID == 0x00302c27 && SpanishPosCheck(-106,81,-28)))
                        
                )  

    achievement(title = "Battle on the Small Bridge",
                description = "Out of the Bath into the Mess Hall, now all you need is some fresh air",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x0047535e && PosCheck(0,0,-4))
                        || (FrenchMapID == 0x0047535e && FrenchPosCheck(0,0,-4))
                        || (SpanishMapID == 0x0047535e && SpanishPosCheck(0,0,-4)))
                        
                )    

    achievement(title = "Redpill Prince",
                description = "C'mon Prince, you can't say that about women...Take orders from Farah and find the path forward, alone",
                points = 3,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x003a474c && PosCheckExtra(-287,150,-36))
                        || (FrenchMapID == 0x003a474c && FrenchPosCheckExtra(-287,150,-36))
                        || (SpanishMapID == 0x003a474c && SpanishPosCheckExtra(-287,150,-36)))
                        
                )    

    achievement(title = "The Other Baths",
                description = "Yes, clearly Farah meant the baths accessible through the bat-infested dank cave",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00211e17 && PosCheckExtra(-116,-8,-154))
                        || (FrenchMapID == 0x00211e17 && FrenchPosCheckExtra(-116,-8,-154))
                        || (SpanishMapID == 0x00211e17 && SpanishPosCheckExtra(-116,-8,-154)))
                        
                )     

    achievement(title = "Into the Light",
                description = "Escape the underground Baths and climb toward the light",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x003b3937 && PosCheck(-64,56,-25))
                        || (FrenchMapID == 0x003b3937 && FrenchPosCheck(-64,56,-25))
                        || (SpanishMapID == 0x003b3937 && SpanishPosCheck(-64,56,-25)))
                        
                ) 

    achievement(title = "What Did You Call Me?",
                description = "Rescue Farah in the Harem",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00475055 && PosCheck(31,149,-23))
                        || (FrenchMapID == 0x00475055 && FrenchPosCheck(31,149,-23))
                        || (SpanishMapID == 0x00475055 && SpanishPosCheck(31,149,-23)))
                        
                )   

    achievement(title = "A Scholar's Weapon",
                description = "Obtain a new Sword in the Halls of Learning",
                points = 10,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x0143372b && PosCheck(41,184,-23))
                        || (FrenchMapID == 0x0143372b && FrenchPosCheck(41,184,-23))
                        || (SpanishMapID == 0x0143372b && SpanishPosCheck(41,184,-23)))
                        
                ) 

    achievement(title = "Planet's Alignement",
                description = "Solve the Observatory Puzzle, now onto something more...dynamic!",
                points = 3,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x002f3232 && PosCheckExtra(138,150,-29))
                        || (FrenchMapID == 0x002f3232 && FrenchPosCheckExtra(138,150,-29))
                        || (SpanishMapID == 0x002f3232 && SpanishPosCheckExtra(138,150,-29)))
                        
                )  

    achievement(title = "Armor is Optional",
                description = "The Prince fell down into the Prison level. Better go shirtless and just don't get hit",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x0021282b && PosCheck(217,-20,-75))
                        || (FrenchMapID == 0x0021282b && FrenchPosCheck(217,-20,-75))
                        || (SpanishMapID == 0x0021282b && SpanishPosCheck(217,-20,-75)))
                        
                )  

    achievement(title = "Easy Escape: No Guards",
                description = "Escape the Prison, climb back up to freedom and make your way to the Tower. The Vizier will pay!",
                points = 5,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00463b3b && PosCheck(207,-45,-31))
                        || (FrenchMapID == 0x00463b3b && FrenchPosCheck(207,-45,-31))
                        || (SpanishMapID == 0x00463b3b && SpanishPosCheck(207,-45,-31)))
                        
                )     

    achievement(title = "Infernal Climb, Eternal Rewards",
                description = "After a dangerous climb you finally reached the Hourglass",
                points = 10,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x021c2325 && PosCheck(96,-25,-69))
                        || (FrenchMapID == 0x021c2325 && FrenchPosCheck(96,-25,-69))
                        || (SpanishMapID == 0x021c2325 && SpanishPosCheck(96,-25,-69)))
                        
                )     

    achievement(title = "Shared Dream",
                description = "What was real and what was a dream? Maybe you'll never know, unless you can catch up to Farah",
                points = 2,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x001f2426 && PosCheck(100,-7,-68))
                        || (FrenchMapID == 0x001f2426 && FrenchPosCheck(100,-7,-68))
                        || (SpanishMapID == 0x001f2426 && SpanishPosCheck(100,-7,-68)))
                        
                )  

    achievement(title = "No More Sand",
                description = "Get back the Dagger of Time",
                points = 10,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x0033302c && PosCheck(95,-42,90))
                        || (FrenchMapID == 0x0033302c && FrenchPosCheck(95,-42,90))
                        || (SpanishMapID == 0x0033302c && SpanishPosCheck(95,-42,90)))
                        
                )    

    achievement(title = "My Name? Just Call Me...",
                description = "Beat the Game",
                points = 25,
                trigger = 
                           CutsceneStart()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00434343 && PosCheck2Extra(660,214))
                        || (FrenchMapID == 0x00434343 && FrenchPosCheck2Extra(660,214))
                        || (SpanishMapID == 0x00434343 && SpanishPosCheck2Extra(660,214)))
                        
                )     

    achievement(title = "True Prince of Persia",
                description = "Beat the Game with no Health or Sand Tank upgrades",
                points = 50,
                trigger = 
                           CutsceneStart()
                        && PlayerHealth > 0 
                        && PlayerMaxHealth == 0x64
                        && MaxSandTank == 0x04    
                        && ((MapID == 0x00434343 && PosCheck2Extra(660,214))
                        || (FrenchMapID == 0x00434343 && FrenchPosCheck2Extra(660,214))
                        || (SpanishMapID == 0x00434343 && SpanishPosCheck2Extra(660,214)))

                        
                )                                                 
//    achievement(title = "Bad Visions",
//                description = "Some visions are worst than others. Thankfully Farah is here for you",
//                points = 1,
//                trigger = 
//                           MapID == 0x00463b3b
//                        && CutsceneEnd()
//                        && PosCheck(176,-53,-33)
//                        && PlayerHealth > 0
//                        
//                )                                                                                                                                                                                                                                                                                         
// --- --- --- --- --- ---
// Collection
// --- --- --- --- --- ---
/// SandCloud
//    achievement(title = "Cloud Start",
//                description = "Collect the First Sand Cloud",
//                points = 1,
//                trigger = 
//                           MapID == 0x00483d36
//                        && SandCloudCollectCheck()
//                        && PosCheck(30,28,2)
//                        && PlayerHealth > 0
//                )

//    achievement(title = "Sandy Feelings",
//                description = "Collect the Second Sand Cloud",
//                points = 1,
//                trigger = 
//                           MapID == 0x00483d36
//                        && SandCloudCollectCheck()
//                        && PosCheck(27,12,19)
//                        && PlayerHealth > 0
//                )     

//    achievement(title = "Up For Grabs",
//                description = "Collect the Third Sand Cloud",
//                points = 1,
//                trigger = 
//                           MapID == 0x00483d36
//                        && SandCloudCollectCheck()
//                       && PosCheckExtra(67,11,13)
//                        && PlayerHealth > 0
//                )  

//    achievement(title = "Cleaning Duty",
//                description = "Collect the Fourth Sand Cloud",
//               points = 1,
//                trigger = 
//                           MapID == 0x00483d36
//                        && SandCloudCollectCheck()
//                       && PosCheckExtra(69,10,2)
//                        && PlayerHealth > 0
//                )  

    achievement(title = "I Love Sand",
                description = "Obtain your first Sand Tank upgrade",
                points = 10,
                trigger = 
                           SandChargeUpgrade(5)
                        && PlayerHealth > 0
//                        && prev(MapID) != 0x003b2e25
                )    

    achievement(title = "It's Coarse and Rough",
                description = "Obtain your second Sand Tank upgrade",
                points = 10,
                trigger = 
                           SandChargeUpgrade(6)
                        && PlayerHealth > 0
 //                       && prev(MapID) != 0x003b2e25
                )   

    achievement(title = "Irritating and It Gets Everywhere",
                description = "Obtain your third Sand Tank upgrade",
                points = 10,
                trigger = 
                           SandChargeUpgrade(7)
                        && PlayerHealth > 0
//                        && prev(MapID) != 0x003b2e25
                ) 

    achievement(title = "Just Like Here",
                description = "Obtain your fourth Sand Tank upgrade",
                points = 10,
                trigger = 
                           SandChargeUpgrade(8)
                        && PlayerHealth > 0
//                        && prev(MapID) != 0x003b2e25
                )  

    achievement(title = "Just Like Her...",
                description = "Obtain your fifth Sand Tank upgrade",
                points = 10,
                trigger = 
                           SandChargeUpgrade(9)
                        && PlayerHealth > 0
//                        && prev(MapID) != 0x003b2e25
                )  

    achievement(title = "Sand Was a Good Friend",
                description = "Obtain every Sand Tank upgrades",
                points = 10,
                trigger = 
                           SandChargeUpgrade(10)
                        && PlayerHealth > 0
//                        && prev(MapID) != 0x003b2e25
                )            

    achievement(title = "Half Guard",
                description = "Obtain 4 Sands Charge, enough to cover your initial Sand Tanks number",
                points = 5,
                trigger = 
                           SandThingyUpgrade(4)
                        && PlayerHealth > 0
//                        && prev(MapID) != 0x003b2e25
                )  

    achievement(title = "Full Guard",
                description = "Obtain the maximum Sands Charge amount",
                points = 5,
                trigger = 
                           SandThingyUpgrade(10)
                        && PlayerHealth > 0
//                        && prev(MapID) != 0x003b2e25
                )                                    
/// Health   

    achievement(title = "Water of Life",
                description = "Collect the First Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00483d36 && PosCheck(91,13,16))
                        || (FrenchMapID == 0x00483d36 && FrenchPosCheck(91,13,16))
                        || (SpanishMapID == 0x00483d36 && SpanishPosCheck(91,13,16)))
                )

    achievement(title = "Trapping Thirst",
                description = "Collect the Second Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x002f2722 && PosCheck(62,65,-6))
                        || (FrenchMapID == 0x002f2722 && FrenchPosCheck(62,65,-6))
                        || (SpanishMapID == 0x002f2722 && SpanishPosCheck(62,65,-6)))
                )    

    achievement(title = "Joyful Tower",
                description = "Collect the Third Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x0055433b && PosCheck(-72,-55,-1))
                        || (FrenchMapID == 0x0055433b && FrenchPosCheck(-72,-55,-1))
                        || (SpanishMapID == 0x0055433b && SpanishPosCheck(-72,-55,-1)))
                ) 

    achievement(title = "Kool-Aid Way",
                description = "Collect the Fourth Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x00302c27 && PosCheck(-93,44,-32))
                        || (FrenchMapID == 0x00302c27 && FrenchPosCheck(-93,44,-32))
                        || (SpanishMapID == 0x00302c27 && SpanishPosCheck(-93,44,-32)))
                ) 

    achievement(title = "Parched Remedy",
                description = "Collect the Fifth Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x003a474c && PosCheck(-312,116,-46))
                        || (FrenchMapID == 0x003a474c && FrenchPosCheck(-312,116,-46))
                        || (SpanishMapID == 0x003a474c && SpanishPosCheck(-312,116,-46)))
                ) 
                
    achievement(title = "Energy Drink",
                description = "Collect the Sixth Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x000e1212 && PosCheck(-146,5,-137))
                        || (FrenchMapID == 0x000e1212 && FrenchPosCheck(-146,5,-137))
                        || (SpanishMapID == 0x000e1212 && SpanishPosCheck(-146,5,-137)))
                ) 

    achievement(title = "Drinking Solution",
                description = "Collect the Seventh Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x1352f2b && PosCheck(90,166,4))
                        || (FrenchMapID == 0x1352f2b && FrenchPosCheck(90,166,4))
                        || (SpanishMapID == 0x1352f2b && SpanishPosCheck(90,166,4)))
                ) 

    achievement(title = "Mystical Waters",
                description = "Collect the Eighth Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x0021282b && PosCheck(189,-18,-119))
                        || (FrenchMapID == 0x0021282b && FrenchPosCheck(189,-18,-119))
                        || (SpanishMapID == 0x0021282b && SpanishPosCheck(189,-18,-119)))
                ) 

    achievement(title = "Bottled Life",
                description = "Collect the Ninth Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x06221e1a && PosCheck(81,-43,-33))
                        || (FrenchMapID == 0x06221e1a && FrenchPosCheck(81,-43,-33))
                        || (SpanishMapID == 0x06221e1a && SpanishPosCheck(81,-43,-33)))
                ) 

    achievement(title = "Quenched Thirst",
                description = "Collect the Tenth and last Health Upgrade",
                points = 10,
                trigger = 
                           HealthUpgrade()
                        && PlayerHealth > 0      
                        && ((MapID == 0x002d2627 && PosCheck(55,-45,-66))
                        || (FrenchMapID == 0x002d2627 && FrenchPosCheck(55,-45,-66))
                        || (SpanishMapID == 0x002d2627 && SpanishPosCheck(55,-45,-66)))
                )                                                                                                                 

    achievement(title = "Sand Wraith",
                description = "Collect all Health and Sand Tank upgrades",
                points = 25,
                trigger = 
                           PlayerMaxHealth == 0xfa
                        && prev(PlayerMaxHealth) == 0xeb
                        && PlayerHealth > 0
                        && MaxSandTank == 0x0a
                        && ((MapID == 0x002d2627 && PosCheck(55,-45,-66))
                        || (FrenchMapID == 0x002d2627 && FrenchPosCheck(55,-45,-66))
                        || (SpanishMapID == 0x002d2627 && SpanishPosCheck(55,-45,-66)))
                )                                                
// --- --- --- --- --- ---
// Bonus
// --- --- --- --- --- ---
/// 3D Level

    achievement(title = "Can't Wait to Kill that Gard! [Bonus]",
                description = "Obtain the Sword in the Prince of Persia 1 3D Easter Egg Level",
                points = 2,
                trigger = 
                           CutsceneEnd()
                        && PlayerHealth > 0      
                        && ((MapID == 0x01282222 && PosCheck(-8,2,-14))
                        || (FrenchMapID == 0x01282222 && FrenchPosCheck(-8,2,-14))
                        || (SpanishMapID == 0x01282222 && SpanishPosCheck(-8,2,-14)))
                )

    achievement(title = "Windows to the Past [Bonus]",
                description = "Enter the Dev Room in the Prince of Persia 1 3D Easter Egg Level",
                points = 3,
                trigger = 
                           PlayerHealth > 0      
                        && ((MapID == 0x01282222 && PosCheck(128,6,-11))
                        || (FrenchMapID == 0x01282222 && FrenchPosCheck(128,6,-11))
                        || (SpanishMapID == 0x01282222 && SpanishPosCheck(128,6,-11)))
                )

    achievement(title = "Party Like it's 1992 [Bonus]",
                description = "Unlock the Prince of Persia 1992 Easter egg. Coming Soon in a subset!",
                points = 5,
                trigger = 
                           bit4(0x00ab8c19) == 1
                        && prev(bit4(0x00ab8c19)) == 0   
                        && PlayerHealth > 0   
                        && (MapID == 0x00232628 || FrenchMapID == 0x00232628 || SpanishMapID == 0x00232628)
                )                


// --- --- --- --- --- ---
// Damageless
// --- --- --- --- --- ---


//    achievement(title = "Honor & Glory",
//                description = "Finish the section outside the Palace [No Damage, Restart on New Game]",
//                points = 2,
//                trigger = 
//                           once(CutsceneEnd()
//                        && PosCheck2(254,-31)
//                        && MapID == 0x00303030
//                            )
//                        && trigger_when(MapID == 0x00272b23
//                        && prev(MapID) == 0x00272a23
//                            )
//                        && never(Damageless())
//                        && never(MapID == 0x003b2e25) //Start Menu
//                )

//    achievement(title = "Great Heist, Greater Fall",
//                description = "Steal the Dagger of Time and finish your first fight [No Damage, No Rewind, Restart on Loading Save]",
//                points = 3,
//                trigger = 
//                           once(CutsceneEnd()
//                        && PosCheck(255,134,23)
//                        && MapID == 0x00272b23
//                            )
//                        && trigger_when(MapID == 0x003c392d
//                        && CutsceneEnd()
//                        && PosCheck(-6,32,6)
//                            )
//                        && never(Damageless())
//                        && never(Rewind())
//                        && never(MapID == 0x003b2e25) //Start Menu
//                )                

//    achievement(title = "Cling to Life",
//                description = "Pursue the mystery girl until your next Vision [No Damage, No Rewind, Restart on Vision]",
//                points = 5,
//                trigger = 
//                           once(CutsceneEnd()
//                        && PosCheck(-6,32,6)
//                        && MapID == 0x003c392d
//                            )
//                        && trigger_when(MapID == 0x00483d36
//                        && CutsceneEnd()
//                        && PosCheck(80,37,13)
//                            )
//                        && never(Damageless())
//                        && never(Rewind())
//                        && never(MapID == 0x003b2e25) //Start Menu
//                ) 

//    achievement(title = "Dark Eyes Upon Me",
//                description = "Catch-up to Farah and reach your next Vision [No Damage, No Upgrade, No Rewind, Restart on Loading Save]",
//                points = 5,
//                trigger = 
//                           once(CutsceneEnd()
//                        && PosCheck(80,37,13)
//                        && MapID == 0x00483d36
//                            )
//                        && trigger_when(MapID == 0x00483d36
//                        && CutsceneEnd()
//                        && PosCheck(80,37,13)
//                            )
//                        && never(Damageless()) // No Dmg
//                        && never(Rewind()) // No Rewind
//                        && never(MapID == 0x003b2e25) //Start Menu
//                        && never(PlayerHealth > 0x64) // No Health Upgrade
//                        && never(SandCloudCollection > 4) // No Sand Upgrade
//                )                                         

// Rich Presence

// Rich Presence

rich_presence_conditional_display(
    CharDataPointer != 0,
    "• Navigating the Currents of Time • {0}/{1}❤️ - {2}/{3}⏰ •",
    rich_presence_value("Life", PlayerHealth),
    rich_presence_value("MaxLife", PlayerMaxHealth),
    rich_presence_value("SandTank", SandsCharge),
    rich_presence_value("MaxSandTank", MaxSandTank))  
 
rich_presence_display(
    "• Prince of Persia • {0} •",
    rich_presence_lookup("Language", Language, LanguageList)
)