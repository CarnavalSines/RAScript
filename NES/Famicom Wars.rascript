// Famicom Wars
// #ID = 5533


// 20230222 Version - Sines, voiceofautumn

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




// $0094: Last Map Played - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
//        Stay at last value during map play, reset to 0 on Victory Screen then take on the new value of 1 or 2
// $0487: 14=HQ Capture???
// $606E: Cursor selected LOC
// $607C: [8Bit] Map ID
//        0x00=Bean Island
//        0x01=Donut Island
//        0x02=Riceball Island
//        0x03=Jewel Island
//        0x04=Pendant Island
//        0x05=Shroud Island
//        0x06=Mask Peninsula
//        0x07=Treasure Island
//        0x08=Alara Mountains
//        0x09=Lost River
//        0x0a=Volcano Isle
//        0x0b=Moonring Island
//        0x0c=Cigar Island
//        0x0d=Dice Island
//        0x0e=Mirror Islands
//        0x0f=Devil Island (Red Exclusive)
//        0x10=Last Dream (Blue Exclusive)
// $607D: Day
// $607E: [8 Bit]  Bean Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $607F: [8 Bit]  Donut Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6080: [8 Bit]  Riceball Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6081: [8 Bit]  Jewel Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6082: [8 Bit] Pendant Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6083: [8 Bit]  Shroud Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6084: [8 Bit]  Mask Peninsula - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6085: [8 Bit]  Treasure Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6086: [8 Bit]  Alara Mountains - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6087: [8 Bit]  Lost River - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6088: [8 Bit]  Volcano Isle - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $6089: [8 Bit]  Moonring Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $608A: [8 Bit]  Cigar Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $608B: [8 Bit]  Dice Island - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $608C: [8 Bit]  Mirror Islands - Owned By
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $608D: [8 Bit] Devil Island (Red Exclusive) - Owned By > TBC
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $608E: [8 Bit]  Last Dream (Blue Exclusive) - Owned By > TBC
//        0x00 = Neutral
//        0x01 = Red Star
//        0x02 = Blue Moon
// $608F: [8 Bit] Bean Island Victory record (in days)
// $6090: [8 Bit] Donut Island Victory record (in days)
// $6091: [8 Bit] Riceball Island Victory record (in days)
// $6092: [8 Bit] Jewel Island Victory record (in days)
// $6093: [8 Bit] Pendant Island Victory record (in days)
// $6094: [8 Bit] Shroud Island Victory record (in days)
// $6095: [8 Bit] Mask Island Victory record (in days)
// $6096: [8 Bit] Treasure Island Victory record (in days)
// $6097: [8 Bit] Alara Mountains Victory record (in days)
// $6098: [8 Bit] Lost River Victory record (in days)
// $6099: [8 Bit] Volcano Isle Victory record (in days)
// $609A: [8 Bit] Moonring Island Victory record (in days)
// $609B: [8 Bit] Cigar Island Victory record (in days)
// $609C: [8 Bit] Dice Island Victory record (in days)
// $609D: [8 Bit] Mirror Island Victory record (in days)
// $609E: [8 Bit] Devil Island (Red Exclusive) Victory record (in days) > TBC
// $609F: [8 Bit] Last Dream (Blue Exclusive) Victory record (in days) > TBC
// $60A8: Total RStar Units
// $60A9: Number of BMoon Units
// $60AA: [16bit] Gold
// $60C0: Options - Animation
//        0x00=Off
//        0x01=On
// $60C1: Options - BGM
//        0x00=Off
//        0x01=Type A
//        0x02=Type B
// $60C2: Number of RStar Infantry
// $60C3: BMoon Infantry
// $60C4: Number of RStar Mechs
// $60C6: Number of RStar Med Tanks
// $60CA: RStar APCs
// $6102: Bit 0 - Blue Moon Type
//        0x00=Player
//        0x01=Computer
//        
//        Bit 1 - Red Star Type
//        0x00=Player
//        0x01=Computer
// $6103: Options - Computer
//        0x00=IQ 100
//        0x01=IQ 200
// $7400: Unit 1 Move
// $7401: Bit 1 = Unit 1 Turn Ended
// $7402: Unit 1 Y coord
// $7403: Unit 1 X coord
// $7405: Unit 1 Life
// $7407: Unit 1 ammo
// $740A: Unit 1 Loc
// $7700: BMoon Unit 1 Stats


///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


MapName = { 
                    0:"Bean Island", 
                    1:"Donut Island", 
                    2:"Riceball Island", 
                    3:"Jewel Island", 
                    4:"Pendant Island", 
                    5:"Shroud Island", 
                    6:"Mask Peninsula", 
                    7:"Treasure Island", 
                    8:"Alara Mountains", 
                    9:"Lost River",
                    10:"Volcano Isle", 
                    11:"Moonring Island", 
                    12:"Cigar Island", 
                    13:"Dice Island",
                    14:"Mirror Islands", 
                    15:"Devil Island",  // (Red Exclusive)
                    16:"Last Dream" // (Blue Exclusive)

                    }
//----------------
//Variable
NormalMode = byte(0x6103) == 0 // 100IQ
HardMode = byte(0x6103) == 1 // 200IQ

P1RedStar = bit0(0x6102) == 1 && bit1(0x6102) == 0
P1BlueMoon = bit0(0x6102) == 0 && bit1(0x6102) == 1

MapIDCheck = byte(0x607c)
RedStarUnitRemaining = byte(0x60a8)
BlueMoonUnitRemaining = byte(0x60a9)

LastMapPlayedStatus = byte(0x94)
//----------------
//Function

function OwnedByCheck(MapID) => byte(0x607e + MapID) // First Map Owned By address + MapID




function RedVictory(MapID,points)
{
    achievement(title = "Red Star Menace: "+ MapName[MapID],
                description = "Playing as Red Star conquer " + MapName[MapID],
                points = points,
                trigger = 
                (P1RedStar // Playing as Red Star
   				&& OwnedByCheck(MapID) == 1
    			&& prev(OwnedByCheck(MapID)) != 1 
    			&& MapIDCheck == MapID
                )
                )
}

function RedVictoryLast(points)
{
    achievement(title = "Red Star Menace: "+ MapName[15],
                description = "Playing as Red Star conquer " + MapName[15],
                points = points,
                trigger = 
                (P1RedStar // Playing as Red Star
   				&& LastMapPlayedStatus == 1
    			&& prev(LastMapPlayedStatus) != 1 
    			&& MapIDCheck == 15
                )
                )
}

function BlueVictory(MapID,points)
{
    achievement(title = "Blue Moon Terror: "+ MapName[MapID],
                description = "Playing as Blue Moon conquer " + MapName[MapID],
                points = points,
                trigger = 
                (P1BlueMoon // Playing as Blue Moon
   				&& OwnedByCheck(MapID) == 2
    			&& prev(OwnedByCheck(MapID)) != 2
    			&& MapIDCheck == MapID
                )
                )
}

function BlueVictoryLast(points)
{
    achievement(title = "Blue Moon Terror: "+ MapName[16],
                description = "Playing as Blue Moon conquer " + MapName[16],
                points = points,
                trigger = 
                (P1BlueMoon // Playing as Blue Moon
   				&& LastMapPlayedStatus == 2
    			&& prev(LastMapPlayedStatus) != 2
    			&& MapIDCheck == 16
                )
                )
}

function RedVictoryHard(MapID,points)
{
    achievement(title = "The Big Brains of Red Star: "+ MapName[MapID],
                description = "Playing as Red Star conquer " + MapName[MapID] + " in 200IQ Mode",
                points = points,
                trigger = 
                (P1RedStar // Playing as Red Star
   				&& OwnedByCheck(MapID) == 1
    			&& prev(OwnedByCheck(MapID)) != 1 
    			&& MapIDCheck == MapID
                      && HardMode
                )
                )
}

function RedVictoryLastHard(points)
{
    achievement(title = "The Big Brains of Red Star: "+ MapName[15],
                description = "Playing as Red Star conquer " + MapName[15] + " in 200IQ Mode",
                points = points,
                trigger = 
                (P1RedStar // Playing as Red Star
   				&& LastMapPlayedStatus == 1
    			&& prev(LastMapPlayedStatus) != 1 
    			&& MapIDCheck == 15
                      && HardMode
                )
                )
}

function BlueVictoryHard(MapID,points)
{
    achievement(title = "The Geniuses of Blue Moon: "+ MapName[MapID],
                description = "Playing as Blue Moon conquer " + MapName[MapID] + " in 200IQ Mode",
                points = points,
                trigger = 
                (P1BlueMoon // Playing as Blue Moon
   				&& OwnedByCheck(MapID) == 2
    			&& prev(OwnedByCheck(MapID)) != 2
    			&& MapIDCheck == MapID
    			&& HardMode
                )
                )
}

function BlueVictoryLastHard(points)
{
    achievement(title = "The Geniuses of Blue Moon: "+ MapName[16],
                description = "Playing as Blue Moon conquer " + MapName[16] + " in 200IQ Mode",
                points = points,
                trigger = 
                (P1BlueMoon // Playing as Blue Moon
   				&& LastMapPlayedStatus == 2
    			&& prev(LastMapPlayedStatus) != 2
    			&& MapIDCheck == 16
    			&& HardMode
                )
                )
}

function WinCapture(MapID,points)
{
    achievement(title = "Encirclement Strategy: "+ MapName[MapID],
                description = "Playing as any army conquer " + MapName[MapID] + " by capturing the enemy HQ",
                points = points,
                trigger = 
                (P1RedStar
    && BlueMoonUnitRemaining >=1 
    && OwnedByCheck(MapID) == 1
    && prev(OwnedByCheck(MapID)) != 1
    && MapIDCheck == MapID) // P1 Red Star Condition
    || (P1BlueMoon
    && RedStarUnitRemaining >=1
    && OwnedByCheck(MapID) == 2
    && prev(OwnedByCheck(MapID)) != 2 // P1 Blue Moon Condition
    && MapIDCheck == MapID) // Making sure we're on the right map, should prevent false positive trigger from save loading
                )
}

function WinCaptureLast(MapID,points)
{
    achievement(title = "Encirclement Strategy: "+ MapName[MapID],
                description = "Playing as any army conquer " + MapName[MapID] + " by capturing the enemy HQ",
                points = points,
                trigger = 
                (P1RedStar
    && BlueMoonUnitRemaining >=1 
    && LastMapPlayedStatus == 1
    && prev(LastMapPlayedStatus) != 1
    && MapIDCheck == MapID) // P1 Red Star Condition
    || (P1BlueMoon
    && RedStarUnitRemaining >=1
    && LastMapPlayedStatus == 2
    && prev(LastMapPlayedStatus) != 2 // P1 Blue Moon Condition
    && MapIDCheck == MapID) // Making sure we're on the right map, should prevent false positive trigger from save loading
                )
}

function WinRoute(MapID,points)
{
    achievement(title = "Salted Earth Strategy: "+ MapName[MapID],
                description = "Playing as any army conquer " + MapName[MapID] + " by routing the enemy",
                points = points,
                trigger = 
                (P1RedStar
    && BlueMoonUnitRemaining == 0 
    && OwnedByCheck(MapID) == 1
    && prev(OwnedByCheck(MapID)) != 1
    && MapIDCheck == MapID) // P1 Red Star Condition
    || (P1BlueMoon
    && RedStarUnitRemaining == 0
    && OwnedByCheck(MapID) == 2
    && prev(OwnedByCheck(MapID)) != 2 // P1 Blue Moon Condition
    && MapIDCheck == MapID) // Making sure we're on the right map, should prevent false positive trigger from save loading
                )
}

function WinRouteLast(MapID,points)
{
    achievement(title = "Salted Earth Strategy: "+ MapName[MapID],
                description = "Playing as any army conquer " + MapName[MapID] + " by routing the enemy",
                points = points,
                trigger = 
                (P1RedStar
    && BlueMoonUnitRemaining == 0 
    && LastMapPlayedStatus == 1
    && prev(LastMapPlayedStatus) != 1
    && MapIDCheck == MapID) // P1 Red Star Condition
    || (P1BlueMoon
    && RedStarUnitRemaining == 0
    && LastMapPlayedStatus == 2
    && prev(LastMapPlayedStatus) != 2 // P1 Blue Moon Condition
    && MapIDCheck == MapID) // Making sure we're on the right map, should prevent false positive trigger from save loading
                )
}
//----------------
///Achievement Code
// Progression

// Red >> Sines
//for i in range (0,14)  // Red map pool
//    RedVictory(i,5)
    
RedVictoryLast(5)
// Blue >> Voice
for i in range (0,14)  // Blue map pool
    BlueVictory(i,5)

BlueVictoryLast(5)

// Hard Red >> Sines
//for i in range (0,14)  // Red map pool
//    RedVictoryHard(i,5)
    
//RedVictoryLastHard(5)    
    
// Hard Blue >> Voice
for i in range (0,14)  // Blue map pool
    BlueVictoryHard(i,5)
    
BlueVictoryLastHard(5)


// Capture >> Sines
//for i in range (0,14)
//    WinCapture(i,5)
    
    
// Routing >> Voice
for i in range (0,14)
    WinRoute(i,5)


// Red Exclusive Map >> Sines
//WinCaptureLast(15,5)
//WinRouteLast(15,5)

// Blue Exclusive Map >> Sines
//WinCaptureLast(16,5)
//WinRouteLast(16,5)
