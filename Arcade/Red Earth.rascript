// Red Earth
// #ID = 12774
// 20240618 Version - Sines

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

// $00F0F2: [16 Bit] Credit Shooter Minigame Nb Hits
//          Max is 0x457
//          
//          Personal max 0x44c
// $017A04: [8 Bit] Game Configuration - Max Round
//          00 > 1 Round
//          01 > 3 Rounds (Default)
//          02 > 5 Rounds
// $017A05: [8 Bit] Game Configuration - Time Count Speed
//          Max 0x03
//          Default 0x01
// $017A06: [8 Bit] Game Configuration - Damage Level
//          Max 0x03
//          Default 0x01
// $017A07: [8 Bit] Game Configuration - Game Difficulty
//          Max 0x07
//          Default 0x03
// $017A09: [8 Bit] Game Configuration - Violence Mode
//          00 > Normal (Default)
//          01 > Off
// $017A0A: [8 Bit] Game Configuration - Handicap
//          00 > Off
//          01 > On (Default)
// $017A0B: [8 Bit] Game Configuration - Event
//          00 > Off (Default)
//          01 > 1 Match
// $060625: [8 Bit] Story Progression
//          Last boss on 0x0a, doesn't change after defeating him
// $0606DC: [8 Bit] Current Scene Dialogue ID
// $0606DE: [8 Bit] Cutscene ID
//          Can be used to check for endings
//          Combine with 0x0606dc for some
//          --- --- ---
//          Tessa Seal > 0x0b
//          Tessa Study > 0x13
//          
//          Leo Bad End > 0x06
//          Leo Good End Human > 0x04 + 0x0606dc == 0x04
//          Leo Good End Lion > 0x04 + 0x0606dc == 0x04 + Continues > 0 && Continues < 20
//          
//          Kenji Trust > 0x09 + 0x0606dc == 0x02
//          Kenji No Trust > 0x06 + 0x0606dc == 0x07
//          
//          Mai Ling is 100% Continues based
// $0606E4: [8 Bit] Stage ID
//          00 > Hauzer
//          01 > Kongou
//          02 > Hydron
//          03 > Lavia
//          04 > Ravange
//          05 > Gi Gi
//          06 > Blade
//          07 > Scion
//          08 > Bonus Game (Temple Masks)
//          09 > Bonus Game (Egypt Statue)
// $060702: [16 Bit] BCD Fight Timer
// $06070B: [8 Bit] Special Attack being used
//          0x00 > Nothing
//          0x01 > Special Attack Animation
//          0x02 > Special Attack Start
// $067822: [8 Bit] Char Select Timer
// $06A716: [16 Bit] Boss Red Health
// $06A73A: Do not use as ending ID, very unstable
// $06A778: [16 Bit] BCD Bonus Score Lower Half
// $06A77A: [16 Bit] BCD Bonus Score Upper Half
//          * 10 000
// $06A842: [16 Bit] P1 Health
// $06A8A6: [8 Bit] P1 CharID
//          00 > Leo
//          01 > Kenji
//          02 > Tessa
//          03 > Mai Ling
// $06A8C1: [8 Bit] Current Level
//          Start at 0x00 for Level 1
// $06A8C4: [16 Bit] BCD P1 Exp Lower Half
//          Game use a Shmup like system of adding +1 to your score on each Continue used. As in regular gameplay every EXP drop is x100 value, this can be used for 1CC/Endings check
// $06A8C6: [16 Bit] BCD P1 Exp Upper Half
//          * 10 000
// $06A8CD: [8 Bit] Orb Type 2
//          01 > Ice
//          02 > Earth
//          03 > Poison
//          04 > Fire
//          05 > Wind
//          06 > Lightning
// $06A8CE: [8 Bit] Orb Type 1
//          01 > Ice
//          02 > Earth
//          03 > Poison
//          04 > Fire
//          05 > Wind
//          06 > Lightning
// $06A8DB: [8 Bit] Perfect Flag
//          0x0a when Perfect Kill
// $06A9D3: [8 Bit] Password being inputed
//          Increment by 1 after each number being entered
// $06A9F8: [8 Bit] Password Symbol
//          Start Symbol == 0x07
//          Start + Down Symbol == 0x08
//          
//          --- --- ---
//          When Password complete
//          Upper 4 == Symbol 5
//          Lower 4 == Symbol 6
// $06A9F9: [8 Bit] Password Symbol
//          Start Symbol == 0x07
//          Start + Down Symbol == 0x08
//          
//          --- --- ---
//          When Password complete
//          Upper 4 == Symbol 3
//          Lower 4 == Symbol 4
// $06A9FA: [8 Bit] Password Symbol
//          Start Symbol == 0x07
//          Start + Down Symbol == 0x08
//          
//          --- --- ---
//          When Password complete
//          Lower 4 == Symbol 2
// $06A9FC: [8 Bit] Password Symbol
//          Start Symbol == 0x07
//          Start + Down Symbol == 0x08
//          
//          --- --- ---
//          When Password complete
//          Upper 4 == Symbol 9
//          Lower 4 == Symbol 10
// $06A9FD: [8 Bit] Password Symbol
//          Start Symbol == 0x07
//          Start + Down Symbol == 0x08
//          
//          --- --- ---
//          When Password complete
//          Lower 4 == Symbol 8
// $06AA00: [8 Bit] Password Symbol
//          Start Symbol == 0x07
//          Start + Down Symbol == 0x08
//          
//          --- --- ---
//          When Password complete
//          Upper 4 == Symbol 1
//          Lower 4 == Symbol 7
// $06AAC2: [16 Bit] Boss Current Health
// $06ABC6: [8 Bit] Boss ID (Enemy Based)
//          Load the associated Boss Sprite and Moveset data
//          00 > Hauzer
//          01 > Kongou
//          02 > Hydron
//          03 > Lavia
//          04 > Ravange
//          05 > Gi Gi
//          06 > Blade
//          07 > Scion
//          08 > Scion 2nd Form
// $07B7CD: pin story mode alt
// $07B7F8: pin credit mini game score
// $07BBFF: pin story mode alt
// $07BCA4: [8 Bit] System Configuration - Chute Mode
// $07BCA5: [8 Bit] System Configuration - Continue
//          00 > No
//          01 > On
// $07BCA6: [8 Bit] System Configuration - Coin
//          0x12 > FreePlay
//          0x00 ~ 0x11 > Coin - Credit configuration
// $07BCAA: [8 Bit] System Configuration - Demo Sound
// $07BCAB: [8 Bit] System Configuration - Sound Mode
// $07BCAC: [8 Bit] System Configuration - Language


///Core
//Constant
Char_Dict = { // {0}: CharID - {1}: CheevoName Prog - {2}: PointNormal  - {3}: Char Name - {4}: CheevoName SpecialAttack  
                    0x01: [0x00, "Lion King", 5, "Leo","Pride"],
                    0x02: [0x01, "Shadow's Bite", 5, "Kenji", "Sloth"],
                    0x03: [0x02, "Mistress of Elements", 5, "Tessa", "Envy"],
                    0x04: [0x03, "Fatal Fury", 5, "Mai Ling", "Wrath"]

                    } 

Boss_Dict = { // {0}: CharID - {1}: CheevoName Prog - {2}: PointNormal  - {3}: Char Name 
                    0x01: [0x00, "Game that Time Forgot", 3, "Hauzer"],
                    0x02: [0x01, "Oni's Rampage", 3, "Kongou"],
                    0x03: [0x02, "Terror from the Deep", 3, "Hydron"],
                    0x04: [0x03, "Harpy's Fury", 5, "Lavia"],
                    0x05: [0x04, "Arumana the Fifth", 5, "Ravange"],
                    0x06: [0x05, "No Re", 10, "Gi Gi"],
                    0x07: [0x06, "Enuma Elish", 10, "Blade"]

                    } 
//Variables

GameDifficulty = byte(0x17a07) // 0x07 max, 0x03 medium
StoryProg = byte(0x60625) // last boss 0x0a

DialogueID = byte(0x606dc)
CutsceneID = byte(0x606de) // For endings

StageID = byte(0x606e4) // Use for bonus stages
SpecialAttackFlag = byte(0x6070b)
PerfectFlag = byte(0x6a8db) // 0x0a on perfect
BCDScoreBonusLower = bcd(word(0x6a778))
BCDScoreBonusUpper = bcd(word(0x6a77a)) * 10000
BCDScoreBonusTotal = bcd(BCDScoreBonusLower + BCDScoreBonusUpper)

PlayerHealth = word(0x6a842)
PlayerCharID = byte(0x6a8a6)
PlayerLevel = byte(0x6a8c1)
PlayerContinueCheck = bcd(low4(0x6a8c4))

PasswordSymbol1 = high4(0x6aa00)
PasswordSymbol2 = low4(0x6a9fa)
PasswordSymbol3 = high4(0x6a9f9)
PasswordSymbol4 = low4(0x6a9f9)
PasswordSymbol5 = high4(0x6a9f8)
PasswordSymbol6 = low4(0x6a9f8)
PasswordSymbol7 = low4(0x6aa00)
PasswordSymbol8 = low4(0x6a9fd)
PasswordSymbol9 = high4(0x6a9fc)
PasswordSymbol10 = low4(0x6a9fc)

BossHealth = word(0x6aac2)
BossID = word(0x6abc6)

BonusMiniGameScore = word(0xf0f2)
P2FlagCheck = bit1(0x0606e9)

//Functions
function BossKill() => BossHealth == 0 && prev(BossHealth) > 0 && PlayerHealth > 0
function GameEnd() => BossID == 0x08 && BossKill()
function PasswordCheck(S1,S2,S3,S4,S5,S6,S7,S8,S9,S10) => PasswordSymbol1 == S1 && PasswordSymbol2 == S2 && PasswordSymbol3 == S3 && PasswordSymbol4 == S4 && PasswordSymbol5 == S5 && PasswordSymbol6 == S6 && PasswordSymbol7 == S7 && PasswordSymbol8 == S8 && PasswordSymbol9 == S9 && PasswordSymbol10 == S10


function BossProg(Boss){
	
    title = Boss_Dict[Boss][1]
	points = Boss_Dict[Boss][2]
	description = format("Defeat {0}", Boss_Dict[Boss][3])
	trigger = (BossKill()
            && BossID == Boss_Dict[Boss][0]
            && P2FlagCheck == 0
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}    

for Boss in Boss_Dict
    BossProg(Boss)


function CharEnding(Char){
	
    title = Char_Dict[Char][1]
	points = Char_Dict[Char][2]
	description = format("Defeat Scion and complete the game with {0}", Char_Dict[Char][3])
	trigger = (BossKill()
            && PlayerCharID == Char_Dict[Char][0]
            && BossID == 0x08
            && StoryProg == 0x0a
            && P2FlagCheck == 0
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}    

for Char in Char_Dict
    CharEnding(Char)

     achievement(title="Curse of Pride",
                description = "Get Leo's Bad Ending. Your Feral side has taken over!",
                points = 10,
                trigger = PlayerCharID == 0
            && StoryProg == 0x0a
            && CutsceneID == 0x06
            && DialogueID == 0x01
            && PlayerContinueCheck < 20
            && P2FlagCheck == 0
)        

     achievement(title="Status Quo",
                description = "Get Leo's Normal Ending. A wise king, but not without regrets.",
                points = 10,
                trigger = PlayerCharID == 0
            && StoryProg == 0x0a
            && CutsceneID == 0x04
            && DialogueID == 0x04
            && PlayerContinueCheck < 20
            && PlayerContinueCheck > 0
            && P2FlagCheck == 0
)       

     achievement(title="King of the Jungle",
                description = "Get Leo's Good Ending. Everything is as it should be.",
                points = 25,
                trigger = PlayerCharID == 0
            && StoryProg == 0x0a
            && CutsceneID == 0x04
            && DialogueID == 0x04
            && PlayerContinueCheck == 0
            && P2FlagCheck == 0
)      


     achievement(title="Lone Blade",
                description = "Get Kenji's Freedom Ending. You chose to cut through the deceit.",
                points = 10,
                trigger = PlayerCharID == 1
            && StoryProg == 0x0a
            && CutsceneID == 0x09
            && DialogueID == 0x02
            && PlayerContinueCheck < 20
            && P2FlagCheck == 0
)    

     achievement(title="The Price of Loyalty",
                description = "Get Kenji's Loyal Ending. You chose duty of truth.",
                points = 10,
                trigger = PlayerCharID == 1
            && StoryProg == 0x0a
            && CutsceneID == 0x06
            && DialogueID == 0x07
            && PlayerContinueCheck < 20
            && P2FlagCheck == 0
)    

     achievement(title="Great Responsabilities",
                description = "Get Tessa's Seal Ending. In the end you did the right thing for the realm.",
                points = 10,
                trigger = PlayerCharID == 2
            && StoryProg == 0x0a
            && CutsceneID == 0x0b
            && PlayerContinueCheck < 20
            && P2FlagCheck == 0
)    

     achievement(title="Thirst for Knowledge",
                description = "Get Tessa's Study Ending. You put the pursuit of knowledge about all else.",
                points = 10,
                trigger = PlayerCharID == 2
            && StoryProg == 0x0a
            && CutsceneID == 0x013
            && PlayerContinueCheck < 20
            && P2FlagCheck == 0
)    

     achievement(title="Never Alone",
                description = "Get Mai Ling's Bad Ending. Hey at least you've got a little friend now!",
                points = 10,
                trigger = PlayerCharID == 3
            && StoryProg == 0x0a
            && PlayerContinueCheck < 20
            && PlayerContinueCheck > 4
            && BossID == 0x08
            && BossKill()
            && P2FlagCheck == 0


)    

     achievement(title="New Family",
                description = "Get Mai Ling's Good Ending. Fight to protect your family!",
                points = 10,
                trigger = PlayerCharID == 3
            && StoryProg == 0x0a
            && PlayerContinueCheck < 5
            && BossID == 0x08
            && BossKill()
            && P2FlagCheck == 0


)    

function LevelProg(Level,Title,Points){
	
    title = Title
	points = Points
	description = format("Reach level {0} with any character", Level)
	trigger = (PlayerLevel >= Level - 1
            && PlayerLevel <= Level + 1
            && prev(PlayerLevel) <= Level - 2
            && prev(PlayerLevel) >= Level - 4
            && PlayerHealth > 0
            && P2FlagCheck == 0
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}    

LevelProg(4,"Apprentice",2)
LevelProg(8,"Squire",3)
LevelProg(16,"Knight",10)
LevelProg(32,"Warzard",25)

     achievement(title="Great Monster Hunter",
                description = "Earn a Perfect Bonus against a boss in Medium difficulty or Above",
                points = 10,
                trigger = GameDifficulty >= 0x03
            && PerfectFlag == 0x0a
            && BossKill()
            && P2FlagCheck == 0


)    

     achievement(title="Savior of the Realm",
                description = "Complete the game in the Hardest difficulty without using any Continue",
                points = 50,
                trigger = GameDifficulty == 0x07
                       && BossKill()
                       && BossID == 0x08
                       && StoryProg == 0x0a
                       && PlayerContinueCheck == 0
                       && P2FlagCheck == 0


)    

     achievement(title="Back to the Basics",
                description = "Complete the game in a Level 1 run in Medium difficulty or Above. Password is Required.",
                points = 10,
                trigger = GameDifficulty >= 0x03
                       && BossKill()
                       && BossID == 0x08
                       && StoryProg == 0x0a
                       && PlayerLevel == 0
                       && once(PlayerLevel == 0 && StoryProg == 1 && prev(StoryProg)==0)
                       && never(PlayerLevel > 0)
                       && never(StoryProg == 0)
                       && P2FlagCheck == 0


)    

     achievement(title="Body and Mind Mastery",
                description = "Complete the game in a Level 32 run in Medium difficulty or Above. Password is Required.",
                points = 10,
                trigger = GameDifficulty >= 0x03
                       && BossKill()
                       && BossID == 0x08
                       && StoryProg == 0x0a
                       && PlayerLevel == 0x1f
                       && once(PlayerLevel == 0x1f && StoryProg == 1 && prev(StoryProg)==0)
                       && never(PlayerLevel < 0x1f)
                       && never(StoryProg == 0)
                       && P2FlagCheck == 0


)    

     achievement(title="Credit Hater",
                description = "In the credit roll during the ending shoot down 1 000 or more letters",
                points = 10,
                trigger = StoryProg == 0x0a
                       && BonusMiniGameScore == 0x3e8
                       && prev(BonusMiniGameScore) < 0x3e8
                       && prev(BonusMiniGameScore) > 0x3d4
                       && P2FlagCheck == 0


)    

function SpecialMoveCheevo(Char){
	
    title = Char_Dict[Char][4]
	points = 5
	description = format("Playing as {0} channel any Orb power and use your Special Attack", Char_Dict[Char][3])
	trigger = (PlayerCharID == Char_Dict[Char][0]
            && PlayerHealth > 0
            && SpecialAttackFlag == 2
            && prev(SpecialAttackFlag) == 1
            && P2FlagCheck == 0
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}    

for Char in Char_Dict
    SpecialMoveCheevo(Char)



     achievement(title="No Car Available",
                description = "Get a Bonus Score of 50 000 Points or more during the Egyptian bonus game",
                points = 5,
                trigger = StageID == 0x09
                       && BCDScoreBonusUpper >= 5
                       && prev(BCDScoreBonusUpper) < 5
                       && P2FlagCheck == 0


)    

     achievement(title="Doom Temple",
                description = "Get a Bonus Score of 60 000 Points or more during the Temple bonus game",
                points = 5,
                trigger = StageID == 0x08
                       && BCDScoreBonusUpper >= 6
                       && prev(BCDScoreBonusUpper) < 6
                       && P2FlagCheck == 0


)    


//Rich Presence
CharacterRP = { 
                    00:"Leo",
                    01:"Kenji",
                    02:"Tessa",
                    03:"Mai Ling"


                    }  

BossRP = { 
                    0x00:"Hauzer",
                    0x01:"Kongou",
                    0x02:"Hydron",
                    0x03:"Lavia",
                    0x04:"Ravange",
                    0x05:"Gi Gi",
                    0x06:"Blade",
                    0x07:"Scion",
                    0x08:"True Scion"

                    }  


 ///Default 
rich_presence_conditional_display(
    P2FlagCheck == 1,
    "• 2ND PLAYER DETECTED - ACHIEVEMENTS BLOCKED •"
)
rich_presence_conditional_display(
    PlayerHealth > 0,
    "• {0} VS {1} - Difficulty {2}/8 - Level {3} - {4} Continue(s) Used •",
    rich_presence_lookup("Char", PlayerCharID, CharacterRP),
    rich_presence_lookup("Boss", BossID, BossRP),
    rich_presence_value("Difficulty",GameDifficulty+1),
    rich_presence_value("PlayerLevel", PlayerLevel+1),
    rich_presence_value("ContinueCounter",PlayerContinueCheck))  
rich_presence_display(
    "• RED EARTH - {0} Continue(s) Used •",
     rich_presence_value("ContinueCounter",PlayerContinueCheck))
