// Agress: Missile Daisenryaku
// #ID = 13526
// 20260131 Version - Sines

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


///Core
//Constant

DemoFlag = bit7(0x0836)
P2Mode = bit2(0x0836)

P1Score = word(0x1c10)
P1Level = word(0x2e18)
P1RegionConquest = word(0x3144)

function VibeCheck() => DemoFlag == 0 && P2Mode == 0

    achievement(title = "Operation Desert Shield",
	points = 2,
	description = "Conquer your first region",
	trigger = P1RegionConquest == 1
           && prev(P1RegionConquest) == 0
           && VibeCheck()
    )

    achievement(title = "Scouting Mission",
	points = 3,
	description = "Conquer five regions",
	trigger = P1RegionConquest == 5
           && prev(P1RegionConquest) == 4
           && VibeCheck()
    )    

    achievement(title = "Missile Diplomacy",
	points = 5,
	description = "Conquer seven regions",
	trigger = P1RegionConquest == 7
           && prev(P1RegionConquest) == 6
           && VibeCheck()
    )        

    achievement(title = "Bringing Peace",
	points = 10,
	description = "Conquer 10 regions",
	trigger = P1RegionConquest == 10
           && prev(P1RegionConquest) == 9
           && VibeCheck()
    )        

    achievement(title = "Surgical Strikes",
	points = 25,
	description = "Conquer the whole map!",
	trigger = P1RegionConquest == 13
           && prev(P1RegionConquest) == 12
           && VibeCheck()
    )        

    achievement(title = "Rotation Expert",
	points = 5,
	description = "Clear Level 10",
	trigger = P1Level == 10
           && prev(P1Level) == 9
           && VibeCheck()
    )            


    achievement(title = "Two Steps Ahead",
	points = 5,
	description = "Clear Level 20",
	trigger = P1Level == 20
           && prev(P1Level) == 19
           && VibeCheck()
    )      

    achievement(title = "Getting Groovy",
	points = 10,
	description = "Clear Level 30",
	trigger = P1Level == 30
           && prev(P1Level) == 29
           && VibeCheck()
    )      

    achievement(title = "Riding the Zone",
	points = 25,
	description = "Clear Level 40",
	trigger = P1Level == 40
           && prev(P1Level) == 39
           && VibeCheck()
    )      

    achievement(title = "Non-Euclidean Shapes",
	points = 50,
	description = "Clear Level 50",
	trigger = P1Level == 50
           && prev(P1Level) == 49
           && VibeCheck()
    )      




//// RP Script

rich_presence_conditional_display(
    DemoFlag == 1 ,
    "• DEMO Mode - Agress: Missile Daisenryaku •"
)

rich_presence_conditional_display(
    P2Mode == 1 ,
    "• • 2P Mode - Agress: Missile Daisenryaku • •"
)

rich_presence_conditional_display(
    P2Mode == 0 && DemoFlag == 0 ,
    "• {0} Region Controlled - Level {1} • {2}Pts •",
    rich_presence_value("RegionP1", P1RegionConquest),
    rich_presence_value("P1Level", (P1Level+1)),
    rich_presence_value("Score", P1Score)
)

rich_presence_display(
    "• A lovely game of missile bombing between friends • "

)  



