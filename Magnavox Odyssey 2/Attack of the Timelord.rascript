// Attack of the Timelord
// #ID = 16960

// 20230616 Version - Sines

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

// $0040: [8 Bit] High Score * 1000
// $0041: [8 Bit] High Score * 100
// $0042: [8 Bit] High Score * 10
// $0043: [8 Bit] High Score * 1
// $004C: [8 Bit] Score * 1000
// $004D: [8 Bit] Score * 100
// $004E: [8 Bit] Score * 10
// $004F: [8 Bit] Score * 1
// $006B: [8 Bit] Wave Number

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
Score = byte(0x4c)*1000 + byte(0x4d)*100 + byte(0x4e)*10 + byte(0x4f)
HiScore = byte(0x40)*1000 + byte(0x41)*100 + byte(0x42)*10 + byte(0x43)

Wave = byte(0x6b)

//----------------
///Function
function Progression(points,title,levelgoal)
{
    achievement(title = title,
                description = "Complete Wave " + levelgoal+1 ,
                points = points,
                trigger = 
                            Wave == levelgoal+1
                         && prev(Wave) == levelgoal
                        
                         
)
}


//----------------
///Achievement Code
Progression(2,"Endless Start",0)
Progression(3,"Arms Race",1)
Progression(5,"Prepare for Defeat",3)
Progression(5,"Goodbye Earthling",5)
Progression(10,"Seize the Planet",7)
Progression(25,"Comfort the World",9)
    achievement(title = "Weapon Dealer",
                description = "Get a score of 70 or more while staying in the first Wave " ,
                points = 5,
                trigger = 
                            Wave == 0
                         && Score >= 70
                         && prev(Score) < 70
                        
                         
)





// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Try your best to defeat the Timelord",
    start  = HiScore > prev(HiScore),
    cancel = always_false(),
    submit = always_true(),
    value = HiScore,
    format = "VALUE"
)   
