// Rescue Heroes: Billy Blazes!
// #ID = 12877
// 20240111 Version - Sines

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

// $2058: [8 Bit] Difficulty Mode
//        00 > Advanced
//        01 > Rookie
// $2080: [8 Bit] Nb Hostage to Rescue
// $20B8: [8 Bit] Water Spray Available Flag
// $20B9: [8 Bit] Wood Box Breaker Available Flag
// $20BA: [8 Bit] Concrete Block Breaker Available Flag
// $20BB: [8 Bit] Grappling Hook Available Flag
// $20BC: [8 Bit] Ladder Available Flag
// $20C0: [8 Bit] Time Trial Flag
//        01 > On
// $20CC: [8 Bit] Nozzles Amount (Not Display)
// $20F4: [8 Bit] Remaining Lives
// $2110: [8 Bit] Bonus Level Token Collection
//        Max 10
// $2130: [8 Bit] Game Over Check
//        More of an in-game check
//        Goes 00 > 0xff when dying and Lives == 0
// $3008: [8 Bit] Current Music Track being played
//        0x02 > Stage Complete
// $382C: [8 Bit] Level ID Manipulable
//        0x02 > Secret Level Select Menu
//        0x0d > Animal Sanctuary
//        0x0e > Bonus Copter 1
//        0x10 > Farmhouse
//        0x11 > Bonus Copter 2
//        0x12 > Campground
//        0x1a > Bonus ATV 1
//        0x16 > Canyon Crossing
//        0x1d > Bonus ATV 2
//        0x19 > Sky High Village
//        0x14 > Bonus Engine 1
//        0x1c > High Rise
//        0x17 > Bonus Engine 2
//        0x1f > City Hall
//        0x20 > Bonus Jetski
//        0x22 > Statue of Justice
//        0x23 > Top of the Statue
//        0x27 > End Credit
//        --- --- ---
//        0x29 > Tutorial
//        0x2a > Secret PoC Mission 1
//        0x2b > Secret PoC Mission 2
//        0x2c > Secret PoC Mission 3
//        0x2d > Secret PoC Mission 4
//        
//        --- --- ---
//        0x05 > Wayward Screen (for secret code detection)
// $51F0: [8 Bit] Cutscene Flag
//        Can't move when at 0x01
// $58BC: [8 Bit] Level ID Backup
// $79A0: [8 Bit] Time Trial 00:00:X
// $79A4: [8 Bit] Time Trial 00:XX:0
// $79B8: [8 Bit] Time Trial XX:00:0

///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


LevelList = { 
                    1:"Animal Sanctuary",
                    2:"Farmhouse",
                    3:"Campground",
                    4:"Canyon Crossing",
                    5:"Sky High Village",
                    6:"High Rise",
                    7:"City Hall",
                    8:"Statue of Justice",
                    9:"Top of the Statue",
                    10:"Tutorial",
                    11:"Secret Mission 1",
                    12:"Secret Mission 2",
                    13:"Secret Mission 3",
                    14:"Secret Mission 4"

                    }  

LevelIDList = { 
                    1:0x0d,
                    2:0x10,
                    3:0x12,
                    4:0x16,
                    5:0x19,
                    6:0x1c,
                    7:0x1f,
                    8:0x22,
                    9:0x23,
                    10:0x29,
                    11:0x2a,
                    12:0x2b,
                    13:0x2c,
                    14:0x2d

                    }  

LevelListLB = { 
                    1:"Animal Sanctuary",
                    2:"Farmhouse",
                    3:"Sky High Village",
                    4:"High Rise"
                    }    

LevelIDLB = { 
                    1:0x0d,
                    2:0x10,
                    3:0x19,
                    4:0x1c,
                    }  

CheevoName = { 
                    1:"Should Have Listened to that Bear",
                    2:"Horse Not Included",
                    3:"Ground Base",
                    4:"Piece Assembly",
                    5:"Flaming High",
                    6:"Rising Tide",
                    7:"Glowing Hall",
                    8:"Fiery Justice",
                    9:"Saving the Lady",
                    10:"Back to Basics",
                    11:"Proof of Concept",
                    12:"Small Gauntlet",
                    13:"Death from Above",
                    14:"Running Around"

                    }  

CheevoNameHard = { 
                    1:"Yogi Master",
                    2:"Some Animals Are More Equals Than Others",
                    3:"Camping Trip",
                    4:"Steel Crush",
                    5:"Can We Repair It?",
                    6:"Sea of Flames",
                    7:"Urban Destruction",
                    8:"The Great French Gift",
                    9:"Marshmallow Not Included",
                    10:"Back to Basics",
                    11:"Proof of Concept",
                    12:"Small Gauntlet",
                    13:"Death from Above",
                    14:"Running Around"

                    }                      

BonusLevelID = { 
                    0x01:0x0e,
                    0x02:0x11,
                    0x03:0x1a,
                    0x04:0x1d,
                    0x05:0x14,
                    0x06:0x17,
                    0x07:0x20

                    }  

LevelListBonusToken = { 
                    0x01:"Bonus Copter 1",
                    0x02:"Bonus Copter 2",
                    0x03:"Bonus ATV 1",
                    0x04:"Bonus ATV 2",
                    0x05:"Bonus Engine 1",
                    0x06:"Bonus Engine 2",
                    0x07:"Bonus Jetski"


                    } 

CheevoNameBonusToken = { 
                    0x01:"Expert Pilot",
                    0x02:"Weaving the Flames",
                    0x03:"Fighting on All Fronts",
                    0x04:"Four-Wheeled Rescue",
                    0x05:"Readying the Big Guns",
                    0x06:"A Man Has Fallen in Rescue City",
                    0x07:"Fire in Water?"


                    }                                                                

DifficultyRP = { 
                    0x00:"Advanced",
                    0x01:"Rookie"
                    }  

LevelListRP = { 
                    0x2:"Secret Level Select Menu",
                    0x0d:"Animal Sanctuary",
                    0x0e:"Bonus Copter 1",
                    0x10:"Farmhouse",
                    0x11:"Bonus Copter 2",
                    0x12:"Campground",
                    0x1a:"Bonus ATV 1",
                    0x16:"Canyon Crossing",
                    0x1d:"Bonus ATV 2",
                    0x19:"Sky High Village",
                    0x14:"Bonus Engine 1",
                    0x1c:"High Rise",
                    0x17:"Bonus Engine 2",
                    0x1f:"City Hall",
                    0x20:"Bonus Jetski",
                    0x22:"Statue of Justice",
                    0x23:"Top of the Statue",
                    0x24:"End Credit",
                    0x29:"Tutorial",
                    0x2a:"Secret Mission 1",
                    0x2b:"Secret Mission 2",
                    0x2c:"Secret Mission 3",
                    0x2d:"Secret Mission 4"

                    }                      

//----------------
//Variable
/// Game Data
DifficultySelect = byte(0x2058)

NbHostageRescue = byte(0x2080)
NbNozzle = byte(0x20cc) // Life counter for Advanced mode
LifeCounter = byte(0x20f4) // Not Game Over upon reaching 0
CurrentMusic = byte(0x3008)
LevelID = byte(0x382c)
CutsceneFlag = byte(0x51f0)
BonusLevelToken = byte(0x2110)

TimeTrialFlag = byte(0x20c0)
TimeTrialSec = byte(0x79a4)
TimeTrialMin = byte(0x79b8)
TimeTrialSubmitScore = (TimeTrialMin * 60) + TimeTrialSec


//Function
function Damageless() =>  never(NbNozzle < prev(NbNozzle)) && never(LifeCounter < prev(LifeCounter)) && never(LevelID == 0x0a && prev(LevelID) != 0x0a)
function LevelClear() => NbHostageRescue == 0 && CurrentMusic == 0x02 && prev(CurrentMusic) != 0x02 && CutsceneFlag == 1
function CheevoProg(Level,Points)
{
    achievement(title=CheevoName[Level],
                description = "Rescue everyone and clear " + LevelList[Level],
                points = Points,
                trigger = LevelID == LevelIDList[Level]
                       && LevelClear()

)              
}

function CheevoProgHard(Level,Points)
{
    achievement(title=CheevoNameHard[Level],
                description = "Rescue everyone and clear " + LevelList[Level] +" in Advanced Mode",
                points = Points,
                trigger = LevelID == LevelIDList[Level]
                       && LevelClear()
                       && DifficultySelect == 0

)              
}

function CheevoProgHardDamageless(Level,Points)
{
    achievement(title="Expert Firefighter: "+ LevelList[Level],
                description = "Clear " + LevelList[Level] +" in Advanced Mode without taking damage or dying [Reset from Level Select screen]",
                points = Points,
                trigger = trigger_when(LevelID == LevelIDList[Level]
                       && LevelClear()
                       && DifficultySelect == 0)
                       && once(LevelID == LevelIDList[Level] && prev(LevelID) == 0x02) // Level Start
                       && Damageless()
                       && never(LevelID != LevelIDList[Level])

)              
}

function CheevoBonusToken(Level,Points)
{
    achievement(title=CheevoNameBonusToken[Level],
                description = "Collect 10 Tokens in " + LevelListBonusToken[Level],
                points = Points,
                trigger = LevelID == BonusLevelID[Level]
                       && BonusLevelToken == 10
                       && prev(BonusLevelToken) == 9

)              
}

function TimeAttackRookie(Level)
{
    leaderboard(
    title = "Time Attack: "+ LevelListLB[Level]+ " [Rookie]",
    description = "Complete the level in the fastest time possible for Rookie Mode",
    start  = LevelID == LevelIDLB[Level] && TimeTrialFlag == 1 && DifficultySelect == 1,
    cancel = LevelID != LevelIDLB[Level],
    submit = LevelClear(),
    value = TimeTrialSubmitScore,
    format = "SECS",
    lower_is_better=true
)   
}   

function TimeAttackAdvanced(Level)
{
    leaderboard(
    title = "Time Attack: "+ LevelListLB[Level]+ " [Advanced]",
    description = "Complete the level in the fastest time possible for Advanced Mode",
    start  = LevelID == LevelIDLB[Level] && TimeTrialFlag == 1 && DifficultySelect == 0,
    cancel = LevelID != LevelIDLB[Level],
    submit = LevelClear(),
    value = TimeTrialSubmitScore,
    format = "SECS",
    lower_is_better=true
)   
}   
//----------------
///Achievement Code

// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
CheevoProg(10,1)

for i in range (1,2)
CheevoProg(i,2)

for i in range (3,4)
CheevoProg(i,3)

for i in range (5,7)
CheevoProg(i,5)

for i in range (8,9)
CheevoProg(i,10)

// --- --- --- --- --- ---
// Bonus Levels
// --- --- --- --- --- ---
for i in range (1,2)
CheevoBonusToken(i,2)

for i in range (3,4)
CheevoBonusToken(i,3)

for i in range (5,6)
CheevoBonusToken(i,5)

CheevoBonusToken(7,5)
// --- --- --- --- --- ---
// Hard Mode
// --- --- --- --- --- ---
for i in range (1,2)
CheevoProgHard(i,2)

for i in range (3,4)
CheevoProgHard(i,3)

for i in range (5,7)
CheevoProgHard(i,5)

for i in range (8,9)
CheevoProgHard(i,10)

// --- --- --- --- --- ---
// No Dmg
// --- --- --- --- --- ---
for i in range (1,2)
CheevoProgHardDamageless(i,3)

for i in range (3,4)
CheevoProgHardDamageless(i,5)

for i in range (5,7)
CheevoProgHardDamageless(i,10)

for i in range (8,9)
CheevoProgHardDamageless(i,25)

// --- --- --- --- --- ---
// Secrets
// --- --- --- --- --- ---
    achievement(title="Not So Secret Menu",
                description = "Press L+R+Up+Start at the WayForward screen to access the secret Level Select. Secret Levels 1-4 are hidden below the Tutorial selection",
                points = 0,
                trigger = LevelID == 0x02
                       && prev(LevelID) == 0x05

) 

for i in range (11,14)
CheevoProg(i,3)

for i in range (11,14)
CheevoProgHardDamageless(i,5)


///Leaderboards Data
for i in range (1,4)
TimeAttackRookie(i)

for i in range (1,4)
TimeAttackAdvanced(i)
// Rich Presence

rich_presence_conditional_display(
    CutsceneFlag == 0,
    "• {0} • {1}🧯 - {2}👨‍🚒 - {3}🧍 • {4}🚒",
    rich_presence_lookup("Difficulty", DifficultySelect, DifficultyRP),
    rich_presence_value("Nozzles", NbNozzle),
    rich_presence_value("Life", LifeCounter),
    rich_presence_value("Rescue", NbHostageRescue),
    rich_presence_lookup("LevelID", LevelID, LevelListRP))  
 
rich_presence_display(
    "• 🔥 Fighting Fire in All Fronts 🔥 •"

)
