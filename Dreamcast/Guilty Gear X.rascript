// Guilty Gear X
// #ID = 462
// 20230726 Version - Sines

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

// $0EFB4C: [8 Bit] Time Limit
//          00 > 30sec
//          01 > 60sec
//          02 > 99sec
//          03 > Infinity
// $0EFB4D: [8 Bit] Round Configuration
//          00 > 1 Round
//          01 > 3 Round
//          02 > 5 Round
// $0EFB4E: [8 Bit] Difficulty Select
//          00 > Easy
//          01 > Normal
//          02 > Hard
//          03 > VeryHard
// $0EFB53: [8 Bit] Medal Mode
//          00 > Off
//          01 > ON
// $0EFB5A: [8 Bit] Shortcut Flag
//          00 > Off
//          01 > ON
// $0F08F0: [8 Bit] GGMode P1 Flag
//          00 > Off
//          01 > ON
//          0xff > Random
// $0F08F1: [8 Bit] GGMode P2 Flag
// $0F0910: [8 Bit] Background Level ID
//          0x00 on transition and Character Select, could be used as check for not changing Char
//          0xff on Main Menu
// $110956: [8 Bit] P2 Char ID
// $110958: [8 Bit] P2 First Round Flag
//          0xFF > No loss
//          0x00 > Lost 1 Round
// $110959: [8 Bit] P2 Second Round Flag
//          0xFF > No loss
//          0x00 > Lost 2 Round
// $110960: [8 Bit] P1 First Round Flag
//          0xFF > No loss
//          0x00 > Lost 1 Round
// $110961: [8 Bit] P1 Second Round Flag
//          0xFF > No loss
//          0x00 > Lost 2 Round
// $1109CE: [16 Bit] Current Fight ID in Arcade mode
//          Increment on "Winner" screen
//          0x09 > Last Boss
//          0x0a > Credit Roll
// $11FC50: [16 Bit] P1 Health (Display)
// $11FCDD: [8 Bit] Latest P1 Combo Hit
// $121950: [8 Bit] Mode Select
//          00 > Main Menu | Arcade
//          01 > VS
//          02 > Training
//          03 > Survival
//          04 > Recording
//          05 > Homepage
//          06 > Option
//          If superior to 06 > Homepage (Web Navigator thingy)
// $121958: [8 Bit] P1 Char ID
//          01 > Sol Badguy
//          02 > Ky Kiske
//          03 > May
//          04 > Millia Rage
//          05 > Axl Low
//          06 > Potemkin
//          07 > Chipp Zanuff
//          08 > Zato-1
//          09 > Baiken
//          0x0a > Faust
//          0x0b > Testament
//          0x0c > Jam Kuradoberi
//          0x0d > Anji Mito
//          0x0e > Johnny
//          0x0f > Venom
//          0x10 > Dizzy
//          0x11 > Random Select (Immediately update to the selected character)
// $12195A: [8 Bit] P2 Char ID (On training Mode)
// $183050: [16 Bit] Survival Mode Timer (Until level 100 beaten)
//          Frame count at 60fps
// $18305C: [8 Bit] Survival Mode Level
// $183F3C: [8 Bit] Difficulty Select (Option Menu duplicate)
//          00 > Easy
//          01 > Normal
//          02 > Hard
//          03 > VeryHard
// $183F54: [8 Bit] Time Limit (Option Menu duplicate)
//          00 > 30sec
//          01 > 60sec
//          02 > 99sec
//          03 > Infinity
// $183F6C: [8 Bit] Round Configuration (Option Menu duplicate)
//          00 > 1 Round
//          01 > 3 Round
//          02 > 5 Round
// $183F84: [8 Bit] Shortcut Flag (Option Menu duplicate)
//          00 > Off
//          01 > ON
// $183F9C: [8 Bit] Medal Mode (Option Menu duplicate)
//          00 > Off
//          01 > ON
// $29A446: [16 Bit] P1 Health
//          Max 0x1b8
// $29A55E: [16 Bit] P2 Health


///Core
//Constant
//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CharID = { 
                    1:0x01, //Sol
                    2:0x02, //Ky
                    3:0x03, //May
                    4:0x04, //Millia
                    5:0x05, //Axl
                    6:0x06, //Potemkin
                    7:0x07, //Chipp 
                    8:0x08, //Zato
                    9:0x09, //Baiken
                    10:0x0a,//Faust
                    11:0x0b,//Testament
                    12:0x0c,//Jam 
                    13:0x0d,//Anji 
                    14:0x0e,//Johnny
                    15:0x0f,//Venom
                    16:0x10//Dizzy
                    }  
                    
CharName = { 
                    1:"Sol Badguy", //Sol
                    2:"Ky Kiske", //Ky
                    3:"May", //May
                    4:"Millia Rage", //Millia
                    5:"Axl Low", //Axl
                    6:"Potemkin", //Potemkin
                    7:"Chipp Zanuff", //Chipp 
                    8:"Zato-1", //Zato
                    9:"Baiken", //Baiken
                    10:"Faust",//Faust
                    11:"Testament",//Testament
                    12:"Jam Kuradoberi",//Jam 
                    13:"Anji Mito",//Anji 
                    14:"Johnny",//Johnny
                    15:"Venom",//Venom
                    16:"Dizzy"//Dizzy
                    }                      
                    
CheevProgTitle = { 
                    1:"Immortal Drifter", //Sol
                    2:"Crusader Prince", //Ky
                    3:"Happy Jellyfish", //May
                    4:"Deadly Hairstyle", //Millia
                    5:"Temporal Displacement", //Axl
                    6:"Buff Potato", //Potemkin
                    7:"Naruto Running", //Chipp 
                    8:"Double Troubles", //Zato
                    9:"Unnarmed but Deadly", //Baiken
                    10:"At least he's not Bald",//Faust
                    11:"Last Will",//Testament
                    12:"Mint Casiopea",//Jam 
                    13:"Butterfly Effect",//Anji 
                    14:"Bravo Captain",//Johnny
                    15:"Toxic Queue",//Venom
                    16:"Of Two Minds"//Dizzy
                    }                          
                    
                    
CheevProgTitleHard = { 
                    1:"The Guilty Gear", //Sol
                    2:"Justice's Meaning", //Ky
                    3:"Totsugeki", //May
                    4:"The Price of Guilt", //Millia
                    5:"Skipping Stone", //Axl
                    6:"Stalwart Protector", //Potemkin
                    7:"New Wave Ninja", //Chipp 
                    8:"Symbiotic Relation", //Zato
                    9:"One Woman Army", //Baiken
                    10:"Hypocrite's Oath",//Faust
                    11:"Last Guardian",//Testament
                    12:"Chef's Kiss",//Jam 
                    13:"Japan's Heart",//Anji 
                    14:"Live Free",//Johnny
                    15:"Assassin's Mantle",//Venom
                    16:"The Innocent Gear"//Dizzy
                    }                       
                    
CheevProgTitleSurvival = { 
                    1:"Red Demon", //Sol
                    2:"Blue Demon", //Ky
                    3:"Aquatic Fiend", //May
                    4:"Mane Monster", //Millia
                    5:"Tempo Devil", //Axl
                    6:"Beastly Destructor", //Potemkin
                    7:"Brisk Devastation", //Chipp 
                    8:"Archfiend's Shade", //Zato
                    9:"Corrupt Grudge", //Baiken
                    10:"Regenerating Decay",//Faust
                    11:"Extermination Avatar",//Testament
                    12:"Beast Chef",//Jam 
                    13:"Moth Diviner",//Anji 
                    14:"Rogue Raider",//Johnny
                    15:"Bitter Malevolence",//Venom
                    16:"Paradise Lost"//Dizzy
                    }                       
                    
                    
//----------------
//Variable

/// Configuration
TimeLimit = byte(0xefb4c)
RoundConf = byte(0xefb4d)
Difficulty = byte(0xefb4e)
MedalMode = byte(0xefb53)
GGModeP1 = byte(0xf08f0)
GGModeP2 = byte(0xf08f1)                
                    
/// Data
BGID = byte(0xf0910)                    
P1CharID = byte(0x121958)
P2CharID = byte(0x110956)
P1Round1Flag = byte(0x110960) // 0xFF > Not lost round / 0x00 Round Lost
P1Round2Flag = byte(0x110961)
P2Round1Flag = byte(0x110958)
P2Round2Flag = byte(0x110959)
P1Health = word(0x29a446)
P2Health = word(0x29a55e)

ArcadeFightID = word(0x1109ce) // 0x09 Last Boss > 0x0a credit roll

ModeSelect = byte(0x121950) // 00 Main Menu and Arcade > 03 Survival

SurvivalLevel = byte(0x18305c)
SurvivalTime = dword(0x183050)
Score = dword(0x1109ac)
                    
//----------------
//Function 
function FightWon() => P2Round2Flag == 0 && prev(P2Round2Flag) == 0xFF
function FightWonSurvival() => P2Round1Flag == 0 && prev(P2Round1Flag) == 0xFF
function DefaultConf() => TimeLimit == 2 && RoundConf == 1 && GGModeP1 == 0 && GGModeP2 == 0    
                  
function ArcadeProg(Character)
{
    achievement(title = CheevProgTitle[Character],
                description = "Complete Arcade mode with "+ CharName[Character] + " [Any Difficulty, No Char switching on Continue, Default Configuration]",
                points = 5,
                trigger = ModeSelect == 0
                       && P1CharID == Character
                       && FightWon()
                       && DefaultConf()
                       && ArcadeFightID == 0x09
                       && once(P1CharID == Character && BGID != 0 && ArcadeFightID == 0 && P1Round1Flag == 0xFF && P2Round1Flag == 0xFF) // Start of arcade mode
                       && never(P1CharID != Character && BGID !=0) // Reset for chosing another fighter and being in game
                       && never(BGID == 0xff) // main menu
                )
}                
                    
function ArcadeProgHard(Character)
{
    achievement(title = CheevProgTitleHard[Character],
                description = "Complete Arcade mode with "+ CharName[Character] + " on Very Hard Difficulty [No Char switching on Continue, Default Configuration]",
                points = 10,
                trigger = ModeSelect == 0
                       && P1CharID == Character
                       && FightWon()
                       && ArcadeFightID == 0x09
                       && Difficulty == 3
                       && DefaultConf()
                       && once(P1CharID == Character && BGID != 0 && ArcadeFightID == 0 && P1Round1Flag == 0xFF && P2Round1Flag == 0xFF) // Start of arcade mode
                       && never(P1CharID != Character && BGID !=0) // Reset for chosing another fighter and being in game
                       && never(BGID == 0xff) // main menu
                )
}                         

function TowerProg(Enemy,Level,Point,Title)
{
    achievement(title = Title,
                description = "Defeat Gold "+ CharName[Enemy]+" in Level "+ Level+" of Survival Mode",
                points = Point,
                trigger = ModeSelect == 3
                       && P2CharID == Enemy
                       && FightWonSurvival()
                       && SurvivalLevel >= Level
                       && SurvivalLevel < Level +10
                       && never(BGID == 0xff) // main menu
                )
}                

function TowerClear(Character)
{
    achievement(title = CheevProgTitleSurvival[Character],
                description = "Defeat the complete Survival Mode with "+ CharName[Character],
                points = 50,
                trigger = ModeSelect == 3
                       && P1CharID == Character
                       && SurvivalLevel == 100
                       && P2CharID == 8
                       && FightWonSurvival()
                       && never(BGID == 0xff) // main menu
                )
}    

function MedalScore(Value,Point,Title)
{
    achievement(title = Title,
                description = "In Arcade mode, with Medal Mode Activated, earn a score of "+ Value+"M or more",
                points = Point,
                trigger = ModeSelect == 0
                       && MedalMode == 1
                       && Score >= Value * 1000000
                       && prev(Score) < Value * 1000000
                       && DefaultConf()
                       && never(BGID == 0xff) // main menu
                )
}     


function TowerSpeedLeaderboard(Character)
{
    leaderboard(
    title = CharName[Character]+" Survivalist",
    description = "Complete the Survival Mode with "+CharName[Character]+" in the fastest time possible",
    start  = P1CharID == Character && SurvivalLevel == 100 && P2CharID == 8 && FightWonSurvival() && never(BGID == 0xff),
    cancel = always_false(),
    submit = always_true(),
    value = SurvivalTime,
    format = "FRAMES",
    lower_is_better=true
)   
}              
//----------------
///Achievement Code
// Progression

/// --- --- ---
///   Arcade
for i in range (1,16)
ArcadeProg(i)

for i in range (1,16)
ArcadeProgHard(i)     

    achievement(title = "Heaven or Hell",
                description = "Complete Arcade mode with no Game Over [Any Difficulty, No Char switching on Continue, Default Configuration]",
                points = 10,
                trigger = ModeSelect == 0
                       && trigger_when(FightWon()
                       && ArcadeFightID == 0x09
                       && DefaultConf())
                       && once(BGID != 0 && ArcadeFightID == 0 && P1Round1Flag == 0xFF && P2Round1Flag == 0xFF) // Start of arcade mode
                       && never(P1Round2Flag == 0 && BGID !=0) // Reset on losing round 2
                       && never(BGID == 0xff) // main menu    
                       
                       )
                       
    achievement(title = "Two Minutes to Midnight",
                description = "Complete Arcade mode with no Game Over on Very Hard Difficulty [No Char switching on Continue, Default Configuration]",
                points = 50,
                trigger = ModeSelect == 0
                       && trigger_when(FightWon()
                       && ArcadeFightID == 0x09
                       && DefaultConf())
                       && Difficulty == 3
                       && once(BGID != 0 && ArcadeFightID == 0 && P1Round1Flag == 0xFF && P2Round1Flag == 0xFF) // Start of arcade mode
                       && never(P1Round2Flag == 0 && BGID !=0) // Reset on losing round 2
                       && never(BGID == 0xff) // main menu    
                       
                       )  
                       
/// --- --- ---
///   Survival
TowerProg(0x0b,20,2,"Descent to Hell") // Testament
TowerProg(0x10,30,2,"Prelude to Disaster") // Dizzy
TowerProg(0x07,40,3,"Bladed Woe") // Chipp
TowerProg(0x06,50,3,"Brute Calamity") // Potemkin
TowerProg(0x09,60,5,"Traditional Collision") // Baiken
TowerProg(0x0a,70,5,"Medical Debacle") // Faust
TowerProg(0x0f,80,10,"Toxin Flood") // Venom
TowerProg(0x04,90,10,"Penultimate Fiend") // Millia
                      
for i in range (1,16)
TowerClear(i)   

    achievement(title = "Demon from the Backyard",
                description = "Defeat the complete Survival Mode in under 10 minutes to unlock all Shadow Costumes",
                points = 100,
                trigger = ModeSelect == 3
                       && trigger_when(SurvivalLevel == 100
                       && P2CharID == 8
                       && FightWonSurvival())
                       && SurvivalTime <= 36000 // 10min framecount 
                       && never(BGID == 0xff) // main menu
                )                   

/// --- --- ---
///   Misc Mode

MedalScore(5,5,"Bronze Medalist")
MedalScore(10,5,"Silver Medalist")   
MedalScore(15,10,"Gold Medalist")     

    achievement(title = "Simpler Times",
                description = "Complete Arcade mode with any character under GG Mode for both opponent[Any Difficulty, Default Configuration]",
                points = 5,
                trigger = ModeSelect == 0
                       && GGModeP1 == 1
                       && GGModeP2 == 1
                       && FightWon()
                       && ArcadeFightID == 0x09
                       && never(BGID == 0xff) // main menu
                )   
                
                
// leaderboard                
for i in range (1,16)
TowerSpeedLeaderboard(i)   

leaderboard(
    title = "Olympic Medalist",
    description = "Obtain the Highest possible Score in a complete Arcade mode run with Medal Mode Activated",
    start  = ModeSelect == 0 && Score > 0 && DefaultConf() && MedalMode == 1 && never(BGID == 0xFF) && ArcadeFightID == 0,
    cancel = BGID == 0xff,
    submit = ArcadeFightID == 0x0a && prev(ArcadeFightID) == 0x09,
    value = Score,
    format = "VALUE"
)                   
