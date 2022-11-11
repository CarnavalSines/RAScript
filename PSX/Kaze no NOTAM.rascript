// Kaze no NOTAM
// #ID = 20377
//20221111 Version - Sines

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



// $08DBE0: [8 Bit] Ballon Selection
//          0 - 4 > Pattern 1-5
// $08DC14: [8 Bit] Key Config Burner Control
//          0 > Circle
//          1 > Cross
//          2 > Triangle
//          3 > Square
//          4 > L1
//          5 > L2
//          6 > R1
//          7 > R2
// $08DC15: [8 Bit] Key Config Valve Control
//          0 > Circle
//          1 > Cross
//          2 > Triangle
//          3 > Square
//          4 > L1
//          5 > L2
//          6 > R1
//          7 > R2
// $08DC16: [8 Bit] Key Config Marker Control
//          0 > Circle
//          1 > Cross
//          2 > Triangle
//          3 > Square
//          4 > L1
//          5 > L2
//          6 > R1
//          7 > R2
// $08DC17: [8 Bit] Key Config Map Control
//          0 > Circle
//          1 > Cross
//          2 > Triangle
//          3 > Square
//          4 > L1
//          5 > L2
//          6 > R1
//          7 > R2
// $08DC18: [8 Bit] Key Config View Control
//          0 > Circle
//          1 > Cross
//          2 > Triangle
//          3 > Square
//          4 > L1
//          5 > L2
//          6 > R1
//          7 > R2
// $08DC1C: [8 Bit] Key Config Horizontal Camera Control
//          0 > Normal
//          1 > Reverse
// $08DC1D: [8 Bit] Key Config Vertical Camera Control
//          0 > Normal
//          1 > Reverse
// $08DC2A: [8 Bit] Option Sound Config
//          0 > Stereo
//          1 > Mono
// $0A6674: [32 Bit] Internal Timer 1
// $0A6780: [32 Bit] Internal Timer 2
// $0AAF74: [8 Bit] Main Menu Select Mode
//          0 > Task
//          1 > Memory Card
//          2 > Round
//          3 > Option
// $0AB950: [8 Bit] Option Menu Mode
//          0 > Record
//          1 > Customize
//          2 > Key Config
//          3 > Sound
// $0ADEA4: [8 Bit] Record Stage
//          0 > Stage 1
//          1 > Stage 2
//          2 > Stage 3
//          3 > All
// $0ADEA8: [8 Bit] Record Task
//          0 > Fly In
//          1 > Try Delta
//          2 > Wolf Hunt
// $0ADEAF: ------
//          Code Note: All Round Records automatically re-arrange in the correct order if modified here, local Stage Records don't.
//          Initialize when checking Records, to be tested for update
//          ------
// $0ADEB0: [32 Bit] Record All Round Fly In High Score 1 Name
// $0ADEB4: [32 Bit] Record All Round Fly In High Score 1
// $0ADEB8: [32 Bit] Record All Round Fly In High Score 2 Name
// $0ADEBC: [32 Bit] Record All Round Fly In High Score 2
// $0ADEC0: [32 Bit] Record All Round Fly In High Score 3 Name
// $0ADEC4: [32 Bit] Record All Round Fly In High Score 3
// $0ADEC8: [32 Bit] Record All Round Fly In High Score 4 Name
// $0ADECC: [32 Bit] Record All Round Fly In High Score 4
// $0ADED0: [32 Bit] Record All Round Fly In High Score 5 Name
// $0ADED4: [32 Bit] Record All Round Fly In High Score 5
// $0ADED8: [32 Bit] Record All Round Fly In High Score 6 Name
// $0ADEDC: [32 Bit] Record All Round Fly In High Score 6
// $0ADEE0: [32 Bit] Record All Round Try Delta Score 1 Name
// $0ADEE4: [32 Bit] Record All Round Try Delta Score 1
// $0ADEE8: [32 Bit] Record All Round Try Delta Score 2 Name
// $0ADEEC: [32 Bit] Record All Round Try Delta Score 2
// $0ADEF0: [32 Bit] Record All Round Try Delta Score 3 Name
// $0ADEF4: [32 Bit] Record All Round Try Delta Score 3
// $0ADEF8: [32 Bit] Record All Round Try Delta Score 4 Name
// $0ADEFC: [32 Bit] Record All Round Try Delta Score 4
// $0ADF00: [32 Bit] Record All Round Try Delta Score 5 Name
// $0ADF04: [32 Bit] Record All Round Try Delta Score 5
// $0ADF08: [32 Bit] Record All Round Try Delta Score 6 Name
// $0ADF0C: [32 Bit] Record All Round Try Delta Score 6
// $0ADF10: [32 Bit] Record All Round Wolf Hunt Score 1 Name
// $0ADF14: [32 Bit] Record All Round Wolf Hunt Score 1
// $0ADF18: [32 Bit] Record All Round Wolf Hunt Score 2 Name
// $0ADF1C: [32 Bit] Record All Round Wolf Hunt Score 2
// $0ADF20: [32 Bit] Record All Round Wolf Hunt Score 3 Name
// $0ADF24: [32 Bit] Record All Round Wolf Hunt Score 3
// $0ADF28: [32 Bit] Record All Round Wolf Hunt Score 4 Name
// $0ADF2C: [32 Bit] Record All Round Wolf Hunt Score 4
// $0ADF30: [32 Bit] Record All Round Wolf Hunt Score 5 Name
// $0ADF34: [32 Bit] Record All Round Wolf Hunt Score 5
// $0ADF38: [32 Bit] Record All Round Wolf Hunt Score 6 Name
// $0ADF3C: [32 Bit] Record All Round Wolf Hunt Score 6
// $0B0E94: [8 Bit] Key Press
//          Bit 0 | L2
//          Bit 1 | R2
//          Bit 2 | L1
//          Bit 3 | R1
//          Bit 4 | Triangle
//          Bit 5 | Circle
//          Bit 6 | Cross
//          Bit 7 | Square
// $0B0E95: [8 Bit] Direction Press and Misc
//          Bit 0 | Select
//          Bit 1 | L3
//          Bit 2 | R3
//          Bit 3 | Start
//          Bit 4 | Up
//          Bit 5 | Right
//          Bit 6 | Down
//          Bit 7 | Left
// $0B16A8: [32 Bit] Wind Direction Flag 1
//          0 > North
//          1 > NE
//          2 > East
//          3 > SE
//          4 > South
//          5 > SW
//          6 > West
//          7 > NW
// $0B16B0: [32 Bit] Wind Direction Flag 2
//          0 > North
//          1 > NE
//          2 > East
//          3 > SE
//          4 > South
//          5 > SW
//          6 > West
//          7 > NW
// $0B16B8: [32 Bit] Wind Direction Flag 3
//          0 > North
//          1 > NE
//          2 > East
//          3 > SE
//          4 > South
//          5 > SW
//          6 > West
//          7 > NW
// $0B16C0: [32 Bit] Wind Direction Flag 4
//          0 > North
//          1 > NE
//          2 > East
//          3 > SE
//          4 > South
//          5 > SW
//          6 > West
//          7 > NW
// $0B16C8: [32 Bit] Wind Direction Flag 5
//          0 > North
//          1 > NE
//          2 > East
//          3 > SE
//          4 > South
//          5 > SW
//          6 > West
//          7 > NW
// $0B1744: [32 Bit] Balloon Speed
//          Only control travel speed, not direction
// $0B1778: [32 Bit] Balloon Stamina Bar
// $0B1A7C: [8 Bit] Round Number
//          0 when not in a task
// $0B1AB0: [8 Bit] Weather ID
//          0 > Fine
//          1 > Rain
//          2 > Cloud
//          3 > Snow
// $0B1AD8: [32 Bit] Record Stage 1 Fly In High Score 1 Name
// $0B1ADC: [32 Bit] Record Stage 1 Fly In High Score 1
// $0B1AE0: [32 Bit] Record Stage 1 Fly In High Score 2 Name
// $0B1AE4: [32 Bit] Record Stage 1 Fly In High Score 2
// $0B1AE8: [32 Bit] Record Stage 1 Fly In High Score 3 Name
// $0B1AEC: [32 Bit] Record Stage 1 Fly In High Score 3
// $0B1AF0: [32 Bit] Record Stage 1 Fly In High Score 4 Name
// $0B1AF4: [32 Bit] Record Stage 1 Fly In High Score 4
// $0B1AF8: [32 Bit] Record Stage 1 Fly In High Score 5 Name
// $0B1AFC: [32 Bit] Record Stage 1 Fly In High Score 5
// $0B1B00: [32 Bit] Record Stage 1 Fly In High Score 6 Name
// $0B1B04: [32 Bit] Record Stage 1 Fly In High Score 6
// $0B1B08: [32 Bit] Record Stage 1 Try Delta Score 1 Name
// $0B1B0C: [32 Bit] Record Stage 1 Try Delta Score 1
// $0B1B10: [32 Bit] Record Stage 1 Try Delta Score 2 Name
// $0B1B14: [32 Bit] Record Stage 1 Try Delta Score 2
// $0B1B18: [32 Bit] Record Stage 1 Try Delta Score 3 Name
// $0B1B1C: [32 Bit] Record Stage 1 Try Delta Score 3
// $0B1B20: [32 Bit] Record Stage 1 Try Delta Score 4 Name
// $0B1B24: [32 Bit] Record Stage 1 Try Delta Score 4
// $0B1B28: [32 Bit] Record Stage 1 Try Delta Score 5 Name
// $0B1B2C: [32 Bit] Record Stage 1 Try Delta Score 5
// $0B1B30: [32 Bit] Record Stage 1 Try Delta Score 6 Name
// $0B1B34: [32 Bit] Record Stage 1 Try Delta Score 6
// $0B1B38: [32 Bit] Record Stage 1 Wolf Hunt Score 1 Name
// $0B1B3C: [32 Bit] Record Stage 1 Wolf Hunt Score 1
// $0B1B40: [32 Bit] Record Stage 1 Wolf Hunt Score 2 Name
// $0B1B44: [32 Bit] Record Stage 1 Wolf Hunt Score 2
// $0B1B48: [32 Bit] Record Stage 1 Wolf Hunt Score 3 Name
// $0B1B4C: [32 Bit] Record Stage 1 Wolf Hunt Score 3
// $0B1B50: [32 Bit] Record Stage 1 Wolf Hunt Score 4 Name
// $0B1B54: [32 Bit] Record Stage 1 Wolf Hunt Score 4
// $0B1B58: [32 Bit] Record Stage 1 Wolf Hunt Score 5 Name
// $0B1B5C: [32 Bit] Record Stage 1 Wolf Hunt Score 5
// $0B1B60: [32 Bit] Record Stage 1 Wolf Hunt Score 6 Name
// $0B1B64: [32 Bit] Record Stage 1 Wolf Hunt Score 6
// $0B1B68: [32 Bit] Record Stage 2 Fly In High Score 1 Name
// $0B1B6C: [32 Bit] Record Stage 2 Fly In High Score 1
// $0B1B70: [32 Bit] Record Stage 2 Fly In High Score 2 Name
// $0B1B74: [32 Bit] Record Stage 2 Fly In High Score 2
// $0B1B78: [32 Bit] Record Stage 2 Fly In High Score 3 Name
// $0B1B7C: [32 Bit] Record Stage 2 Fly In High Score 3
// $0B1B80: [32 Bit] Record Stage 2 Fly In High Score 4 Name
// $0B1B84: [32 Bit] Record Stage 2 Fly In High Score 4
// $0B1B88: [32 Bit] Record Stage 2 Fly In High Score 5 Name
// $0B1B8C: [32 Bit] Record Stage 2 Fly In High Score 5
// $0B1B90: [32 Bit] Record Stage 2 Fly In High Score 6 Name
// $0B1B94: [32 Bit] Record Stage 2 Fly In High Score 6
// $0B1B98: [32 Bit] Record Stage 2 Try Delta Score 1 Name
// $0B1B9C: [32 Bit] Record Stage 2 Try Delta Score 1
// $0B1BA0: [32 Bit] Record Stage 2 Try Delta Score 2 Name
// $0B1BA4: [32 Bit] Record Stage 2 Try Delta Score 2
// $0B1BA8: [32 Bit] Record Stage 2 Try Delta Score 3 Name
// $0B1BAC: [32 Bit] Record Stage 2 Try Delta Score 3
// $0B1BB0: [32 Bit] Record Stage 2 Try Delta Score 4 Name
// $0B1BB4: [32 Bit] Record Stage 2 Try Delta Score 4
// $0B1BB8: [32 Bit] Record Stage 2 Try Delta Score 5 Name
// $0B1BBC: [32 Bit] Record Stage 2 Try Delta Score 5
// $0B1BC0: [32 Bit] Record Stage 2 Try Delta Score 6 Name
// $0B1BC4: [32 Bit] Record Stage 2 Try Delta Score 6
// $0B1BC8: [32 Bit] Record Stage 2 Wolf Hunt Score 1 Name
// $0B1BCC: [32 Bit] Record Stage 2 Wolf Hunt Score 1
// $0B1BD0: [32 Bit] Record Stage 2 Wolf Hunt Score 2 Name
// $0B1BD4: [32 Bit] Record Stage 2 Wolf Hunt Score 2
// $0B1BD8: [32 Bit] Record Stage 2 Wolf Hunt Score 3 Name
// $0B1BDC: [32 Bit] Record Stage 2 Wolf Hunt Score 3
// $0B1BE0: [32 Bit] Record Stage 2 Wolf Hunt Score 4 Name
// $0B1BE4: [32 Bit] Record Stage 2 Wolf Hunt Score 4
// $0B1BE8: [32 Bit] Record Stage 2 Wolf Hunt Score 5 Name
// $0B1BEC: [32 Bit] Record Stage 2 Wolf Hunt Score 5
// $0B1BF0: [32 Bit] Record Stage 2 Wolf Hunt Score 6 Name
// $0B1BF4: [32 Bit] Record Stage 2 Wolf Hunt Score 6
// $0B1BF8: [32 Bit] Record Stage 3 Fly In High Score 1 Name
// $0B1BFC: [32 Bit] Record Stage 3 Fly In High Score 1
// $0B1C00: [32 Bit] Record Stage 3 Fly In High Score 2 Name
// $0B1C04: [32 Bit] Record Stage 3 Fly In High Score 2
// $0B1C08: [32 Bit] Record Stage 3 Fly In High Score 3 Name
// $0B1C0C: [32 Bit] Record Stage 3 Fly In High Score 3
// $0B1C10: [32 Bit] Record Stage 3 Fly In High Score 4 Name
// $0B1C14: [32 Bit] Record Stage 3 Fly In High Score 4
// $0B1C18: [32 Bit] Record Stage 3 Fly In High Score 5 Name
// $0B1C1C: [32 Bit] Record Stage 3 Fly In High Score 5
// $0B1C20: [32 Bit] Record Stage 3 Fly In High Score 6 Name
// $0B1C24: [32 Bit] Record Stage 3 Fly In High Score 6
// $0B1C28: [32 Bit] Record Stage 3 Try Delta Score 1 Name
// $0B1C2C: [32 Bit] Record Stage 3 Try Delta Score 1
// $0B1C30: [32 Bit] Record Stage 3 Try Delta Score 2 Name
// $0B1C34: [32 Bit] Record Stage 3 Try Delta Score 2
// $0B1C38: [32 Bit] Record Stage 3 Try Delta Score 3 Name
// $0B1C3C: [32 Bit] Record Stage 3 Try Delta Score 3
// $0B1C40: [32 Bit] Record Stage 3 Try Delta Score 4 Name
// $0B1C44: [32 Bit] Record Stage 3 Try Delta Score 4
// $0B1C48: [32 Bit] Record Stage 3 Try Delta Score 5 Name
// $0B1C4C: [32 Bit] Record Stage 3 Try Delta Score 5
// $0B1C50: [32 Bit] Record Stage 3 Try Delta Score 6 Name
// $0B1C54: [32 Bit] Record Stage 3 Try Delta Score 6
// $0B1C58: [32 Bit] Record Stage 3 Wolf Hunt Score 1 Name
// $0B1C5C: [32 Bit] Record Stage 3 Wolf Hunt Score 1
// $0B1C60: [32 Bit] Record Stage 3 Wolf Hunt Score 2 Name
// $0B1C64: [32 Bit] Record Stage 3 Wolf Hunt Score 2
// $0B1C68: [32 Bit] Record Stage 3 Wolf Hunt Score 3 Name
// $0B1C6C: [32 Bit] Record Stage 3 Wolf Hunt Score 3
// $0B1C70: [32 Bit] Record Stage 3 Wolf Hunt Score 4 Name
// $0B1C74: [32 Bit] Record Stage 3 Wolf Hunt Score 4
// $0B1C78: [32 Bit] Record Stage 3 Wolf Hunt Score 5 Name
// $0B1C7C: [32 Bit] Record Stage 3 Wolf Hunt Score 5
// $0B1C80: [32 Bit] Record Stage 3 Wolf Hunt Score 6 Name
// $0B1C84: [32 Bit] Record Stage 3 Wolf Hunt Score 6
// $0B2F50: [8 Bit] BGM Select
//          0 > Random
//          1 > Departure
//          2 > Tranquility
//          3 > Phantom
//          4 > Solitude
//          5 > Discovery
//          6 > Dry Wind
//          7 > Nature
//          8 > Long For
//          9 > Turning Point
// $0B2F58: [8 Bit] Map ID
//          0 > Drafty Valley
//          1 > Windy City
//          2 > Breezy Earth
// $0B5690: [8 Bit] Map time of day
//          0 > Morning
//          1 > Sunset
//          2 > Night
// $0B5694: [8 Bit] Task Select
//          0 > Fly In
//          1 > Try Delta
//          2 > Wolf Hunt
// $0B5C94: [8 Bit] WIP Elevation Level
//          2a - 31 > Level 1
//          32 - 3e > Level 2
//          3f - 4a > Level 3
//          4b - 57 > Level 4
//          58 - 5a > Level 5
// $0D0F54: [8 Bit] Flying Flag
// $0D0F5C: [32 Bit] Task Clear Record
// $0D0F65: [8 Bit] Alternative View Points
//          Bit 0 | First Person Mode
//          Bit 7 | Out of Bound View
// $0D0F66: [8 Bit - Bitflag] Game Status Flags
//          ------
//          Clear/Fail flag don't work by themselves, need to be in a game over / pause status for them to display properly
//          Clear flag has priority over Fail flag
//          ------
//          Bit 0 | Out of Bound
//          Bit 4 | Demo Mode
//          Bit 5 | In game
//          Bit 6 | Task Clear
//          Bit 7 | Task Failed
// $0D0F67: [8 Bit - Bitflag] Game Status Flags
//          Bit 1 | Ready Start Flag
//          Bit 6 | Map Display and Menu (Select) > Pause with display ?
//          Bit 7 | Pause
// $0D0F78: [160 Bit] Camera View Angle Block
// $0D0F98: [16 Bit] Vertical Camera Position
// $0D0F9A: [16 Bit] Horizontal Camera Position

///Core
//Constant

//Quick points distribution
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

RoundDescription = {
    1: "Drop the last marker in order to form a zone of more than 30km",
    2: "Find the target and hit it with a marker within 10m of the center",
    3: "Pop a balloon under 1 minute",
    4: "Create a zone of more than 25km by dropping 3 markers",
    5: "Hit each of the 3 targets withing 20m of the center",
    6: "Find a ballon and pop it with only 3 markers",
    7: "Drop a marker in any 3 of the 4 designated areas",
    8: "Pop a Chicken Balloon by hitting it 50 times",
    9: "Find the target and hit all 3 markers within 10m of the center",
}

MapLookup = {
    0: "Drafty Valley",
    1: "Windy City",
    2: "Breezy Earth"
}

ModeLookup = {
    0: "Fly In",
    1: "Try Delta",
    2: "Wolf Hunt"
}

//----------------
//Variable
MapID = byte(0xB2F58)
ModeID = byte(0xB5694)
RoundID = byte(0xB1A7C)
TaskClearRecord = dword(0xD0F5C) // The score value when finishing a map

//----------------
//Function
function FlyingON () => byte(0xD0F54) == 1 && prior(byte(0xd0f54)) == 0 //Flag's ON when flying in-game, check against prior value to prevent memory flicker false positive
function TaskClear () => bit6(0xD0F66) == 1 // Clear Screen
function TaskFail () => bit7(0xD0F66) == 1 // Fail Screen
function DemoMode () => bit4(0xD0F66) == 1 // Demo mode flag
function FlyingStart () => bit1(0x0d0f67) == 1 // START popup on mission start

//Check against various fail screens
function FailCheck() => TaskFail() || DemoMode () || dword(0xB1778) == 0 //Balloon Stamina 0 = ded

// Map prog x Mode Prog
function MapProgCheevo(Map,Mode)
{
    achievement(title = MapLookup[Map] + " - " + ModeLookup[Mode] + " Casual",
                description = "Explore and complete " + MapLookup[Map] +" in " + ModeLookup[Mode] + " mode",
                points = Easy,
                trigger =
                            once(FlyingON())
                            && MapID == Map
                            && ModeID == Mode
                            && RoundID == 0 // RoundID = 0 during regular map play
                            && TaskClear()
                            && never(FailCheck()) // Reset on failstate reached
                            && never(ModeID != Mode) // Reset of different mode is selected
                            && never(MapID != Map) // Reset on different map selected
                )
}

// Similar but checking for Round tasks
function RoundProgCheevo(Round,Points)
{
    achievement(title = "Round " + Round + " Expert",
                description = "Clear Round "+ Round + " - " + RoundDescription[Round],
                points = Points,
                trigger =
                            once(FlyingON())
                            && RoundID == Round 
                            && TaskClear()
                            && never(FailCheck()) // Reset on failstate reached
                            && never(RoundID != Round) // Reset on different Round OR Round == 0 (normal map flying)
                )
}
//----------------

///Achievement Code
// Map Completion x Game Modes
for map in range(0,2)
    for mode in range(0,2)
        MapProgCheevo(map,mode)
        
// Round Challenges

for round in range(1,6)
    RoundProgCheevo(round, Easy)
    
for round in range(7,9)
    RoundProgCheevo(round, Medium)
    
// In-game Leaderboard
achievement(title = "Fly In Master",
                description = "Beat the All Round Top score for Fly In. After achieved need to be checked in the record section. Will reset on starting a new flight if the record section is not checked first !",
                points = Challenge,
                trigger =
                            once(TaskClear())
                         && once (TaskClearRecord < 100) // Get new High Score
                         && never(FlyingStart()) // Reset when starting a new flight
                         && dword(0x0ADEB4) < 100 // All Round High Score - All Round Score initialize when checked in record
                         && (dword(0xB1ADC) <100 // Double Check on Map 1 Fly In High Score - Map Score initialize on boot-up > For both map and all round high score no memory flicker.
                             || dword(0xB1B68) <100 // Or Map 2 High Score
                             || dword(0xB1BF8) <100 // Or Map 3 High Score
                         )
            )
            
achievement(title = "Try Delta Master",
                description = "Beat the All Round Top score for Try Delta. After achieved need to be checked in the record section. Will reset on starting a new flight if the record section is not checked first !",
                points = Challenge,
                trigger =   
                            once(TaskClear())
                         && once (TaskClearRecord > 4219) // Get new High Score
                         && never(FlyingStart()) // Reset when starting a new flight
                         && dword(0x0ADEE4) > 4219 // All Round High Score - All Round Score initialize when checked in record
                         && (dword(0x0B1B0C) > 4219 // Double Check on Map 1 Try Delta High Score - Map Score initialize on boot-up > For both map and all round high score no memory flicker.
                             || dword(0x0B1B9C) > 4219 // Or Map 2 High Score
                             || dword(0x0B1C2C) > 4219 // Or Map 3 High Score
                            )
            )            


achievement(title = "Wolf Hunt Master",
                description = "Beat the All Round Top score for Wolf Hunt. After achieved need to be checked in the record section. Will reset on starting a new flight if the record section is not checked first !",
                points = Challenge,
                trigger =   
                            once(TaskClear())
                         && once (TaskClearRecord < 14) // Get new High Score
                         && never(FlyingStart()) // Reset when starting a new flight
                         && dword(0x0ADF14) < 14 // All Round High Score - All Round Score initialize when checked in record
                         && (dword(0x0B1B3C) < 14 // Double Check on Map 1 Wolf Hunt High Score - Map Score initialize on boot-up > For both map and all round high score no memory flicker.
                             || dword(0x0B1BCC) < 14 // Or Map 2 High Score
                             || dword(0x0B1C5C) < 14 // Or Map 3 High Score
                            )
            )            

// Misc Challenge
achievement(title = "99 Luftballons",
                description = "From the Sony boot-up screen keep L1+L2+R1+R2 pressed until the start menu appears. Check the different ballons in Customize now !",
                points = 1,
                trigger =
                         once(repeated(600, (  bit0(0x0B0E94) //Check that L1+L2+R1+R2 are pressed for at least 10sec
                                             + bit1(0x0B0E94)
                                             + bit2(0x0B0E94)
                                             + bit3(0x0B0E94)
                                               == 4
                                             )
                                       )
                             )
                          && byte(0x08dbe0) != 0 // Check a different balloon from the default value
                          && never(dword(0xa6780) >= 12288) // arbitrary reset fairly early after a machine reset
                            
            )            


//----------------
//Rich Presence

//----------------
//Leaderboard
