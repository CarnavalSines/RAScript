// Capcom Sports Club
// #ID = 12262
// 20240409 Version - Sines

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

// $00B8: [8 Bit] Game Mode
//        Only True on Select screen
// $0995: [8 Bit] Football - Timer Countdown Player Select
// $0CAB: [8 Bit] Tennis - Timer Countdown Player Select
// $0E3F: [8 Bit] Basketball - Timer Countdown Player Select
// $8B80: [16 Bit] Score Upper Half
//        * 65536
// $8B82: [16 Bit] Score Lower Half
// $8BA1: [8 Bit] Full Run Game Clear
//        Bit 0 | Kick Stars Clear
//        Bit 1 | Smash Stars Clear
//        Bit 2 | Dunk Stars Clear
//        Credit roll automatically when last game is cleared OR when selecting END before that
//        Value update on reaching "Extend Play!" screen, even without selecting CONTINUE
// $8BDA: [8 Bit] Active Players Bitflag
//        Bit 0 | P1 Active
//        Bit 1 | P2 Active
// $8BF2: [8 Bit] Game Configuration - 2P Select Mode
//        00 > On
//        01 > Off
//        02 > Only 2P
// $8BF3: [8 Bit] Game Mode < Use this one
//        00 > Kick Stars (Football)
//        01 > Smash Stars (Tennis)
//        02 > Dunk Stars (Basketball)
// $8BF4: [8 Bit] Game Configuration - Kick Stars (Football) Timer Speed
//        01 > Default
//        03 > Max (Fast)
// $8BF5: [8 Bit] Game Configuration - Kick Stars (Football) Difficulty
//        01 > Default
//        03 > Max
// $8BF6: [8 Bit] Game Configuration - Dunk Stars (Basketball) Timer Speed
//        01 > Default
//        03 > Max (Fast)
// $8BF7: [8 Bit] Game Configuration - Dunk Stars (Basketball) Difficulty
//        01 > Default
//        03 > Max
// $8BF8: [8 Bit] Game Configuration - Smash Stars (Tennis) Max Games
//        00 > 13 (0-0)
//        01 > 9 (2-2)
//        02 > 5 (4-4) Default
//        03 > 1 (6-6)
// $8BF9: [8 Bit] Game Configuration - Smash Stars (Tennis) Difficulty
//        01 > Default
//        03 > Max
// $8C1E: [16 Bit] Lifetime Credit inserted Upper half)
//        * 65536
// $8C20: [16 Bit] Lifetime Credit inserted (Lower half)
// $8C92: [8 Bit] Football / Basketball - Match Timer Seconds * 10
//        0'X0"
// $8C93: [8 Bit] Football / Basketball - Match Timer Minute
//        X'00"
// $8C95: [8 Bit] Football / Basketball - Match Timer Seconds
//        0'0X"
// $8C96: [8 Bit] Football / Basketball - P2 Team ID
// $8C97: [8 Bit] Football / Basketball - P1 Team ID
//        --- --- ---
//        Football
//        0x00 > Germany
//        0x01 > Japan
//        0x02 > Italy
//        0x03 > France
//        0x04 > Spain
//        0x05 > Mexico
//        0x06 > Argentina
//        0x07 > Brazil
//        0x08 > Star -> Bonus Char
//        --- --- ---
//        Basketball
//        0x00 > United Kingdom
//        0x01 > France
//        0x02 > Germany
//        0x03 > Italy
//        0x04 > Spain
//        0x05 > Japan
//        0x06 > China
//        0x07 > USA
//        0x08 > Golden USA -> Bonus Char
// $8C98: [8 Bit] Basketball - P1 Score
// $8C9A: [8 Bit] Basketball - P2 Score
// $8C9D: [8 Bit] Football - Nb Match Won
//        Should only increment to 0x04 if fighting Extra Boss
// $8CB4: [8 Bit] Football - P1 Score
// $8CBA: [8 Bit] Football - P2 Score
// $8CBE: [8 Bit] Basketball - Current Match ID
//        01 > Quarterfinal
//        02 > Semifinal
//        03 > Final
//        04 > Secret Fight
// $8CC1: [8 Bit] Football - Current Match ID
//        01 > Quarterfinal
//        02 > Semifinal
//        03 > Final
//        04 > Secret Fight
// $8CC4: [8 Bit] Basketball - Nb Match Won
// $8DA0: [8 Bit] Basketball - P1 Nb Dunks
// $8DA2: [8 Bit] Basketball - P2 Nb Dunks
// $8DA4: [8 Bit] Basketball - P1 3PG Tried
//        0/X
// $8DA6: [8 Bit] Basketball - P2 3PG Tried
//        0/X
// $8DA8: [8 Bit] Basketball - P2 3PG Scored
//        X/0
// $8DAA: [8 Bit] Basketball - P2 3PG Scored
//        X/0
// $8DF4: [8 Bit] Football - P1 Nb Shot for the Match
//        Used for Average calculation (Total Points / Nb Shots)
// $8DF6: [8 Bit] Football - P2 Nb Shot for the Match
// $AE14: [8 Bit] Tennis - P1 Match Score
// $AE15: [8 Bit] Tennis - P1 Score
// $AE1E: [8 Bit] Tennis - P1 Total Point
// $AE26: [8 Bit] Tennis - P1 Service Ace
// $AE28: [8 Bit] Tennis - P1 Return Ace
// $AE86: [8 Bit] Tennis - P1 Char ID
//        0x00 > Graft (Germany)
//        0x01 > Natalie (France)
//        0x02 > Estella (Spain)
//        0x03 > Katrina (Russia)
//        0x04 > Simmy (India)
//        0x05 > Florence (Italy)
//        0x06 > Laurie (UK)
//        0x07 > Amee (USA)
//        0x08 > Maria (Mexico)
//        0x09 > Jana (Brazil)
//        0x0a > Fang-Ming (Taiwan)
//        0x0b > Li-Li (China)
//        0x0c > Zina (Egypt)
//        0x0d > Sue (Korea)
//        0x0e > Hikaro (Japan)
//        0x0f > Ayshea (Australia)
//        0x10 > Melody (Love) -> Bonus Char
//        0x11 > Melody (Love) -> Bonus Char
// $AE87: [8 Bit] Tennis - Current Match ID
//        01 > Quarterfinal
//        02 > Semifinal
//        03 > Final
//        04 > Secret Fight
// $B314: [8 Bit] Tennis - P2 Match Score
// $B315: [8 Bit] Tennis - P2 Score
// $B31E: [8 Bit] Tennis - P2 Total Points
// $B326: [8 Bit] Tennis - P2 Service Ace
// $B328: [8 Bit] Tennis - P2 Return Ace
// $B386: [8 Bit] Tennis - P2 Char ID

///Core
//Constant
Football_Prog_Dict = { // {0}: TeamID - {1}: TeamName - {2}: CheevoName  - {3}: Score 
                    0x01: [0, "Germany", "Kasespatzle", 5],
                    0x02: [1, "Japan", "Onigiri", 5],
                    0x03: [2, "Italy", "Risotto", 5],
                    0x04: [3, "France", "Baguette", 5],
                    0x05: [4, "Spain", "Fideua", 5],
                    0x06: [5, "Mexico", "Pozole", 5],
                    0x07: [6, "Argentina", "Milanesa", 5],
                    0x08: [7, "Brazil", "Acarajé", 5],
                    0x09: [8, "Star", "Moon Dust", 3]


                    } 

Basketball_Prog_Dict = { // {0}: TeamID - {1}: TeamName - {2}: CheevoName  - {3}: Score 
                    0x01: [0, "United Kingdom", "Big Ben", 5],
                    0x02: [1, "France", "Eiffel Tower", 5],
                    0x03: [2, "Germany", "Siegessaule", 5],
                    0x04: [3, "Italy", "Tower of Pisa", 5],
                    0x05: [4, "Spain", "Alhambra", 5],
                    0x06: [5, "Japan", "Senso-Ji", 5],
                    0x07: [6, "China", "Temple of Heaven", 5],
                    0x08: [7, "USA", "Statue of Liberty", 5],
                    0x09: [8, "Golden USA", "Golden Bridge", 3]


                    }                     

Tennis_Prog_Dict = { // {0}: TeamID - {1}: TeamName - {2}: CheevoName  - {3}: Score 
                    0x01: [0, "Graft (Germany)", "Tennisspieler", 5],
                    0x02: [1, "Natalie (France)", "But I AM Superior", 5],
                    0x03: [2, "Estella (Spain)", "Bull's Charge", 5],
                    0x04: [3, "Katrina (Russia)", "Blizzard Tempest", 5],
                    0x05: [4, "Simmy (India)", "No Extra Arms", 5],
                    0x06: [5, "Florence (Italy)", "Pizza Slice", 5],
                    0x07: [6, "Laurie (UK)", "Oh No, She's Bri'ish", 5],
                    0x08: [7, "Amee (USA)", "Tennis Dimension", 5],
                    0x09: [8, "Maria (Mexico)", "Flight of the Caracara", 5],
                    0x10: [9, "Jana (Brazil)", "Brazil's Coming to YOU!", 5],
                    0x11: [10, "Fang-Ming (Taiwan)", "I Don't Want Any Troubles", 5],
                    0x12: [11, "Li-Li (China)", "Chun-Chun", 5],
                    0x13: [12, "Zina (Egypt)", "Sand's Curse", 5],
                    0x14: [13, "Sue (Korea)", "T-Pop", 5],
                    0x15: [14, "Hikaro (Japan)", "Ancestral Racket", 5],
                    0x16: [15, "Ayshea (Australia)", "Tennis's a Good Job Mate", 5],
                    0x17: [16, "Melody (Love)", "Baby Don't Hurt Me", 3]


                    }                         

Score_Prog_Dict = { // {0}: Score - {1}: DescName - {2}: CheevoName  - {3}: Score 
                    0x01: [100000, "100 000", "Stylish Athlete", 2],
                    0x02: [200000, "200 000", "Jewel Enthusiast", 3],
                    0x03: [300000, "300 000", "True Gentleman", 5],
                    0x04: [400000, "400 000", "Liquidity Bath", 10],
                    0x05: [500000, "500 000", "Goldmine", 25]

                    }      
//Variables
Score1 = word(0x8b80) * 65536
Score2 = word(0x8b82)
P1Score = Score1 + Score2

FootballCheck = bit0(0x8ba1)
TennisCheck = bit1(0x8ba1)
BasketballCheck = bit2(0x8ba1)

P1ActiveFlag = bit0(0x8bda)
P2ActiveFlag = bit1(0x8bda)

GameMode = byte(0x8bf3)

FootballTimerSpeed = byte(0x8bf4)
FootballDifficulty = byte(0x8bf5)
BasketballTimerSpeed = byte(0x8bf6)
BasketballDifficulty = byte(0x8bf7)
TennisGameConf = byte(0x8bf8)
TennisDifficulty = byte(0x8bf9)

Credit1 = word(0x8c1e) * 65536
Credit2 = word(0x8c20)
LifetimeCredit = Credit1 + Credit2

FootBasketballP1ID = byte(0x8c97)
FootBasketballP2ID = byte(0x8c96)
/// BASKET
BasketballP1Score = byte(0x8c98)
BasketballP2Score = byte(0x8c9a)
BasketballMatchID = byte(0x8cbe)
BasketballMatchWon = byte(0x8cc4)
BasketballP1NbDunks = byte(0x8da0)
BasketballP1Nb3PointShots = byte(0x8da8)

/// FOOTBALL
FootballP1Score = byte(0x8cb4)
FootballP2Score = byte(0x8cba)
FootballMatchID = byte(0x8cc1)
FootballMatchWon = byte(0x8c9d)
FootballP1NbShot = byte(0x8df4)
FootballP2NbShot = byte(0x8df6)

/// TENNIS
TennisP1CharID = byte(0xae86)
TennisP2CharID = byte(0xb386)
TennisMatchID = byte(0xae87)
TennisMatchWon = byte(0xae52)

TennisP1MatchScore = byte(0xae14)
TennisP1TotalPoint = byte(0xae1e)
TennisP1ServiceAce = byte(0xae26)
TennisP1ReturnAce = byte(0xae28)

TennisP2MatchScore = byte(0xb314)
TennisP2TotalPoint = byte(0xb31e)

// Functions
function TennisClear() => TennisCheck == 1 && prev(TennisCheck) == 0
function FootballClear() => FootballCheck == 1 && prev(FootballCheck) == 0
function BasketballClear() => BasketballCheck == 1 && prev(BasketballCheck) == 0

function TennisProg(Char){
	
    title = Tennis_Prog_Dict[Char][2]
	points = Tennis_Prog_Dict[Char][3]
	description = format("Win the Smash Stars tournament with {0}", Tennis_Prog_Dict[Char][1])
	trigger = (P2ActiveFlag == 0
            && GameMode == 1
            && TennisP1CharID == Tennis_Prog_Dict[Char][0]
            && TennisClear()
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function FootballProg(Char){
	
    title = Football_Prog_Dict[Char][2]
	points = Football_Prog_Dict[Char][3]
	description = format("Win the Kick Stars tournament with the {0} Team", Football_Prog_Dict[Char][1])
	trigger = (P2ActiveFlag == 0
            && GameMode == 0
            && FootBasketballP1ID == Football_Prog_Dict[Char][0]
            && FootballClear()
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function BasketballProg(Char){
	
    title = Basketball_Prog_Dict[Char][2]
	points = Basketball_Prog_Dict[Char][3]
	description = format("Win the Dunk Stars tournament with the {0} Team", Basketball_Prog_Dict[Char][1])
	trigger = (P2ActiveFlag == 0
            && GameMode == 2
            && FootBasketballP1ID == Football_Prog_Dict[Char][0]
            && BasketballClear()
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function ScoreProg(Score){
	
    title = Score_Prog_Dict[Score][2]
	points = Score_Prog_Dict[Score][3]
	description = format("Reach a score of {0} or above", Score_Prog_Dict[Score][1])
	trigger = (P2ActiveFlag == 0
            && P1Score >= Score_Prog_Dict[Score][0]
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

// Achievements 
/// ---------- Global
    achievement(title="Get Ready to SPAM",
                description = "Enter 1997 or more credits in the machine in order to unlock the secret characters. Hey, at least it's free!",
                points = 1,
                trigger = measured(LifetimeCredit >= 1997)
            && prev(LifetimeCredit) < 1997
            && prev(LifetimeCredit) > 0

    )

    achievement(title="Princess of Tennis",
                description = "Win the Smash Stars tournament",
                points = 5,
                trigger = TennisClear()
            && GameMode == 1
            && P2ActiveFlag == 0

    )    

    achievement(title="I'll Have you Know it's Called Football",
                description = "Win the Kick Stars tournament",
                points = 5,
                trigger = FootballClear()
            && GameMode == 0
            && P2ActiveFlag == 0

    )        

    achievement(title="Donuts Not Included",
                description = "Win the Dunk Stars tournament",
                points = 5,
                trigger = BasketballClear()
            && GameMode == 2
            && P2ActiveFlag == 0

    )      

    achievement(title="Sports Master",
                description = "Win all 3 tournaments in a row",
                points = 10,
                trigger = measured(BasketballCheck+TennisCheck+FootballCheck == 3)
            && prev(BasketballCheck+TennisCheck+FootballCheck) == 2
            && P2ActiveFlag == 0

    )      

/// ---------- Hard Mode

    achievement(title="Smash Brawler",
                description = "Win the Smash Stars tournament in Difficulty 4 with the other settings at default",
                points = 10,
                trigger = TennisClear()
            && GameMode == 1
            && P2ActiveFlag == 0
            && TennisDifficulty == 3
            && TennisGameConf == 2

    )    

    achievement(title="Street Kicker",
                description = "Win the Kick Stars tournament in Difficulty 4 with the other settings at default",
                points = 10,
                trigger = FootballClear()
            && GameMode == 0
            && P2ActiveFlag == 0
            && FootballDifficulty == 3
            && FootballTimerSpeed == 1

    )        

    achievement(title="Trampoline Dunk",
                description = "Win the Dunk Stars tournament in Difficulty 4 with the other settings at default",
                points = 10,
                trigger = BasketballClear()
            && GameMode == 2
            && P2ActiveFlag == 0
            && BasketballDifficulty == 3
            && BasketballTimerSpeed == 1

    )      

    achievement(title="Not that kind of Triathlon",
                description = "Win all 3 tournaments in a row in Difficulty 4 with the other settings at default",
                points = 25,
                trigger = measured(BasketballCheck+TennisCheck+FootballCheck == 3)
            && prev(BasketballCheck+TennisCheck+FootballCheck) == 2
            && P2ActiveFlag == 0
            && TennisDifficulty == 3
            && TennisGameConf == 2
            && FootballDifficulty == 3
            && FootballTimerSpeed == 1
            && BasketballDifficulty == 3
            && BasketballTimerSpeed == 1

    )      

/// ---------- Score
for Char in Score_Prog_Dict
    ScoreProg(Char)

/// ---------- Tennis
    achievement(title="What is Love?",
                description = "Win the secret fight against Melody in Smash Stars without playing Melody yourself",
                points = 10,
                trigger = TennisCheck == 0
            && GameMode == 1
            && P2ActiveFlag == 0
            && TennisMatchWon == 4
            && TennisMatchID == 4
            && TennisP1CharID != 0x10
            && TennisP1CharID != 0x11
    )

for Char in Tennis_Prog_Dict
    TennisProg(Char)

achievement(title="Flawless Tenis Match",
                description = "Win a Tennis match without letting the enemy score any point. Default difficulty or higher, other settings at default and not playing as Melody",
                points = 5,
                trigger = TennisP1TotalPoint == 8
            && TennisP2TotalPoint == 0    
            && GameMode == 1
            && P2ActiveFlag == 0
            && TennisMatchWon > prev(TennisMatchWon)
            && TennisDifficulty >= 1
            && TennisGameConf == 2
            && TennisP1CharID != 0x10
            && TennisP1CharID != 0x11
)
    achievement(title="One Shot, One Kill",
                description = "Win a Tennis match with at least 4 Ace Services. Default difficulty or higher, other settings at default and not playing as Melody",
                points = 10,
                trigger = TennisP1ServiceAce >= 4
            && GameMode == 1
            && P2ActiveFlag == 0
            && TennisMatchWon > prev(TennisMatchWon)
            && TennisDifficulty >= 1
            && TennisGameConf == 2
            && TennisP1CharID != 0x10
            && TennisP1CharID != 0x11
    )

        achievement(title="Return to Sender",
                description = "Win a Tennis match with at least 4 Return Aces. Default difficulty or higher, other settings at default and not playing as Melody",
                points = 10,
                trigger = TennisP1ReturnAce >= 4
            && GameMode == 1
            && P2ActiveFlag == 0
            && TennisMatchWon > prev(TennisMatchWon)
            && TennisDifficulty >= 1
            && TennisGameConf == 2
            && TennisP1CharID != 0x10
            && TennisP1CharID != 0x11
    )
/// ---------- Football
    achievement(title="All the Stars are our Enemy",
                description = "Win the secret fight against the Star Team in Kick Stars without playing Star Team yourself",
                points = 10,
                trigger = FootballClear()
            && GameMode == 0
            && P2ActiveFlag == 0
            && FootballMatchWon == 4
            && FootballMatchID == 4
            && FootBasketballP1ID != 0x08
    )   

   

for Char in Football_Prog_Dict
    FootballProg(Char)


    achievement(title="Flawless Football Match",
                description = "Win a Football match without letting the enemy score any point. Default difficulty or higher, other settings at default and not playing as the Star Team",
                points = 5,
                trigger = FootballP2Score == 0
            && GameMode == 0
            && P2ActiveFlag == 0
            && FootballMatchWon > prev(FootballMatchWon)
            && FootBasketballP1ID != 0x08
            && FootballDifficulty >= 1
            && FootballTimerSpeed == 1
    )   

    achievement(title="Castle Defender",
                description = "Win a Football match where the enemy team had more shots attempt than you. Default difficulty or higher, other settings at default and not playing as the Star Team",
                points = 10,
                trigger = GameMode == 0
            && P2ActiveFlag == 0
            && FootballMatchWon > prev(FootballMatchWon)
            && FootBasketballP1ID != 0x08
            && FootballDifficulty >= 1
            && FootballTimerSpeed == 1
            && FootballP2NbShot > FootballP1NbShot
    )              
/// ---------- Basketball

    achievement(title="Golden Wind",
                description = "Win the secret fight against the Golden USA Team in Dunk Stars without playing Golden USA yourself",
                points = 10,
                trigger = BasketballClear()
            && GameMode == 2
            && P2ActiveFlag == 0
            && BasketballMatchID == 4
            && BasketballMatchWon == 4
            && FootBasketballP1ID != 0x08
    )    

for Char in Basketball_Prog_Dict
    BasketballProg(Char)    

    achievement(title="Flawless Basketball Match",
                description = "Win a Basketball match without letting the enemy score any point. Default difficulty or higher, other settings at default and not playing as the Golden USA Team",
                points = 5,
                trigger = BasketballP2Score == 0
            && GameMode == 2
            && P2ActiveFlag == 0
            && BasketballMatchWon > prev(BasketballMatchWon)
            && FootBasketballP1ID != 0x08
            && BasketballDifficulty >= 1
            && BasketballTimerSpeed == 1
    )        

    achievement(title="Dunk Master",
                description = "Win a Basketball match having made 3 dunks or more. Default difficulty or higher, other settings at default and not playing as the Golden USA Team",
                points = 10,
                trigger = GameMode == 2
            && P2ActiveFlag == 0
            && BasketballMatchWon > prev(BasketballMatchWon)
            && FootBasketballP1ID != 0x08
            && BasketballP1NbDunks >= 3
    )        

    achievement(title="Cat's Eyes",
                description = "Win a Basketball match having made 3 successful 3-Points Shots or more. Default difficulty or higher, other settings at default and not playing as the Golden USA Team",
                points = 10,
                trigger = GameMode == 2
            && P2ActiveFlag == 0
            && BasketballMatchWon > prev(BasketballMatchWon)
            && FootBasketballP1ID != 0x08
            && BasketballP1Nb3PointShots >= 3
    )            

// Rich Presence
FootballRP = { 
                    0x00:"Germany",
                    0x01:"Japan",
                    0x02:"Italy",
                    0x03:"France",
                    0x04:"Spain",
                    0x05:"Mexico",
                    0x06:"Argentina",
                    0x07:"Brazil",
                    0x08:"Star"

                    } 

BasketballRP = { 
                    0x00:"United Kingdom",
                    0x01:"France",
                    0x02:"Germany",
                    0x03:"Italy",
                    0x04:"Spain",
                    0x05:"Japan",
                    0x06:"China",
                    0x07:"USA",
                    0x08:"Golden USA"

                    } 

TennisRP = { 
                    0x00:"Graft (Germany)",
                    0x01:"Natalie (France)",
                    0x02:"Estella (Spain)",
                    0x03:"Katrina (Russia)",
                    0x04:"Simmy (India)",
                    0x05:"Florence (Italy)",
                    0x06:"Laurie (UK)",
                    0x07:"Amee (USA)",
                    0x08:"Maria (Mexico)",
                    0x09:"Jana (Brazil)",
                    0x0a:"Fang-Ming (Taiwan)",
                    0x0b:"Li-Li (China)",
                    0x0c:"Zina (Egypt)",
                    0x0d:"Sue (Korea)",
                    0x0e:"Hikaro (Japan)",
                    0x0f:"Ayshea (Australia)",
                    0x10:"Melody (Love)",
                    0x11:"Melody (Love)"

                    } 

MatchRP = { 
                    0x01:"Quarterfinal",
                    0x02:"Semifinal",
                    0x03:"Final",
                    0x04:"Champion"

                    }                     
rich_presence_conditional_display(
    GameMode == 0 && P1ActiveFlag == 1,
    "• Kick Stars Mode (Football) • Difficulty Level {0} • Playing as the {1} Team - {2} • {3} Points •",
    rich_presence_value("DifficultyFootball", FootballDifficulty+1),
    rich_presence_lookup("FootballRP", FootBasketballP1ID, FootballRP),
    rich_presence_lookup("MatchRP", FootballMatchID, MatchRP),
    rich_presence_value("Score", P1Score)
    ) 

rich_presence_conditional_display(
    GameMode == 1 && P1ActiveFlag == 1,
    "• Smash Stars Mode (Tennis) • Difficulty Level {0} • Playing {1} - {2} • {3} Points •",
    rich_presence_value("DifficultyTennis", TennisDifficulty+1),
    rich_presence_lookup("TennisRP", TennisP1CharID, TennisRP),
    rich_presence_lookup("MatchRP", TennisMatchID, MatchRP),
    rich_presence_value("Score", P1Score)
)

rich_presence_conditional_display(
    GameMode == 2 && P1ActiveFlag == 1,
    "• Dunk Stars Mode (Basketball) • Difficulty Level {0} • Playing as the {1} Team - {2} • {3} Points •",
    rich_presence_value("DiffcultyBasketball", BasketballDifficulty+1),
    rich_presence_lookup("BasketballRP", FootBasketballP1ID, BasketballRP),
    rich_presence_lookup("MatchRP", BasketballMatchID, MatchRP),
    rich_presence_value("Score", P1Score)
)
///Default 
rich_presence_display(
    "• Capcom Private Sport Resort is Open ! • {0} Credits in the Machine •",
    rich_presence_value("Lifetimecredits", LifetimeCredit)

)    

leaderboard(
    title ="Kick Champion",
    description = "Highest Score on solo clearing Kick Stars Mode (First game selected)",
    start  = P2ActiveFlag == 0 && GameMode == 0 && FootballClear() && TennisCheck == 0 && BasketballCheck == 0,
    cancel = always_false(),
    submit = always_true(),
    value = P1Score,
    format = "VALUE",
    lower_is_better=false
)    

leaderboard(
    title ="Smash Champion",
    description = "Highest Score on solo clearing Smash Stars Mode (First game selected)",
    start  = P2ActiveFlag == 0 && GameMode == 1 && TennisClear() && FootballCheck == 0 && BasketballCheck == 0,
    cancel = always_false(),
    submit = always_true(),
    value = P1Score,
    format = "VALUE",
    lower_is_better=false
)    

leaderboard(
    title ="Dunk Champion",
    description = "Highest Score on solo clearing Dunk Stars Mode (First game selected)",
    start  = P2ActiveFlag == 0 && GameMode == 2 && BasketballClear() && TennisCheck == 0 && FootballCheck == 0,
    cancel = always_false(),
    submit = always_true(),
    value = P1Score,
    format = "VALUE",
    lower_is_better=false
)    

leaderboard(
    title ="Capcom Champion",
    description = "Highest Score on clearing all three games",
    start  = P2ActiveFlag == 0 && (FootballCheck+TennisCheck+BasketballCheck) == 3 && prev(FootballCheck+TennisCheck+BasketballCheck) == 2,
    cancel = always_false(),
    submit = always_true(),
    value = P1Score,
    format = "VALUE",
    lower_is_better=false
)    