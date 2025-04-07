// Tournament Cyberball
// #ID = 26382
// 20250407 Version - Sines

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

RivalCoach = byte(0x96)
P1Team = byte(0x97)
P2Team = byte(0x98)
P1Score = ((byte(0xd340) - 2) * 10) + (byte(0xd341) - 2)
P2Score = ((byte(0xd344) - 2) * 10) + (byte(0xd345) - 2)

GamePeriod = byte(0xd376) - 2

function P1ScoreCheck(Period) => (byte(0xd3af + (3*Period)) * 10 + byte(0xd3b0 + (3*Period))) > (byte(0xd3c1 + (3*Period)) * 10 + byte(0xd3c2 + (3*Period))) && (byte(0xd3c1 + (3*Period)) * 10 + byte(0xd3c2 + (3*Period))) == 0

    achievement(title="What's Up Doc",
                description = "Defeat Doc Davis",
                points = 5,
                trigger = RivalCoach == 0x01
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="Anti Air",
                description = "Defeat Sky Rogers",
                points = 5,
                trigger = RivalCoach == 0x02
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="Bring Out the Pain",
                description = "Defeat I. M. Payne",
                points = 10,
                trigger = RivalCoach == 0x00
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="Parry THIS",
                description = "Defeat Grace Savage",
                points = 10,
                trigger = RivalCoach == 0x03
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="Here Come the Thunder",
                description = "Win a match with the Seatle Thunder",
                points = 3,
                trigger = P1Team == 0x01
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="They Came from Outer Space",
                description = "Win a match with the Honolulu Invasion",
                points = 3,
                trigger = P1Team == 0x02
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="Lightning Strike Twice",
                description = "Win a match with the Los Angeles Lightning",
                points = 3,
                trigger = P1Team == 0x03
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="They Will Not Stop. EVER.",
                description = "Win a match with the San Diego Machine",
                points = 3,
                trigger = P1Team == 0x04
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="Over in a Flash",
                description = "Win a match with the Phoenix Flash",
                points = 3,
                trigger = P1Team == 0x05
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="Psycho Crush",
                description = "Win a match with the San Francisco Crush",
                points = 3,
                trigger = P1Team == 0x06
                       && GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score

)  

    achievement(title="Hyper Offense",
                description = "Not only win a match but do so while gaining at least one point during every period",
                points = 10,
                trigger = GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score
                       && (byte(0xd3af) * 10 + byte(0xd3b0 )) > 0x02
                       && (byte(0xd3af + (3*1)) * 10 + byte(0xd3b0 + (3*1))) > 0x02
                       && (byte(0xd3af + (3*2)) * 10 + byte(0xd3b0 + (3*2))) > 0x02
                       && (byte(0xd3af + (3*3)) * 10 + byte(0xd3b0 + (3*3))) > 0x02
                       && (byte(0xd3af + (3*4)) * 10 + byte(0xd3b0 + (3*4))) > 0x02
                       && (byte(0xd3af + (3*5)) * 10 + byte(0xd3b0 + (3*5))) > 0x02

)  

    achievement(title="Steel Wall",
                description = "Shutout the enemy team by not letting gain any point during the whole match",
                points = 10,
                trigger = GamePeriod == 1
                       && prev(GamePeriod) == 6
                       && P1Score > P2Score
                       && P2Score == 0

)  

RPCoach = { 
                    0x00:"Payne",
                    0x01:"Davis",
                    0x02:"Roger",
                    0x03:"Savage"

                    }    

 RPTeam = { 
                    0x01:"Seattle Thunder",
                    0x02:"Honolulu Invasion",
                    0x03:"Los Angeles Lightning",
                    0x04:"San Diego Machine",
                    0x05:"Phoenix Flash",
                    0x06:"San Francisco Crush"

                    }                       
 



rich_presence_display(
    "• Match of the New Century! The Player's {0} VS Coach {1}'s {2} • Current Score of {3} - {4} •",
    rich_presence_lookup("RPTeam", P1Team, RPTeam),
    rich_presence_lookup("RPCoach", RivalCoach, RPCoach),
    rich_presence_lookup("RPTeam", P2Team, RPTeam),
    rich_presence_value("P1Score", P1Score),
    rich_presence_value("P2Score", P2Score)

)  