// Congo Bongo
// #ID = 32457
// 20241219 Version - Sines

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

CurrentPhase = byte(0x008f)
Level = byte(0x00bb)
Lives = byte(0x00bc)

Score = byte(0x00b1) * 100000 + byte(0x00b2) * 10000 + byte(0x00b3) * 1000 + byte(0x00b4) * 100 + byte(0x00b5) * 10 + byte(0x00b6)
Bonus = byte(0x00b7) * 1000 + byte(0x00b8) * 100 + byte(0x00b9) * 10 + byte(0x00ba)


    achievement(title="Scaling the Waterfall",
                description = "Reach Bongo at the top of the Waterfall",
                points = 2,
                trigger = Lives > 0
                       && Lives != 0xff
                       && CurrentPhase == 1
                       && prev(CurrentPhase) == 0
)  

    achievement(title="Wooden Bridge",
                description = "Reach Bongo across the wooden bridge",
                points = 3,
                trigger = Lives > 0
                       && Lives != 0xff
                       && CurrentPhase == 2
                       && prev(CurrentPhase) == 1
)  

    achievement(title="Hidey Holes",
                description = "Reach Bongo on the other side of the field",
                points = 5,
                trigger = Lives > 0
                       && Lives != 0xff
                       && CurrentPhase == 3
                       && prev(CurrentPhase) == 2
)  

    achievement(title="Leap of Faith",
                description = "Reach Bongo across the jungle river, clearing the level",
                points = 5,
                trigger = Lives > 0
                       && Lives != 0xff
                       && Level > prev(Level)
                       && prev(CurrentPhase) == 3
) 

    achievement(title="Jungle Tracker",
                description = "Catch Bongo 4 more times and clear the 2nd Level",
                points = 10,
                trigger = Lives > 0
                       && Lives != 0xff
                       && Level > prev(Level)
                       && prev(CurrentPhase) == 3
                       && Level == 3
) 

    achievement(title="Safari Master",
                description = "Catch Bongo 4 more times yet again and clear the 3rd Level",
                points = 10,
                trigger = Lives > 0
                       && Lives != 0xff
                       && Level > prev(Level)
                       && prev(CurrentPhase) == 3
                       && Level == 4
) 

    achievement(title="Might of the Empire",
                description = "Clear the entirety of Level 1 without losing a single Life",
                points = 10,
                trigger = Lives > 0
                       && Lives != 0xff
                       && trigger_when(Level > prev(Level)
                       && prev(CurrentPhase) == 3
                       && Level == 2)
                       && once(Level == 1 && Score == 0 && Lives == 3)
                       && never(Lives < prev(Lives))
) 

    achievement(title="King of the Falls",
                description = "Reach Bongo at the top of the Waterfall with a bonus of 4000 or more",
                points = 5,
                trigger = Lives > 0
                       && Lives != 0xff
                       && CurrentPhase == 1
                       && prev(CurrentPhase) == 0
                       && prev(Bonus) >= 4000
)  

    achievement(title="Slippery Ground",
                description = "Reach Bongo across the wooden bridge with a bonus of 4500 or more",
                points = 5,
                trigger = Lives > 0
                       && Lives != 0xff
                       && CurrentPhase == 2
                       && prev(CurrentPhase) == 1
                       && prev(Bonus) >= 4500
)  

    achievement(title="Rhino Jumper",
                description = "Reach Bongo on the other side of the field with a bonus of 4000 or more",
                points = 5,
                trigger = Lives > 0
                       && Lives != 0xff
                       && CurrentPhase == 3
                       && prev(CurrentPhase) == 2
                       && prev(Bonus) >= 4000
)  

    achievement(title="Focused Hunter",
                description = "Reach Bongo across the jungle river with a bonus of 4000 or more",
                points = 10,
                trigger = Lives > 0
                       && Lives != 0xff
                       && Level > prev(Level)
                       && prev(CurrentPhase) == 3
                       && prev(Bonus) >= 4000
) 

leaderboard(
    title ="Explorator Expert",
    description = "Track the highest score on Game Over",
    start  = Lives == 0 && Lives != 0xff && prev(Lives) == 1 ,
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE",
    lower_is_better=false
)    

RPPhase = { 
                    0x00:"Waterfall",
                    0x01:"Small Pond",
                    0x02:"Rhino Field",
                    0x03:"Jungle River"

                    }    

rich_presence_conditional_display(
    Lives != 0xff,
    "• Level {0} - {1} • Score: {2} •",
    rich_presence_value("Level", Level),
    rich_presence_lookup("RPPhase", CurrentPhase, RPPhase),
    rich_presence_value("Score", Score)
    )  
///Default 
rich_presence_display(
    "• On the Hunt for Bongo •"

)