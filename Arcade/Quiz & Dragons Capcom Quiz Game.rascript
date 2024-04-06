// Quiz & Dragons: Capcom Quiz Game
// #ID = 12257
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

// $00BE: [8 Bit] Tied to Encounter State
//        0xc4 > Encounter Start
//        0x70 > Encounter Cleared
// $E01C: Credits
// $E025: [8 Bit] Current Stage
//        00 > Stage 1 - Woods of Legend
//        01 > Stage 2 - The Flatfield
//        02 > Stage 2 - Beast Mountain
//        03 > Stage 3 - Chateau of Avalon
//        04 > Stage 4 - Fairy Lake
//        05 > Stage 5 - Midnight Forest
//        06 > Stage 5 - Destroyed Town
//        07 > Stage 6 - Dungeon
//        08 > Stage 7 - Gordian's Palace
// $E027: [8 Bit] Current Board Tile Occupied
//        --- --- ---
//        Stages final Tile
//        Stage 1 - Woods of Legend > 0xa
//        Stage 2 - The Flatfield 0x20
//        Stage 2 - Beast Mountain > 0x12
//        Stage 3 - Chateau of Avalon > 0x2a
//        Stage 4 - Fairy Lake > 0x13
//        Stage 5 - Midnight Forest > 0x13
//        Stage 5 - Destroyed Town > 0x1a
//        Stage 6 - Dungeon > 0x2a
//        Stage 7 - Gordian's Palace > 0x22
// $E22C: Player 1 - Information
//        --- Bit0 | Playing
//        --- Bit1 | Character selected
// $E22E: Player 2 - Information
//        --- Bit0 | Playing
//        --- Bit1 | Character selected
// $E234: Player 1 - Character
//        --- 00 | Fighter
//        --- 01 | Wizard
//        --- 02 | Amazon
//        --- 03 | Ninja
// $E236: Player 2 - Character
//        --- 00 | Fighter
//        --- 01 | Wizard
//        --- 02 | Amazon
//        --- 03 | Ninja
// $E238: Player 1 - Respawn Timer - Centiseconds [16bit]
// $E23A: Player 2 - Respawn Timer - Centiseconds [16bit]
// $E23C: Player 1 - Respawn Timer - Seconds [16bit]
// $E23E: Player 2 - Respawn Timer - Seconds [16bit]
// $E244: [16 Bit] Number of encounter cleared
// $E248: [16 Bit] Total Number of Questions for this Run
// $E24C: [16 Bit] Number of Correctly Answered Questions this Round
//        Used for Percent Correct calculation
// $E250: [16 Bit] Current Round Question
// $E25E: Question state
//        00 = Question being asked
//        01 = Question with 1 answer removed
//        02 = Question with 2 answers removed
// $E468: Player 1 - Score [32bit]
// $E46C: Player 2 - Score [32bit]
// $E476: Player 1 - Vital [16bit]
// $E478: Player 2 - Vital [16bit]
// $E4A6: Game status?
//        01 = Quiz in progress
//        02 = Last 3 questions in Gordian stage
//        06 = Last question in Gordian stage
// $E95C: [8 Bit] Difficulty 1 - How Many Questions
//        00 > Easiest
//        01 > Easy
//        02 > Normal (Default)
//        03 > Hard
//        04 > Hardest
// $E95D: [8 Bit] Continues Allowed Dip Switch
//        00 > No Continues
//        01 > Continues
// $E95E: [8 Bit] Initial Lives
//        Default 0x05
// $E95F: [8 Bit] Difficulty 2 - How Hard are the Questions
//        00 > Easy
//        01 > Normal (Default)
//        02 > Hard
//        03 > Hardest
// $E962: [16 Bit] Current Encounter Points Earned
// $E964: [16 Bit] Current Encounter Points Needed
//        Decrease until beaten == 0
// $E966: [8 Bit] Current Item Held
//        00 > None
//        01 > Shortcut
//        02 > Magic Scroll
//        03 > Magic Staff
//        04 > Magic Sword
//        05 > Ring of Speed
//        06 > Ring of Wisdom

///Core
//Constant
Char_Dict = { // {0}: MatchID - {1}: CheevoName Prog - {2}: Score  - {3}: Class Name - {4}: CheevoName Hard - {5}: Score Hard
                    0x01: [00, "By the Sword in my Hand", 10, "Fighter", "Infinite Stamina", 25],
                    0x02: [01, "INT Build", 10, "Wizard", "Spellflinger", 25],
                    0x03: [02, "Feminine Intuition", 5, "Amazon", "I Am no Man", 10],
                    0x04: [03, "After Zanzibar", 5, "Ninja", "You're That Ninja", 10]

                    } 

Stage_Dict = { // {0}: MatchID - {1}: Stage Name - {2}: Score  - {3}: Cheevo Name Prog - {4}: Last Tile Check - {5}: Cheevo Name Hard - {6}: Score Hard
                    0x00: [00, "Stage 1 - Woods of Legend", 2, "Lost Woods", 0xa, "Walk in the Woods", 3],
                    0x01: [01, "Stage 2 - The Flatfield", 3, "Plain Simple", 0x20, "Flatlined", 5],
                    0x02: [02, "Stage 2 - Beast Mountain", 3, "Rocky Terrain", 0x12, "Monster Hunter", 5],
                    0x03: [03, "Stage 3 - Chateau of Avalon", 5, "Castle of Legends", 0x2a, "Voyage to AVALON", 10],
                    0x04: [04, "Stage 4 - Fairy Lake", 5, "Looking for a Sword", 0x13, "Number Nine", 10],
                    0x05: [05, "Stage 5 - Midnight Forest", 5, "Two Minutes to Midnight", 0x13, "Dread Woods", 10],
                    0x06: [06, "Stage 5 - Destroyed Town", 5, "This City must be Purged", 0x1a, "Back in the Village", 10],
                    0x07: [07, "Stage 6 - Dungeon", 10, "Last Defense Line", 0x2a, "Darkest Dungeon", 10],
                    0x08: [08, "Stage 7 - Gordian's Palace", 10, "Stomach Knots", 0x22, "Cutting the Knot", 25],
    
}                           

Item_Dict = { // {0}: MatchID - {1}: CheevoName - {2}: Score  - {3}: Item Name 
                    0x01: [00, "NOCHEEVO", 0, "None"],
                    0x02: [01, "Cousin Balin's Road", 2, "Shortcut"],
                    0x03: [02, "Identifying Scroll", 2, "Magic Scroll"],
                    0x04: [03, "I Cast Fireball", 2, "Magic Staff"],
                    0x05: [04, "Riddle of Steel", 2, "Magic Sword"],
                    0x06: [05, "Boost Powers", 2, "Ring of Speed"],
                    0x07: [06, "Wisdom of the Elders", 2, "Ring of Wisdom"]

                    } 

//Variables
EncounterState = byte(0x00be)           
CurrentStage = byte(0xe025)        
CurrentTile = byte(0xe027) 

ActiveP1 = bit0(0xe22c)
ActiveP2 = bit0(0xe22e)
P1Class = byte(0xe234)

P1ScoreLower = dword(0xe468)
P1ScoreUpper = dword(0xe466) * 65536
P1Score = P1ScoreLower + P1ScoreUpper


P1Health = word(0xe476)
P1Item = byte(0xe966)

CurrentQuestionTotal = byte(0xe250)
CurrentQuestionTotalCorrect = byte(0xe24c)

Difficulty1 = byte(0xe95c) // How Many
Difficulty2 = byte(0xe95f) // How Hard

EnemyHealth = byte(0xe964)

//Functions
function StartCheck(Stage) => once(ActiveP1 == 1 && ActiveP2 == 0 && CurrentStage == Stage && CurrentTile > 0 && prev(CurrentTile)==0 ) && never(ActiveP2 == 1)
function ItemUnlock(Item) => P1Item == Item && prev(P1Item) == 0
function P2Block() => disable_when(ActiveP2==1, until=(CurrentStage == 0 && CurrentTile == 0 && ActiveP2 == 0))

function ArcadeProg(Stage){
	
    title = Stage_Dict[Stage][3]
	points = Stage_Dict[Stage][2]
	description = format("Clear {0}", Stage_Dict[Stage][1])
	trigger = (P2Block()
            && CurrentStage == Stage_Dict[Stage][0]
            && CurrentTile == Stage_Dict[Stage][4]
            && P1Health > 0
            && EnemyHealth == 0
            && EncounterState == 0x70
            && prev(EncounterState) != 0x70
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Stage in Stage_Dict
    ArcadeProg(Stage)

function CharProg(Char){
	
    title = Char_Dict[Char][1]
	points = Char_Dict[Char][2]
	description = format("Defeat Gordian as the {0} without switching class", Char_Dict[Char][3])
	trigger = (P2Block()
            && trigger_when(CurrentStage == 8 //start of trigger
            && CurrentTile == Stage_Dict[8][4]
            && P1Health > 0
            && EnemyHealth == 0
            && EncounterState == 0x70
            && prev(EncounterState) != 0x70
            )
            && StartCheck(0)
            && P1Class == Char_Dict[Char][0]
            && never(P1Class != Char_Dict[Char][0])
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}    

for Char in Char_Dict
    CharProg(Char)

function ArcadeProgHard(Stage){
	
    title = Stage_Dict[Stage][5]
	points = Stage_Dict[Stage][6]
	description = format("Clear {0} in Hardest difficulty, both for Difficulty level and Wisdom of Enemy", Stage_Dict[Stage][1])
	trigger = (P2Block()
            && CurrentStage == Stage_Dict[Stage][0]
            && CurrentTile == Stage_Dict[Stage][4]
            && P1Health > 0
            && EnemyHealth == 0
            && EncounterState == 0x70
            && prev(EncounterState) != 0x70
            && Difficulty1 == 4
            && Difficulty2 == 3
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Stage in Stage_Dict
    ArcadeProgHard(Stage)

function CharProgHard(Char){
	
    title = Char_Dict[Char][4]
	points = Char_Dict[Char][5]
	description = format("Defeat Gordian as the {0} without switching class in Hardest difficulty, both for Difficulty level and Wisdom of Enemy", Char_Dict[Char][3])
	trigger = (P2Block()
            && trigger_when(CurrentStage == 8 //start of trigger
            && CurrentTile == Stage_Dict[8][4]
            && P1Health > 0
            && EnemyHealth == 0
            && EncounterState == 0x70
            && prev(EncounterState) != 0x70
            )
            && StartCheck(0)
            && P1Class == Char_Dict[Char][0]
            && never(P1Class != Char_Dict[Char][0])
            && Difficulty1 == 4
            && Difficulty2 == 3
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}    

for Char in Char_Dict
    CharProgHard(Char)    

    achievement(title="Trivia Expert",
                description = "Defeat Gordian and clear the game without ever dying",
                points = 25,
                trigger = P2Block()
            && trigger_when(CurrentStage == 8 //start of trigger
            && CurrentTile == Stage_Dict[8][4]
            && P1Health > 0
            && EnemyHealth == 0
            && EncounterState == 0x70
            && prev(EncounterState) != 0x70
            )
            && StartCheck(0)
            && never(P1Health == 0 && prev(P1Health) > 0)
)   

    achievement(title="True Demon Lord",
                description = "Defeat Gordian and clear the game without ever dying in Hardest difficulty, both for Difficulty level and Wisdom of Enemy",
                points = 50,
                trigger = P2Block()
            && trigger_when(CurrentStage == 8 //start of trigger
            && CurrentTile == Stage_Dict[8][4]
            && P1Health > 0
            && EnemyHealth == 0
            && EncounterState == 0x70
            && prev(EncounterState) != 0x70
            )
            && StartCheck(0)
            && never(P1Health == 0 && prev(P1Health) > 0)
            && Difficulty1 == 4
            && Difficulty2 == 3
)   

function ItemCollect(Item){
	
    title = Item_Dict[Item][1]
	points = Item_Dict[Item][2]
	description = format("Find a {0}", Item_Dict[Item][3])
	trigger = (P2Block()
            && ItemUnlock(Item_Dict[Item][0])
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}    

for i in range(2,7)
    ItemCollect(i)

    achievement(title="NEEEEEEEEERD",
                description = "Get 100% Correct answer against an enemy requiring 5 or more questions to defeat",
                points = 5,
                trigger = P2Block()
            && P1Health > 0
            && EnemyHealth == 0
            && EncounterState == 0x70
            && prev(EncounterState) != 0x70
            && CurrentQuestionTotal >= 5
            && CurrentQuestionTotal == CurrentQuestionTotalCorrect
            
)       

//Rich Presence
Class = { 
                    0:"⚔️Fighter⚔️",
                    1:"🧙Wizard🧙",
                    2:"🗡️Amazon🗡️",
                    3:"⛩️Ninja⛩️"

                    }  

RPDifficulty1 = { 
                    0:"Easiest",
                    1:"Easy",
                    2:"Normal",
                    3:"Hard",
                    4:"Hardest"

                    }  

RPDifficulty2 = { 
                    0:"Easy",
                    1:"Normal",
                    2:"Hard",
                    3:"Hardest"

                    }    

Items = { 
                    0:"None",
                    1:"Shortcut",
                    2:"Magic Scroll",
                    3:"Magic Staff",
                    4:"Magic Sword",
                    5:"Ring of Speed",
                    6:"Ring of Wisdom"

                    }         

RPStages = { 
                    0:"Stage 1 - Woods of Legend",
                    1:"Stage 2 - The Flatfield",
                    2:"Stage 2 - Beast Mountain",
                    3:"Stage 3 - Chateau of Avalon",
                    4:"Stage 4 - Fairy Lake",
                    5:"Stage 5 - Midnight Forest",
                    6:"Stage 5 - Destroyed Town",
                    7:"Stage 6 - Dungeon",
                    8:"Stage 7 - Gordian's Palace"

                    }                                                           
///Default 
rich_presence_display(
    "• Questing as a {0} - {1} Difficulty / {2} Enemy Wisdom • Current Health:{3} - Current Equipment:{4} - Score:{5} • {6} •",
    rich_presence_lookup("Class", P1Class, Class),
    rich_presence_lookup("Difficulty1", Difficulty1, RPDifficulty1),
    rich_presence_lookup("Difficulty2", Difficulty2, RPDifficulty2),
    rich_presence_value("Health", P1Health),
    rich_presence_lookup("Items", P1Item, Items),
    rich_presence_value("Score", P1Score),
    rich_presence_lookup("Stage", CurrentStage, RPStages)
)

//Leaderboards
leaderboard(
    title ="Global Leaderboard",
    description = "Highest Score for any playthrough",
    start  = CurrentTile == Stage_Dict[8][4] && P1Health > 0 && EnemyHealth == 0 && EncounterState == 0x70 && prev(EncounterState) != 0x70,
    cancel = always_false(),
    submit = always_true(),
    value = P1Score,
    format = "VALUE",
    lower_is_better=false
)

function CharLeaderboard(Char){
leaderboard(
    title = Char_Dict[Char][3] + " Leaderboard",
    description = format("Highest Score for a {0} only playthrough", Char_Dict[Char][3]),
    start  = P1Class == Char_Dict[Char][0] && ActiveP1 == 1 && ActiveP2 == 0 && CurrentStage == 0 && CurrentTile > 0 && prev(CurrentTile) == 0,
    cancel = P1Class != Char_Dict[Char][0] || ActiveP2 == 1,
    submit = CurrentTile == Stage_Dict[8][4] && P1Health > 0 && EnemyHealth == 0 && EncounterState == 0x70 && prev(EncounterState) != 0x70,
    value = P1Score,
    format = "VALUE",
    lower_is_better=false
)


}

for Char in Char_Dict
    CharLeaderboard(Char)   