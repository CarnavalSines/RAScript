// Space Dungeon
// #ID = 15160
// 20260213 Version - Sines

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

StateCheck = byte(0x49)
Lives = byte(0x2e6) //0xff on game over
Score = dword(0x8a4)
LevelID = bcd(byte(0x8db))

    achievement(title="Black Void",
                description = "Clear Level 1",
                points = 2,
                trigger = LevelID == 2
                       && prev(LevelID) == 1
                       && Lives != 0xff
)  

    achievement(title="More Dungeon Than Space",
                description = "Clear Level 3",
                points = 5,
                trigger = LevelID == 4
                       && prev(LevelID) == 3
                       && Lives != 0xff
)  

    achievement(title="Target Rich Environment",
                description = "Clear Level 5",
                points = 5,
                trigger = LevelID == 6
                       && prev(LevelID) == 5
                       && Lives != 0xff
)  

    achievement(title="Dungeoncrawl",
                description = "Clear Level 7",
                points = 10,
                trigger = LevelID == 8
                       && prev(LevelID) == 7
                       && Lives != 0xff
)  

    achievement(title="You Could Be a Hero",
                description = "Clear Level 10",
                points = 25,
                trigger = LevelID == 11
                       && prev(LevelID) == 10
                       && Lives != 0xff
)  

    achievement(title="Broken Cross",
                description = "Escape with an Iron Cross",
                points = 3,
                trigger = (StateCheck == 0x18
                       || StateCheck == 0x1a
                       || StateCheck == 0x1b)
                       && Score == prev(Score) + 0x500
                       && Lives != 0xff
)  

    achievement(title="David Copper Piece",
                description = "Escape with a Copper Piece",
                points = 3,
                trigger = (StateCheck == 0x18
                       || StateCheck == 0x1a
                       || StateCheck == 0x1b)
                       && Score == prev(Score) + 0x1000
                       && Lives != 0xff
)  

    achievement(title="Blue Silver",
                description = "Escape with a Silver Star",
                points = 3,
                trigger = (StateCheck == 0x18
                       || StateCheck == 0x1a
                       || StateCheck == 0x1b)
                       && Score == prev(Score) + 0x2000
                       && Lives != 0xff
)  

    achievement(title="Pelias's Price",
                description = "Escape with a Golden Fleece",
                points = 5,
                trigger = (StateCheck == 0x18
                       || StateCheck == 0x1a
                       || StateCheck == 0x1b)
                       && Score == prev(Score) + 0x4000
                       && Lives != 0xff
)  

    achievement(title="Renewed Covenant",
                description = "Escape with a Platinum Ark",
                points = 10,
                trigger = (StateCheck == 0x18
                       || StateCheck == 0x1a
                       || StateCheck == 0x1b)
                       && Score == prev(Score) + 0x8000
                       && Lives != 0xff
)  

    achievement(title="Cartographer",
                description = "Get a Complete Fill In bonus",
                points = 25,
                trigger = Score == prev(Score) + 0x10000
                       && Lives != 0xff
)  

    achievement(title="Badge Worthy",
                description = "Defeat a Piker Ship",
                points = 2,
                trigger = Score == prev(Score) + 0x100
                       && Lives != 0xff
)  

    achievement(title="Go Back to Grehawk!",
                description = "Defeat a Thief",
                points = 3,
                trigger = Score == prev(Score) + 0x50
                       && Lives != 0xff
                       && LevelID > 1
)  


//// RP Script



rich_presence_display(
    "• Space Dungeoncrawling in Level {0} • {1}Pts •",
    rich_presence_value("LevelID", LevelID),
    rich_presence_value("Score", bcd(Score))
)



