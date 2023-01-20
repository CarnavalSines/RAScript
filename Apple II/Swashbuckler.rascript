// Swashbuckler
// #ID = 22170
// 20230119 Version - Sines

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

// $00E8: [8 Bit] Main Char Animation
//        0xff on start screen
//        0x0b and 0x05 > Down attack pose
// $00E9: [8 Bit] Right Enemy Status
//        0xc0 Dead
//        0x80 Alive
// $00ED: [8 Bit] Horizontal Position
//        Start in the middle at 0x10
//        Far left at 0x05
//        Far right at 0x1b
// $09C0: [8 Bit] Kill Count
//        Max to 255 before looping back to 0
//        When Live = 0, become equal to High Score
//        Live = 0 comes first THEN Kill count change to high score value
// $09C2: [8 Bit] Live Counter
// $09CD: [8Bit] Left Enemy Status
//        0xc0 Dead
//        0x80 Alive


///Core
//Constant
//Quick points distribution
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable
KillCounter = byte(0x9c0)
LiveCounter = byte(0x9c2)
HorizontalPosition = byte(0xed)
CharAnimID = byte(0xe8)

//----------------
//Function
function LiveLost() => prev(LiveCounter) > LiveCounter

function InGameCheck() => CharAnimID != 0xff && HorizontalPosition != 0xff //default value for those on the startup menu

function ReachedKillCount(title,kill,points)
{
    achievement(title = title,
                description = "Reach " + kill + " kills in total",
                points = points,
                trigger = KillCounter == kill // goal
                          && prev(KillCounter) < KillCounter // delta check
                          && InGameCheck() // Not on menu screen
                )
                          
}

//----------------

///Achievement Code
// Progression
// Misc Challenge


// Progression
//------
ReachedKillCount("Anyway, I Started Stabbing",10,Easy)

achievement(title = "Out of the Cargo Hold",
            description = "Escape the Cargo Hold and reach the Gun Deck",
            points = Easy,
            trigger = KillCounter == 33 // goal
                      && prev(KillCounter) < KillCounter // delta check
                      && InGameCheck() // Not on menu screen
           )
           
achievement(title = "Fresh Air at Last !",
            description = "Escape the Gun Deck and reach the outside Main Deck",
            points = Easy,
            trigger = KillCounter == 54 // goal
                      && prev(KillCounter) < KillCounter // delta check
                      && InGameCheck() // Not on menu screen
           )
           
ReachedKillCount("You Call Yourself a Pirate ?",80,Medium)
ReachedKillCount("Halfway There",125,Medium)
ReachedKillCount("I Can Do This All Day",200,Medium)

achievement(title = "The Cycle of Violence",
            description = "No matter how many you kill, you are forever trapped in the cycle of violence",
            points = Hard,
            trigger = KillCounter == 0 // goal
                      && prev(KillCounter) == 255 // delta check
                      && InGameCheck() // Not on menu screen
           )
// Misc Challenge
achievement(title = "Critter Sweeper",
            description = "Kill one of the annoying crawling critters",
            points = Easy,
            trigger = (CharAnimID == 0x0b || CharAnimID == 0x05) // Down attack animation left/right
                      && prev(KillCounter) < KillCounter // delta check
                      && InGameCheck() // Not on menu screen
           )
           
achievement(title = "Patient Killer I",
            description = "Get out of the cargo hold without ever moving from the starting position. Reset Emulator for retry",
            points = Medium,
            trigger = once(CharAnimID == 0xff) // Initialise on main menu
                      && InGameCheck() // Not on menu screen when triggering
                      && never(HorizontalPosition != 0x10 && prev(HorizontalPosition)==0x10)
                      && trigger_when(KillCounter == 33) // Only checking the final kill count for proper trigger display  
           )
           
achievement(title = "Patient Killer II",
            description = "Reach the main deck without ever moving from the starting position. Reset Emulator for retry",
            points = Hard,
            trigger = once(CharAnimID == 0xff) // Initialise on main menu
                      && KillCounter > 32 // Prevent the challenge display from being present too early
                      && InGameCheck() // Not on menu screen when triggering
                      && never(HorizontalPosition != 0x10 && prev(HorizontalPosition)==0x10)
                      && trigger_when(KillCounter == 54) // Only checking the final kill count for proper trigger display                      
           )
           
achievement(title = "Fabulous Fabio",
            description = "Get out of the cargo hold without losing a life. Reset Emulator for retry",
            points = Medium,
            trigger = once(CharAnimID == 0xff) // Initialise on main menu
                      && InGameCheck() // Not on menu screen when triggering
                      && never(LiveLost()) // Just don't die :5head:
                      && trigger_when(KillCounter == 33) // Only checking the final kill count for proper trigger display                     
           )           

achievement(title = "Only Dying in the Open",
            description = "Reach the main deck without losing a life. Reset Emulator for retry",
            points = Hard,
            trigger = once(CharAnimID == 0xff) // Initialise on main menu
                      && KillCounter > 32 // Prevent the challenge display from being present too early
                      && InGameCheck() // Not on menu screen when triggering
                      && never(LiveLost()) // Just don't die :5head:
                      && trigger_when(KillCounter == 54) // Only checking the final kill count for proper trigger display                      
           )
///Leaderboards Data

//----------------
