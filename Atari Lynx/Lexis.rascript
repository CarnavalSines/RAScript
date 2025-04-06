// Lexis
// #ID = 10242
// 20250406 Version - Sines

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


/// Variables
DisplayPage = byte(0x16)
SecretMode = byte(0x52)
YouWinSFX = byte(0x62)
ChallengeModeHighlight = byte(0x66)

GameMode = byte(0x71)

Score = low4(0x2583) * 10000000 + low4(0x2584) * 1000000 + low4(0x2585) * 100000 + low4(0x2586) * 10000 + low4(0x2587) * 1000 + low4(0x2589) * 100 + low4(0x258a) * 10 + low4(0x258b)

ChallengeLevel = low4(0x320e)
DropWidth = low4(0x321b)
SkillLevel = low4(0x3223) * 10 + low4(0x3224)
PageNumber = low4(0x39a5) * 10 + low4(0x39a6)

    achievement(title="Open Book",
                description = "Clear Page 1 in Pages Mode",
                points = 2,
                trigger = GameMode == 0x01
                       && PageNumber == 1
                       && (DisplayPage == 0x38
                       || DisplayPage == 0x39)
                       && YouWinSFX == 1
                       && prev(YouWinSFX) == 2

)  

    achievement(title="Protoculture",
                description = "Clear Page 25 in Pages Mode",
                points = 10,
                trigger = GameMode == 0x01
                       && PageNumber == 25
                       && (DisplayPage == 0x38
                       || DisplayPage == 0x39)
                       && YouWinSFX == 1
                       && prev(YouWinSFX) == 2

)  

    achievement(title="Mr Fancy Words",
                description = "Clear Page 50 in Pages Mode",
                points = 10,
                trigger = GameMode == 0x01
                       && PageNumber == 50
                       && (DisplayPage == 0x38
                       || DisplayPage == 0x39)
                       && YouWinSFX == 1
                       && prev(YouWinSFX) == 2

)  

    achievement(title="Pillar of Knowledge",
                description = "Clear Page 75 in Pages Mode",
                points = 25,
                trigger = GameMode == 0x01
                       && PageNumber == 75
                       && (DisplayPage == 0x38
                       || DisplayPage == 0x39)
                       && YouWinSFX == 1
                       && prev(YouWinSFX) == 2

)  
    achievement(title="Archsage",
                description = "Clear Page 99 in Pages Mode (No Secret Code)",
                points = 50,
                trigger = GameMode == 0x01
                       && PageNumber == 99
                       && (DisplayPage == 0x38
                       || DisplayPage == 0x39)
                       && YouWinSFX == 1
                       && prev(YouWinSFX) == 2
                       && SecretMode == 0

)  

    achievement(title="It's a Secret to Everybody",
                description = "On the Main Menu, use the secret code given to you by beating the 99th Page",
                points = 0,
                trigger = DisplayPage == 0x2f
                       && SecretMode == 1
                       && prev(SecretMode) == 0

)  

    achievement(title="Space Cadet",
                description = "Reach a score of 20 000 or more in the Secret Mode",
                points = 5,
                trigger = DisplayPage == 0x25
                       && Score >= 20000
                       && prev(Score) < 20000

)  

    achievement(title="Thesis",
                description = "Reach a score of 5 000 or more in Standard Mode",
                points = 5,
                trigger = GameMode == 0x00
                       && DisplayPage == 0x3c
                       && Score >= 5000
                       && prev(Score) < 5000

)  

    achievement(title="Antithesis",
                description = "Reach a score of 10 000 or more in Standard Mode",
                points = 10,
                trigger = GameMode == 0x00
                       && DisplayPage == 0x3c
                       && Score >= 10000
                       && prev(Score) < 10000

)  

    achievement(title="Synthesis",
                description = "Reach a score of 25 000 or more in Standard Mode",
                points = 25,
                trigger = GameMode == 0x00
                       && DisplayPage == 0x3c
                       && Score >= 25000
                       && prev(Score) < 25000

)  

    achievement(title="And Now for a Challenge",
                description = "Beat Challenge 0",
                points = 2,
                trigger = (DisplayPage == 0x3c
                       || DisplayPage == 0x8e)
                       && GameMode == 0x02
                       && ChallengeModeHighlight == 0
                       && prev(ChallengeModeHighlight) == 1
                       && ChallengeLevel == 0

)  

    achievement(title="To Go On",
                description = "Beat Challenge 1",
                points = 3,
                trigger = (DisplayPage == 0x3c
                       || DisplayPage == 0x8e)
                       && GameMode == 0x02
                       && ChallengeModeHighlight == 0
                       && prev(ChallengeModeHighlight) == 1
                       && ChallengeLevel == 1

)  

    achievement(title="Cleaning Duty",
                description = "Beat Challenge 2",
                points = 3,
                trigger = (DisplayPage == 0x3c
                       || DisplayPage == 0x8e)
                       && GameMode == 0x02
                       && ChallengeModeHighlight == 0
                       && prev(ChallengeModeHighlight) == 1
                       && ChallengeLevel == 2

)  

    achievement(title="Mightier than the Sword",
                description = "Beat Challenge 3",
                points = 5,
                trigger = (DisplayPage == 0x3c
                       || DisplayPage == 0x8e)
                       && GameMode == 0x02
                       && ChallengeModeHighlight == 0
                       && prev(ChallengeModeHighlight) == 1
                       && ChallengeLevel == 3

)  

    achievement(title="Spilled Ink",
                description = "Beat Challenge 4",
                points = 5,
                trigger = (DisplayPage == 0x3c
                       || DisplayPage == 0x8e)
                       && GameMode == 0x02
                       && ChallengeModeHighlight == 0
                       && prev(ChallengeModeHighlight) == 1
                       && ChallengeLevel == 4

)  

    achievement(title="Feeling the Heat",
                description = "Beat Challenge 5",
                points = 5,
                trigger = (DisplayPage == 0x3c
                       || DisplayPage == 0x8e)
                       && GameMode == 0x02
                       && ChallengeModeHighlight == 0
                       && prev(ChallengeModeHighlight) == 1
                       && ChallengeLevel == 5

)  

    achievement(title="Against All Odds",
                description = "Beat Challenge 6",
                points = 10,
                trigger = (DisplayPage == 0x3c
                       || DisplayPage == 0x8e)
                       && GameMode == 0x02
                       && ChallengeModeHighlight == 0
                       && prev(ChallengeModeHighlight) == 1
                       && ChallengeLevel == 6

)  

    achievement(title="Scrambled Brain",
                description = "Beat Challenge 6 while on Drop Width 5",
                points = 25,
                trigger = (DisplayPage == 0x3c
                       || DisplayPage == 0x8e)
                       && GameMode == 0x02
                       && ChallengeModeHighlight == 0
                       && prev(ChallengeModeHighlight) == 1
                       && ChallengeLevel == 6
                       && DropWidth == 5

)  


/// RP Script

RPMode = { 
                    0x00:"Standard",
                    0x01:"Pages",
                    0x02:"Challenges"

                    }    
 

rich_presence_conditional_display(
    (DisplayPage == 0x3c || DisplayPage == 0x8e) && GameMode == 0x01,
    "• Playing in {0} Mode - Page {1} •",
    rich_presence_lookup("RPMode", GameMode, RPMode),
    rich_presence_value("Page", PageNumber)
)

rich_presence_conditional_display(
    (DisplayPage == 0x3c || DisplayPage == 0x8e) && GameMode == 0x00,
    "• Playing in {0} Mode - Score: {1} •",
    rich_presence_lookup("RPMode", GameMode, RPMode),
    rich_presence_value("Score", Score)
)

rich_presence_conditional_display(
    (DisplayPage == 0x3c || DisplayPage == 0x8e) && GameMode == 0x02,
    "• Playing in {0} Mode - Challenge Level {1} •",
    rich_presence_lookup("RPMode", GameMode, RPMode),
    rich_presence_value("CL", ChallengeLevel)
)

rich_presence_conditional_display(
    DisplayPage == 0x25,
    "• Reaching for the Stars - Score: {0} •",
    rich_presence_value("Score", Score)
)

rich_presence_display(
    "• The power of WORDS • "

)  