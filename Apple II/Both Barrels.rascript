// Both Barrels
// #ID = 32563
// 20250104 Version - Sines

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

DuckPlayer1Score = low4(0x0754) + low4(0x0753) * 10
DuckPlayer2Score = low4(0x0773) + low4(0x0772) * 10
DuckTotalScore = DuckPlayer1Score + DuckPlayer2Score

HighNoonDifficulty = byte(0x6cbc)
HighNoonShotCount = byte(0x6cca)
HighNoonGoodGuyScore = byte(0x6cd8)
HighNoonBadGuyScore = byte(0x6cd1)

ModeIsHighNoon = HighNoonDifficulty <= 0x25
ModeIsDuckHunt = HighNoonDifficulty > 0x25

    achievement(title="I Count Two Guns Fella",
                description = "In High Noon Mode kill 12 Bad Guys in 12 Shots",
                points = 5,
                trigger = ModeIsHighNoon
                       && HighNoonShotCount == 12
                       && prev(HighNoonShotCount) == 11
                       && HighNoonGoodGuyScore - HighNoonShotCount == 0
)  

    achievement(title="Started Blasting",
                description = "In High Noon Mode kill 25 Bad Guys",
                points = 2,
                trigger = ModeIsHighNoon
                       && HighNoonGoodGuyScore == 25
                       && prev(HighNoonGoodGuyScore) == 24
)  

    achievement(title="Target Rich Environment",
                description = "In High Noon Mode kill 50 Bad Guys",
                points = 3,
                trigger = ModeIsHighNoon
                       && HighNoonGoodGuyScore == 50
                       && prev(HighNoonGoodGuyScore) == 49
)  

    achievement(title="I Can Do This All Day",
                description = "In High Noon Mode kill 100 Bad Guys on the Fastest difficulty mode",
                points = 5,
                trigger = HighNoonGoodGuyScore == 100
                       && prev(HighNoonGoodGuyScore) == 99
                       && HighNoonDifficulty == 0x05
)  

    achievement(title="Fastest Gun in the West",
                description = "In High Noon Mode kill 25 Bad Guys on the Fastest difficulty mode without getting shot",
                points = 5,
                trigger = HighNoonGoodGuyScore == 25
                       && prev(HighNoonGoodGuyScore) == 24
                       && HighNoonDifficulty == 0x05
                       && HighNoonBadGuyScore == 0
)  

    achievement(title="Quack Like a Duck",
                description = "In Duck Hunt Mode kill your first Duck",
                points = 2,
                trigger = ModeIsDuckHunt
                       && DuckTotalScore == 1
                       && prev(DuckTotalScore) == 0
)  

    achievement(title="Fly Like a Duck",
                description = "In Duck Hunt Mode kill 5 Ducks total",
                points = 3,
                trigger = ModeIsDuckHunt
                       && (DuckTotalScore == 5 && (prev(DuckTotalScore) == 4 || prev(DuckTotalScore) == 3))
                       || (DuckTotalScore == 6 && prev(DuckTotalScore) == 4)
)  

    achievement(title="Look Like a Duck",
                description = "In Duck Hunt Mode kill 10 Ducks total",
                points = 5,
                trigger = ModeIsDuckHunt
                       && (DuckTotalScore == 10 && (prev(DuckTotalScore) == 9 || prev(DuckTotalScore) == 8))
                       || (DuckTotalScore == 11 && prev(DuckTotalScore) == 9)
)  

    achievement(title="Both Barrels",
                description = "In Duck Hunt Mode kill 2 Ducks with on Shot",
                points = 5,
                trigger = ModeIsDuckHunt
                       && DuckTotalScore == prev(DuckTotalScore) + 2
)  

RPSpeed = { 
                    0x25:"9",
                    0x21:"8",
                    0x1d:"7",
                    0x19:"6",
                    0x15:"5",
                    0x11:"4",
                    0x0d:"3",
                    0x09:"2",
                    0x05:"1"

                    }    

rich_presence_conditional_display(
    ModeIsHighNoon,
    "• It's High Noon - Speed Level {1} • Score: {0} •",
    rich_presence_value("Score", HighNoonGoodGuyScore),
    rich_presence_lookup("RPSpeed", HighNoonDifficulty, RPSpeed)
    )  
///Default 
rich_presence_display(
    "• Hunting for Ducks • Score: {0}",
    rich_presence_value("ScoreDuck", DuckTotalScore)

)