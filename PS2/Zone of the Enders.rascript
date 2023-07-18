// Zone of the Enders
// #ID = 19079

// 20230707 Version - Sines

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
// $48EE94: Player Health Pointer
//          +0xCAC=Health (Float)
// $48EED4: Objective Arrow Active (01)
// $48EEF0: Playing Cutscene/Collecting Item/etc? (01)
// $48EF00: Difficulty
//          0x00=Easy
//          0x01=Normal
//          0x02=Hard
//          0x03=Very Hard
// $48EF01: Player Level
// $48EF02: Experience Points (16-Bit)
// $48EF04: Health (Static Clone) (Float)
// $48EF10: Story Progress/Mission Objective Flag
//          0x00=Destroy the Raptor
//          0x01=Escape FACTORY.1
//          0x02=Obtain the Flight Module and Escape FACTORY.1
//          0x03=Obtain the Flight Module and Escape FACTORY.1
//          0x04=Destroy Tempest and Save TOWN.1
//          0x05=Leave TOWN.1
//          0x06=Obtain the Colony Info from FACTORY.1
//          0x07=Obtain the Colony Info from FACTORY.11
//          0x08=Leave FACTORY.1
//          0x09=Move to CITY.1 and Destroy the EPS Relay
//          0x0A=Find a Long-Distance Weapon
//          0x0B=Destroy the Porters in TOWN.2 and Obtain the Item
//          0x0C=Snipe the EPS Relay Block in CITY.1
//          0x0D=Destroy the Power Supply Facility of EPS.1 and EPS.2
//          0x0E=Destroy the Power Supply Facility of EPS.1 and EPS.2
//          0x0F=Destroy the Emergency Generator of EPS.2
//          0x10=Find an Uncontrolled Raptor
//          0x11=Use the Raptor to Destroy the Emergency Generator of EPS.2
//          0x12=Use the Raptor to Destroy the Emergency Generator of EPS.2
//          0x13=Use the Raptor to Destroy the Emergency Generator of EPS.2
//          0x14=Meet up with the Atlantis at MOUNTAIN.1
//          0x15=Escape the Large Orbital Frame
//          0x16=Find a Way to Repair ADA in FACTORY.2
//          0x17=Find a Way to Repair ADA in FACTORY.2
//          0x18=Find a Module to Avoid the Laser Attacks
//          0x19=Find a Module to Avoid the Laser Attacks
//          0x1A=Destroy Tyrant in PARK.1
//          0x1B=Meet Up With the Atlantis at MOUNTAIN.1
//          0x1C=Fly Throught the Gully Along the MOUNTAIN.1 slope
//          0x1D=Destroy Nebula at MOUNTAIN.1
//          0x1E=Defeat Neith in WAREHOUSE.1
//          0x1F=Dispose of the Bombs!
//          0x20=Defeat Neith in HUB.1 and Rendezvous With the Atlantis!
// $48EF11: Numberical Area ID
//          0x00=Title Screen
//          0x01=GLOBAL.HUB
//          0x02=HANGAR.1
//          0x03=FACTORY.1
//          0x04=TOWN.1 (Tempest Battle)
//          0x05=TOWN.1
//          0x06=TOWN.2
//          0x07=CITY.1
//          0x08=EPS.1
//          0x09=EPS.2
//          0x0A=CITY.2
//          0x0B=FACTORY.2
//          0x0C=TOWN.3
//          0x0D=PARK.1
//          0x0E=MOUNTAIN.1
//          0x0F=DAM.1
//          0x10=WAREHOUSE.1
//          0x11=TUNNEL.1
//          0x12=HUB.1
//          0x13=VR.TRAINING
//          0x14=ATLANTIS.1 (Ending)
// $48EF12: Previous Area
// $48EF18: Number of Unused Passcodes
// $48EF1C: Passcodes Bit String (Bits remain after using)
//          Bit 0 - pass_javelin
//          Bit 1 - pass_geyser
//          Bit 2 - pass_bounder
//          Bit 3 - pass_phalanx
//          Bit 4 - pass_halberd
//          Bit 5 - pass_comet
//          Bit 6 - pass_gauntlet
//          Bit 7 - pass_decoy1
// $48EF1D: Passcodes Bit String (Bits remain after using)
//          Bit 0 - pass_decoy2
//          Bit 1 - pass_mummy
//          Bit 2 - pass_global
//          Bit 3 - pass_control1
//          Bit 4 - pass_control2
//          Bit 5 - pass_vaccine
//          Bit 6 - pass_antillia
//          Bit 7 - Unused
// $48EF20: Used Passcodes Bit String
//          Bit 0 - pass_javelin
//          Bit 1 - pass_geyser
//          Bit 2 - pass_bounder
//          Bit 3 - pass_phalanx
//          Bit 4 - pass_halberd
//          Bit 5 - pass_comet
//          Bit 6 - pass_gauntlet
//          Bit 7 - pass_decoy1
// $48EF21: Used Passcodes Bit String
//          Bit 0 - pass_decoy2
//          Bit 1 - pass_mummy
//          Bit 2 - pass_global
//          Bit 3 - pass_control1
//          Bit 4 - pass_control2
//          Bit 5 - pass_vaccine
//          Bit 6 - pass_antillia
//          Bit 7 - Unused
// $48EF24: Obtained Weapons
//          Bit 0 - Javelin
//          Bit 1 - Geyser
//          Bit 2 - Bounder
//          Bit 3 - Phalanx
//          Bit 4 - Halberd
//          Bit 5 - Comet
//          Bit 6 - Gauntlet
//          Bit 7 - Sniper
// $48EF25: Obtained Weapons/Modules Bit String
//          Bit 0 - Decoy
//          Bit 1 - Mummy
//          Bit 2 - monitor.fcmd (Scouting Mode Module)
//          Bit 3 - global.fcmd (Flying Mode Module)
//          Bit 4 - raptr_ctrl.fcmd (Raptor Control Module)
//          Bit 5 - detector.fcmd (Anti-Stealth Module)
//          Bit 7 - vaccine.exec (Vaccine Module)
// $48EF26: Obtained Info Bit String
//          Bit 0 - antillia.info (EPS System Data)
//          Bit 1 - info_b.inf (Not used)
//          Bit 2 - info_c.inf (Not used)
//          Bit 3 - info_d.inf (Not used)
//          Bits 4-7 - Unused
// $48EF28: Training Performed Bit String
//          Bit 0 - Move
//          Bit 1 - Dash
//          Bit 2 - Normal Attack
//          Bit 3 - Dash Attack
//          Bit 4 - Burst Attack
//          Bit 5 - Guard
//          Bit 6 - Grab and Throw
//          Bit 7 - Lock On
// $48EF29: Training Performed Bit String
//          Bit 0 - Escape
//          Bit 1 - Camera Operation
//          Bit 2 -
//          Bit 3 -
//          Bit 4 -
//          Bit 5 -
//          Bit 6 -
//          Bit 7 -
// $48EF2A: Equipped Secondary Weapon
//          0x00=None
//          0x01=Javelin
//          0x02=Geyser
//          0x03=Bounder
//          0x04=Phalanx
//          0x05=Halberd
//          0x06=Comet
//          0x07=Gauntlet
//          0x08=Sniper
//          0x09=Decoy
//          0x0A=Mummy
// $48EF2E: Javelin Ammo (16-Bit)
// $48EF30: Geyser Ammo (16-Bit)
// $48EF32: Bounder Ammo (16-Bit)
// $48EF34: Phalanx Ammo (16-Bit)
// $48EF36: Halberd Ammo (16-Bit)
// $48EF38: Comet Ammo (16-Bit)
// $48EF3A: Gauntlet Ammo (16-Bit)
// $48EF3C: Sniper Ammo (16-Bit)
// $48EF3E: Decoy Ammo (16-Bit)
// $48EF40: Mummy Ammo (16-Bit)
// $48EF46: Total Enemies Destroyed (16-Bit)
// $48EF48: Total Saves  (16-Bit)
// $48EF4A: Total Continues Used  (16-Bit)
// $48EF4C: Rescue Mission 1: Town 2 Result
//          0x01=A
//          0x02=B
//          0x03=C
//          0x04=D
//          0x05=E
// $48EF4D: Rescue Mission 2: Town 1 Result
// $48EF4E: Rescue Mission 3: Town 3 Result
// $48EF4F: Rescue Mission 4: City 2 Result
// $48EF50: Rescue Mission 4: City 1 Result
// $48F8A7: Versus Arena Chosen
//          0x00=Hangar
//          0x01=Factory
//          0x02=Town 1
//          0x03=Town 2
//          0x04=City 1
//          0x05=City 2
//          0x06=Park
//          0x07=Town 3
//          0x08=Mountain
//          0x09=Warehouse
//          0x0A=HUB
// $48F8A8: Versus Player Chosen - Player 1
//          0x00=Mummy Head
//          0x01=Cyclops
//          0x02=Raptor
//          0x03=Jehuty
//          0x04=Neith
//          0x05=Single Sword Raptor
//          0x06=Zombie Neith
// $48F8A9: Versus Player Chosen - Player 2
// $48F8AA: Versus Mode Players Flag
//          0x00=Player 1 vs COM
//          0x01=Player 1 vs Player 2
// $48F8AB: Versus Player 1 Level
// $48F8AC: Versus Player 2 Level
// $49119B: Total Number of Enemies Engaged
// $49119C: Total Number of Squads Engaged
// $49C604: Game Over (01)
// $49C9D8: [32 Bit] Boss Health (all boss or just Tempest ?) (Float)
//          Different from Display Health
//          During Tempest first fight goes from 1 to 0 before form transition
// $49D590: [8 Bit] Cinematic Flag
//          IE currently watching a cinematic or not
// $49DDF4: Pointer Related to Level Story Progress?
// $49DF40: Shots Fired?
// $4A6890: Player Health Pointer
//          +0x61C=Health (Float)
// $4AA240: Stage ID (ASCII Text)
//          stage/[stage ID]/
// $4AA246: Stage ID
//          title/ = Title Screen
//          ending/ = Ending
//          fa1/ = Factory 1
//          vr1/ = VR Training Menu
// $4AA2BC: Current Area Timer Pointer
//          +0x964=Current Area Timer (16-Bit)
// $4AA2C8: [32 Bit] Potential VS Mode pointer
//          +0x13A34 | P1 MechID
//          Suspicion of pointer chain
//          
//          Tempest Phase 1 Pointer
//          0x5E8=Phase 1 Health
// $4AA2D4: Tempest Phase 2 Pointer?
//          +0xF5C8=Phase 2 Health
// $4AA4CE: [8 Bit] Button Press L2 Sensor
//          Pressure Sensitive, counters go from 00 (off) to FF (full pressure)
// $4AA4CF: [8 Bit] Button Press R2 Sensor
//          Pressure Sensitive, counters go from 00 (off) to FF (full pressure)
// $4AA4DA: [8 Bit] Button Press Flags 1
//          Bit 0 | Select
//          Bit 1 | L3
//          Bit 2 | R3
//          Bit 3 | Start
//          Bit 4 | Up (DPad or LStick)
//          Bit 5 | Right (DPad or LStick)
//          Bit 6 | Down (DPad or LStick)
//          Bit 7 | Left (DPad or LStick)
// $4AA4DB: [8 Bit] Button Press Flags 2
//          Bit 0 | L2
//          Bit 1 | R2
//          Bit 2 | L1
//          Bit 3 | R1
//          Bit 4 | Triangle
//          Bit 5 | Circle
//          Bit 6 | Cross
//          Bit 7 | Square
// $4AA941: Current Time
//          Seconds
// $4AA942: Current Time
//          Minutes
// $4AA943: Current Time
//          Hours
// $4AA945: Current Date
//          Day
// $4AA946: Current Date
//          Month
// $4AA947: Current Date
//          Year
// $4DF42C: Save Data Time: Hours?
// $4DFC90: Versus Mode Unlocked (Through Game Completion)
//          Bit 0 - Versus Mode Unlocked
//          Bit 1 - Extra Characters and Maps Unlocked
// $4DFC94: Number of Game Completions?
// $4DFC9C: [8 Bit] Versus Mode Unlocks bitflags
//          Bit 1 | Basic VS Mode Unlocked
//          Bit 2 | Advanced VS Mode Unlocked (Bonus Characters / Maps)
// $4DFCA0: [8 Bit] Configuration Menu Flags
//          Bit 0 | Vibration On / Off
//          Bit 1 | Caption DEMO On / Off
//          Bit 2 | Caption GAME On / Off
//          Bit 3 | Sound Stereo (1) / Mono (0)
// $4DFCB0: Game Started Time
//          Seconds
// $4DFCB1: Game Started Time
//          Minute
// $4DFCB2: Game Started Time
//          Hour
// $4DFCB3: Game Started Date
//          Day
// $4DFCB4: Game Started Date
//          Month
// $4DFCB5: Game Started Time
//          Year
// $4DFCB8: Time of Loaded Save
//          Seconds
// $4DFCB9: Time of Loaded Save
//          Minutes
// $4DFCBA: Time of Loaded Save
//          Hours
// $4F95FD: Rescue Mission 2: TOWN.1
//          0x01=SOS In-Progress
//          0x02=In-Mission
// $4F9609: Rescue Mission 1: TOWN.2
//          0x01=SOS In-Progress
//          0x02=In-Mission
// $4F9615: Rescue Mission 3: TOWN.3
//          0x01=SOS In-Progress
//          0x02=In-Mission
// $4F9621: Rescue Mission 5: CITY.1
//          0x01=SOS In-Progress
// $4F962D: Rescue Mission 4: CITY.2
//          0x01=SOS In-Progress
//          0x02=In-Mission
// $4F96BD: Porters Destroyed and Item Collected (01)
//          FACTORY.2 - Decoy Ammo
// $4F96F9: Rescule Mission 1: TOWN.2 Survivors Percentage (On Map) (Float)
// $4F9705: Rescule Mission 2: TOWN.1 Survivors Percentage (On Map) (Float)
// $4F9711: Rescule Mission 3: TOWN.3 Survivors Percentage (On Map) (Float)
// $4F971D: Rescule Mission 4: CITY.2 Survivors Percentage (On Map) (Float)
// $4F9729: Rescule Mission 5: CITY.1 Survivors Percentage (On Map) (Float)
// $4FB740: Factory Destruction Flags (01)
// $4FBE20: Colony Destruction Value?
// $500F78: MOUNTAIN.1 Damage
//          Wall
// $51CE54: [8 Bit] Game Over Menu Continue/EXIT
//          01 > Continue
//          00 > Exit
// $524444: [8 Bit] VS Mode P1 Selection ?
// $5AE970: [8 Bit] Standing Still Flag
// $5AE9AA: [8 Bit] Attack Status ? Tentative
//          0x02 > Charge
//          0x0a > Shield
//          0x13 > Shoot
//          0x14 > Charge Shoot
//          0x15 > Boost Shoot
// $5AEA8E: [16 Bit] ? Health Value
// $5BBB03: ADA Told Leo About Generator (00>01) (Dynamic?)
// $5BBB18: Number of Times Fired on EPS Shield (Dynamic?)
// $1D04C98: [WATCH]

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
/// Player Data
JehutyHealth = float(0x0048ef04) // Static health clone
PlayerLevel = byte(0x48ef01)
SubWeaponEquipped = byte(0x48ef2a)
WeaponUnlocks1 = byte(0x48ef24)
WeaponUnlocks2 = byte(0x48ef25) // Only bit 0 && bit 1 for weapons, others are module flags

JavelinAmmo = word(0x48ef2e)
GeyserAmmo = word(0x48ef30)
BounderAmmo = word(0x48ef32)
PhalanxAmmo = word(0x48ef34)
HalberdAmmo = word(0x48ef36)
CometAmmo = word(0x48ef38)
GauntletAmmo = word(0x48ef3a)
SniperAmmo = word(0x48ef3c)
DecoyAmmo = word(0x48ef3e)
MummyAmmo = word(0x48ef40)

TotalEnemyEngagedCount = byte(0x49119b)
TotalSquadEngagedCount = byte(0x49119c)

///Game Data
Difficulty = byte(0x48ef00) // Easy / Normal / Hard / VHard 0x00 - 0x03
StoryFlag = byte(0x48ef10)
AreaID = byte(0x48ef11)
TrainingFlags1 = byte(0x48ef28)
TrainingFlags2 = byte(0x48ef29) // Only bit 0 && bit 1 relevant

TotalEnemyKill = word(0x48ef46)
TotalSaves = word(0x48ef48)
TotalContinues = word(0x48ef4a)

RescueMissionScore1 = byte(0x48ef4c) // A/B/C/D/E 0x01(A) - 0x05 (E)
RescueMissionScore2 = byte(0x48ef4d)
RescueMissionScore3 = byte(0x48ef4e)
RescueMissionScore4 = byte(0x48ef4f)
RescueMissionScore5 = byte(0x48ef50)

RescueMissionFlag1 = byte(0x4f9609) // 01 > In progress - 02 > In mission
RescueMissionFlag2 = byte(0x4f95fd)
RescueMissionFlag3 = byte(0x4f9615)
RescueMissionFlag4 = byte(0x4f962d)
RescueMissionFlag5 = byte(0x4f9621)

CheatInputFlag = byte(0x48ef6c) // Detected on 0x0A
DebugModeCheatActivation = byte(0x48eec6) // Individual cheat from Bit 0 to Bit 4
GameOverFlag = byte(0x49c604) // Detected on 0x01

BossHealth = dword(0x0049c9d8)
BombPointer = dword(0x0049de0c)
BombIncorrectOffset = 0x1291c
BombIncorrectCount = byte(BombPointer + BombIncorrectOffset)

BombRemainingOffset = 0x12926
BombRemainingCount = byte(BombPointer + BombRemainingOffset)

CutsceneFlag = byte(0x0048eef0)
// Versus Mode
VersusArena = byte(0x48f8a7)
VersusP1MechID = byte(0x48f8a8)
VersusP2MechID = byte(0x48f8a9)

VersusMode = byte(0x48f8aa) // 00 VS Com > 01 VS P2

VersusP1Level = byte(0x48f8ab)
VersusP2Level = byte(0x48f8ac)

VSModeUnlockFlag = byte(0x4dfc90) // bit 0 first unlock, bit 1 second unlock
VSModeCodeUnlockCheat = byte(0x4dfc9c) // anything superior to 0 should be nuked

VSModeEndFlag = byte(0x4aa780) // Raised to 1 on fight end (no retreat)
VSModeP2HealthPointer = dword(0x4d874c)
VSModeP2HealthOffset = 0xb8
VSModeP2Health = dword(VSModeP2HealthPointer + VSModeP2HealthOffset)

//----------------
///Function
function AntiCheatCheck() // Pause Flag if the ammo/health regen code is used OR that the player level is > 8 OR any weapon ammo is > to the normal maxmimu UNTIL Title Screen is reached
{disable_when(CheatInputFlag == 0x0a
|| PlayerLevel > 8
|| JavelinAmmo > 300
|| GeyserAmmo > 100
|| BounderAmmo > 100
|| PhalanxAmmo > 3000
|| HalberdAmmo > 100
|| CometAmmo > 100
|| GauntletAmmo > 200
|| SniperAmmo > 200
|| DecoyAmmo > 10
|| MummyAmmo > 100
|| DebugModeCheatActivation > 0,
until=repeated(60,AreaID == 0x00)
)

}

function Damageless() => JehutyHealth < prev(JehutyHealth)

function NoSubWeapons() 
{once(JavelinAmmo < prev(JavelinAmmo)
|| GeyserAmmo < prev(GeyserAmmo)
|| BounderAmmo < prev(BounderAmmo)
|| PhalanxAmmo < prev(PhalanxAmmo)
|| HalberdAmmo < prev(HalberdAmmo)
|| CometAmmo < prev(CometAmmo)
|| GauntletAmmo < prev(GauntletAmmo)
|| SniperAmmo < prev(SniperAmmo)
|| DecoyAmmo < prev(DecoyAmmo)
|| MummyAmmo < prev(MummyAmmo))
}

function NoSubWeaponsTyrant() 
{once(JavelinAmmo < prev(JavelinAmmo)
|| GeyserAmmo < prev(GeyserAmmo)
|| BounderAmmo < prev(BounderAmmo)
|| PhalanxAmmo < prev(PhalanxAmmo)
|| HalberdAmmo < prev(HalberdAmmo)
|| CometAmmo < prev(CometAmmo)
|| GauntletAmmo < prev(GauntletAmmo)
|| SniperAmmo < prev(SniperAmmo)
|| MummyAmmo < prev(MummyAmmo))
}

//----------------
///Achievement Code

// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---

        
achievement(title = "Into the Much Too Literal Cockpit",
            description = "Destroy your first enemy",
            points = 1,
            trigger = AntiCheatCheck()
                   && TotalEnemyKill == 1
                   && prev(TotalEnemyKill) == 0
                   && AreaID == 0x02
            )
            
achievement(title = "Zone of the Beginners",
            description = "Complete all the Tutorials",
            points = 2,
            trigger = AntiCheatCheck()
                   && bitcount(0x48ef28) + bitcount(0x48ef29) == 10
                   && prev(bitcount(0x48ef28) + bitcount(0x48ef29)) == 9
            )            
            
achievement(title = "Say Hello to My Little Frame",
            description = "Defeat the attacking enemies and drive off Neith in FACTORY.1 without taking damage on Normal or higher difficulty",
            points = 5,
            trigger = AntiCheatCheck()
                   && once(StoryFlag == 1 && prev(StoryFlag)== 0)
                   && trigger_when(StoryFlag == 2
                   && prev(StoryFlag) == 1)
                   && never(Damageless())
            )                   
            
achievement(title = "I Believe I can Fly",
            description = "Obtain the monitor and flight modules",
            points = 3,
            trigger = AntiCheatCheck()
                   && bit2(0x48ef25) + bit3(0x48ef25) == 2
                   && prev(bit2(0x48ef25) + bit3(0x48ef25)) == 1
            )                    
 
achievement(title = "Reap What you Sow",
            description = "Defeat Tempest",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 5
                   && prev(StoryFlag) == 4
                   && AreaID == 4
                   
            )              
             
            
achievement(title = "Don't Call Me Junior!",
            description = "Defeat Tempest without taking damage on Normal or higher difficulty",
            points = 5,
            trigger = AntiCheatCheck()
                   && once(AreaID == 4 && prev(AreaID)== 1 && StoryFlag == 4)
                   && trigger_when(StoryFlag == 5
                   && prev(StoryFlag) == 4
                   && Difficulty >= 1)
                   && never(Damageless())
                   
            )              
            
achievement(title = "Illogical Actions",
            description = "Rescue the people in TOWN.2 with at least a C rank",
            points = 5,
            trigger = AntiCheatCheck()
                   && RescueMissionScore1 <= 3
                   && prev(RescueMissionScore1) == 5 // Default Value

            )                    
            
achievement(title = "Essential Workers",
            description = "Rescue the people in TOWN.2 with an A rank",
            points = 10,
            trigger = AntiCheatCheck()
                   && RescueMissionScore1 == 1
                   && prev(RescueMissionScore1) == 5 // Default Value

            )                     
            
achievement(title = "There and Back Again",
            description = "Return to FACTORY.1 and obtain the colony info",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 8
                   && prev(StoryFlag) == 7
                   && AreaID == 3
                   
            )               
            
            
achievement(title = "Not Again...",
            description = "Rescue the people in TOWN.1 with at least a C rank",
            points = 5,
            trigger = AntiCheatCheck()
                   && RescueMissionScore2 <= 3
                   && prev(RescueMissionScore2) == 5 // Default Value

            )                    
            
achievement(title = "If You Do Something, Do It Well !",
            description = "Rescue the people in TOWN.1 with an A rank",
            points = 10,
            trigger = AntiCheatCheck()
                   && RescueMissionScore2 == 1
                   && prev(RescueMissionScore2) == 5 // Default Value

            )                  
            
achievement(title = "Time to Play Sniper",
            description = "Destroy the CITY.1 shaft",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0xd
                   && prev(StoryFlag) == 0xc
                   && AreaID == 7
                   
            )   
            
achievement(title = "I Always Kill What I Aim At",
            description = "Destroy the CITY.1 shaft without missing a shot with your sniper rifle [Total 8 Shots or Less]",
            points = 10,
            trigger = AntiCheatCheck()
                   && once(AreaID == 7 && prev(AreaID)==1) 
                   && trigger_when(StoryFlag == 0xd
                   && prev(StoryFlag) == 0xc
                   && AreaID == 7)
                   && never(repeated(9,SniperAmmo < prev(SniperAmmo))) // 8 Shot max, reset at 9
                   && never(AreaID == 1) // To account for ammo change on unlocking the sniper
                   
            )                    
            
achievement(title = "Hold On to Your Butts",
            description = "Destroy the EPS.1 generator",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0xf
                   && prev(StoryFlag) == 0xe
                   && AreaID == 8
                   
            )   
                        
achievement(title = "That Doesn't Look Very Scary",
            description = "Hijack an enemy raptor and destroy the EPS.2 generator",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x13
                   && prev(StoryFlag) == 0x12
                   && AreaID == 9
                   
            )               
            
achievement(title = "More Like a Six Foot Turkey",
            description = "Destroy the raptor you were controlling",
            points = 2,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x14
                   && AreaID == 9
                   && bit5(0x48ef25) == 1
                   && prev(bit5(0x48ef25))==0
                   
            )               
                        
achievement(title = "Clever Girl...",
            description = "Destory all enemies at EPS.2 while controlling the raptor [25 Enemies]",
            points = 10,
            trigger = AntiCheatCheck()
                   && once(StoryFlag==0x11 && prev(StoryFlag)==0x10)
                   && trigger_when(AreaID == 9
                   && measured(repeated(21,TotalEnemyKill > prev(TotalEnemyKill))))
                   
            )                    
            
achievement(title = "Good Samaritan",
            description = "Rescue the people in TOWN.3 with at least a C rank",
            points = 5,
            trigger = AntiCheatCheck()
                   && RescueMissionScore3 <= 3
                   && prev(RescueMissionScore3) == 5 // Default Value

            )                    
            
achievement(title = "For the People",
            description = "Rescue the people in TOWN.3 with an A rank",
            points = 10,
            trigger = AntiCheatCheck()
                   && RescueMissionScore3 == 1
                   && prev(RescueMissionScore3) == 5 // Default Value

            )                
achievement(title = "Force of Habit",
            description = "Rescue the people in CITY.2 with at least a C rank",
            points = 5,
            trigger = AntiCheatCheck()
                   && RescueMissionScore4 <= 3
                   && prev(RescueMissionScore4) == 5 // Default Value

            )                    
            
achievement(title = "Physician Heal Thyself",
            description = "Rescue the people in CITY.2 with an A rank",
            points = 10,
            trigger = AntiCheatCheck()
                   && RescueMissionScore4 == 1
                   && prev(RescueMissionScore4) == 5 // Default Value

            )                
                        
            
achievement(title = "Thank You For Choosing NordVPN",
            description = "Find the vaccine to repair ADA",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x18
                   && prev(StoryFlag) == 0x17
                   && AreaID == 0xb

                   
            )                 
            
achievement(title = "Good As New",
            description = "Rescue the people in CITY.1 with at least a C rank",
            points = 5,
            trigger = AntiCheatCheck()
                   && RescueMissionScore5 <= 3
                   && prev(RescueMissionScore5) == 5 // Default Value

            )                    
            
achievement(title = "Best for Last",
            description = "Rescue the people in CITY.1 with an A rank",
            points = 10,
            trigger = AntiCheatCheck()
                   && RescueMissionScore5 == 1
                   && prev(RescueMissionScore5) == 5 // Default Value

            )        
            
achievement(title = "The Ultimate Life-Form...",
            description = "Defeat Tyrant",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x1b
                   && prev(StoryFlag) == 0x1a
                   && AreaID == 0x0d
                   
            )              
                         
achievement(title = "Wesker, You've Become Senile!",
            description = "Defeat Tyrant without taking damage without taking damage on Normal or higher difficulty",
            points = 10,
            trigger = AntiCheatCheck()
                   && once(AreaID ==0x0d && prev(AreaID)== 1 && StoryFlag == 0x1a)
                   && trigger_when(StoryFlag == 0x1b
                   && prev(StoryFlag) == 0x1a
                   && Difficulty >= 1)
                   && never(Damageless())
            )      
            
achievement(title = "Yawn Fest",
            description = "Defeat Tyrant without using any subweapons on Normal or higher difficulty",
            points = 5,
            trigger = AntiCheatCheck()
                   && once(AreaID ==0x0d && prev(AreaID)== 1 && StoryFlag == 0x1a)
                   && trigger_when(StoryFlag == 0x1b
                   && prev(StoryFlag) == 0x1a
                   && Difficulty >= 1)
                   && never(NoSubWeaponsTyrant())
            )  

achievement(title = "Ender's Game",
            description = "Destroy the whole colony for fun!",
            points = 10,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x1b
                   && AreaID == 0x0
                   && prev(AreaID) == 0x01
            //       && RescueMissionScore1 == 5
            //       && RescueMissionScore2 == 5
            //       && RescueMissionScore3 == 5
            //       && RescueMissionScore4 == 5
            //       && RescueMissionScore5 == 5
                   
            )         
            
achievement(title = "That's Enough Killing for Today",
            description = "Defeat Nebula",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x1e
                   && prev(StoryFlag) == 0x1d
                   && AreaID == 0x10
                   
            )              
                         
achievement(title = "Embracing the Night",
            description = "Defeat Nebula without taking damage on Normal or higher difficulty",
            points = 10,
            trigger = AntiCheatCheck()
                   && once(AreaID ==0x0f && prev(AreaID)== 0x0e && StoryFlag == 0x1d)
                   && trigger_when(StoryFlag == 0x1e
                   && prev(StoryFlag) == 0x1d
                   && Difficulty >= 1)
                   && never(Damageless())
            )      
            
achievement(title = "Cooked Octopus",
            description = "Defeat Nebula without using any subweapons on Normal or higher difficulty",
            points = 5,
            trigger = AntiCheatCheck()
                   && once(AreaID ==0x0f && prev(AreaID)== 0x0e && StoryFlag == 0x1d)
                   && trigger_when(StoryFlag == 0x1e
                   && prev(StoryFlag) == 0x1d
                   && Difficulty >= 1)
                   && never(NoSubWeapons())
            )  
                        
            
achievement(title = "Preparation Obliterated",
            description = "Defeat Neith in WAREHOUSE.1",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x1e
                   && AreaID == 0x11
                   && prev(AreaID) == 0x10
                   
            )               
            
achievement(title = "Pride's Fall",
            description = "Defeat Neith in WAREHOUSE.1 without taking damage on Normal or higher difficulty",
            points = 10,
            trigger = AntiCheatCheck()
                   && (once(AreaID ==0x10 && StoryFlag == 0x1e && prev(AreaID) == 0x0f) ||once(AreaID ==0x10 && StoryFlag == 0x1e && prev(AreaID) == 0x00))// 0x3f800000
                   && trigger_when(StoryFlag == 0x1e
                   && AreaID == 0x11
                   && prev(AreaID) == 0x10
                   && Difficulty >= 1)
                   && never(Damageless())
            )               
            
achievement(title = "I Can Do It Without Weapons",
            description = "Defeat Neith in WAREHOUSE.1 without using any subweapons on Normal or higher difficulty",
            points = 5,
            trigger = AntiCheatCheck()
                   && (once(AreaID ==0x10 && StoryFlag == 0x1e && prev(AreaID) == 0x0f) ||once(AreaID ==0x10 && StoryFlag == 0x1e && prev(AreaID) == 0x00))
                   && trigger_when(StoryFlag == 0x1e
                   && AreaID == 0x11
                   && prev(AreaID) == 0x10
                   && Difficulty >= 1)
                   && never(NoSubWeapons())
            )                   
            
achievement(title = "Someone Set Us up the Bomb",
            description = "Defuse the bombs!",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && prev(StoryFlag) == 0x1f
                   && AreaID == 0x12
                  
            )               
                        
achievement(title = "Mission: Destroy Floating Mines",
            description = "Successfully defuse all the bombs",
            points = 10,
            trigger = AntiCheatCheck()
                   && trigger_when(StoryFlag == 0x20
                   && prev(StoryFlag) == 0x1f
                   && AreaID == 0x12)
                   && once(BombRemainingCount == 5)
                   && never(BombIncorrectCount > 0)
                  
            )               
                                
achievement(title = "The Purpose of Living",
            description = "Defeat Neith and escape the colony with your life!",
            points = 10,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prev(AreaID) == 0x12
                  
            )             
            
achievement(title = "You Two Are Not Destined to Meet Yet",
            description = "Defeat Neith and escape the colony without taking damage on Normal or higher difficulty",
            points = 25,
            trigger = AntiCheatCheck()
                   && once(AreaID ==0x12 && prev(StoryFlag)== 0x1f && StoryFlag == 0x20)
                   && trigger_when(StoryFlag == 0x20
                   && prev(AreaID) == 0x12
                   && AreaID == 0x14
                   && Difficulty >= 1)
                   && never(Damageless())
                  
            )                    

achievement(title = "Hard Work and Guts",
            description = "Defeat Neith and escape the colony without using any subweapons on Normal or higher difficulty",
            points = 10,
            trigger = AntiCheatCheck()
                   && once(AreaID ==0x12 && prev(StoryFlag)== 0x1f && StoryFlag == 0x20)
                   && trigger_when(StoryFlag == 0x20
                   && prev(AreaID) == 0x12
                   && AreaID == 0x14
                   && Difficulty >= 1)
                   && never(NoSubWeapons())
                  
            )            
            
// --- --- --- --- --- ---
// Misc & Endings
// --- --- --- --- --- ---

            
achievement(title = "Jehuty 2172: Professional Edition",
            description = "Obtain all weapons and modules",
            points = 10,
            trigger = AntiCheatCheck()
                   && bitcount(0x48ef25) + bitcount(0x48ef24) == 15
                   && prev(bitcount(0x48ef25) + bitcount(0x48ef24)) == 14
                  
            )                   
            
achievement(title = "Never Tell Me the Odds!",
            description = "Engage 15 or more enemies and defeat them all on Normal or higher difficulty",
            points = 10,
            trigger = AntiCheatCheck()
                   && once(TotalEnemyEngagedCount == 15)
                   && trigger_when(repeated(15,TotalEnemyKill > prev(TotalEnemyKill))) // Check that the kill count is raised 15 Times
                   && never(GameOverFlag == 1)
                   && never(AreaID != prev(AreaID))
                   && never(AreaID == 1)
                  
            )                 
            
achievement(title = "ADAversity",
            description = "Complete the game on Easy or higher difficulty",
            points = 1,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && Difficulty >= 0
                   && CutsceneFlag == 0
                   
                  
            )              
            
achievement(title = "ADAptive",
            description = "Complete the game on Normal or higher difficulty",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && Difficulty >= 1
                   && CutsceneFlag == 0
                   
                  
            )              
                        
achievement(title = "ADAventerous",
            description = "Complete the game on Hard or higher difficulty",
            points = 10,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && Difficulty >= 2
                   && CutsceneFlag == 0
                   
                  
            )             
 
achievement(title = "ADAmiration",
            description = "Complete the game on Very Hard difficulty",
            points = 25,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && Difficulty == 3
                   && CutsceneFlag == 0
                   
                  
            )  
            
achievement(title = "Naked Jehuty",
            description = "Complete the game without collecting any unnecessary weapons on Very Hard difficulty",
            points = 25,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && Difficulty == 3
                   && WeaponUnlocks1 == 0x80 // Bit 7 Sniper only
                   && bit1(0x48ef25) == 0 // Checking that Mummy weapon has never been unlocked
                   && CutsceneFlag == 0
                   
                  
            )              
 
achievement(title = "Zone of the Speeders",
            description = "Complete the game in one session in under 90 minutes",
            points = 50,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && once(AreaID == 2 && prev(AreaID) == 0 && StoryFlag == 0) // New game start
                   && never(repeated(324000,AreaID != 0)) // 60 frames (1sec) * 60 (1 minutes) * 90 (90 minutes) > Anticheat already reset if on the titlescreen
                   && CutsceneFlag == 0
                   
                  
            )   
 
achievement(title = "Zone of the Somewhat Reckless",
            description = "Complete the game with 10 or less saves",
            points = 10,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && TotalSaves <= 10
                   && CutsceneFlag == 0
                   
                  
            )  
 
achievement(title = "Zone of the Survivors",
            description = "Complete the game with 0 continues",
            points = 10,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && TotalContinues == 0
                   && CutsceneFlag == 0
                   
                  
            )   
 
achievement(title = "Zone of the Blenders",
            description = "Complete the game with 250 or more enemies defeated",
            points = 10,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && TotalEnemyKill >= 250
                   && CutsceneFlag == 0
                   
                  
            )   
achievement(title = "Zone of the Pacifists",
            description = "Complete the game on Very Hard difficulty with no more than 80 enemies defeated",
            points = 50,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && TotalEnemyKill <= 80
                   && Difficulty == 3
                   && CutsceneFlag == 0
                   
                  
            )  
achievement(title = "Zone of the Zone of the Rescuers",
            description = "Complete the game with all A-Rank rescues",
            points = 25,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && RescueMissionScore1 == 1
                   && RescueMissionScore2 == 1
                   && RescueMissionScore3 == 1
                   && RescueMissionScore4 == 1
                   && RescueMissionScore5 == 1
                   && CutsceneFlag == 0
                   
                  
            )    
            
achievement(title = "Zone of the S's",
            description = "Complete the game with an overall S rank evaluation",
            points = 25,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && Difficulty == 3
                   && TotalContinues <= 5
                   && (RescueMissionScore1 + RescueMissionScore2 + RescueMissionScore3 + RescueMissionScore4 + RescueMissionScore5) < 10
                   && CutsceneFlag == 0
                   
                  
            ) 
            
            
achievement(title = "The Greatest Runner of the 22nd Century",
            description = "Complete the game on Very Hard difficulty with 10 saves or less, 0 continues, 250 or more enemies defeated and all A-Rank rescues",
            points = 50,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && Difficulty == 3
                   && TotalSaves <= 10
                   && TotalContinues == 0
                   && TotalEnemyKill >= 250
                   && RescueMissionScore1 == 1
                   && RescueMissionScore2 == 1
                   && RescueMissionScore3 == 1
                   && RescueMissionScore4 == 1
                   && RescueMissionScore5 == 1
                   && CutsceneFlag == 0
                   
                  
            )  
            
achievement(title = "It's Time to D-D-Duel !",
            description = "Beat the game a 2nd Time to unlock all the Versus mode options",
            points = 5,
            trigger = AntiCheatCheck()
                   && StoryFlag == 0x20
                   && AreaID == 0x14
                   && prior(AreaID) == 0x12
                   && CutsceneFlag == 0
                   && byte(0x004dfc94) == 2
                   && prev(byte(0x004dfc94)) == 1 // Game completion counter increment check
                   
                  
            )              
// --- --- --- --- --- ---
// Versus Mode
// --- --- --- --- --- ---

achievement(title = "Spooky Time",
            description = "In Versus Mode playing as the Mummy Head defeat the AI Mummy Head [P1 LV4 or lower, P2 LV4 or higher]",
            points = 3,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 0
                   && VersusP2MechID == 0
                   && VersusP1Level <= 4
                   && VersusP2Level >= 4
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1
                   
                   
                  
            )   
            
achievement(title = "Keep Your Eye Open",
            description = "In Versus Mode playing as the Cyclops defeat the AI Cyclops [P1 LV4 or lower, P2 LV4 or higher]",
            points = 3,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 1
                   && VersusP2MechID == 1
                   && VersusP1Level <= 4
                   && VersusP2Level >= 4
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1
                   
                   
                  
            )   
                        
achievement(title = "Life Finds a Way",
            description = "In Versus Mode playing as the Raptor defeat the AI Raptor [P1 LV4 or lower, P2 LV4 or higher]",
            points = 3,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 2
                   && VersusP1Level <= 4
                   && VersusP2Level >= 4
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1
                   
                   
                  
            )              
            
achievement(title = "Main Character Syndrome",
            description = "In Versus Mode playing as the Jehuty defeat the AI Jehuty [P1 LV4 or lower, P2 LV4 or higher]",
            points = 3,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 3
                   && VersusP2MechID == 3
                   && VersusP1Level <= 4
                   && VersusP2Level >= 4
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1
                   
                   
                  
            )                      
            
achievement(title = "Horsing Around",
            description = "In Versus Mode playing as the Neith defeat the AI Neith [P1 LV4 or lower, P2 LV4 or higher]",
            points = 3,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 4
                   && VersusP2MechID == 4
                   && VersusP1Level <= 4
                   && VersusP2Level >= 4
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1
                   
                   
                  
            )                 
            
achievement(title = "Man Creates Dinosaurs",
            description = "In Versus Mode playing as the Single Sword Raptor defeat the AI Single Sword Raptor [P1 LV4 or lower, P2 LV4 or higher]",
            points = 3,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 5
                   && VersusP2MechID == 5
                   && VersusP1Level <= 4
                   && VersusP2Level >= 4
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1
                   
                   
                  
            )               
            
achievement(title = "Shoot Them in the Head",
            description = "In Versus Mode playing as the Zombie Neith defeat the AI Zombie Neith [P1 LV4 or lower, P2 LV4 or higher]",
            points = 3,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 6
                   && VersusP2MechID == 6
                   && VersusP1Level <= 4
                   && VersusP2Level >= 4
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1
                   
                   
                  
            )              
            
achievement(title = "Are You My Mummy ?",
            description = "In Versus Mode playing as the Mummy Head defeat the AI Mummy Head [P1 LV4 or lower, P2 LV8]",
            points = 5,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 0
                   && VersusP2MechID == 0
                   && VersusP1Level <= 4
                   && VersusP2Level == 8
                   && trigger_when(VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   
                   
                  
            )               
            
achievement(title = "You Had a Dream. I Have a Plan",
            description = "In Versus Mode playing as the Cyclops defeat the AI Cyclops [P1 LV4 or lower, P2 LV8]",
            points = 5,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 1
                   && VersusP2MechID == 1
                   && VersusP1Level <= 4
                   && VersusP2Level == 8
                   && trigger_when(VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   
                   
                  
            )                    
            
achievement(title = "They Should All Be Destroyed!",
            description = "In Versus Mode playing as the Raptor defeat the AI Raptor [P1 LV4 or lower, P2 LV8]",
            points = 5,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 2
                   && VersusP1Level <= 4
                   && VersusP2Level == 8
                   && trigger_when(VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   
                   
                  
            )                 
            
achievement(title = "True Ender",
            description = "In Versus Mode playing as the Jehuty defeat the AI Jehuty [P1 LV4 or lower, P2 LV8]",
            points = 5,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 3
                   && VersusP2MechID == 3
                   && VersusP1Level <= 4
                   && VersusP2Level == 8
                   && trigger_when(VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   
                   
                  
            )                 
            
achievement(title = "Bitter Revenge",
            description = "In Versus Mode playing as the Neith defeat the AI Neith [P1 LV4 or lower, P2 LV8]",
            points = 5,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 4
                   && VersusP2MechID == 4
                   && VersusP1Level <= 4
                   && VersusP2Level == 8
                   && trigger_when(VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   
                   
                  
            )                 
            
achievement(title = "When She Came In She Took Over the Pride",
            description = "In Versus Mode playing as the Single Sword Raptor defeat the AI Single Sword Raptor [P1 LV4 or lower, P2 LV8]",
            points = 5,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 5
                   && VersusP2MechID == 5
                   && VersusP1Level <= 4
                   && VersusP2Level == 8
                   && trigger_when(VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   
                   
                  
            )                 
            
achievement(title = "S.T.A.R.S....",
            description = "In Versus Mode playing as the Zombie Neith defeat the AI Zombie Neith [P1 LV4 or lower, P2 LV8]",
            points = 5,
            trigger = StoryFlag == 0x0
                   && VersusMode == 0
                   && VersusP1MechID == 6
                   && VersusP2MechID == 6
                   && VersusP1Level <= 4
                   && VersusP2Level == 8
                   && trigger_when(VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   
                   
                  
            )    

achievement(title = "The Little Raptor that Could",
            description = "In Versus mode during a single session defeat each LV8 mechas playing as the Raptor",
            points = 25,
            trigger = StoryFlag == 0x0
                   
                   && once(VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 0
                   && VersusP2Level == 8
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   // Fight 1
                   && once(VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 1
                   && VersusP2Level == 8
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   //Fight 2
                   && once(VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 2
                   && VersusP2Level == 8
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   // Fight 3
                   && once(VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 3
                   && VersusP2Level == 8
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   // Fight 4
                   && once(VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 4
                   && VersusP2Level == 8
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   // Fight 5
                   && once(VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 5
                   && VersusP2Level == 8
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   // Fight 6
                   && once(VersusMode == 0
                   && VersusP1MechID == 2
                   && VersusP2MechID == 6
                   && VersusP2Level == 8
                   && VSModeP2Health == 0
                   && VSModeEndFlag == 1)
                   // Fight 7
                   
                  
            )                        
