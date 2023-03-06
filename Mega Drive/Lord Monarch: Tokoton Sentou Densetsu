// Lord Monarch: Tokoton Sentou Densetsu
// #ID = 4345

// 20230306 Version - Sines

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


// $8544: [8 Bit] Controller Port 1
//        0x03 > MD Mouse
// $96C2: [8 Bit] Game State Value
//        0x1a > In a Map
//        0x02 > Not in map (main menu, victory screen)
// $96C4: [16 Bit] Game State Value Certificate
//        TBC Stable, but goes from
//        0x0f03 usually to
//        0x0602 on Certificate screen (can be used to check end of map
// $A770: potential victory screen
// $A96C: ..
// $CC61: [8 Bit] Game Mode
//        00 > Story / Main Menu
//        01 > Challenge Normal
//        02 > Challenge Advanced
// $CC78: [16 Bit] Gold
// $CD36: [16 Bit] In-Game Timer Used to track Current Days count
//        +2 to value == 1 Day
// $CD3A: [16 Bit] In-Game Timer
//        Used to Decrement Total Days Remaining count
// $CD3C: [8 Bit] Chapter Value (Story Mode)
//        00~07 > Ch 1~8
// $CD3E: [8 Bit] Challenge (Normal & Advanced) Level ID
//        Only change while in map
//        - Ending - got no ID associated
//        0x33 > Level 52 (last)
// $CD64: [16 Bit] Victory - Remaining Campaign Days
// $CD66: [16 Bit] Victory - Occupation Penalty
// $CD68: [8 Bit] Victory - Occupation sub%
// $CD6A: [8 Bit] Victory - Occupation %
// $CD70: [16 Bit] Victory - Efficiency Bonus
// $CD72: [8 Bit] Victory - Efficiency sub%
// $CD74: [8 Bit] Victory - Efficiency %
// $CDA2: [8 Bit] Game Pause
//        00 > Play
//        01 > Pause
// $CDA4: [8 Bit] Taxe Rate change windows
//        00 > No
//        01 > On
// $CDA8: [8 Bit] Tax Rate
//        00 ~ 0x1e (30)
// $CDDE: [16 Bit] Second Gold address ? One might be just the display
// $CDE8: [8 Bit] Current Days count
// $CDEC: [16 Bit] Campaign Days Remaining
// $CE03: [8 Bit] In cinematic marker
//        00 > On map / In game
//        FF > In cinematic (can be used to check end of Ch8)
// $D1BE: [16 Bit] King's Value
// $D27E: [16 Bit] King 2 Value
// $D33E: [16 Bit] King 3 Value
// $D3FE: [16 Bit] King 4 Value
// $EE97: [8 Bit] Certification Level
//        0x14 > Max Rank (1)
// $F2A8: potential level ID
// $F2B0: [8 Bit] Challenge Level Available (not bitflags)
//        Works for both Normal and Advanced Challenge
//        Likely Cursor position ID in menu
//        0x35 > Max value (ending)
// $F2B4: bitflags?
// $F300: [8 Bit] Option: Sound
//        00 > On
//        01 > Off
// $F301: [8 Bit] Option: Speed
//        Default: 2
// $F302: [8 Bit] Option: Control (Which Controller port are active, there's no multiplayer so P2 can be turned off)
//        00 > P1 & P2
//        01 > P1
// $F303: [8 Bit] Option: Music
//        00 > On
//        01 > Off
// $F305: [8 Bit] Option: Key Set
//        00 > No 1
//        01 > No 2
//        02 > No 3
// 0x00ee95 [8 Bit] Game State 0x2a on Victory Screen


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CheevoProgTitle =  { 
                    0:"Prove Thyself",
                    1:"LFP: Looking for Princess",
                    2:"The Demon Ressurgence",
                    3:"Leafing Around",
                    4:"Maelstrom of Emotion",
                    5:"Hot Temper",
                    6:"The End ?",
                    7:"Outrunning Responsabilities"
                    }  
                    
                    
ChapterName = { 
                    0:"I am an Adult",
                    1:"The challenge of the selfish princess",
                    2:"Show them the power of youth!",
                    3:"The encroaching forest",
                    4:"Threat of submersion",
                    5:"The long road to Langer Island",
                    6:"The sun sets over the battle",
                    7:"The princess is mine !"
                    }  
                    

//----------------
//Variable
SegaMouseController = byte(0x8544) == 0x03 // Sega Mouse Controller Value

InGameStatus = byte(0x96C2) // 0x1a In Map, 0x02 Main Menu or Victory Screen
InCutscene = byte(0xCE03) // 00 Normal, 0xFF cutscene

VictoryScreenCheck = byte(0x00ee95) // 0x2a on Victory Screen >> 0x27 on ch7 credit roll, 0x03 on ch8 credit roll

GameMode = byte(0xCC61) // 00 > Main Menu / Story, 01 > Normal Challenge, 02 > Advanced Challenge
StoryModeChapter = byte(0xCD3C) // 0-7 for chapter 1-8
LevelID = byte(0xCD3E) // 00 - 0x32 for last level > Mode agnostic

SpeedConf = byte(0xF301) // Max 0x03

//----------------
//Function
function StoryChapterDone(ChapterID,Points)
{
    achievement(title=CheevoProgTitle[ChapterID],
                description = "Complete Chapter " + ChapterID+1 +" - "+ ChapterName[ChapterID],
                points = Points,
                trigger = GameMode == 0 // Story Mode check
                       && repeated(10, StoryModeChapter == ChapterID +1 ) // Checking for player in current chapter + switch to the new one > Checking the value to be true for 10 frames due to bootup memory jump
                       && prior(StoryModeChapter) == ChapterID  
                       && InCutscene == 0 // Not in a cutscene technically
      
)              
}

function NormalChallengeDone(ChapterID,Points)
{
    achievement(title="Prince Monarch: "+ ChapterID-4 +" - " + ChapterID,
                description = "In Normal Challenge mode, complete maps " + ChapterID-4 +" - "+ ChapterID,
                points = Points,
                trigger = GameMode == 1 // Story Mode check
                       && prev(VictoryScreenCheck) != 0x2a // Victory Screen, value change on Certificate check
                       && VictoryScreenCheck == 0x2a
                       && LevelID == ChapterID-1
      
)              
}

function AdvancedChallengeDone(ChapterID,Points)
{
    achievement(title="Lord Monarch: "+ ChapterID-4 +" - " + ChapterID,
                description = "In Advanced Challenge mode, complete maps " + ChapterID-4 +" - "+ ChapterID,
                points = Points,
                trigger = GameMode == 2 // Story Mode check
                       && prev(VictoryScreenCheck) != 0x2a // Victory Screen, value change on Certificate check
                       && VictoryScreenCheck == 0x2a
                       && LevelID == ChapterID-1
      
)              
}
//----------------
///Achievement Code
// Story
StoryChapterDone(0,5)
StoryChapterDone(1,5)
StoryChapterDone(2,5)
StoryChapterDone(3,10)
StoryChapterDone(4,10)
StoryChapterDone(5,10)
achievement(title=CheevoProgTitle[6],
                description = "Complete Chapter 7" +" - "+ ChapterName[6],
                points = 25,
                trigger = GameMode == 0 // Story Mode check
                       && StoryModeChapter == 6  
                       && InCutscene == 0xff 
                       && repeated(10,VictoryScreenCheck == 0x27)
      
)    

achievement(title=CheevoProgTitle[7],
                description = "Complete Chapter 8" +" - "+ ChapterName[7],
                points = 25,
                trigger = GameMode == 0 // Story Mode check
                       && StoryModeChapter == 7  
                       && InCutscene == 0xff 
                       && repeated(10,VictoryScreenCheck == 0x03)
      
)   


// Normal Challenge
NormalChallengeDone(5,2)
NormalChallengeDone(10,3)
NormalChallengeDone(15,5)
NormalChallengeDone(20,10)
NormalChallengeDone(25,10)
NormalChallengeDone(30,10)
NormalChallengeDone(35,10)
NormalChallengeDone(40,10)
NormalChallengeDone(45,25)
NormalChallengeDone(50,25)
achievement(title="Prince Monarch: 51 - 52",
                description = "In Normal Challenge mode, complete the last two maps !",
                points = 50,
                trigger = GameMode == 1 // Story Mode check
                       && prev(VictoryScreenCheck) != 0x2a // Victory Screen, value change on Certificate check
                       && VictoryScreenCheck == 0x2a
                       && LevelID == 0x33 )

// Advanced Challenge
AdvancedChallengeDone(5,2)
AdvancedChallengeDone(10,3)
AdvancedChallengeDone(15,5)
AdvancedChallengeDone(20,10)
AdvancedChallengeDone(25,10)
AdvancedChallengeDone(30,10)
AdvancedChallengeDone(35,10)
AdvancedChallengeDone(40,10)
AdvancedChallengeDone(45,25)
AdvancedChallengeDone(50,25)
achievement(title="Lord Monarch: 51 - 52",
                description = "In Advanced Challenge mode, complete the last two maps !",
                points = 50,
                trigger = GameMode == 2 // Story Mode check
                       && prev(VictoryScreenCheck) != 0x2a // Victory Screen, value change on Certificate check
                       && VictoryScreenCheck == 0x2a
                       && LevelID == 0x33 )

// Misc
achievement(title="Just like on PC !",
                description = "Play any of the challenge map from start to finish using the Sega Mouse only (Sega Mouse need to be selected on Main Menu before selection Normal/Advanced mode)",
                points = 5,
                trigger = (GameMode == 1 // Story Mode check
                       || GameMode == 2)
                       && prev(VictoryScreenCheck) != 0x2a // Victory Screen, value change on Certificate check
                       && trigger_when(VictoryScreenCheck == 0x2a
                       && SegaMouseController)
                       && once(byte(0x00f317)== 02 && byte(0x00f318) == 0 && byte(0x00f319) == 04 && SegaMouseController) // Check value on main menu before selectionning a mode
                       && never(!SegaMouseController) // Reset if not sega mouse controller
                       
)

//----------------

///Leaderboard
