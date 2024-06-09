// Mach Breakers
// #ID = 28686
// 20240501 Version - Sines

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

// $011148: [8 Bit] Char Select Countdown
// $047628: [16 Bit] Record 1 GameID
// $04762A: maybe it's a Clear flag ? TBC with skipped
// $04762E: [16 Bit] Record 1 Score
// $047642: [16 Bit] Record 2 GameID
// $047648: [16 Bit] Record 2 Score
// $04765C: [16 Bit] Record 3 GameID
// $047662: [16 Bit] Record 3 Score
// $047676: [16 Bit] Record 4 GameID
// $04767C: [16 Bit] Record 4 Score
// $047690: [16 Bit] Record 5 GameID
// $047696: [16 Bit] Record 5 Score
// $0476AA: [16 Bit] Record 6 GameID
// $0476B0: [16 Bit] Record 6 Score
// $0476C4: [16 Bit] Record 7 GameID
// $0476CA: [16 Bit] Record 7 Score
// $0476DE: [16 Bit] Record 8 GameID
// $0476E4: [16 Bit] Record 8 Score
// $0476F8: [16 Bit] Record 9 GameID
// $0476FE: [16 Bit] Record 10 Score
// $047712: [16 Bit] Record 11 GameID
// $047718: [16 Bit] Record 11 Score
// $04772C: [16 Bit] Record 12 GameID
// $047732: [16 Bit] Record 12 Score
// $047746: [16 Bit] Record 13 GameID
// $04774C: [16 Bit] Record 13 Score
// $04777A: [16 Bit] Maximum Speed Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $04777C: [16 Bit] Hyper Glider Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $04777E: [16 Bit] Block Buster Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $047780: [16 Bit] Beast Hole Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $047782: [16 Bit] Super Stunt Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $047784: [16 Bit] Deep Diver Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $047786: [16 Bit] Ground Spike Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $047788: [16 Bit] Future Gate Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $04778A: [16 Bit] Rapid Jump Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $04778C: [16 Bit] Ice Break Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $04778E: [16 Bit] Bomb's Away Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $047790: [16 Bit] Monster Drag Clear Info
//          0x00 > Default Difficulty
//          Above that > Number of retries (each retries lower the qualification requirements)
//          0xffff > Game Clear
//          0xfffe > Game Skipped
// $047794: [16 Bit] Char ID
//          00 > Johnny Sanders
//          01 > Li Shao-Yen
//          02 > Michael Fletcher
//          03 > Sophia Rayleigh
//          04 > Karl Weisemann
//          05 > Masala T. Masala
//          06 > Long Rui Huan
// $047796: [16 Bit] P1 Total Points
//          +3 On 2nd Place
//          +6 On 1st Place
//          Points get added BEFORE the game clear flag turns to 0xffff
// $0477AE: [16 Bit] Current Game Score (Try 1)
//          Ignore the symbol in the middle
//          Example: 11.20 is registered as 1120 aka 0x460
// $0477B2: [16 Bit] Current Game Score Try 2
//          Same as 0x0477ae
// $0477F6: [16 Bit] Current Game ID
//          Day 1
//          --- --- ---
//          0x00 > Maximum Speed
//          Day 2
//          --- --- ---
//          0x0b > Monster Drag
//          0x01 > Hyper Glider
//          0x09 > Ice Crusher
//          Day 3
//          --- --- ---
//          0x04 > Super Stunt
//          0x07 > Future Gate
//          0x0a > Bomb's Away
//          0x03 > Beast Hole
//          Day 4
//          --- --- ---
//          0x05 > Deep Diver
//          0x02 > Block Buster
//          0x08 > Rapid Jump
//          Last Day
//          --- --- ---
//          0x06 > Ground Spike
//          0x0c > Exibition Stage VS Numan Champion
// $047804: [16 Bit] Game State
//          0x0017 > Win EndScreen
// $0485E8: [8 Bit] Nb Continues used current run
// $048B30: [8 Bit] Coin Options - Free Play
//          00 > Yes
//          01 > No (Default)
// $048B32: [8 Bit] Difficulty Level
//          00 > Easy
//          01 > Medium (Default)
//          02 > Hard
//          03 > Very Hard

///Core
//Constant
Char_Dict = { // {0}: CharID - {1}: CheevoName Prog - {2}: PointNormal  - {3}: Char Name 
                    0x01: [0x00, "Built Different", 10, "Johnny Sanders"],
                    0x02: [0x01, "White Streak", 10, "Li Shao-Yen / Makoto Kotobuki"],
                    0x03: [0x02, "Snake Limbs", 10, "Michael Fletcher"],
                    0x04: [0x03, "Licensed Superhero", 10, "Sophia Rayleigh"],
                    0x05: [0x04, "German Ingenuity", 10, "Karl Weisemann"],
                    0x06: [0x05, "Hairball", 10, "Masala T. Masala"],
                    0x07: [0x06, "Bloatmaxxing", 10, "Long Rui Huan"]

                    } 

Game_Dict = { // {0}: GameID - {1}: Game Name - {2}: PointNormal  - {3}: CheevoNameNormal - {4}: PointNoRetry  - {5}: CheevoNameNoRetry - {6}: PointWR  - {7}: CheevoNameWR - {8}: RetryAddr
                    0x01: [0x00, "Maximum Speed", 1, "Bullet Point", 3, "Explosive Start", 10, "Casual Jog", 0x4777a],
                    0x02: [0x0b, "Monster Drag", 3, "GodziFlex", 5, "Cooking Kaiju", 10, "One Hand Tied", 0x47790],
                    0x03: [0x01, "Hyper Glider", 3, "Fly Like a Butterfly", 5, "Paraglider", 10, "Aerial Scouting", 0x4777c],
                    0x04: [0x09, "Ice Crusher", 3, "Shaken, Not Stirred", 5, "Ice Age", 10, "Sipping Martinis", 0x4778c],
                    0x05: [0x04, "Super Stunt", 5, "Rolling Around at the Speed of Sound", 5, "F1 Racing", 10, "Could Do It Blindfolded", 0x47782],
                    0x06: [0x07, "Future Gate", 5, "Gatekeeper", 5, "Iron Reflexes", 10, "Numan Cannon", 0x47788],
                    0x07: [0x0a, "Bomb's Away", 5, "More Efficient than a Javelin", 5, "Red Bomber", 10, "Mass Murder For Sport", 0x4778e],
                    0x08: [0x03, "Beast Hole", 5, "Beast Control", 5, "Beast Master", 10, "Beast Tamer", 0x47780],
                    0x09: [0x05, "Deep Diver", 5, "Quick Swim", 10, "Synchronized Swimming", 25, "Holy Diver", 0x47784],
                    0x10: [0x02, "Block Buster", 5, "One Punch Numan", 10, "Violent Rythm", 25, "Iron Fist", 0x4777e],
                    0x11: [0x08, "Rapid Jump", 5, "Small Leap for Numans", 10, "The Hot Never Bothered Me Anyway", 25, "Bunny Hopping", 0x4778a],
                    0x12: [0x06, "Ground Spike", 10, "Cannon Spike", 25, "Tactical Nuke", 50, "Digging Duggers", 0x47786]

                    } 


//Variables
GameID = word(0x477f6)
CharID = word(0x47794)
ContinueCounter = byte(0x485e8)
Difficulty = byte(0x48b32) // default == 0x01, max == 0x03
GameEndCheck = word(0x47804) // 0x17 -> Used for end of run check, not end of current game !
WRCheck = word(0x1a1402) // 0x0870 on WR screen
P1Points = word(0x47796) // +3 qualification, +6 Win 
P2Points = word(0x477a2)

//Functions
function GameEnd() => GameEndCheck == 0x17 && prev(GameEndCheck) != 0x17
function GameQualify() => P1Points >= prev(P1Points)+3
function GameWin() => P1Points >= prev(P1Points)+6
function GameWR() => WRCheck == 0x0870 && prev(WRCheck) != 0x0870

function GameProg(Game){
	
    title = Game_Dict[Game][3]
	points = Game_Dict[Game][2]
	description = format("Qualify during the {0} Event", Game_Dict[Game][1])
	trigger = (GameID == Game_Dict[Game][0]
            && GameQualify()
            && CharID < 0xff00
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}


function GameProgNoRetry(Game){
	
    title = Game_Dict[Game][5]
	points = Game_Dict[Game][4]
	description = format("Win the {0} Event on your first try while playing in Medium difficulty or Above", Game_Dict[Game][1])
	trigger = (GameID == Game_Dict[Game][0]
            && GameWin()
            && CharID < 0xff00
            && word(Game_Dict[Game][8]) == 0
            && Difficulty >= 1
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}


function GameProgWR(Game){
	
    title = Game_Dict[Game][7]
	points = Game_Dict[Game][6]
	description = format("Beat the World Record score in the {0} Event while playing in Medium difficulty or Above", Game_Dict[Game][1])
	trigger = (GameID == Game_Dict[Game][0]
            && GameWR()
            && CharID < 0xff00
            && Difficulty >= 1
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function CheevoOrdering(Game){
	
GameProg(Game)
GameProgNoRetry(Game)
GameProgWR(Game)
}

for Game in Game_Dict
    CheevoOrdering(Game)


function CharClear(Char){
	
    title = Char_Dict[Char][1]
	points = Char_Dict[Char][2]
	description = format("Qualify in all events and win the game playing only as {0} in Medium difficulty or Above", Char_Dict[Char][3])
	trigger = (Difficulty >= 1
            && CharID == Char_Dict[Char][0]
            && once(GameID == 0x00 && GameQualify() && CharID == Char_Dict[Char][0])
            && GameEnd()
            && P1Points > P2Points
            && never(CharID != Char_Dict[Char][0])
            && all_of(range(0x04777a,0x047790,step=2), addr => word(addr) == 0xffff)
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Char in Char_Dict
    CharClear(Char)

    achievement(title="Humanity's Peak",
                description = "Win the game in Very Hard mode",
                points = 25,
                trigger = (Difficulty == 0x03
                        && P1Points > P2Points
                        && GameEnd()
)   
    )

        achievement(title="Fingers of Steel",
                description = "Win the game in Medium difficulty or Above using only 1 Credit",
                points = 25,
                trigger = (Difficulty >= 0x01
                        && P1Points > P2Points
                        && GameEnd()
                        && ContinueCounter == 0
)   
    )
//Rich Presence
CharacterRP = { 
                    00:"Johnny Sanders",
                    01:"Li Shao-Yen / Makoto Kotobuki",
                    02:"Michael Fletcher",
                    03:"Sophia Rayleigh",
                    04:"Karl Weisemann",
                    05:"Masala T. Masala",
                    06:"Long Rui Huan"

                    }  

RPDifficulty = { 
                    0:"Easy",
                    1:"Medium",
                    2:"Hard",
                    3:"Very Hard"

                    }    


GameRP = { 
                    0x00:"Maximum Speed",
                    0x0b:"Monster Drag",
                    0x01:"Hyper Glider",
                    0x09:"Ice Crusher",
                    0x04:"Super Stunt",
                    0x07:"Future Gate",
                    0x0a:"Bomb's Away",
                    0x03:"Beast Hole",
                    0x05:"Deep Diver",
                    0x02:"Block Buster",
                    0x08:"Rapid Jump",
                    0x06:"Ground Spike",
                    0x0c:"Exibition Stage VS Numan Champion"

                    }  


 ///Default 

rich_presence_conditional_display(
    CharID < 0xff00,
    "• Running as a {0} - {1} Difficulty • Playing {2} • Current Score:{3} •",
    rich_presence_lookup("Class", CharID, CharacterRP),
    rich_presence_lookup("Difficulty", Difficulty, RPDifficulty),
    rich_presence_lookup("Game", GameID, GameRP),
    rich_presence_value("P1Score", P1Points))  
rich_presence_display(
    "• The Future of Sports is here! - {0} Difficulty •",
    rich_presence_lookup("Difficulty", Difficulty, RPDifficulty)
)

//Leaderboards
leaderboard(
    title ="Global Leaderboard",
    description = "Highest Score for any playthrough on Medium difficulty or Above",
    start  = GameEnd() && Difficulty >= 1,
    cancel = always_false(),
    submit = always_true(),
    value = P1Points,
    format = "VALUE",
    lower_is_better=false
)                   