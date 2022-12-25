// OutRun
// #ID = 12405
// 20221224 Version - Sines


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



// $010F: [8 Bit] BGM Select
//        00 > Magical Sound Shower
//        01 > Passing Breeze
//        02 > Splash Wave
// $0110: [8 Bit] Transmission Mode
//        00 > AT / Automatic
//        01 > MT / Manual (Up / Down to change gear)
// $0124: [8 Bit] Start Press Flag
//        Bit 7 | Start Press
// $0125: [8 Bit] Pause Detection
//        00 > Run
//        FF > Pause
// $0126: [8 Bit] Button Press Flags
//        Bit 0 | Up
//        Bit 1 | Down
//        Bit 2 | Left
//        Bit 3 | Right
//        Bit 4 | B (Button 1 on real hardware)
//        Bit 5 | A (Button 2 on real hardware)
// $012B: [8 Bit] Stage Select / Race Select
//        ------
//        1 Player Game
//        ------
//        Same Track ID as 0x01f1
//        ------
//        VS Computer
//        ------
//        00 - 09 > Race A to J
// $0169: [8 Bit] Time 0:0X
// $016A: [8 Bit] Time 0:X0
// $01F0: [8 Bit]
//        Transition Flags ?
//        Bit 0 & 2 goes to 0 on checkpoint
// $01F1: [8 Bit] Background / Graphism related ?
//        Usually same values as Stage Level but goes wild on End Run and increment up to FF
//        Stay fixed on regular Game Over
//        ----------
//        On Race mode goes straight from 00 to FF on run end (win or lose)
// $01F2: [8 Bit] Run End Flag
//        01 > Successful Run Ending
//        Stay at 0 on Game Over
// $02C0: [256 Bit] Color displayed data block
// $0313: [8 Bit] Position relative to the center line
//        Doesn't matter if left / right
//        00 On center line
//        0x0d - 0x13 Off Road values
// $0361: [8 Bit] Acceleration
// $0362: [8 Bit] Gear Status
//        00 > Low
//        01 > High
// $0363: [8 Bit] Speed
//        Speed is Gear dependant
//        ------
//        Low Gear
//        ------
//        Min Speed == 0KM
//        Top Speed == 144KM (0x90)
//        
//        ------
//        High Gear
//        ------
//        Low Speed == (0x59)
// $0376: [16 Bit]
//        Race P1 car position (Red arrow on the side)
//        Display Only
// $03E3: [8 Bit] Race mode P2 position
// $03E4: [16 Bit]
//        Race P2 car position (White arrow on the side)
//        Display only
// $03EA: [8 Bit] Current Map Timer
//        Increase from 00 to 99 (max value not possible normally so loop back to 00)
//        BCD
// $03F2: [16 Bit] Total time of the run in seconds
//        0x03ea value get added to currently saved value here on stage change
//        BCD
// $0BBD: [8 Bit] Car can't move flag
//        Bit 0
//        Goes 00 > 01 on time over or reaching goal
//        Goes 01 > 00 on map start
// $0BBE: [8 Bit] Goal Reached Flag
//        Bit 0
// $1002: [8 Bit] Song Playing
//        04 > Splash Wave
//        06 > 1P Run Won jingle
//        07 > VS Computer Race Won jingle
//        08 > Passing Breeze
//        09 > Magical Sound Shower
//        0b > 1P Game Over Music
// $1C20: [8 Bit] Menu Selection
// $1C22: [8 Bit] Mode Select
//        FF > Main Menu
//        00 > 1 Player Game
//        01 > VS Computer
// $1C23: [8 Bit] Timer 1
//        ------
//        Main Menu
//        ------
//        Timer until getting back to the credits
//        Count to 200s (0xc8)
//        
//        ------
//        Run End
//        ------
//        X' 00 Final Results
// $1C24: [8 Bit] Timer 2
//        ------
//        Run End
//        ------
//        0' XX Final Results
//        Display is in BCD (0x38 == 38 displayed)
//        
//        ------
//        Route Recap
//        ------
//        Countdown before booting back to main menu

///Core
//Constant
StageName = {
    0: "Coconut Beach",
    1: "Devil's Canyon",
    2: "Pyramids",
    3: "Inner City",
    4: "Night Harbor",
    5: "Casino Paradise",
    6: "Windmill's Breeze",
    7: "Desert Ruin",
    8: "Mountainside",
    9: "Vineyard",
}

RaceName = {
    0: "A",
    1: "B",
    2: "C",
    3: "D",
    4: "E",
    5: "F",
    6: "G",
    7: "H",
    8: "I",
    9: "J",
}

//Quick points distribution
BabyEasy = 2
VeryEasy = 3
Easy = 5
Medium = 10
Hard = 25
OffTheRoad = byte(0x313) >= 0xd
ManualGear = byte(0x110) == 1
EndScreen = byte(0x1f1) == 0xFF // Background value ? Goes to FF on End screen
//----------------
//Variable
StageID = byte(0x12b)
SongCheck = byte(0x1002)
ModeSelect = byte(0x1c22)
VSRaceOn = (byte(0x3e3) + byte(0x3e4)) !=0 // P2 Position in race > Only has a value during a VSComp race

//----------------

//Function
function VSComputerWin() => EndScreen
           && SongCheck == 7 // Jingle that plays on win for VS Computer mode
           && ModeSelect == 1 // VS Computer Mode
           
function OnePlayerRunWin() => byte(0x1f2) == 1 // Flag goes to 1 on succesful run
           && EndScreen
           && SongCheck == 6 // Jingle that plays on win for 1P Race Mode
           && ModeSelect == 0 // 1P Race Mode
           
           
// Transition flag in bit 0 and 2 of byte(0x1f0) goes from 1 to 0 on stage switch. Thus, can be used to check combined with StageID that the current stage has been cleared.
function StageSwitch() => prev(bit0(0x1f0)) == 1
         && prev(bit2(0x1f0)) == 1
         && bit0(0x1f0) == 0
         && bit2(0x1f0) == 0
         
function OnePlayerRunProgCheevo(ID,points) // Regular stage completion, considered done on stage transition         
{
    achievement(title = StageName[ID],
                description = "Complete the stage " + StageName[ID] ,
                points = points,
                trigger = 
                ModeSelect == 00 // 1P Race Mode
                && StageSwitch()
                && StageID == ID 
                )
}

function OnePlayerRunEndCheevo(ID,points) // End Stage completion, considered done on victory screen          
{
    achievement(title = StageName[ID],
                description = "Complete the stage " + StageName[ID] ,
                points = points,
                trigger = 
                OnePlayerRunWin()
                && StageID == ID 
                )
}

function VSComputerProgCheevo(ID,points) // Race won, trigger on victory screen         
{
    achievement(title = "Course " + RaceName[ID],
                description = "Win Course " + RaceName[ID] ,
                points = points,
                trigger = 
                VSComputerWin()
                && StageID == ID 
                )
}

function ProRacerCheevo(ID,points) // Race won, trigger on victory screen > RA Challenge Edition, no Pause menu, no off-road, Manual Transmission       
{
    achievement(title = "Course " + RaceName[ID] + " [Expert Driver]",
                description = "Win Course " + RaceName[ID] + " like a Pro ! [No Pause | No Off-Road | MT (Manual Transmission) mode]",
                points = points,
                trigger = 
                once(ModeSelect == 0xFF)
                && StageID == ID 
                && ManualGear
                && never(OffTheRoad)
                && never(byte(0x125) == 0xFF && ModeSelect == 1 && SongCheck != 0) // Pause Detection + dodging initial memory reset shenanigans
                && never(ModeSelect == 00 && SongCheck !=0)
                && VSRaceOn
                && ModeSelect == 1
                && trigger_when(SongCheck == 7) // Had to break the VSComputerWin() function to get a proper trigger point, would need to be rewrite to be more elegant probably.
                && trigger_when(EndScreen)
                )
}
function EndRunLeaderboard(ID) // Leaderboard for reaching the end of a 1PRace run, trigger on Goal Screen and submit final Time    
{
leaderboard(
    title = StageName[ID] + " Complete Run",
    description = "Best Time for a 1P Race that end successfully in "+ StageName[ID],
    start  = OnePlayerRunWin()
             && StageID == ID, //No display, trigger on win screen
    cancel = always_false(),
    submit = always_true(),
    value = bcd(word(0x03f2)), // End run total time in sec (BCD Display)
    format = "SECS", lower_is_better = true
            )
}
//----------------

///Achievement Code
// 1 Player Game
    achievement(title = StageName[0], // Necessary to add a few checks due to the StageID of Coconut Beach being 00 and having risk of early trigger.
                description = "Complete the stage " + StageName[0] ,
                points = BabyEasy,
                trigger = 
                once(ModeSelect == 0xFF)
                && ModeSelect == 00 // 1P Race Mode
                && StageSwitch()
                && StageID == 00 
                && never(byte(0x0bbd) == 1 && SongCheck !=0) // Time Over flag
                )

for i in range(1,5)
    OnePlayerRunProgCheevo(i,Easy)
    
for i in range(6,9)
    OnePlayerRunEndCheevo(i,Hard)    
   
// VS Computer
VSComputerProgCheevo(0,VeryEasy)  

for i in range(1,6)
    VSComputerProgCheevo(i,Easy)    

for i in range(7,9)
    VSComputerProgCheevo(i,Medium)       
// Expert Driver Challenges
for i in range(0,5)
   ProRacerCheevo(i,Medium)  
   
for i in range(6,9)
   ProRacerCheevo(i,Hard)  
// Misc Challenge


//----------------

// RP Lookups

//----------------

///Rich Presence Data

//----------------


///Leaderboards Data
for i in range(6,9)
   EndRunLeaderboard(i) 

//----------------
