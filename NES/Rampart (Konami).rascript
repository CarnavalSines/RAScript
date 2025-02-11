// Rampart (Konami)
// #ID = 31654
// 20250211 Version - Sines

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

// Constant
Prog_Dict = { // {0}: LevelID - {1}: CheevoName Prog - {2}: Score Prog  - {3}: Level Name 
                    0x01: [0x01, "The Basics", 2, "Course 1 in Practice Mode"],
                    0x02: [0x02, "Battle Tanks", 2, "Course 2 in Practice Mode"],
                    0x03: [0x03, "Pesky Bees", 2, "Course 3 in Practice Mode"],
                    0x04: [0x04, "Deforestation", 3, "Course 4 in Practice Mode"],
                    0x05: [0x05, "Desert Storm", 3, "Course 5 in Practice Mode"],
                    0x06: [0x06, "Night Operation", 3, "Course 6 in Practice Mode"],
                    0x07: [0x07, "Advanced War", 5, "Course 7 in Practice Mode"],
                    0x08: [0x08, "Jolly Stroll", 5, "Episode 1 in Easy Mode"],
                    0x09: [0x09, "Winds of Chaos", 5, "Episode 2 in Easy Mode"],
                    0x0a: [0x0a, "Wailing Woods", 5, "Episode 3 in Easy Mode"],
                    0x0b: [0x0b, "Infestation Issues", 10, "Episode 4 in Easy Mode"],
                    0x0c: [0x0c, "Red Hood", 10, "Episode 5 in Easy Mode"],
                    0x0d: [0x0d, "Dragon Attack", 5, "Stage 1 in Normal Mode"],
                    0x0e: [0x0e, "Cursed Forest", 5, "Stage 2 in Normal Mode"],
                    0x0f: [0x0f, "Undead Scourge", 5, "Stage 3 in Normal Mode"],
                    0x10: [0x10, "Sacred Temple", 5, "Stage 4 in Normal Mode"],
                    0x11: [0x11, "Giant's Assault", 10, "Stage 5 in Normal Mode"],
                    0x12: [0x12, "Seizing the Gate", 10, "Stage 6 in Normal Mode"],
                    0x13: [0x13, "Scorching Emblem", 10, "Stage 7 in Normal Mode"],
                    0x14: [0x14, "Samurai's Strike", 5, "Battle 1 in Hard Mode"],
                    0x15: [0x15, "River's Crossing", 5, "Battle 2 in Hard Mode"],
                    0x16: [0x16, "Striking Cavalry", 10, "Battle 3 in Hard Mode"],
                    0x17: [0x17, "Violent Protest", 10, "Battle 4 in Hard Mode"],
                    0x18: [0x18, "Symmetry", 10, "Battle 5 in Hard Mode"],
                    0x19: [0x19, "Drenched in Blood", 25, "Battle 6 in Hard Mode"],
                    0x1a: [0x1a, "Nobunaga the Ambitious", 50, "the Final Battle in Hard Mode"],


                    } 
// Variable
DubiousWinFlag = byte(0x002d)
GamePhase = byte(0x002e)
DemoFlag = byte(0x0034)

CannonOnMap = byte(0x0058)

Enemy1 = byte(0x00b7)
Enemy2 = byte(0x00b8)
EnemyCheck = Enemy1 + Enemy2

CurrentPoints = word(0x05d4)
ClearPoints = word(0x05d6)

LevelID = byte(0x05f7)

function ArcadeProg(Stage){
	
    title = Prog_Dict[Stage][1]
	points = Prog_Dict[Stage][2]
	description = format("Clear {0}", Prog_Dict[Stage][3])
	trigger = (LevelID == Prog_Dict[Stage][0] + 1
            && prev(LevelID) == Prog_Dict[Stage][0]
            && DemoFlag == 0
            && CannonOnMap > 0
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function StageClearManualCheck() => DemoFlag == 0 && CannonOnMap > 0 && ((CurrentPoints > ClearPoints && prev(CurrentPoints) < (ClearPoints)) || (EnemyCheck == 0 && prev(EnemyCheck) > 0) )

for i in range(1,6)
    ArcadeProg(i)

    achievement(title=Prog_Dict[7][1],
                description = format("Clear {0}", Prog_Dict[7][3]),
                points = Prog_Dict[7][2],
                trigger = LevelID == Prog_Dict[7][0]
                       && prev(LevelID) == LevelID
                       && StageClearManualCheck()
)      

for i in range(8,11)
    ArcadeProg(i)

    achievement(title=Prog_Dict[12][1],
                description = format("Clear {0}", Prog_Dict[12][3]),
                points = Prog_Dict[12][2],
                trigger = LevelID == Prog_Dict[12][0]
                       && prev(LevelID) == LevelID
                       && DemoFlag == 0
                       && CannonOnMap > 0
                       && DubiousWinFlag == 0x05
                       && prev(DubiousWinFlag) < DubiousWinFlag
)      
  

for i in range(13,18)
    ArcadeProg(i)

    achievement(title=Prog_Dict[19][1],
                description = format("Clear {0}", Prog_Dict[19][3]),
                points = Prog_Dict[19][2],
                trigger = LevelID == Prog_Dict[19][0]
                       && prev(LevelID) == LevelID
                       && DemoFlag == 0
                       && CannonOnMap > 0
                       && DubiousWinFlag == 0x05
                       && prev(DubiousWinFlag) < DubiousWinFlag
)   

for i in range(20,25)
    ArcadeProg(i)

    achievement(title="Long Haul",
                description = format("Clear {0} with a Score Victory", Prog_Dict[25][3]),
                points = Prog_Dict[25][2],
                trigger = LevelID == Prog_Dict[25][0]
                       && prev(LevelID) == LevelID
                       && DemoFlag == 0
                       && CannonOnMap > 0
                       && CurrentPoints > ClearPoints
                       && prev(CurrentPoints) < ClearPoints
)   

    achievement(title=Prog_Dict[26][1],
                description = format("Clear {0} by Capturing the Enemy's Fortress", Prog_Dict[26][3]),
                points = Prog_Dict[26][2],
                trigger = LevelID == Prog_Dict[26][0]
                       && prev(LevelID) == LevelID
                       && DemoFlag == 0
                       && CannonOnMap > 0
                       && DubiousWinFlag == 0x05
                       && prev(DubiousWinFlag) < DubiousWinFlag
                       && CurrentPoints < ClearPoints
                       && EnemyCheck > 0
)   

    achievement(title="Nobunaga the Builder",
                description = format("Clear {0} with a Score Victory", Prog_Dict[26][3]),
                points = Prog_Dict[26][2],
                trigger = LevelID == Prog_Dict[26][0]
                       && prev(LevelID) == LevelID
                       && DemoFlag == 0
                       && CannonOnMap > 0
                       && CurrentPoints > ClearPoints
                       && prev(CurrentPoints) < ClearPoints
)   

    achievement(title="Rebelious Attitude",
                description = "Clear Course 2 with a Score Victory instead of following your instructions",
                points = 3,
                trigger = LevelID == 0x02
                       && prev(LevelID) == LevelID
                       && DemoFlag == 0
                       && CannonOnMap > 0
                       && CurrentPoints > ClearPoints 
                       && prev(CurrentPoints) < ClearPoints
)    

    achievement(title="The Demon",
                description = "Clear any Hard Mode battle by killing every enemies",
                points = 10,
                trigger = LevelID >= 0x14
                       && prev(LevelID) == LevelID
                       && DemoFlag == 0
                       && CannonOnMap > 0
                       && EnemyCheck == 0
                       && prev(EnemyCheck) > 0
)    

    achievement(title="Full Power",
                description = "Place 12 Cannons on the Map",
                points = 10,
                trigger = LevelID > 0
                       && prev(LevelID) == LevelID
                       && DemoFlag == 0
                       && CannonOnMap > 0
                       && CannonOnMap == 12
                       && prev(CannonOnMap) == 11
)    


RPLevelID = { 
                    0x01: "Course 1",
                    0x02: "Course 2",
                    0x03: "Course 3",
                    0x04: "Course 4",
                    0x05: "Course 5",
                    0x06: "Course 6",
                    0x07: "Course 7",
                    0x08: "Episode 1",
                    0x09: "Episode 2",
                    0x0a: "Episode 3",
                    0x0b: "Episode 4",
                    0x0c: "Episode 5",
                    0x0d: "Stage 1",
                    0x0e: "Stage 2",
                    0x0f: "Stage 3",
                    0x10: "Stage 4",
                    0x11: "Stage 5",
                    0x12: "Stage 6",
                    0x13: "Stage 7",
                    0x14: "Battle 1",
                    0x15: "Battle 2",
                    0x16: "Battle 3",
                    0x17: "Battle 4",
                    0x18: "Battle 5",
                    0x19: "Battle 6",
                    0x1a: "The Final Battle"


                    } 
  

// Rich Presence
rich_presence_conditional_display(
    CannonOnMap > 0 && DemoFlag == 0,
    "• {0} • Current Points: {1} •",
    rich_presence_lookup("RPPhase", LevelID, RPLevelID),
    rich_presence_value("Score", CurrentPoints)
    
    
    )  
///Default 
rich_presence_display(
    "• The Better Rampart Experience! •"
)