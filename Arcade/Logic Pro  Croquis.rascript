// Logic Pro | Croquis
// #ID = 14459
// 20240830 Version - Sines

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

// $024C: [8 Bit] BCD Score Display > Use the other, this one can be a check for lb submission
//        X0 000
// $025C: [8 Bit] BCD Score Display > Use the other, this one can be a check for lb submission
//        0X 000
// $026C: [8 Bit] BCD Score Display > Use the other, this one can be a check for lb submission
//        00 X00
// $027C: [8 Bit] BCD Score Display > Use the other, this one can be a check for lb submission
//        00 0X0
// $02DC: [8 Bit] BCD Score Display > Use the other, this one can be a check for lb submission
//        00 00X
// $1994: [8 Bit] Timer
//        Max 0x1f
//        Time Over on 0x00
// $19AC: [8 Bit] Nb Correct Square filled
//        Increment (display decrease) in memory, puzzle end early if manually modified to be the total nb of square required
// $19B2: [8 Bit] Current Level
//        Regular levels 0x00 > 0x08
//        "Final" starting at 0x09 up to 0x0e
//        0x0f > Game Cleared
// $1B10: [8 Bit] Nb Help Used
//        Track per level, reset on new puzzle
// $1B28: [8 Bit] Nb Help Available
// $1D20: [8 Bit] 2P Flag
//        0xff > 2P
// $1DD0: [8 Bit] Final Select
//        0x00 > Seoul
//        0x01 > Beijing
//        0x02 > Tokyo
//        0x03 > New York
//        0x04 > Hawaii
//        0x05 > Rio de Janeiro
//        0x06 > Paris
//        0x07 > Rome
//        0x08 > London
//        0x09 > Moscow
// $1DF1: [8 Bit] Dip Switch Setting
//        0xff > Default
//        Bit 0 - 1 - 2 > Credit Settings
//        Bit 3 > Fast time if 0
//        Bit 4 > Slow Time if 0
//        If Bit 3 & Bit 4 at 0 > Fastest time
//        
//        --- --- ---
//        Bit 5 > Hard Difficulty if 0
//        Bit 6 > Easy Difficulty if 0
//        If Bit 5 & Bit 6 at 0 > Hardest Difficulty
//        
//        --- --- ---
//        Bit 7 > Demo Sound Off if 0
// $1DF3: [8 Bit] Number of credits
// $1E22: [8 Bit] Demo Flag
//        0xff > Demo
// $924C: [8 Bit] BCD Score Display
//        X0 000
// $925C: [8 Bit] BCD Score Display
//        0X 000
// $926C: [8 Bit] BCD Score Display
//        00 X00
// $927C: [8 Bit] BCD Score Display
//        00 0X0
// $92DC: [8 Bit] BCD Score Display
//        00 00X
// $92E0: [8 Bit] 2P detection
//        Only fills up when 2P is present, removed on Game Over
// $92FC: [8 Bit] BCD Score Display P2
//        0X 000
// $930C: [8 Bit] BCD Score Display P2
//        00 X00
// $931C: [8 Bit] BCD Score Display P2
//        00 0X0
// $932C: [8 Bit] BCD Score Display P2
//        00 00X

///Core
//Constant

City_Dict = { // {0}:CityID  - {1}: CheevoName Prog - {2}: City Name 
                    0x01: [0x00, "Korean Princess","Seoul"],
                    0x02: [0x01, "Familiar Design","Beijing"],
                    0x03: [0x02, "Flower Garden","Tokyo"],
                    0x04: [0x03, "Cowgirl","New York"],
                    0x05: [0x04, "Sea Breeze","Hawaii"],
                    0x06: [0x05, "Samba","Rio de Janeiro"],
                    0x07: [0x06, "Superior Choice","Paris"],
                    0x08: [0x07, "Bread and Circus","Rome"],
                    0x09: [0x08, "True Lady","London"],
                    0x10: [0x09, "Cold Never Bothered Me Anyway","Moscow"]

                    } 

//Variables       
Timer = byte(0x1994)            
LevelID = byte(0x19b2)
HelpCount = byte(0x1b10)
FinalSelect = byte(0x1dd0)

P2Flag = byte(0x1d20)
DemoFlag = byte(0x1e22)
Dipswitch = byte(0x1df1)
TimerFast = bit3(Dipswitch) == 0 && bit4(Dipswitch) == 1
TimerSlow = bit3(Dipswitch) == 1 && bit4(Dipswitch) == 0
TimerFastest = bit3(Dipswitch) == 0 && bit4(Dipswitch) == 0
DifficultyHard = bit5(Dipswitch) == 0 && bit6(Dipswitch) == 1
DifficultyEasy = bit5(Dipswitch) == 1 && bit6(Dipswitch) == 0
DifficultyHardest = bit5(Dipswitch) == 0 && bit6(Dipswitch) == 0



Score = bcd(byte(0x92dc)) + bcd(byte(0x927c)) * 10 + bcd(byte(0x926c)) * 100 + bcd(byte(0x925c)) * 1000 + bcd(byte(0x924c)) * 10000
ScoreTriggerCheck = bcd(byte(0x02dc)) + bcd(byte(0x027c)) * 10 + bcd(byte(0x026c)) * 100 + bcd(byte(0x025c)) * 1000 + bcd(byte(0x024c)) * 10000

//Functions
function GameClear() => LevelID == 0x0f && prev(LevelID) == 0x0e
function MiscCheck() => unless(once(P2Flag == 0xff)) && DemoFlag == 0x00 || never(LevelID == 1 && prev(LevelID) == 0)


     achievement(title="Around the World",
                description = "Clear Puzzle 1 ~ 8",
                points = 3,
                trigger = LevelID == 0x09
            && prev(LevelID) == 0x08
)      
function ArcadeProg(City){
	
    title = City_Dict[City][1]
	points = 5
	description = format("Obtain the {0} Ending", City_Dict[City][2])
	trigger = (GameClear()
            && FinalSelect == City_Dict[City][0]
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}    

for City in City_Dict
    ArcadeProg(City)


     achievement(title="Puzzle Warrior",
                description = "Clear Arcade mode without using any Help",
                points = 5,
                trigger = trigger_when(GameClear())
            && never(HelpCount > prev(HelpCount))
            && once(LevelID == 1 && Score > 0 && prev(Score)== 0) 
)   

     achievement(title="Picross Savant",
                description = "Clear Arcade mode with 1CC in Hardest difficulty",
                points = 10,
                trigger = trigger_when(GameClear())
            && never(Timer == 0 && prev(Timer) > 0)
            && once(LevelID == 1 && Score > 0 && prev(Score)== 0) 
            && bit5(Dipswitch) == 0 
            && bit6(Dipswitch) == 0
)   

//Rich Presence

CityRP = { 
                    0x00:"Seoul",
                    0x01:"Beijing",
                    0x02:"Tokyo",
                    0x03:"New York",
                    0x04:"Hawaii",
                    0x05:"Rio de Janeiro",
                    0x06:"Paris",
                    0x07:"Rome",
                    0x08:"London",
                    0x09:"Moscow"

                    }  


 ///Default 
rich_presence_conditional_display(
    LevelID > 8,
    "• Solving Puzzle {0} • {1} Route • ",
    rich_presence_value("LevelID",LevelID),
    rich_presence_lookup("CityRP", FinalSelect, CityRP)
)
rich_presence_conditional_display(
    LevelID > 0 && LevelID < 9,
    "• Solving Puzzle {0} •",
    rich_presence_value("LevelID",LevelID)
    )  

rich_presence_display(
    "• I want to be a BEAUTIFUL WOMAN •")
