// Side Pocket for WonderSwan
// #ID = 25087
// 20241128 Version - Sines

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

SetPlayAmount = byte(0x200)

P2Flag = byte(0x202)
VSModeFlag = byte(0x203)
GameModeFlag = byte(0x20f)
ActivePlayerFlag = byte(0x743)

CharID = byte(0x204)
P2CharID = byte(0x205)
HustlerLevelID = byte(0x206)
P1Score = byte(0x20d)
P2Score = byte(0x20e)
TargetBallID = byte(0x564)
LastBallID = byte(0x747)
ShotPower = byte(0x723)
GameState = byte(0x700)


    achievement(title="Hustler Snail",
                description = "Win your first Hustler match",
                points = 2,
                trigger = P2Flag == 0
                       && VSModeFlag == 0
                       && HustlerLevelID == 1
                       && prev(HustlerLevelID) == 0
)  

    achievement(title="Hustler Cub",
                description = "Win your second Hustler match",
                points = 3,
                trigger = P2Flag == 0
                       && VSModeFlag == 0
                       && HustlerLevelID == 2
                       && prev(HustlerLevelID) == 1
)  

    achievement(title="Hustler Hawk",
                description = "Win your third Hustler match",
                points = 5,
                trigger = P2Flag == 0
                       && VSModeFlag == 0
                       && HustlerLevelID == 3
                       && prev(HustlerLevelID) == 2
)  

    achievement(title="Hustler King",
                description = "Win your fourth and last Hustler match",
                points = 10,
                trigger = P2Flag == 0
                       && VSModeFlag == 0
                       && HustlerLevelID == 3
                       && ((SetPlayAmount == 0
                       && P1Score == 1
                       && prev(P1Score) == 0)
                       || (SetPlayAmount == 1
                       && P1Score == 2
                       && prev(P1Score) == 1)
                       || (SetPlayAmount == 2
                       && P1Score == 3
                       && prev(P1Score) == 2))
)  

    achievement(title="Grand Tour",
                description = "Complete Hustler mode in Best of 5 without using a continue past the first match",
                points = 10,
                trigger = P2Flag == 0
                       && VSModeFlag == 0
                       && SetPlayAmount == 2
                       && trigger_when(HustlerLevelID == 3
                       && P1Score == 3
                       && prev(P1Score) == 2)
                       && once(HustlerLevelID == 1 && prev(HustlerLevelID) == 0 && P2Flag == 0 && VSModeFlag == 0 && SetPlayAmount == 2)
                       && never(HustlerLevelID == 0)
                       && never(P2Score == 3 && prev(P2Score) == 2)
)  

    achievement(title="Legendary Strength",
                description = "Do a full powered shot",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && ShotPower == 0x60
                       && GameState == 0x01
                       && prev(GameState) == 0x02
)  

    achievement(title="Learning to Count: 1",
                description = "Sink the 1 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x01
                       && LastBallID == 0x01
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 2",
                description = "Sink the 2 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x02
                       && LastBallID == 0x02
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 3",
                description = "Sink the 3 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x03
                       && LastBallID == 0x03
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 4",
                description = "Sink the 4 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x04
                       && LastBallID == 0x04
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 5",
                description = "Sink the 5 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x05
                       && LastBallID == 0x05
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 6",
                description = "Sink the 6 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x06
                       && LastBallID == 0x06
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 7",
                description = "Sink the 7 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x07
                       && LastBallID == 0x07
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 8",
                description = "Sink the 8 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x08
                       && LastBallID == 0x08
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 9",
                description = "Sink the 9 Ball when it's next",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x09
                       && LastBallID == 0x09
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Learning to Count: 10",
                description = "Sink the 10 Ball when it's next. If it's too difficult for you to count this high you can use your hands for visual help.",
                points = 1,
                trigger = ActivePlayerFlag == 0
                       && TargetBallID == 0x0a
                       && LastBallID == 0x0a
                       && prev(LastBallID) < LastBallID
                       && P2Flag == 0
)  

    achievement(title="Pocket Change",
                description = "Win a Pocket Game against the CPU",
                points = 5,
                trigger = P2Flag == 0
                       && VSModeFlag == 1
                       && GameModeFlag == 1
                       && ((SetPlayAmount == 0
                       && P1Score == 1
                       && prev(P1Score) == 0)
                       || (SetPlayAmount == 1
                       && P1Score == 2
                       && prev(P1Score) == 1)
                       || (SetPlayAmount == 2
                       && P1Score == 3
                       && prev(P1Score) == 2))
)  

    achievement(title="Money in the Bank",
                description = "Win a Pocket Game against the CPU in Best of 5 mode",
                points = 10,
                trigger = P2Flag == 0
                       && VSModeFlag == 1
                       && GameModeFlag == 1
                       && SetPlayAmount == 2
                       && P1Score == 3
                       && prev(P1Score) == 2
)  

    achievement(title="Hat Trick",
                description = "In any mode VS a CPU sink 3 balls in a row without letting P2 play",
                points = 10,
                trigger = ActivePlayerFlag == 0
                       && measured(tally(3,(prev(LastBallID) < LastBallID && ActivePlayerFlag == 0)))
                       && P2Flag == 0
                       && never(P2Flag == 1)
                       && never(ActivePlayerFlag == 1)

)  

RPChar = { 
                    0x00:"Tony",
                    0x01:"Pole",
                    0x02:"Misa",
                    0x03:"Riho",
                    0x04:"Cue"

                    }   

RPMode = { 
                    0x00:"Hustler",
                    0x01:"Pocket"

                    }                        

rich_presence_display(
    "• VS {0} • {1} - {2} • {3} Mode • Targeting Ball {4} •",
    rich_presence_lookup("RPChar", P2CharID, RPChar),
    rich_presence_value("P1Score", P1Score),
    rich_presence_value("P2Score", P2Score),
    rich_presence_lookup("RPMode", GameModeFlag, RPMode),
    rich_presence_value("TargetBall", TargetBallID)
)  