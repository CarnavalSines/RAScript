// Hataraku Chocobo | Working Chocobo
// #ID = 17766

// 20230226 Version - Sines

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

// $010024: some screen id ?
// $010030: chocobo pick
// $010033: [8 Bit] Medal To Get for Level
// $010034: [8 Bit] How many Chocobo currently picked, Start of Level
// $010040: [8 Bit] Food Quantity Display
// $010041: [8 Bit] Water Quantity Display
// $010042: [8 Bit] Wood Quantity Display
// $010043: [8 Bit] Stone Quantity Display
// $010050: [8 Bit] Character ID > Only true on first Screen
//          00 > Kouichi Kuroto
//          01 > Novice Mueller
//          02 > Novice Claus
//          03 > Kind Maria
//          04 > Veteran Fujio
//          05 > Tomboy Meilin
//          06 > Idol Chokobou
//          07 > Novice Rudy
//          08 > Veteran Suzan
//          09 > Novice Geruda
//          0a > Knight Richard
//          0b > Mastermind Yuda
//          0c > Either MC or Red Mage
//          0d > Veteran Mila
//          0e > Mail Order Mist
//          0f > Veteran Tochiro
// $010051: [8 Bit] Character Pick > Only true on first screen
//          0~3
// $01021D: [8 Bit] Level ID
//          00 > Overworld / Player's Farm
//          01 > Kapua Outskirts
//          02 > Geneva
//          03 > Fiena
//          04 > Lorika
//          05 > Colonia
//          06 > Kenabumu
//          07 > Regina
//          08 > Noreia
//          09 > Emetari
//          0a > Depurisu
//          0b > Greva
//          0c > Sinope
//          0d > Deva
//          0e > Vetera
//          0f > Meritene
// $01021E: [8 Bit] Level Time Limit (in Years)
// $010220: [8 Bit] Current Level Year
//          Goes +1 over Year Limit for the final recap
// $010221: [8 Bit] Level Phase
//          00 > End Year Recap
//          01 > Normal Play
//          03 > Harvest
//          04 > Auction
//          05 > Trade
// $010222: [8 Bit] Player Turn Indication
//          03 > Your Turn
// $0102B4: [8 Bit] Food Quantity
// $0102B5: [8 Bit] Water Quantity
// $0102B6: [8 Bit] Wood Quantity
// $0102B7: [8 Bit] Stone Quantity
// $010334: [8 Bit] Food Quantity Player 2
// $010335: [8 Bit] Water Quantity Player 2
// $010336: [8 Bit] Wood Quantity Player 2
// $010337: [8 Bit] Stone Quantity Player 2
// $0103B4: [8 Bit] Food Quantity Player 3
// $0103B5: [8 Bit] Water Quantity Player 3
// $0103B6: [8 Bit] Wood Quantity Player 3
// $0103B7: [8 Bit] Stone Quantity Player 3
// $010434: [8 Bit] Food Quantity Player 4
// $010435: [8 Bit] Water Quantity Player 4
// $010436: [8 Bit] Wood Quantity Player 4
// $010437: [8 Bit] Stone Quantity Player 4
// $01052E: [16 Bit] Level Action Timer
// $010534: [16 Bit] Placing 1st Counter
// $010536: [16 Bit] Placing 2nd Counter
// $010538: [16 Bit] Placing 3rd Counter
// $01053A: [16 Bit] Placing 4th Counter
// $01053C: [16 Bit] Big Sucess Counter
// $01053E: [16 Bit] Sucess Counter
// $010540: [16 Bit] Failure Counter
// $010542: [16 Bit] Medals Counter
//          Is used to determine Level Unlocks
//          0x0003 > Level 2 & 3 unlocked
//          0x000f > Level 4 & 5 unlocked
//          0x0022 > Level 6, 7 & 8 unlocked
//          0x0050 > Level 9, 10, 11 & 12 unlocked
// $010544: [8 Bit] Bitflags Level Cleared (From blinking Gold to fixed White)
//          Bit 0 | Level 1
//          Bit 1 | Level 2
//          Bit 2 | Level 3
//          Bit 3 | Level 4
//          Bit 4 | Level 5
//          Bit 5 | Level 6
//          Bit 6 | Level 7
//          Bit 7 | Level 8
// $010545: [8 Bit] Bitflags Level Cleared (From blinking Gold to fixed White)
//          Bit 0 | Level 9
//          Bit 1 | Level 10
//          Bit 2 | Level 11
//          Bit 3 | Level 12
//          Bit 4 | Level 13 > Postgame
//          Bit 5 | Level 14 > Postgame
//          Bit 6 | Level 15 > Postgame
// $010546: [8 Bit] Postgame Indicator
//          Not a bitflag !
//          0x00 > Main Game
//          0x01 > Postgame ON, level 13, 14 & 15 unlocked
//          Everything above > Postgame deactivated
// $010554: [8 Bit] Farm Chocobo Slot 1 Sprite
//          0x00 > Black Mage Straight Hat
//          0x01 > Black Mage Twintail Hat
//          0x02 > White Mage Hood Down
//          0x03 > White Mage Hood Up
//          0x04 > Blue Hair Mustache man
//          0x05 > Chun-Li cosplay
//          0x06 > Man in a chocobo costume
//          0x07 > Alchemist
//          0x08 > Green robed lady
//          0x09 > Gree robed lady w/ hat
//          0x0a > Dragoon
//          0x0b > Ninja
//          0x0c > Red Mage
//          0x0d > Time Mage
//          0x0e > Summoner
//          0x0f > Dwarf
//          --- --- ---
//          Actual Chocobos
//          
//          0x10 > Yellow Chocobo
//          0x14 > Tan Chocobo
//          0x15 > Black Chocobo
//          
//          > Searched up to 0x50 without finding other chocobo sprite, going to do cheevo based on Portrait ID instead
// $010555: [8 Bit] Farm Chocobo Slot 1 Portrait
//          0x00 > Yellow Chocobo
//          0x01 > Black Chocobo
//          0x02 > Red Chocobo
//          0x03 > Tan Chocobo
//          0x04 > White Chocobo
//          0x05 > Tiger Chocobo
//          0x06 > Brown Chocobo
//          0x07 > Good Manager
// $010556: [8 Bit] Farm Chocobo Slot 1 Description
//          0x00 > Yellow Chocobo
//          0x01 > Black Chocobo
//          0x02 > Red Chocobo
//          0x03 > Tan Chocobo
//          0x04 > White Chocobo
//          0x05 > Tiger Chocobo
//          0x06 > Brown Chocobo
//          0x07 > Good Manager
// $010610: [16 Bit] Horizontal Camera Scrolling Position
// $010612: [16 Bit] Vertical Camera Scrolling Position
// $01062C: [16 Bit] Vertical Position
// $01062E: [16 Bit] Horizontal Position
// $01063E: [16 Bit] Sprite ID ?
//          Can be used for Chocobo Riding Values
//          0x83a6 > On Foot
//          0xaf56 > Yellow Chocobo
//          0xb1a6 > Cursor Plume
//          0xb42e > Tan Chocobo
//          0xb67e > Black Chocobo
// $0112A7: potential chocobo breed id
//          07 > Empty Space
//          0a > Tiger Chocobo
//          0b > Yellow Chocobo
//          0d > Black Chocobo
//          10 > Tan Chocobo


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

LevelName = { 
                    0:"Overworld / Player's Farm", 
                    1:"Kapua Outskirts", 
                    2:"Geneva", 
                    3:"Fiena", 
                    4:"Lorika", 
                    5:"Colonia", 
                    6:"Kenabumu", 
                    7:"Regina", 
                    8:"Noreia", 
                    9:"Emetari",
                    10:"Depurisu", 
                    11:"Greva", 
                    12:"Sinope", 
                    13:"Deva",
                    14:"Vetera", 
                    15:"Meritene"
                    }
                    

LevelIDTable = { 
                    0:0x00, 
                    1:0x01, 
                    2:0x02, 
                    3:0x03, 
                    4:0x04, 
                    5:0x05, 
                    6:0x06, 
                    7:0x07, 
                    8:0x08, 
                    9:0x09,
                    10:0x0a, 
                    11:0x0b, 
                    12:0x0c, 
                    13:0x0d,
                    14:0x0e, 
                    15:0x0f
                    }        
                    
                    
LevelTimeLimitTable = { 
                    0:0, 
                    1:4, 
                    2:4, 
                    3:5, 
                    4:5, 
                    5:6, 
                    6:6, 
                    7:7, 
                    8:7, 
                    9:7,
                    10:7, 
                    11:8, 
                    12:8, 
                    13:8,
                    14:8, 
                    15:8
                    }                    
                    
LevelFirstClearFlag = { 
                    0:0, 
                    1:bit0(0x10544), 
                    2:bit1(0x10544), 
                    3:bit2(0x10544), 
                    4:bit3(0x10544), 
                    5:bit4(0x10544), 
                    6:bit5(0x10544), 
                    7:bit6(0x10544), 
                    8:bit7(0x10544), 
                    9:bit0(0x10545),
                    10:bit1(0x10545), 
                    11:bit2(0x10545), 
                    12:bit3(0x10545), 
                    13:bit4(0x10545),
                    14:bit5(0x10545), 
                    15:bit6(0x10545)
                    }                    
                    
ChocoboList = { 
                    0:"Yellow", 
                    1:"Black", 
                    2:"Red", 
                    3:"Tan", 
                    4:"White", 
                    5:"Tiger", 
                    6:"Brown"
                   
                    }
                    
                    
//----------------
//Variable
LevelID = byte(0x1021d)

CurrentLevelYear = byte(0x10220) // +1 of level limit on final recap phase
LevelPhase = byte(0x10221)  //00 == End year recap, only value used in cheevo

MedalCounter = word(0x10542) // 0x0003, 0x000f, 0x0022 and 0x0050 as level unlock threshold
PostGameValue = byte(0x10546) // 00 normally, 01 when postgame available

ChocoFarmSlot1Portrait = byte(0x10555) // Used for chocobo capture cheevos
FirstPlaceCounter = word(0x10534)
//----------------
//Function
function LevelEndCheck(Level) => LevelID == LevelIDTable[Level] && CurrentLevelYear == (LevelTimeLimitTable[Level] + 1) && LevelPhase == 0

function LevelCompletion(Level,points)
{
    achievement(title = "The Pioneer Life: "+ LevelName[Level],
                description = "Complete the Level " + LevelName[Level],
                points = points,
                trigger = LevelEndCheck(Level) // As name imply, see above
                       && LevelFirstClearFlag[Level] == 1 //Clear Flag On
                       && prev(LevelFirstClearFlag[Level]) == 0 // Delta 0>1 flag turning On
                )
}

function LevelFirstPlace(Level,points)
{
    achievement(title = "Frontier's Conqueror: "+ LevelName[Level],
                description = "Assert your dominance over the land by finishing First in the Level " + LevelName[Level],
                points = points,
                trigger = LevelEndCheck(Level) // As name imply, see above
                       && FirstPlaceCounter > prev(FirstPlaceCounter) // Check for the first place counter increment, can only happen if winning of course
                )
}

function ChocoboRider(ChocoboID,points)
{
    achievement(title = ChocoboList[ChocoboID] + " Chocobo Master",
                description = "Obtain a " + ChocoboList[ChocoboID] + " Chocobo and put it in the first Slot of your Chocobo Farm (Move it back & forth once if already on the first slot)",
                points = points,
                trigger = LevelID == 0
                       && ChocoFarmSlot1Portrait == ChocoboID
                       && prev(ChocoFarmSlot1Portrait) != ChocoboID
                )
}

function LevelUnlocks(Threshold,Title,points)
{
    achievement(title = Title,
                description = "Unlock the new batch of levels. [Medals Required: " + Threshold + "]",
                points = points,
                trigger = MedalCounter >= Threshold
                       && prev(MedalCounter) < Threshold
                       && LevelPhase == 0 //// Should only trigger while completing a level
                       && LevelID != 0 // No world map trigger
                )
}
//----------------
///Achievement Code
// Progression
LevelCompletion(1,2)

for i in range (2,3)
LevelCompletion(i,3)

for i in range (4,8)
LevelCompletion(i,5)

for i in range (9,12)
LevelCompletion(i,10)

for i in range (13,15)
LevelCompletion(i,25)


// Misc Challenge
LevelFirstPlace(1,3)

for i in range (2,7)
LevelFirstPlace(i,5)

for i in range (8,10)
LevelFirstPlace(i,10)

for i in range (11,12)
LevelFirstPlace(i,25)

for i in range (13,15)
LevelFirstPlace(i,50)
//----------------
//Misc Challenge     
for i in range (1,4)    
ChocoboRider(i,2)

for i in range (5,6)
ChocoboRider(i,5)

LevelUnlocks(3,"Chocobo Stable Boy",3)
LevelUnlocks(0xf,"Chocobo Squire",3)
LevelUnlocks(0x22,"Chocobo Knight",5)
LevelUnlocks(0x50,"Chocobo Marshal",10)