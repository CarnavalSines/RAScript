// Boxyboy
// #ID = 2281
// 20240201 Version - Sines

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
// $0011: [16 Bit] Step Counter
//        Start at 0x2a16 for some god forsaken reason
//        +1 after "Level Complete" cutscene
//        Stays at 0 during Demo Mode
//        Reset on level change
// $0055: [8 Bit] Level State
//        00 > Playing
//        01 > Stage Complete
//        02 > Give Up
// $0093: [40 Bit Alligned] ASCII Passwordp
// $0200: [8 Bit] Max Stage ID Unlocked
// $0203: [8 Bit] Stage ID
// $1A47: [8 Bit] Demo Flag
//        00 > Normal
//        01 > Demo

///Core
//Constant
CheevoName = { // 0-20 USA - 21-40 Egypt - 41-60 China - 61-80 Southpole - 81-100 Japan - Repeat from USA every 20 levels
                    1:"Boxy Fetus",
                    6:"Move the Box, Box Mover",
                    11:"A Boxy Kind of Feel",
                    16:"Box Included",
                    21:"Put in a Box",
                    26:"Box Box Box",
                    31:"Boxying Around",
                    36:"I'm Box",
                    41:"The Great Box",
                    46:"Flight Box",
                    51:"Big Box",
                    56:"Metal Box",
                    61:"Box Around the World",
                    66:"Of Boxes and Men",
                    71:"Why Does He Push the Box",
                    76:"Boxying this Game, With no Survivors",
                    81:"A Box and his Box",
                    86:"Hi, My Name is Box(x)y",
                    91:"All is Violent, All is Boxy",
                    96:"Spooky Scary Box",
                    101:"Boxy Kid",
                    106:"The Box Heard Accross the World",
                    111:"One Box at a Time",
                    116:"Box...Die",
                    121:"Virtuous Box",
                    126:"Forget It, It's Boxy Town",
                    131:"What's in the Box?",
                    136:"A Box by Any Other Names",
                    141:"Pile of Boxes",
                    146:"Boxinger Z",
                    151:"Mobile Box Boxdam",
                    156:"Code Box",
                    161:"We Have to Box Back",
                    166:"Box Escape",
                    171:"Endless Box",
                    176:"It's Raining Boxes",
                    181:"Trust Me, I'm A Box",
                    186:"Box Rider",
                    191:"Box Around and Find Out",
                    196:"Box Stranding",
                    201:"Boxy Man",
                    206:"The King of the Iron Box",
                    211:"One Box",
                    216:"Box Battle",
                    221:"Beat Box",
                    226:"DoDonBoxy",
                    231:"Armored Box",
                    236:"Boxy Creed",
                    241:"One Man to Box them All",
                    246:"Boxy God"

                    }  
//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable
StepCounter = word(0x0011)
StageState = byte(0x0055)
StageID = byte(0x0203)
DemoFlag = byte(0x1a47)
CheatFlag = byte(0x00dc)

//Function
function CheevoProg(Level,Points)
{
    achievement(title=CheevoName[Level],
                description = "Clear Levels " + Level+" ~ "+Level+4+" in a single session",
                points = Points,
                trigger = once(StageID == Level
                       && StageState == 1
                       && prev(StageState) == 0
                       && DemoFlag == 0
                       && StepCounter >= 10784
                       && CheatFlag == 0
                       )
                       && once(StageID == Level+1
                       && StageState == 1
                       && prev(StageState) == 0
                       && DemoFlag == 0
                       && StepCounter >= 10784
                       && CheatFlag == 0
                       )
                       && once(StageID == Level+2
                       && StageState == 1
                       && prev(StageState) == 0
                       && DemoFlag == 0
                       && StepCounter >= 10784
                       && CheatFlag == 0
                       )
                       && once(StageID == Level+3
                       && StageState == 1
                       && prev(StageState) == 0
                       && DemoFlag == 0
                       && StepCounter >= 10784
                       && CheatFlag == 0
                       )
                       && once(StageID == Level+4
                       && StageState == 1
                       && prev(StageState) == 0
                       && DemoFlag == 0
                       && StepCounter >= 10784
                       && CheatFlag == 0
                       )


)              
}

//----------------
///Achievement Code
// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
for i in range(1,16,5)
CheevoProg(i,2)

for i in range(21,36,5)
CheevoProg(i,3)

for i in range(41,146,5)
CheevoProg(i,5)

for i in range(151,236,5)
CheevoProg(i,10)

for i in range(241,246,5)
CheevoProg(i,25)
// Rich Presence
rich_presence_display(
    "• 📦 Boxying Around in Level {0} 📦 •",
    rich_presence_value("Level", StageID)
)

