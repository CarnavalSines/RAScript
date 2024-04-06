// Hit the Ice: VHL - The Official Video Hockey League
// #ID = 9955
// 20240327 Version - Sines

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

// $0048: [8 Bit] Current Match Period
//        Max 0x03 "normal"
//        0x04 > Sudden Death
// $0A99: [8 Bit] Coundown Seconds BCD
// $0A9A: [8 Bit] Coundown Minutes BCD
// $0BE7: [8 Bit] Nb Player Select
//        Bunch of values depending on Today's Game selected but every 1P mode are 0x00
// $0BE8: [8 Bit] Today's Game
//        00 > VS. Play
//        01 > Championship
//        02 > Shot Race
// $0BEE: [8 Bit] P1 Score
// $0BEF: [8 Bit] P2 Score
// $0C63: [8 Bit] Championship Current Match
//        01 > Blue
//        02 > Green
//        03 > Yellow
//        04 > Black
// $0C6C: [8 Bot] Shot Game Goals
//        0x06 > 3 Shots
//        0x0c > 6 Shots
//        0x12 > 9 Shots
//        0x18 > 12 Shots
// $0C80: [8 Bit] Option Mode Period Time
//        Default 0x00
// $0C81: [8 Bit] Option Mode Handicap
//        Default 0x00
// $0C9D: [8 Bit] Various Game State
//        0x90 > Score Board animation
// $0D6E: [8 Bit] Debug Options
//        Block anything other than 0x00


///Core
//Constant
Match_Dict = { // {0}: MatchID - {1}: CheevoName - {2}: Score - {3}: Color 
                    0x01: [01, "Blue Me Away", 2, "Blue"],
                    0x02: [02, "Green With Envy", 3, "Green"],
                    0x03: [03, "Yellow Jealousy", 5, "Yellow"],
                    0x04: [04, "Black Out", 5, "Black"]

                    } 

Shot_Dict = { // {0}: ShotId - {1}: CheevoName - {2}: Score - {3}: Shots 
                    0x01: [0x06, "Training Wheels", 3, 3],
                    0x02: [0x0c, "I Count Six Shots", 3, 6],
                    0x03: [0x12, "Afternoon With the Lads", 5, 9],
                    0x04: [0x18, "Endless Shooting", 5, 12]

                    } 

TodayGame = { 
                    0:"VS. Play",
                    1:"Championship",
                    2:"Shot Race"

                    }  

RPShot = { 
                    0x06:"3 Shots",
                    0x0c:"6 Shots",
                    0x12:"9 Shots",
                    0x18:"12 Shots"

                    }                      
//Variables
MatchPeriod = byte(0x48)
TimerSec = bcd(byte(0xa99))
TimerMin = bcd(byte(0xa9a))

NbPlayers = byte(0xbe7)
GameMode = byte(0xbe8)
P1Score = byte(0xbee)
P2Score = byte(0xbef)
GameState = byte(0xc9d)


ChampionshipMatch = byte(0x0c63)
ShotGameOption = byte(0xc6c)

OptionPeriodConf = byte(0xc80)
OptionHandicap = byte(0xc81)
DebugModeOption = byte(0xd6e)

//----------------
//Function
function DefaultConf() => OptionPeriodConf == 0 && OptionHandicap == 0 && DebugModeOption == 0 && NbPlayers == 0

function ChampionshipProg(Match){
	
    title = Match_Dict[Match][1]
	points = Match_Dict[Match][2]
	description = format("Defeat the {0} Team in a Championship match [Default Settings]", Match_Dict[Match][3])
	trigger = (DefaultConf()
            && GameMode == 1
            && ChampionshipMatch == Match
            && P1Score > P2Score
            && ((MatchPeriod == 3 && TimerSec == 0 && TimerMin == 0 && prev(TimerSec) == 1)
            || MatchPeriod == 4) // 4th period is sudden death, will always end after one point is taken
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function ShotGameProg(Shots){
	
    title = Shot_Dict[Shots][1]
	points = Shot_Dict[Shots][2]
	description = format("Win a match in Shot Game - {0} Shots mode [Default Settings]", Shot_Dict[Shots][3])
	trigger = (DefaultConf()
            && GameMode == 2
            && ShotGameOption == Shot_Dict[Shots][0]
            && P1Score > P2Score
            && GameState == 0x90
            && prev(GameState) != 0x90
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Match in Match_Dict
    ChampionshipProg(Match)

for Shots in Shot_Dict
    ShotGameProg(Shots)    

    achievement(title="Tricky Headgear",
                description = "In VS. Play or Championship Mode score 3 points in a single match [Default Settings]",
                points = 3,
                trigger = DefaultConf()
                       && __ornext(GameMode == 0
                       || GameMode == 1)
                       && P1Score == 3
                       && prev(P1Score) == 2
)         

    achievement(title="Icy Domination",
                description = "In VS. Play or Championship Mode score 10 points in a single match [Default Settings]",
                points = 10,
                trigger = DefaultConf()
                       && __ornext(GameMode == 0
                       || GameMode == 1)
                       && P1Score == 0x10
                       && prev(P1Score) == 9
)     

    achievement(title="Skill Issue",
                description = "In VS. Play or Championship Mode win a match without having the enemy team score any point [Default Settings]",
                points = 10,
                trigger = DefaultConf()
                       && __ornext(GameMode == 0
                       || GameMode == 1)
                       && P1Score > P2Score
                       && P2Score == 0
                       && ((MatchPeriod == 3 && TimerSec == 0 && TimerMin == 0 && prev(TimerSec) == 1)
                       || MatchPeriod == 4)
)    


    achievement(title="Master Control",
                description = "In VS. Play win a match with the X Option activated [Other Settings on Default]",
                points = 10,
                trigger = DefaultConf()
                       && __ornext(GameMode == 0
                       || GameMode == 1)
                       && P1Score > P2Score
                       && P2Score == 0
                       && ((MatchPeriod == 3 && TimerSec == 0 && TimerMin == 0 && prev(TimerSec) == 1)
                       || MatchPeriod == 4)
)    

// Rich Presence

rich_presence_conditional_display(
    GameMode == 2,
    "• {0} - {1} • Player's Team {2} - {3} Enemy's Team ",
    rich_presence_lookup("Modes", GameMode, TodayGame),
    rich_presence_lookup("Submode", ShotGameOption, RPShot),
    rich_presence_value("P1Score", P1Score),
    rich_presence_value("P2Score", P2Score)) 


///Default 
rich_presence_display(
    "• {0} • Player's Team {1} - {2} Enemy's Team ",
    rich_presence_lookup("Modes", GameMode, TodayGame),
    rich_presence_value("P1Score", P1Score),
    rich_presence_value("P2Score", P2Score)

)