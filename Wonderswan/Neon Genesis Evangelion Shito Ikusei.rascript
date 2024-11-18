// Neon Genesis Evangelion: Shito Ikusei
// #ID = 17551
// 20241116 Version - Sines

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


Event_Dict = { // {0}: EventID - {1}: CheevoName Prog - {2}: EventName
                    0x01: [0x11076, "Say the Line Shinji","Run Away"],
                    0x02: [0x11077, "Field Research","Ritsuko Field Tent"],
                    0x03: [0x11078, "Always a Bigger Fish","Misato Strategy Meeting"],
                    0x04: [0x11079, "Supportive Friend","Ritsuko Hug"],
                    0x05: [0x1107a, "DDR Gaming","Shinji and Asuka Training"],
                    0x06: [0x1107b, "Infinite Money","Asuka Shopping Trip"],
                    0x07: [0x1107c, "Keeping it Cool","Power Outage"],
                    0x09: [0x1107d, "Family Portions","Group Ramen Dinner"],
                    0x0a: [0x1107e, "Mother's Legacy","MAGI Exploration"],
                    0x0b: [0x1107f, "Fleeting Peace","Group Skygazing"],
                    0x0c: [0x11080, "A Little Late","Betreyal"],
                    0x0d: [0x11081, "Internal Reflection","Asuka's Doubt"],
                    0x0e: [0x11082, "Weird Ayanami","Troubled Ayanami"],
                    0x0f: [0x11083, "Mysterious Defense","Terminal Dogma Attack"],
                    0x10: [0x11085, "Counter Attack","Nightly Shogi"],
                    0x11: [0x11086, "Group Fun","Nightly Mahjong"],
                    0x12: [0x11087, "At a Loss","Missing Book"],
                    0x13: [0x11089, "Real Strategist","Gendo Master Strategist"],
                    0x14: [0x11089, "Real Player","Shigeru Concert"],
                    0x15: [0x1108a, "Laundry Duty","Makoto Laundry"],
                    0x16: [0x1108b, "Girls Outing","Ritsuko Laundry"],
                    0x17: [0x1108c, "Moments of Calm","Fuyutsuki Laundry"],
                    0x18: [0x1108d, "Overconfidence","Shinji Synchronisation Test"],
                    0x19: [0x1108e, "Rare Words","Ayanami ID"],
                    0x1a: [0x1108f, "NERV Needs You!","NERV Recruitment"],
                    0x1b: [0x11090, "Little Soldier","Kensuke Field Training"],
                    0x1c: [0x11091, "Lasting Impact","Misato Park"],
                    0x1d: [0x11092, "School Gardian","Class Meeting 1"],
                    0x1e: [0x11093, "Class Rep","Class Meeting 2"],
                    0x1f: [0x11094, "Movie Goers","Class Meeting 3"],
                    0x20: [0x11095, "Dating Advices","Class Meeting 4"],
                    0x21: [0x11096, "White Dress","Wedding Shopping"],
                    0x22: [0x11097, "Old Days","Group Drinking"],
                    0x23: [0x11098, "Noodle Stop","Ritsuko Ramen"],
                    0x24: [0x11099, "Like Old Times","Fuyutsuki Ramen"],
                    0x25: [0x1109a, "Taciturn Eater","Gendo Ramen"],
                    0x26: [0x1109b, "Lake Explosions","Firework"],
                    0x27: [0x1109c, "Last Minute Shopping","Shinji Store Run"],
                    0x28: [0x1109d, "Deadly Cook","Misato Cooking"],
                    0x29: [0x1109e, "Smooth Operator","Misato Kiss"],
                    0x2a: [0x1109f, "Brushed Teeth","Shinji Kiss"],
                    0x2b: [0x110a0, "Textbook Work Harassment","Maya Harassment"],
                    0x2c: [0x110a1, "Lift Issues","Elevator Outage"],
                    0x2d: [0x110a2, "Lifeline","Heaven's Gate"],
                    0x2e: [0x110a3, "Battleground","Maya Bar Meeting"],
                    0x2f: [0x110a4, "Blooming Feelings","May Bar Meeting"],
                    0x30: [0x110a5, "Whiny Drunk","Makoto Bar Meeting"],
                    0x31: [0x110a6, "Bad Business","School Pictures"],
                    0x32: [0x110a7, "Let Him Cook","Shinji's Cooking"],
                    0x33: [0x110a9, "Scientific Process","Data Analysis"]

                    }  

Angel_Dict = { // {0}: AngelID - {1}: CheevoName Prog - {2}: Angel Name
                    0x01: [0x08, "Absolute Terror","Sachiel"],
                    0x02: [0x09, "Censor Dodger","Samshel"],
                    0x03: [0x0a, "Geometric Screaming","Ramiel"],
                    0x04: [0x0b, "Like Fish to Water","Gaghiel"],
                    0x05: [0x0c, "Combat Collab","Israfel"],
                    0x06: [0x0d, "Volcano's Spirit","Sandalphon"],
                    0x07: [0x0e, "Long Legs","Matarael"],
                    0x08: [0x0f, "Abstract Art","Sahaquiel"],
                    0x09: [0x10, "Shadow World","Leliel"],
                    0x10: [0x11, "Mirror Match","Bardiel"],
                    0x11: [0x12, "Tasty Snack","Zeruel"],
                    0x12: [0x13, "God's Light","Arael"],
                    0x13: [0x14, "Put a Ring on It","Armisael"],
                    0x14: [0x15, "White Death","MP Eva"],
                    0x15: [0x16, "Prototype Unit","Unit-00"],
                    0x16: [0x17, "Get in There Shinji","Unit-01"],
                    0x17: [0x18, "Tsundere Bot","Unit-02"],
                    0x18: [0x19, "Nanovirus","Ireul"],
                    0x19: [0x1a, "Fifth Child","Kaworu Nagisa"],
                    0x20: [0x1b, "Tumbling Down","Rei Ayanami"],
                    0x21: [0x1c, "The Third is What Counts","Light Giant"],
                    0x22: [0x1d, "Mother is Home","Lilith"],
                    0x23: [0x1e, "I'm Not an Angel!","Pen Pen"]

                    }  

TimerMinute = byte(0x1102c)
TimerHour = byte(0x1102e)
TechnicianID = byte(0x110ec)
mapID = byte(0x114a7) // 0x39 for end of game
SaveProtection = byte(0x011491)

AngelID = byte(0x1103e)
AngelEvoID = byte(0x01106c)
AngelTrainingLevel = byte(0x11669)
AngelTrainingLives = byte(0x1166b)
AngelStrenght = word(0x11054)
AngelIntelligence = word(0x11056)
AngelATField = word(0x11058)

ItemFish = byte(0x110c0)
ItemLCL_CL3 = byte(0x110c1)
ItemLCL_TerminalDogma = byte(0x110c2)
ItemCorrosive = byte(0x110c3)
ItemCassette = byte(0x110c4)
ItemFeather = byte(0x110c5)
ItemSaltCrystal = byte(0x110c6)
ItemS2Sample = byte(0x110c7)
ItemUnit0Core = byte(0x110c8)
ItemUnit1Core = byte(0x110c9)
ItemUnit2Core = byte(0x110ca)
ItemE3Key = byte(0x110cb)
ItemHDKey = byte(0x110cc)
ItemIDCard = byte(0x110cd)
ItemDeskKey = byte(0x110ce)
ItemDVD_Angel = byte(0x110cf)
ItemDVD_Fake = byte(0x110d0)

    achievement(title="Cute Bug",
                description = "Raise your Angel to the Larva Stage",
                points = 1,
                trigger = AngelID == 1
                       && prev(AngelID) == 0
                       && mapID == 0x30
)

    achievement(title="They Grow so Fast!",
                description = "Raise your Angel to the Puppa Stage",
                points = 2,
                trigger = mapID == 0x30
                       && ((AngelID == 2
                       && prev(AngelID) != AngelID)
                       || (AngelID == 3
                       && prev(AngelID) != AngelID)
                       || (AngelID == 4
                       && prev(AngelID) != AngelID))
)

    achievement(title="Peaceful Sleep",
                description = "Raise your Angel to the Cocoon Stage",
                points = 3,
                trigger = mapID == 0x30
                       && ((AngelID == 5
                       && prev(AngelID) != AngelID)
                       || (AngelID == 6
                       && prev(AngelID) != AngelID)
                       || (AngelID == 7
                       && prev(AngelID) != AngelID))
)

    achievement(title="Perfect Little Angel",
                description = "Raise your Angel to their Mature Form [No Special Item Form]",
                points = 5,
                trigger = AngelID > 7
                       && AngelID < 0x15
                       && prev(AngelID) < 8
                       && mapID == 0x30
)

    achievement(title="Raised with Love",
                description = "Fully raise your Angel until they leave home. Every young one must leave the nest eventually...",
                points = 10,
                trigger = AngelID > 7
                       && prev(mapID) == 0x30
                       && mapID == 0x39
)

    achievement(title="First Defense Line",
                description = "Have your Angel battle against Unit-00 during the Final Phase",
                points = 5,
                trigger = AngelID > 7
                       && prev(mapID) == 0x39
                       && mapID == 0x01
)

    achievement(title="Angry German Girl",
                description = "Have your Angel battle against Unit-02 during the Final Phase",
                points = 10,
                trigger = AngelID > 7
                       && prev(mapID) == 0x39
                       && mapID == 0x02
)

    achievement(title="Third Child, Last Hope",
                description = "Have your Angel battle against Unit-01 during the Final Phase",
                points = 10,
                trigger = AngelID > 7
                       && prev(mapID) == 0x39
                       && mapID == 0x03
)

    achievement(title="Ace Up the Sleeve",
                description = "Have your Angel battle against the last defender during the Final Phase",
                points = 25,
                trigger = AngelID > 7
                       && prev(mapID) == 0x39
                       && mapID == 0x04
)

function AngelProg(Angel){
	
    title = Angel_Dict[Angel][1]
	points = 10
	description = format("Raise the Angel {0} to the Final Phase", Angel_Dict[Angel][2])
	trigger = (AngelID == Angel_Dict[Angel][0]
            && mapID == 0x39
            && prev(mapID) == 0x30
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Angel in Angel_Dict
    AngelProg(Angel)

    achievement(title="So Long",
                description = "Obtain a Fish",
                points = 2,
                trigger = ItemFish == 0x81
                       && prev(ItemFish) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Strange Liquid",
                description = "Obtain the CL3 LCL Sample",
                points = 2,
                trigger = ItemLCL_CL3 == 0x81
                       && prev(ItemLCL_CL3) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Cloning Experiment",
                description = "Obtain the Terminal Dogma LCL Sample",
                points = 2,
                trigger = ItemLCL_TerminalDogma == 0x81
                       && prev(ItemLCL_TerminalDogma) == 0x00
                       && SaveProtection == 1
)

    achievement(title="In Tokyo-3 No One Can Hear you Scream",
                description = "Obtain the Corrosive sample",
                points = 2,
                trigger = ItemCorrosive == 0x81
                       && prev(ItemCorrosive) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Just Vibin'",
                description = "Obtain the Cassette Tape",
                points = 2,
                trigger = ItemCassette == 0x81
                       && prev(ItemCassette) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Thanks for All the Fish",
                description = "Obtain the Feather",
                points = 2,
                trigger = ItemFeather == 0x81
                       && prev(ItemFeather) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Probably Not Kosher",
                description = "Obtain the Salt Crystal",
                points = 2,
                trigger = ItemSaltCrystal == 0x81
                       && prev(ItemSaltCrystal) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Rocket Science",
                description = "Obtain the S² Sample",
                points = 2,
                trigger = ItemS2Sample == 0x81
                       && prev(ItemS2Sample) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Rei Will Have to Do it Again",
                description = "Obtain the 00 Core",
                points = 2,
                trigger = ItemUnit0Core == 0x81
                       && prev(ItemUnit0Core) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Shinji, Your Dad Loves You!",
                description = "Obtain the 01 Core",
                points = 2,
                trigger = ItemUnit1Core == 0x81
                       && prev(ItemUnit1Core) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Will to Power",
                description = "Obtain the 02 Core",
                points = 2,
                trigger = ItemUnit2Core == 0x81
                       && prev(ItemUnit2Core) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Mystery Zone",
                description = "Obtain the E3 Key",
                points = 2,
                trigger = ItemE3Key == 0x81
                       && prev(ItemE3Key) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Knocking on Heaven's Door",
                description = "Obtain the HD Key",
                points = 2,
                trigger = ItemHDKey == 0x81
                       && prev(ItemHDKey) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Yoink",
                description = "Obtain the Desk Key",
                points = 2,
                trigger = ItemDeskKey == 0x81
                       && prev(ItemDeskKey) == 0x00
                       && SaveProtection == 1
)

    achievement(title="This is Me",
                description = "Obtain the ID Card",
                points = 2,
                trigger = ItemIDCard == 0x81
                       && prev(ItemIDCard) == 0x00
                       && SaveProtection == 1
)

    achievement(title="DVD Release",
                description = "Obtain the Angel DVD",
                points = 2,
                trigger = ItemDVD_Angel == 0x81
                       && prev(ItemDVD_Angel) == 0x00
                       && SaveProtection == 1
)

    achievement(title="Fake News",
                description = "Obtain the Faked DVD",
                points = 2,
                trigger = ItemDVD_Fake == 0x81
                       && prev(ItemDVD_Fake) == 0x00
                       && SaveProtection == 1
)

function EventProg(Event){
	
    title = Event_Dict[Event][1]
	points = 5
	description = format("Clear the {0} Event", Event_Dict[Event][2])
	trigger = (byte(Event_Dict[Event][0]) == 0xff
            && prev(byte(Event_Dict[Event][0])) > 0
            && prev(byte(Event_Dict[Event][0])) < 0xff
            && SaveProtection == 1
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Event in Event_Dict
    EventProg(Event)

///100% Events

    
    achievement(title="Congratulations",
                description = "Clear Every Events in the game",
                points = 50,
                trigger = all_of(range(0x11076,0x110aa,step=1), addr => byte(addr) == 0xff)
                       && any_of(range(0x11076,0x110aa,step=1), addr => prev(byte(addr)) < 0xff)
                       && SaveProtection == 1
)


RPAngel = { 
                    0x00: "Embryo",
                    0x01: "Larva (Humanoid)",
                    0x02: "Pupa (Humanoid)",
                    0x03: "Pupa (Organic)",
                    0x04: "Pupa (Inorganic)",
                    0x05: "Cocoon (Humanoid)",
                    0x06: "Cocoon (Organic)",
                    0x07: "Cocoon (Inorganic)",
                    0x08: "Sachiel",
                    0x09: "Samshel",
                    0x0a: "Ramiel",
                    0x0b: "Gaghiel",
                    0x0c: "Israfel",
                    0x0d: "Sandalphon",
                    0x0e: "Matarael",
                    0x0f: "Sahaquiel",
                    0x10: "Leliel",
                    0x11: "Bardiel",
                    0x12: "Zeruel",
                    0x13: "Arael",
                    0x14: "Armisael",
                    0x15: "MP Eva",
                    0x16: "Unit-00",
                    0x17: "Unit-01",
                    0x18: "Unit-02",
                    0x19: "Ireul",
                    0x1a: "Kaworu Nagisa",
                    0x1b: "Rei Ayanami",
                    0x1c: "Light Giant",
                    0x1d: "Lilith",
                    0x1e: "Pen Pen (Not An Angel)"

                    }  
rich_presence_display(
        "• Rasing a cute little Angel: {0} - Strenght: {1}/400 - Intelligence: {2}/400 - A.T. Field: {3}/400  • {4}:{5} •",
    rich_presence_lookup("RPAngel", AngelID, RPAngel),
    rich_presence_value("Strenght", AngelStrenght),
    rich_presence_value("Int", AngelIntelligence),
    rich_presence_value("ATField", AngelATField),
    rich_presence_value("Hours", TimerHour),
    rich_presence_value("Min", TimerMinute)

)  