// Ultimate Fighting Championship
// #ID = 21745
// 20230927 Version - Sines

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
// $C26B: [8 Bit] Mode
//        00 > Main Menu / Tournament
//        01 > Versus
//        02 > Training
//        03 > Survival
//        04 > Options
//        05 > Biographies
// $C2CD: [8 Bit] Rounds
//        --- --- ---
//        Used during training mode
//        00 on start
//        0x0b on final win
//        --- --- ---
//        During tournament reset at each new championship
//        Winning Round 0x03 = winning the championship
// $C2CF: [8 Bit] Difficulty Mode
//        00 > Easy
//        01 > Medium
//        02 > Hard
// $C2DD: [8 Bit] UFC Tournament
//        00 > Southwesterner Regional
//        01 > Northwestern Regional
//        02 > Eastern Regional
//        03 > Western Regional
//        04 > USA
//        05 > South American
//        06 > Intercontinental
//        07 > World
//        08 > Credit Roll
// $C2DE: [8 Bit] Timer before KO
//        If P2 stamina > 0 && P1Stamina > P2 Stamina then Time Over victory
//        If P2 stamina == 0 then knock out victory
// $C2E0: [8 Bit] P1 Character
//        00 > Chuck Liddell
//        01 > Eugene Jackson
//        02 > Tito Ortiz
//        03 > Pedro Rizzo
//        04 > Frank Shamrock
//        05 > Guy Mezger
//        06 > Kevin Randleman
//        07 > Evan Tanner
// $C2E1: [8 Bit] P2 Character
// $C70B: [8 Bit] P1 Stamina
//        Max 0x2b
// $C72B: [8 Bit] P2 Stamina



///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

FighterName = { 
                    0:"Chuck Liddell", 
                    1:"Eugene Jackson", 
                    2:"Tito Ortiz", 
                    3:"Pedro Rizzo", 
                    4:"Frank Shamrock", 
                    5:"Guy Mezger", 
                    6:"Kevin Randleman", 
                    7:"Evan Tanner"
                    }  

TournamentName = { 
                    0:"Southwesterner Regional", 
                    1:"Northwestern Regional", 
                    2:"Eastern Regional", 
                    3:"Western Regional", 
                    4:"USA", 
                    5:"South American", 
                    6:"Intercontinental", 
                    7:"World"
                    }  

TournamentHardCheevoTitle = { 
                    0:"Westcoast Underdog", 
                    1:"Montana Man", 
                    2:"Elephant Stomp", 
                    3:"Donkey Kick", 
                    4:"Proud Eagle", 
                    5:"Back to Brazil", 
                    6:"Whole New Horizons", 
                    7:"King of the World"
                    }                      
//----------------
//Variable

GameMode = byte(0xc26b) // 00 Main Menu / Tournament > 01 Versus > 02 Training > 03 Survival
RoundID = byte(0xc2cd) // 00 on start, 0x0b on final training win
TournamentID = byte(0xc2dd) // 00 > 07 tournaments >> 08 credit roll

Difficulty = byte(0xc2cf) // 00 easy > 01 normal > 02 hard
KOTimer = byte(0xc2de) // 00 on KO

P1Stamina = byte(0xc70b)
P2Stamina = byte(0xc72b)
FightState = byte(0xc222)

NotMainMenu = byte(0xc2d1) == 0xFF
P1CharID = byte(0xC2E0)

//Function
//function P1Win() => (KOTimer == 0 && prev(KOTimer) > 0 && ((P2Stamina == 0) || (P1Stamina > P2Stamina)) || (FightState == 0xf0 && P1Stamina > P2Stamina))
//function P1Lose() => (KOTimer == 0 && prev(KOTimer) > 0 && ((P1Stamina == 0) || (P1Stamina < P2Stamina)) || (FightState == 0xf0 && P1Stamina < P2Stamina))
function P1Win() => FightState == 0xf4 && prev(FightState) != 0xf4 && P1Stamina > P2Stamina
function P1Lose() => FightState == 0xf4 && prev(FightState) != 0xf4 && P1Stamina < P2Stamina

function ArcadeProg(Tournament, Points)
{
    achievement(title = TournamentName[Tournament] + " Champion",
                description = "Win the "+ TournamentName[Tournament] + " Tournament",
                points = Points,
                trigger = GameMode == 0
                       && P1Win()
                       && RoundID == 0x02
                       && TournamentID == Tournament
                )
}       

function ArcadeProgHard(Tournament, Points)
{
    achievement(title = TournamentHardCheevoTitle[Tournament],
                description = "Win the "+ TournamentName[Tournament] + " Tournament in Hard mode",
                points = Points,
                trigger = GameMode == 0
                       && P1Win()
                       && RoundID == 0x02
                       && TournamentID == Tournament
                       && Difficulty == 2
                )
}    

function SurvivalProg(Rounds, Title, Points)
{
    achievement(title = Title,
                description = "Win "+ Rounds + " rounds in Survival Mode",
                points = Points,
                trigger = GameMode == 3
                       && P1Win()
                       && RoundID == Rounds-1

                )
}  

//----------------
///Achievement Code
// Progression

for i in range(0,2)
ArcadeProg(i,5) 

for i in range(3,6)
ArcadeProg(i,10) 

ArcadeProg(7,25) 

/// --- --- ---
// Hard Mode

for i in range(0,2)
ArcadeProgHard(i,5) 

for i in range(3,5)
ArcadeProgHard(i,10) 

ArcadeProgHard(6,25) 
ArcadeProgHard(7,50) 

/// --- --- ---
// Training Mode
    achievement(title = "Fight Before the Fight",
                description = "Complete the Training Mode",
                points = 5,
                trigger = GameMode == 2
                       && RoundID == 0x0b
                       && prev(RoundID) == 0x0a

                )
                
/// --- --- ---
// Survival Mode

SurvivalProg(3, "Warmup", 3)
SurvivalProg(7, "Blood Sport", 5)
//SurvivalProg(10, "Blood Sport", 10)
//SurvivalProg(15, "Crowd's Favorite", 25)


// Leaderboard
leaderboard(
    title = "Arena Champion",
    description = "Survive as many rounds as possible in survival mode",
    start  = GameMode == 2 && RoundID > 0 && P1Lose(),
    cancel = always_false(),
    submit = always_true(),
    value = RoundID,
    format = "VALUE"
)      

// Rich Presence (test)
rich_presence_conditional_display(
    NotMainMenu && GameMode == 0,
    "|| Round {0} of the {1} Tournament || Fighting with {2} ||",
    rich_presence_value("Round", RoundID+1),
    rich_presence_lookup("Tournament", TournamentID, TournamentName),
    rich_presence_lookup("Fighter", P1CharID,FighterName))
    
rich_presence_conditional_display(
    NotMainMenu && GameMode == 2,
    "|| Round {0} of the Training regiment || Fighting with {1} ||",
    rich_presence_value("Round", RoundID+1),
    rich_presence_lookup("Fighter", P1CharID,FighterName))

rich_presence_conditional_display(
    NotMainMenu && GameMode == 3,
    "|| Round {0} of the Survival Mode || Fighting with {1} ||",
    rich_presence_value("Round", RoundID+1),
    rich_presence_lookup("Fighter", P1CharID,FighterName))    
rich_presence_display(
    "|| Time for the Ultimate Fighting Championship ! ||"
)
