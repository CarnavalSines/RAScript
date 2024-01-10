// WWF In Your House
// #ID = 27213

// 20240110 Version - Sines

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

// $115460: [16 Bit] Number of Wins
// $130DE0: [16 Bit] P1 Life
// $130E00: [16 Bit] P2 Life
// $130E08: [16 Bit] P3 Life
// $130E10: [16 Bit] P4 Life
// $15FAC2: [16 Bit] Can be used for Super Pin Detection
//          0x1c20 > Prev value
//          Bret Hart > 0x0a80
//          British Bulldog > 0x5e80
//          The Undertaker > 0x50e8
//          Owen Hart > 0x2a50
//          Shawn Michaels > 0x3f80
//          Ahmed Johnson > 0x9781
//          Vader > 0x18d0
//          Goldust > 0x87f8
//          Ultimate Warrior > 0x7430
//          Hunter > 0x1738
//          
//          --- --- ---
//          0xffff > 0x3000 trigger for Championship Win screen
// $15FB12: [16 Bit] P1 CharID
//          00 > Bret Hart
//          01 > British Bulldog
//          02 > The Undertaker
//          03 > Owen Hart
//          04 > Shawn Michaels
//          05 > Ahmed Johnson
//          06 > Vader
//          07 >
//          08 > Goldust
//          09 > Ultimate Warrior
//          0a > Hunter
// $15FB6A: [16 Bit] Nb of Players
//          1 for the set
//          > 1 for any multiplayer mode
// $15FBAA: [16 Bit] Battle Mode
//          00 > WWF Season
//          01 > Intercontinental Championship
//          02 > WWF Championship
// $15FBB6: [8 Bit] Difficulty
//          00 > Easy
//          01 > Medium
//          02 > Hard

///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CharList = { 
                    0x00:"Bret Hart",
                    0x01:"British Bulldog",
                    0x02:"The Undertaker",
                    0x03:"Owen Hart",
                    0x04:"Shawn Michaels",
                    0x05:"Ahmed Johnson",
                    0x06:"Vader",
                    0x07:"EMPTY",
                    0x08:"Goldust",
                    0x09:"Ultimate Warrior",
                    0x0a:"Hunter"

                    }  

CheevoName = { 
                    0x00:"Best There Is",
                    0x01:"Not U.S.A",
                    0x02:"Rest In Piece",
                    0x03:"King of Harts",
                    0x04:"Kliq Kick",
                    0x05:"Proud of Who You Are",
                    0x06:"Vadertime",
                    0x07:"EMPTY",
                    0x08:"Remember the Name",
                    0x09:"Always Believe",
                    0x0a:"Arrogance is Truth"

                    }                      

SuperPinList = { 
                    0x00:0x0a80,
                    0x01:0x5e80,
                    0x02:0x50e8,
                    0x03:0x2a50,
                    0x04:0x3f80,
                    0x05:0x9781,
                    0x06:0x18d0,
                    0x07:"EMPTY",
                    0x08:0x87f8,
                    0x09:0x7430,
                    0x0a:0x1738

                    }     

CheevoNamePin = { 
                    0x00:"Champion's Belt",
                    0x01:"Island Pride",
                    0x02:"Master of Death",
                    0x03:"Golden Throne",
                    0x04:"Heartbreak",
                    0x05:"Dust to Dust",
                    0x06:"Flattening",
                    0x07:"EMPTY",
                    0x08:"Just Reward",
                    0x09:"God of Thunder",
                    0x0a:"One More for the Collection"

                    }                          

GameMode = { 
                    0x00:"WWF Season",
                    0x01:"Intercontinental Championship",
                    0x02:"WWF Championship"

                    }      

DifficultyRP = { 
                    0x00:"Easy",
                    0x01:"Medium",
                    0x02:"Hard"

                    }                                                             
//----------------
//Variable
/// Game Data
P1Life = word(0x130de0)
StateDetection = word(0x15fac2)
P1CharID = word(0x15fb12)
NbPlayer = word(0x15fb6a)
BattleMode = word(0x15fbaa)
Difficulty = byte(0x15fbb6)
CurrentMatch = word(0x15fc7a)


//Function
function ModeWin() => NbPlayer == 1 && StateDetection == 0x3000 && prev(StateDetection) == 0xffff
function CharWin(Char)
{
    achievement(title=CheevoName[Char],
                description = "Beat any Solo mode with " + CharList[Char]+ "[Continues OK, No Switching Characters on Game Over]",
                points = 5,
                trigger = P1CharID == Char
                       && ModeWin()
                       && once(P1CharID == Char && CurrentMatch == 0)
                       && never(P1CharID != Char && P1Life > 0)
)              
}

function Fatality(Char)
{
    achievement(title=CheevoNamePin[Char],
                description = "Use " + CharList[Char] + " Super Pin",
                points = 3,
                trigger = P1CharID == Char
                       && prev(StateDetection) == 0x1c20 
                       && StateDetection == SuperPinList[Char]
                       && NbPlayer == 1
)              
}
//----------------
///Achievement Code

// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
for i in range (0,6)
CharWin(i)

for i in range (8,10)
CharWin(i)

    achievement(title="Seasonal Champion",
                description = "Beat the WWF Season mode with Any character",
                points = 10,
                trigger = BattleMode == 0
                       && ModeWin()
)    

    achievement(title="Intercontinental Champion",
                description = "Beat the Intercontinental Championship mode with Any character",
                points = 10,
                trigger = BattleMode == 1
                       && ModeWin()
)    

    achievement(title="In the House",
                description = "Beat the WWF Championship mode with Any character",
                points = 10,
                trigger = BattleMode == 2
                       && ModeWin()
)    
// --- --- --- --- --- ---
// Misc
// --- --- --- --- --- ---

    achievement(title="Master of Seasons",
                description = "Beat the WWF Season mode with Any character in Hard Mode",
                points = 25,
                trigger = BattleMode == 0
                       && ModeWin()
                       && Difficulty == 2
)    

    achievement(title="Undisputed Globetrotter",
                description = "Beat the Intercontinental Championship mode with Any character in Hard Mode",
                points = 25,
                trigger = BattleMode == 1
                       && ModeWin()
                       && Difficulty == 2
)    

    achievement(title="There Goes the Neighborhood!",
                description = "Beat the WWF Championship mode with Any character in Hard Mode",
                points = 25,
                trigger = BattleMode == 2
                       && ModeWin()
                       && Difficulty == 2
)    


for i in range (0,6)
Fatality(i)

for i in range (8,10)
Fatality(i)

// Rich Presence

rich_presence_conditional_display(
    P1CharID != 0xffff && P1Life != 0,
    "• {0} • {1} - {2} Mode •",
    rich_presence_lookup("CharID", P1CharID, CharList),
    rich_presence_lookup("GameMode", BattleMode, GameMode),
    rich_presence_lookup("Difficulty", Difficulty, DifficultyRP))  
 
rich_presence_display(
    "• WWF - In Your House •"

)