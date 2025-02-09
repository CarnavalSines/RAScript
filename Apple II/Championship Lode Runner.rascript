// Championship Lode Runner
// #ID = 22830
// 20250209 Version - Sines

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
Prog_Dict = { // {0}: LevelID - {1}: CheevoName Prog
                    0x01: [0x01, "Welcome to Hell"],
                    0x02: [0x02, "Musical Inspiration"],
                    0x03: [0x03, "Manic Miner"],
                    0x04: [0x04, "Central Tower"],
                    0x05: [0x05, "Core Cracker"],
                    0x06: [0x06, "Floating Island"],
                    0x07: [0x07, "Triforce of Wisdom"],
                    0x08: [0x08, "Qbert"],
                    0x09: [0x09, "Donut"],
                    0x10: [0x0a, "Umbrella"],
                    0x11: [0x0b, "Bank Heist"],
                    0x12: [0x0c, "Hidden Path"],
                    0x13: [0x0d, "Quick Exit"],
                    0x14: [0x0e, "Looping Madness"],
                    0x15: [0x0f, "Xylophone"],
                    0x16: [0x10, "Gravity Shift"],
                    0x17: [0x11, "Open Sky"],
                    0x18: [0x12, "It's a Trap!"],
                    0x19: [0x13, "Water Evacuation"],
                    0x20: [0x14, "Cave Explorer"],
                    0x21: [0x15, "Serpentine"],
                    0x22: [0x16, "Rocket Boost"],
                    0x23: [0x17, "Hidden Lair"],
                    0x24: [0x18, "Silly Wabbit"],
                    0x25: [0x19, "Moonrune"],
                    0x26: [0x1a, "Space Station"],
                    0x27: [0x1b, "Running in the Wind"],
                    0x28: [0x1c, "No Jump Button"],
                    0x29: [0x1d, "Industrial Belt"],
                    0x30: [0x1e, "Less is More"],
                    0x31: [0x1f, "Quiver"],
                    0x32: [0x20, "Reverse Cake"],
                    0x33: [0x21, "Butterfly"],
                    0x34: [0x22, "As Seen on TV"],
                    0x35: [0x23, "Symmetry"],
                    0x36: [0x24, "Control Tower"],
                    0x37: [0x25, "Castle Fortification"],
                    0x38: [0x26, "Prompt Escape"],
                    0x39: [0x27, "Alpha and Omega"],
                    0x40: [0x28, "Such a Thrill"],
                    0x41: [0x29, "Time Attack"],
                    0x42: [0x2a, "Air Vents"],
                    0x43: [0x2b, "Death Star"],
                    0x44: [0x2c, "Treasure Hunter"],
                    0x45: [0x2d, "Leap of Faith"],
                    0x46: [0x2e, "Precious"],
                    0x47: [0x2f, "Chessboard"],
                    0x48: [0x30, "Secret Tunnels"],
                    0x49: [0x31, "Light at the End"],
                    0x50: [0x32, "Hell to Welcome"]

                    } 

// Variable
GameSpeed = byte(0x0071)
Score1 = bcd(word(0x0073))
Score2 = bcd(word(0x0075))
Score = bcd(Score1 + (Score2 * 10000))
TreasureCheck = byte(0x78)
LifeCounter = byte(0x7d)
DemoFlag = byte(0x7e)
LevelID = byte(0x89)


function ArcadeProg(Stage){
	
    title = Prog_Dict[Stage][1]
	points = 5
	description = format("Clear Level {0} in the default Speed or higher", Prog_Dict[Stage][0])
	trigger = (LevelID == Prog_Dict[Stage][0] + 1
            && prev(LevelID) == Prog_Dict[Stage][0]
            && DemoFlag != 0
            && disable_when(GameSpeed > 6, until=LifeCounter == 0 || LevelID == 0xc0)
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Stage in Prog_Dict
    ArcadeProg(Stage)

    achievement(title="Champion's Training",
                description = "Reach a Score of 50 000 points or more",
                points = 10,
                trigger = DemoFlag!=0
                       && disable_when(GameSpeed > 6, until=LifeCounter == 0 || LevelID == 0xc0)
                       && Score >= 50000
                       && prev(Score) < 50000
)  

    achievement(title="Avaricious Hunter",
                description = "Reach a Score of 100 000 points or more",
                points = 25,
                trigger = DemoFlag!=0
                       && disable_when(GameSpeed > 6, until=LifeCounter == 0 || LevelID == 0xc0)
                       && Score >= 100000
                       && prev(Score) < 100000
)  

    achievement(title="Insatiable Greed",
                description = "Reach a Score of 200 000 points or more",
                points = 50,
                trigger = DemoFlag!=0
                       && disable_when(GameSpeed > 6, until=LifeCounter == 0 || LevelID == 0xc0)
                       && Score >= 200000
                       && prev(Score) < 200000
)  


// Rich Presence
rich_presence_conditional_display(
    GameSpeed > 6,
    "• Game Speed is set lower than default, every achievements are blocked until Game Over •"
    
    )  
///Default 
rich_presence_display(
    "• Level {0} - {1} • Score: {2} •",
    rich_presence_value("Level", LevelID),
    rich_presence_value("MEN", LifeCounter),
    rich_presence_value("Score", Score)
)