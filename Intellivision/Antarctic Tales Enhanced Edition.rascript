// ~Homebrew~ Antarctic Tales Enhanced Edition
// #ID = 24890

// 20230615 Version - Sines

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

// $053C: [8 Bit] Flag for code being used (Auto-Jump)
//        0x00 > 2021 Mode
//        0x01 > Normal Mode
// $0604: [8 Bit] Loop Number
// $060C: [8 Bit] Stage Number
// $0688: [8 Bit] Speed (Bitflag based)
//        0x1f > Speed 1
//        0x0f > Speed 2
//        0x07 > Speed 3 (max speed normal mode)
//        0x03 > Speed 4 (max speed 2021 mode)
// $06AC: [8 Bit] Timer
// $06B4: [8 Bit] Trainer Mode (1002) flag
//        00 > Off
//        01 > On
// $06F0: [8 Bit] Code Flags
//        Classic Mode (2021), Trainer Mode (1002), Fast Forward (1234)
//        00 > Off
//        01 > Classic Mode
//        02 > Trainer Mode
//        04 > Fast Forward
// $0CB0: [16 Bit] Score
// $0CB4: [8 Bit] Fish Collected
// $0CBC: [8 Bit] Green Flags Collected
// $0CD0: [16 Bit] Remaining Distance in level
// $0CE4: [8 Bit] Purple Flags Collected
// $0D7D: [8 Bit] Value that seems fairly stable to identify Credits mode
//        0x26 > Credits



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
Loop = byte(0x604)
Stage = byte(0x60c)
Speed = byte(0x688)
Code = byte(0x6f0)

Timer = byte(0x6ac)
RemainingDistance = word(0xcd0)
Score = word(0xcb0)

Fish = byte(0xcb4)
GreenFlag = byte(0xcbc)
PurpleFlag = byte(0xce4)

//----------------
///Function
function GameOver() => Loop >= 1 && Stage >=1 && Timer == 0 && byte(0x498) == 4 && Code != 2

function ProgressionNormal(points,title,levelgoal)
{
    achievement(title = title,
                description = "Clear Stage " + levelgoal + " [Lap 1 | No Codes]",
                points = points,
                trigger = 
                            Code == 0 // InGame
                         && Loop == 1
                         && Stage == levelgoal
                         && RemainingDistance == 0
                         && prev(RemainingDistance) == 1
                         
)
}

function ProgressionClassic(points,title,levelgoal)
{
    achievement(title = title,
                description = "Clear Stage " + levelgoal + " [Lap 1 | Classic Mode]",
                points = points,
                trigger = 
                            Code == 1 // InGame
                         && Loop == 1
                         && Stage == levelgoal
                         && RemainingDistance == 0
                         && prev(RemainingDistance) == 1
                         
)
}
//----------------
///Achievement Code
ProgressionNormal(2,"Freezing Land",1)
ProgressionNormal(2,"Classical Runner",2)
ProgressionNormal(3,"Getting Cold Feet",3)
ProgressionNormal(3,"Artic Tourist",4)
ProgressionNormal(5,"Lots of Sights to See",5)
ProgressionNormal(5,"Many Places to Be",6)
ProgressionNormal(5,"Land of the Cold",7)
ProgressionNormal(5,"Salmon Run",8)
ProgressionNormal(10,"Small Respite",9)
ProgressionNormal(10,"Full Lap",10)

    achievement(title = "Marathon Runner",
                description = "Clear Loop 2 [Normal Mode | Fast Forward code Allowed]",
                points = 25,
                trigger = 
                            (Code == 0 || Code == 4)// InGame
                         && Loop == 2
                         && Stage == 10
                         && RemainingDistance == 0
                         && prev(RemainingDistance) == 1
)

ProgressionClassic(2,"Back to the Past",1)
ProgressionClassic(2,"Speed Fiend",2)
ProgressionClassic(3,"Wind on your Back",3)
ProgressionClassic(3,"PenPen's Admirer",4)
ProgressionClassic(5,"Like to Move it",5)
ProgressionClassic(5,"Around the World in 80 Minutes",6)
ProgressionClassic(5,"Limitless",7)
ProgressionClassic(5,"Like in the Good Old Days",8)
ProgressionClassic(10,"Automation is for Chumps",9)
ProgressionClassic(10,"Perfect Line",10)

    achievement(title = "Classic Expert",
                description = "Clear Loop 2 in Classic Mode",
                points = 50,
                trigger = 
                            Code == 1// InGame
                         && Loop == 2
                         && Stage == 10
                         && RemainingDistance == 0
                         && prev(RemainingDistance) == 1
)

    achievement(title = "Green Beret",
                description = "Collect 50 Green Flags in a single run [No Training Mode]",
                points = 5,
                trigger = 
                            Code != 2
                         && GreenFlag == 50
                         && prev(GreenFlag) == 49
                         && Loop >= 1
                         && Stage >= 1
)

    achievement(title = "Flag Bearer",
                description = "Collect 25 Power-up Flags in a single run [No Training Mode]",
                points = 10,
                trigger = 
                            Code != 2
                         && PurpleFlag == 25
                         && prev(PurpleFlag) == 24
                         && Loop >= 1
                         && Stage >= 1
)

    achievement(title = "Filet-O-Fish",
                description = "Grab 50 Fish in a single run [No Training Mode]",
                points = 10,
                trigger = 
                            Code != 2
                         && Fish == 50
                         && prev(Fish) == 49
                         && Loop >= 1
                         && Stage >= 1
)


// Leaderboard 
leaderboard(
    title = "High Score",
    description = "How many laps can you complete before being exhausted ?",
    start  = GameOver() ,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
