// Star Trek: The Motion Picture
// #ID = 2124
// 20230201 Version - Sines

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



// $0079: How Many Players? [8-bit]
//        0x01: 1 Player
//        0x02: 2 Player
// $007A: Which Game? [8-bit]
//        Goes from 0x01 to 0x08.
//        Initial note by Wolfman2000
//        ------
//        Additional Info: Game value change on which level the blackhole rift appears for the boss fight. Game 1 is on level 1, Game 2 on level 2 etc all the way to 8.
// $0095: Pause [00/ff]
// $0099: Score [56-bits]
// $00A2: Lives
// $00A5: [8 Bit] {US} Shield Strenght
// $00A6: [8 Bit] {US} Firepower
// $00A7: [8 Bit] {US} Live Counter
// $00AE: Sector
// $00B1: Ships destroyed:
//        08 (8) Sector 1 completed
//        0a (10) Sector 2 completed
//        0c (12) Sector 3 completed
//        0e (14) Sector 4 completed
//        10 (16) Sector 5 completed
//        12 (18) Sector 6 completed
//        14 (20) Sector 7 completed
//        16 (22) Sector 8 completed
// $00B4: [8 Bit] {US} Sector
//        Start at 00 for Sector 1
//        FF on Game Over
// $00B7: [8 Bit] {US} Ship destroyed count
//        Goes back to 0 on new Sector
///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50
NextSectorShipKill = {
                    0:0x8, // Starting at 0 to allign with stage ID
                    1:0xa,
                    2:0xc,
                    3:0xe,
                    4:0x10,
                    5:0x12,
                    6:0x14,
                    7:0x16
                    }
                    
CheevoTitles = {
                    0:"No One Can Hear You Scream", 
                    1:"Don't Be Perfect",
                    2:"Thanks for All the Fish",
                    3:"Great Disturbance in the Force",
                    4:"Pandorum Effect",
                    5:"Where We’re Going We Don’t Need Eyes to See!",
                    6:"I Have Such Wonderful Things to Show You",
                    7:"To Infinity and Beyond"
                    }
                    
//----------------
//Variable
Shield = byte(0xa5)
LivesCount = byte(0xa7)
Sector = byte(0xb4)
KillCount = byte(0xb7)
PlayerMode = byte(0x79)
GameMode = byte(0x7a)
SinglePlayer = PlayerMode == 0x1

//----------------
//Function
function LiveLost() => prev(LivesCount) > LivesCount
// function LiveGain() => (prev(LivesCount) < LivesCount) && LivesCount!=0
function GameOver() => LivesCount == 0 && Sector == 0xff

function SectorProg(Stage,points)
{
    achievement(title = CheevoTitles[Stage],
                description = "Complete Sector " + (Stage+1), // Memory ID start at 00, +1 to align with display
                points = points,
                trigger = prev(Sector) == Stage // Current Sector
                          && Sector == Stage+1 // Switch to new Sector
                          && once(KillCount == NextSectorShipKill[Stage]) // Got the appropriate amount of kills to trigger sector switch
                          && never(GameOver()) //NEVER BE GAME OVER
                          && SinglePlayer // No 2 players shenanigans
                )
                   
}

//----------------

///Achievement Code
// Progression
// Misc Challenge

//Progression
for i in range (0,3)
    SectorProg(i,Easy)

for i in range (4,7)
    SectorProg(i,Medium)
    
achievement (title = "There and Back Again",
             description = "Kill the enemy mothership and start the second loop",
             points = Hard,
             trigger = once(Sector == 0x8) // Reach the last sector
                       && Sector == 0x0 // Loop back
                       && SinglePlayer
                       && never(GameOver())
                     
            )
            
//----------------
//Misc Challenge
            
achievement (title = "To Go Even Further Beyond",
             description = "Kill the enemy mothership and start the second loop without losing a single life",
             points = Hard,
             trigger = once(Sector == 0x8) // Reach the last sector
                       && once(LivesCount == 3) // Snapshot at the start of the game when you have 3 lives
                       && trigger_when(Sector == 0x0) // Loop back
                       && SinglePlayer
           //            && never(GameOver()) // Redundant
                       && never(LiveLost()) // Reset on loss of a life
                     
            )
            
//achievement (title = "Indeed",
//             description = "Show those aliens who's the boss and get an additional life !",
//             points = Baby,
//             trigger = LiveGain()
//                       && SinglePlayer
//                       && once(LivesCount == 0x3 && prev(LivesCount)==0x3) // Snapshot at the beginning of the game, avoid early memory getting set and triggering too soon
//                       && never(GameOver())
//           )
            
achievement(title = "Ender's Maneuver",
                description = "Complete Sector 1 without using your shields", 
                points = Easy,
                trigger = prev(Sector) == 0x0 // Current Sector
                          && Sector == 0x1 // Switch to new Sector
                          && once(KillCount == 0) // Snapshot at the begining of the game
                          && never(GameOver()) //NEVER BE GAME OVER
                          && SinglePlayer // No 2 players shenanigans
                          && never(prev(Shield) > Shield) // Reset on shield usage. Technically you can use your shields as long as you have 0 kills, but it won't help you to progress anyway
            )
achievement (title = "Who the Hell Do You Think I Am?!",
             description = "In Mode 8, reach the mothership in Sector 8 to gain an additional life and loop back to the first Sector. From there reach the final boss and destroy it.",
             points = Challenge,
             trigger = once(Sector == 0x0 && prev(Sector) == 0x7) // Loop back from Sector 8 to 1
                //       && once(LiveGain()) // Double check of previous event, get an additional life
                       && once(Sector==0x8) // Reach sector 9
                       && trigger_when(Sector == 0x0) // Kill the final boss and loop again
                       && SinglePlayer
                       && GameMode == 0x8 // Mode 8 check
                       && never(GameOver()) // Reset on GameOver
                     
            )

//----------------
