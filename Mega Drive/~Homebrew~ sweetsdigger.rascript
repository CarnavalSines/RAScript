// ~Homebrew~ sweetsdigger
// #ID = 29147
// 20240406 Version - Sines

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

// $001C: [8 Bit] Game Over Flag
// $0020: [8 Bit] Pause Flag
// $0024: [8 Bit] Stage Clear Flag
// $002E: [8 Bit] Level ID
// $0032: [16 Bit] Current Score Upper Half
//        * 65536
// $0034: [16 Bit] Current Score Lower Half
// $0038: [16 Bit] Hi Score
// $0C50: [8 Bit] Player Bomb Count
// $0C51: [8 Bit] Player Life

///Core
//Constant
Prog_Dict = { // {0}: LevelID - {1}: CheevoName Prog - {2}: Score Prog  - {3}: CheevoName Deathless - {4}: CheevoName Bombless - {5}: Score Deathless - {6}: Score Bombless - {7}: LevelID Desc
                    0x01: [6, "Swirl Gaming", 2, "Cream Core", "Spell Master", 2, 3,5],
                    0x02: [11, "Murderous Pancake", 3, "Secret Sweet Sauce", "A Freaking Leaf", 5, 5,10],
                    0x03: [16, "100% Real Cake", 5, "Slice of Fun", "Anti Pacman", 10, 5,15],
                    0x04: [20, "Perfection", 10, "Sweet as I Like", "The 'Beetus", 25, 10, 20]

                    } 

//Variables
StageClearFlag = byte(0x0024)
LevelID = byte(0x002e)
ScoreLower = word(0x0034)
ScoreUpper = word(0x0032) * 65536
Score = ScoreLower + ScoreUpper
PlayerLife = byte(0x0c51)
PlayerBomb = byte(0x0c50)

//Functions
function GameOver() => PlayerLife == 0xff && prev(PlayerLife) == 0
function DeathCheck() => PlayerLife < prev(PlayerLife)
function BombCheck() => PlayerBomb < prev(PlayerBomb)
function StageClear() => StageClearFlag == 1 && prev(StageClearFlag) == 0

function ArcadeProg(Stage){
	
    title = Prog_Dict[Stage][1]
	points = Prog_Dict[Stage][2]
	description = format("Beat the Level {0} Boss", Prog_Dict[Stage][7])
	trigger = (LevelID == Prog_Dict[Stage][0]
            && StageClear()
            && PlayerLife != 0xff
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Stage in Prog_Dict
    ArcadeProg(Stage)

function ArcadeProgDeathless(Stage){
	
    title = Prog_Dict[Stage][3]
	points = Prog_Dict[Stage][5]
	description = format("Beat the Level {0} Boss without ever having lost a Life", Prog_Dict[Stage][7])
	trigger = (LevelID == Prog_Dict[Stage][0]
            && StageClear()
            && PlayerLife != 0xff
            && once(LevelID == 1 && Score == 0)
            && never(DeathCheck())
            && never(GameOver())
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Stage in Prog_Dict
    ArcadeProgDeathless(Stage)    

function ArcadeProgBombless(Stage){
	
    title = Prog_Dict[Stage][4]
	points = Prog_Dict[Stage][6]
	description = format("Beat the Level {0} Boss without ever having used a Bomb", Prog_Dict[Stage][7])
	trigger = (LevelID == Prog_Dict[Stage][0]
            && StageClear()
            && PlayerLife != 0xff
            && once(LevelID == 1 && Score == 0)
            && never(BombCheck())
            && never(GameOver())
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Stage in Prog_Dict
    ArcadeProgBombless(Stage)        

///Default 
rich_presence_display(
    "• Sweet Hunting in Level {0} • {1}❤️ - {2}💣 • Score: {3}",
    rich_presence_value("Level", LevelID),
    rich_presence_value("Health", PlayerLife),
    rich_presence_value("Bomb", PlayerBomb),
    rich_presence_value("Score", Score)
)    

leaderboard(
    title ="Sweet Hunter Leaderboard",
    description = "Highest Score on beating Level 20",
    start  = LevelID == 20 && StageClear() && PlayerLife !=0xff ,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE",
    lower_is_better=false
)