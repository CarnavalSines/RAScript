// ~Homebrew~ Relevo's Snowboarding
// #ID = 29093
// 20240407 Version - Sines

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

// $307E: [8 Bit] Score BCD
//        000XX0
//        * 10
// $307F: [8 Bit] Score BCD
//        0XX000
//        * 1000
// $3080: [8 Bit] Score BCD
//        X00000
//        * 100000
//        Technically can go above but display shows 0
// $3081: [8 Bit] Level ID
//        Start at 0x00, ends at 0x0f (Last Stage)
//        0x11 > Freestyle
// $3089: [8 Bit] Color Style
// $3099: [8 Bit] Char State
//        00 > Normal
//        01 > Airborne
//        02 > Down
// $309E: [8 Bit] Goal Flag
//        00 > Off
//        01 > On
// $30AF: [8 Bit] Time Counter
// $30DF: [8 Bit] Nb Figures done in a single jump
//        Nb of frames held for grabs
//        Considered Short Grab (ie. fail) if < 0x1e on landing grabs
// $30E1: [8 Bit] Figure Performed
//        Goes to 0xff on jump until safely landing
//        Stays at 0xff if landing failed
//        00 > Tamedog
//        01 > Wildcat
//        02 > Frontside
//        03 > Backside
//        04 > Nose Grab
//        05 > Indy
//        06 > Mute
//        07 > Melon
// $3109: [8 Bit] Demo Flag
// $311F: [8 Bit] Practice Mode Flag
// $3120: [8 Bit] Practice Event Unlocks
//        00 > None
//        0x0f > Max
//        Secret Code FROSTIVAL unlocks all from the start

///Core
//Constant
Prog_Dict = { // {0}: LevelID - {1}: CheevoName Prog - {2}: Score Prog  - {3}: Course Name - {4}: CheevoName NoFall - {5}: Score NoFall 
                    0x01: [0x03, "Entry Course", 5, "Asian", "Proof of Merit", 5],
                    0x02: [0x07, "Sand Rider", 5, "African", "Dashing Through the Snow", 5],
                    0x03: [0x0b, "Weight of Tradition", 10, "European", "Smooth Sliding", 10],
                    0x04: [0x0f, "One Last Ride", 25, "American", "One with the Ice", 10]

                    } 

Board_Dict = { // {0}: BoardID - {1}: CheevoName Prog - {2}: Board Name  
                    0x01: [0, "All Rounder Ride","Type A (Balanced)"],
                    0x02: [1, "Canon Shot","Type B (Speed)"],
                    0x03: [2, "Airbender","Type C (Jump)"],
                    0x04: [3, "Trust Doesn't Exclude Control","Type D (Control)"]

                    }                     

Figure_Dict = { // {0}: Figure - {1}: CheevoName Prog - {2}: Figure Name  - {3}:Frame Check
                    0x01: [0, "Puppy Person","Tamedog", 1],
                    0x02: [1, "Feline Grace","Wildcat", 1],
                    0x03: [2, "Spiral Energy","Frontside", 1],
                    0x04: [3, "Spinning Top","Backside", 1],
                    0x05: [4, "Got Yours!","Nose Grab", 0x1e],
                    0x06: [5, "No Snake There","Indy", 0x1e],
                    0x07: [6, "Silence is Gold","Mute", 0x1e],
                    0x08: [7, "Fruity Energy","Melon", 0x1e]

                    }  

//Variables
Score1 = bcd(byte(0x307e)) *10
Score2 = bcd(byte(0x307f)) *1000
Score3 = bcd(byte(0x3080)) *100000
Score = bcd(Score1 + Score2 + Score3)
LevelID = byte(0x3081)

BoardID = byte(0x3088)
CharState = byte(0x3099)
CharDown = CharState == 2

GoalFlag = byte(0x309e)
Timer = bcd(byte(0x30af))

FigureTimerCount = byte(0x30df)
FigureID = byte(0x30e1)

DemoFlag = byte(0x3109)
PracticeModeFlag = byte(0x311f)

//Functions
function StageClear() => GoalFlag == 1 && prev(GoalFlag) == 0

function ArcadeProg(Stage){
	
    title = Prog_Dict[Stage][1]
	points = Prog_Dict[Stage][2]
	description = format("Win the {0} Course", Prog_Dict[Stage][3])
	trigger = (LevelID == Prog_Dict[Stage][0]
            && StageClear()
            && DemoFlag == 0
            && PracticeModeFlag == 0
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Stage in Prog_Dict
    ArcadeProg(Stage)

function BoardProg(Board){
	
    title = Board_Dict[Board][1]
	points = 10
	description = format("Become Champion using the {0} Board", Board_Dict[Board][2])
	trigger = (LevelID == 0x0f
            && StageClear()
            && BoardID == Board_Dict[Board][0]
            && DemoFlag == 0
            && PracticeModeFlag == 0
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Board in Board_Dict
    BoardProg(Board)    

function ArcadeProgNoFall(Stage){
	
    title = Prog_Dict[Stage][4]
	points = Prog_Dict[Stage][5]
	description = format("Win the last level of the {0} Course without falling down. Practice Mode is Allowed", Prog_Dict[Stage][3])
	trigger = (LevelID == Prog_Dict[Stage][0]
            && trigger_when(StageClear()
            && DemoFlag == 0)
            && once(LevelID == Prog_Dict[Stage][0] && Timer > 0 && prev(Timer) == 0)
            && never(CharDown)
            && never(LevelID != prev(LevelID))
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Stage in Prog_Dict
    ArcadeProgNoFall(Stage)    

function FigureProg(figure){
	
    title = Figure_Dict[figure][1]
	points = 2
	description = format("Successfully perform the {0} figure. Practice Mode is Allowed", Figure_Dict[figure][2])
	trigger = (FigureID == Figure_Dict[figure][0]
            && prev(FigureID) == 0xff
            && FigureTimerCount >= Figure_Dict[figure][3]
            && DemoFlag == 0
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for figure in Figure_Dict
    FigureProg(figure)       


RPBoard = { 
                    0x00:"Type A",
                    0x01:"Type B",
                    0x02:"Type C",
                    0x03:"Type D"

                    }    
///Default 
rich_presence_display(
    "• Radical Riding down Course {0} • {1} Board Rider - Score: {2}",
    rich_presence_value("Level", LevelID+1),
    rich_presence_lookup("Board", BoardID, RPBoard),
    rich_presence_value("Score", Score)
)    

leaderboard(
    title ="Snowmaster",
    description = "Highest Score on clearing the last level",
    start  = LevelID == 0xf && StageClear() && DemoFlag == 0 && PracticeModeFlag == 0 ,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE",
    lower_is_better=false
)    