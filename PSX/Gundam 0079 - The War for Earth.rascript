// Gundam 0079 - The War for Earth
// #ID = 32705
// 20250407 Version - Sines

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


/// Variables

VideoID = byte(0x81ae0)
ChapterID = byte(0x81b08)

Code1 = byte(0x81b24)
Code2 = byte(0x81b25)
Code3 = byte(0x81b26)
Code4 = byte(0x81b27)
Code5 = byte(0x81b28)
Code6 = byte(0x81b29)
Code7 = byte(0x81b2a)
Code8 = byte(0x81b2b)

    achievement(title="Fly, Gundam!",
                description = "Complete Chapter 1",
                points = 1,
                trigger = ChapterID == 0
                       && VideoID == 0x1f
                       && prev(VideoID) == 0x1b

)  

    achievement(title="The Red Comet",
                description = "Complete Chapter 2",
                points = 1,
                trigger = ChapterID == 1
                       && VideoID == 0x28
                       && prev(VideoID) == 0x27

)  

    achievement(title="Soul Weighed Down by Gravity",
                description = "Complete Chapter 3",
                points = 1,
                trigger = ChapterID == 2
                       && VideoID == 0x42
                       && prev(VideoID) == 0x41

)  

    achievement(title="City Trip",
                description = "Complete Chapter 4",
                points = 1,
                trigger = ChapterID == 3
                       && VideoID == 0x48
                       && prev(VideoID) == 0x46

)  

    achievement(title="No Zaku, Boy",
                description = "Complete Chapter 5",
                points = 1,
                trigger = ChapterID == 4
                       && VideoID == 0x5a
                       && prev(VideoID) == 0x58

)  

    achievement(title="Curse Your Sudden but Inevitable Betrayal Char!",
                description = "Finish the Game",
                points = 5,
                trigger = ChapterID == 6
                       && VideoID == 0x7e
                       && prev(ChapterID) == 5

)  

    achievement(title="Budding Newtype",
                description = "Finish the Game in a single sitting, without using any code",
                points = 10,
                trigger = ChapterID == 6
                       && VideoID == 0x7e
                       && prev(ChapterID) == 5
                       && Code1 == 0
                       && Code2 == 0
                       && Code3 == 0
                       && Code4 == 0
                       && Code5 == 0
                       && Code6 == 0
                       && Code7 == 0
                       && Code8 == 0

)  

                  
 



rich_presence_display(
    "• Fly, Gundam! - Chapter {0} •",
    rich_presence_value("ChapterID", ChapterID+1)
)