// ~Hack~ Fire Emblem Wars
// #ID = 22571
// 20250319 Version - Sines

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

Prog_Dict = { // {0}: MapID - {1}: CheevoName - {2}: Score  - {3}: Map Name - {4}: War Room Score
                    0x01: [0x6c, "Back to the Origin", 5, "Talys Island", 0x1407a],
                    0x02: [0x6d, "Enhanced Classic", 5, "Egg Island", 0x1408e],
                    0x03: [0x6e, "Small Lakes", 5, "Basin Lakes", 0x140a2],
                    0x04: [0x6f, "Axe Bros Home", 5, "Western Isles", 0x140b6],
                    0x05: [0x70, "Larum's Lament", 5, "Civil Unrest", 0x140ca],
                    0x06: [0x71, "Rivers in the Desert", 5, "Lost River", 0x140de],
                    0x07: [0x72, "Super Fire Emblem Wars", 5, "Terra Maw", 0x140f2],
                    0x08: [0x73, "Rushed Tracks", 5, "Flank Track", 0x14106],
                    0x09: [0x74, "Nomade Hell", 5, "Law of Sacae", 0x1411a],
                    0x0a: [0x75, "Ice Wings", 5, "Snowy Offensive", 0x1412e],
                    0x0b: [0x76, "Dreadful Mountains", 5, "Dire Range", 0x14142],
                    0x0c: [0x77, "Wyvern Nest", 5, "Bern Peaks", 0x14156],
                    0x0d: [0x78, "Gleaming Fang", 5, "Shrine of Seals S", 0x1416a],
                    0x0e: [0x79, "Galle Last Stand", 5, "Shrine of Seals N", 0x1417e],
                    0x0f: [0x7a, "Wyrmslayer", 5, "Dragon's Lake", 0x14192],
                    0x10: [0x7b, "Sacred Snow", 5, "Teraz Plateau", 0x141a6],
                    0x11: [0x7c, "Air Supremacy", 5, "Wyvern Mirror", 0x141ba],
                    0x12: [0x7d, "Foggy Swamp", 5, "Bog of Desperation", 0x141ce],
                    0x13: [0x7e, "Cozy Neighbours", 5, "Ridge Island", 0x141e2],
                    0x14: [0x7f, "Disunited Front", 5, "Northern Frontier", 0x141f6],
                    0x15: [0x80, "Crushing the Rebellion", 5, "Rivers Four", 0x1420a],
                    0x16: [0x81, "Deranged Stratagem", 5, "Ocean D. Range", 0x1421e],
                    0x17: [0x82, "Global Melee", 5, "Spring Lakes", 0x14232],
                    0x18: [0x83, "All According to Plan", 5, "South Cape", 0x14246],
                    0x19: [0x84, "Finishing the Fight", 5, "Corsairs' Trial", 0x1425a],
                    0x1a: [0x85, "From All Sides", 10, "Hunting Ground", 0x1426e],
                    0x1b: [0x86, "Family Bond", 10, "Capture Trial", 0x14282],
                    0x1c: [0x87, "Back From the Future", 10, "Jet-Black Forest", 0x14296],
                    0x1d: [0x88, "Rise of the Demon King", 10, "Final War", 0x142aa],
                    0x1e: [0x89, "Ending the Dragon War", 25, "Salvation", 0x142be],
                    0x1f: [0x8a, "Sword Fight", 1, "Tutorial 01 - Terrain Intel", "BEEEEEP"],
                    0x20: [0x8b, "Trench War", 2, "Tutorial 02 - Base Capture", "BEEEEEP"],
                    0x21: [0x8c, "Ressource Management", 3, "Tutorial 03 - Capture Battle", "BEEEEEP"],
                    0x22: [0x94, "Blue Water Blue Sky", 4, "Tutorial 04 - Clash at Garda", "BEEEEEP"],
                    0x23: [0x92, "Holding the Line", 5, "Tutorial 05 - Hamill Pincer", "BEEEEEP"],
                    0x24: [0x93, "At Least It’s Not Thracia Fog", 5, "Tutorial 06 - Search Battle", "BEEEEEP"],
                    0x25: [0x95, "Final Test", 5, "Tutorial 07 - Blizzard Logistics", "BEEEEEP"],
                    0x26: [0x97, "One Last Thing", 10, "Tutorial 08 - Laus Plains", "BEEEEEP"]

                    } 

CO_Dict = { // {0}: P1COID - {1}: CO Name  - {2}: Cheevo Name
                    0x01: [0x00, "Guinivere", "Queenly Authority"],
                    0x02: [0x01, "Roy", "He's Our Boy"],
                    0x03: [0x02, "Marcus", "Jeigan THIS"],
                    0x04: [0x03, "Juno", "Frosty Reception"],
                    0x05: [0x04, "Eirika", "Sacred Kindness"],
                    0x06: [0x05, "Dayan", "Wild Call"],
                    0x07: [0x06, "Ephraim", "Princely Stones"],
                    0x08: [0x07, "Gonzales", "Balding Rage"],
                    0x09: [0x08, "Elphin", "Merry Tune"],
                    0x0a: [0x09, "Geese", "Sea Legs"],
                    0x0b: [0x0a, "Sturm", "Friendship Destroyer"],
                    0x0c: [0x0b, "Zephiel", "Berning Hatred"],
                    0x0d: [0x0c, "Narshen", "Blue Blood"],
                    0x0e: [0x0d, "Idun", "You Dun Goofed"],
                    0x0f: [0x0e, "Lyon", "Demoniac Call"],
                    0x10: [0x0f, "Merlinus", "Quality of Life"],
                    0x11: [0x10, "Perceval", "White Knight"],
                    0x12: [0x11, "Echidna", "Pointing the Way"],
                    0x13: [0x12, "Miledy", "Wyvern Fury"]

                    } 
ModeID = byte(0x591c)
P1CO = byte(0x2b2dd)
P1Funds = word(0x2b2c0)
P1Properties = byte(0x2b2d1)
P1PowerUse = byte(0x2b2de)

MapID = byte(0x3fc2)

Tutorial1 = byte(0x37e0e)
Tutorial2 = byte(0x37e0f)
Tutorial3 = byte(0x37e10)
Tutorial4 = byte(0x37e18)
Tutorial5 = byte(0x37e16)
Tutorial6 = byte(0x37e17)
Tutorial7 = byte(0x37e19)
BonusTutorial = byte(0x37e1b)

// -------------------------- Tutorial Prog

    achievement(title=Prog_Dict[0x1f][1],
                description = "Clear "+ Prog_Dict[0x1f][3],
                points = Prog_Dict[0x1f][2],
                trigger = Tutorial1 == 2
                       && prev(Tutorial1) == 1
                       && MapID == Prog_Dict[0x1f][0]
                       && ModeID == 0x04
                    
)  

    achievement(title=Prog_Dict[0x20][1],
                description = "Clear "+ Prog_Dict[0x20][3],
                points = Prog_Dict[0x20][2],
                trigger = Tutorial2 == 2
                       && prev(Tutorial2) == 1
                       && MapID == Prog_Dict[0x20][0]
                       && ModeID == 0x04
                    
)  

    achievement(title=Prog_Dict[0x21][1],
                description = "Clear "+ Prog_Dict[0x21][3],
                points = Prog_Dict[0x21][2],
                trigger = Tutorial3 == 2
                       && prev(Tutorial3) == 1
                       && MapID == Prog_Dict[0x21][0]
                       && ModeID == 0x04
                    
)  

    achievement(title=Prog_Dict[0x22][1],
                description = "Clear "+ Prog_Dict[0x22][3],
                points = Prog_Dict[0x22][2],
                trigger = Tutorial4 == 2
                       && prev(Tutorial4) == 1
                       && MapID == Prog_Dict[0x22][0]
                       && ModeID == 0x04
                    
) 

    achievement(title=Prog_Dict[0x23][1],
                description = "Clear "+ Prog_Dict[0x23][3],
                points = Prog_Dict[0x23][2],
                trigger = Tutorial5 == 2
                       && prev(Tutorial5) == 1
                       && MapID == Prog_Dict[0x23][0]
                       && ModeID == 0x04
                    
)  

    achievement(title=Prog_Dict[0x24][1],
                description = "Clear "+ Prog_Dict[0x24][3],
                points = Prog_Dict[0x24][2],
                trigger = Tutorial6 == 2
                       && prev(Tutorial6) == 1
                       && MapID == Prog_Dict[0x24][0]
                       && ModeID == 0x04
                    
)  

    achievement(title=Prog_Dict[0x25][1],
                description = "Clear "+ Prog_Dict[0x25][3],
                points = Prog_Dict[0x25][2],
                trigger = Tutorial7 == 2
                       && prev(Tutorial7) == 1
                       && MapID == Prog_Dict[0x25][0]
                       && ModeID == 0x04
                    
)  

    achievement(title=Prog_Dict[0x26][1],
                description = "Clear the bonus "+ Prog_Dict[0x26][3],
                points = Prog_Dict[0x26][2],
                trigger = BonusTutorial == 2
                       && prev(BonusTutorial) == 1
                       && MapID == Prog_Dict[0x26][0]
                       && ModeID == 0x04
                    
)  
// -------------------------- CO Powers
function PowerProg(CO){
	
    title = CO_Dict[CO][2]
	points = 2
	description = format("Activate {0} Limit as Player 1", CO_Dict[CO][1])
	trigger = (P1CO == CO_Dict[CO][0]
            && P1PowerUse == 2
            && prev(P1PowerUse) == 0
            && (ModeID == 0x05
            || ModeID == 0x04)
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}
for CO in CO_Dict
    PowerProg(CO)
// -------------------------- War Room

function ExtraMissionCompleteSum(StartRange,EndRange) =>
    all_of(range(StartRange,EndRange,step=20), addr => byte(addr) >= 1)

function PrevExtraMissionComplete(StartRange,EndRange) =>
    any_of(range(StartRange,EndRange,step=20), addr => prev(byte(addr)) == 0)

function SRankCheck(WarRoomScore) => high4(WarRoomScore) + (byte(WarRoomScore+1) * 16)

    achievement(title="Master of War",
                description = "Complete every War Room Maps",
                points = 25,
                trigger = ModeID == 5
                       && ExtraMissionCompleteSum(0x14079,0x142bd)
                       && PrevExtraMissionComplete(0x14079,0x142bd)
)  

function MapProg(Map){
	
    title = Prog_Dict[Map][1]
	points = Prog_Dict[Map][2]
	description = "Clear "+ Prog_Dict[Map][3] + " with an S Rank"
	trigger = (SRankCheck(Prog_Dict[Map][4]) >= 290
                       && prev(SRankCheck(Prog_Dict[Map][4])) < 290
                       && MapID == Prog_Dict[Map][0]
                       && ModeID == 0x05
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for i in range (1,30)
    MapProg(i)

RPMapID = { 
                    0x6c: "Talys Island",
                    0x6d: "Egg Island",
                    0x6e: "Basin Lakes",
                    0x6f: "Western Isles",
                    0x70: "Civil Unrest",
                    0x71: "Lost River",
                    0x72: "Terra Maw", 
                    0x73: "Flank Track", 
                    0x74: "Law of Sacae", 
                    0x75: "Snowy Offensive", 
                    0x76: "Dire Range", 
                    0x77: "Bern Peaks",
                    0x78: "Shrine of Seals S",
                    0x79: "Shrine of Seals N", 
                    0x7a: "Dragon's Lake", 
                    0x7b: "Teraz Plateau",
                    0x7c: "Wyvern Mirror",
                    0x7d: "Bog of Desperation",
                    0x7e: "Ridge Island", 
                    0x7f: "Northern Frontier", 
                    0x80: "Rivers Four", 
                    0x81: "Ocean D. Range", 
                    0x82: "Spring Lakes", 
                    0x83: "South Cape", 
                    0x84: "Corsairs' Trial", 
                    0x85: "Hunting Ground", 
                    0x86: "Capture Trial", 
                    0x87: "Jet-Black Forest", 
                    0x88: "Final War",
                    0x89: "Salvation", 
                    0x8a: "Tutorial 01 - Terrain Intel",
                    0x8b: "Tutorial 02 - Base Capture", 
                    0x8c: "Tutorial 03 - Capture Battle", 
                    0x94: "Tutorial 04 - Clash at Garda", 
                    0x92: "Tutorial 05 - Hamill Pincer", 
                    0x93: "Tutorial 06 - Search Battle", 
                    0x95: "Tutorial 07 - Blizzard Logistics",
                    0x97: "Tutorial 08 - Laus Plains"

                    } 

RPPlayerChar = { 
                    0x00: "Guinivere",
                    0x01: "Roy", 
                    0x02: "Marcus", 
                    0x03: "Juno", 
                    0x04: "Eirika", 
                    0x05: "Dayan",
                    0x06: "Ephraim", 
                    0x07: "Gonzales", 
                    0x08: "Elphin", 
                    0x09: "Geese", 
                    0x0a: "Sturm", 
                    0x0b: "Zephiel", 
                    0x0c: "Narshen",
                    0x0d: "Idun", 
                    0x0e: "Lyon", 
                    0x0f: "Merlinus", 
                    0x10: "Perceval", 
                    0x11: "Echidna", 
                    0x12: "Miledy"

                    } 



rich_presence_conditional_display(
    ModeID == 4,
    "• Learning the Ropes - {0} •",
    rich_presence_lookup("RPMapID", MapID, RPMapID)
)

rich_presence_conditional_display(
    ModeID == 5 && P1Funds > 0,
    "• Planning in the War Room - Playing {0} as {1} - Funds: {2} - Bases Captured: {3} •",
    rich_presence_lookup("RPMapID", MapID, RPMapID),
    rich_presence_lookup("RPPlayerChar", P1CO, RPPlayerChar),
    rich_presence_value("Funds", P1Funds),
    rich_presence_value("Base", P1Properties)
)


rich_presence_display(
    "• Fire Emblem without Perma-Death - Advance Wars but without the Advance • "

)  