// America Oudan Ultra Quiz
// #ID = 20004
// 20260325 Version - Sines

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

Difficulty = word(0x2a52) //0xffff Normal, 0x0000 Easy
GoodAnswerCount = word(0x2c24)
NbQuestion = word(0x2c26)

StageID = word(0x2d02)
EventID = word(0x2c52)
AnswerState = word(0x2c54) // 0x01 Correct, 0x02 Wrong

Round2_JankenP1Score = word(0x0828)
Round4_NbFail = word(0x295a)
Round5_NbBall = word(0x2980)
Round7_Scoring = word(0x083a)
Round9_ShmupLife = word(0x2ce6)
Round9_ShmupScore = bcd(word(0x2cec))
Round10_Score = word(0x2c24)
BonusRound_Moles = word(0x2cca)

CharLetter1 = word(0x2a40)
CharLetter2 = word(0x2a42)
CharLetter3 = word(0x2a44)
CharLetter4 = word(0x2a46)

    achievement(title="Not Playing Around",
                description = "Win Round 1 in the Game Dome and start your journey",
                points = 1,
                trigger = StageID == 0x01
                       && prev(StageID) == 0x00
                       && NbQuestion == 0x05
    )

    achievement(title="Skill Solution",
                description = "Win the Rock, Paper, Scissors duel in Round 2 thanks to your great skill level",
                points = 2,
                trigger = StageID == 0x01
                       && prev(Round2_JankenP1Score) == 0x03
                       && Round2_JankenP1Score == 0x04
    )

    achievement(title="Flying Quiz Line",
                description = "Qualify in Round 3 while flying to the US",
                points = 2,
                trigger = StageID == 0x03
                       && prev(StageID) == 0x02
                       && GoodAnswerCount >= 20
    )

    achievement(title="Snooze Cruise",
                description = "Qualify in Round 3 with at least 25 good answers",
                points = 5,
                trigger = StageID == 0x03
                       && prev(StageID) == 0x02
                       && measured(GoodAnswerCount >=25, when=prev(StageID)==0x02)
    )

    achievement(title="Mud Monster",
                description = "Qualify in Round 4 and bounce away!",
                points = 3,
                trigger = StageID == 0x04
                       && prev(StageID) == 0x03
                       && GoodAnswerCount == 0x05
    )    

    achievement(title="Pristine Diver",
                description = "Qualify in Round 4 in 5 questions, without making any error or missing the target",
                points = 5,
                trigger = StageID == 0x04
                       && prev(StageID) == 0x03
                       && GoodAnswerCount == 0x05
                       && NbQuestion == 0x05
    )    

    achievement(title="Quiz Ball Run",
                description = "Qualify in Round 5 and keep the ball rolling to the next stage!",
                points = 5,
                trigger = StageID == 0x05
                       && prev(StageID) == 0x04
                       && GoodAnswerCount == 0x05
    )     

    achievement(title="This achievement hate you",
                description = "Qualify in Round 5 without losing any ball",
                points = 10,
                trigger = StageID == 0x05
                       && prev(StageID) == 0x04
                       && GoodAnswerCount == 0x05
                       && Round5_NbBall >= 0x02
    )     

    achievement(title="F-Null",
                description = "Qualify in Round 6 and keep on racing",
                points = 5,
                trigger = StageID == 0x06
                       && prev(StageID) == 0x05
                       && NbQuestion == 0x04
    )          

    achievement(title="Sharp Shoot",
                description = "Qualify in Round 7, eyes on the target now!",
                points = 5,
                trigger = StageID == 0x07
                       && prev(StageID) == 0x06
                       && NbQuestion >= 0x04
    )              

    achievement(title="Chicken Run",
                description = "Qualify in Round 8 by catching envelopes and running around like a chicken",
                points = 5,
                trigger = StageID == 0x08
                       && prev(StageID) == 0x07
                       && GoodAnswerCount == 0x05
    )                  

    achievement(title="Quiz'em Up",
                description = "Qualify in Round 9 and blast your way to the finale",
                points = 5,
                trigger = StageID == 0x09
                       && prev(StageID) == 0x08
                       && GoodAnswerCount >= 0x05
    )                      

    achievement(title="Gradius Who?",
                description = "Qualify in Round 9 with 2 remaining lives or more",
                points = 10,
                trigger = StageID == 0x09
                       && prev(StageID) == 0x08
                       && GoodAnswerCount >= 0x05
                       && Round9_ShmupLife >= 0x03
    )     

    achievement(title="Undisputed Quiz Master",
                description = "You Win!",
                points = 10,
                trigger = StageID == 0x0a
                       && prev(StageID) == 0x09
                       && Round10_Score >= 10
    )     

    achievement(title="Goffer Slapper",
                description = "Win the bonus whack-a-mole minigame and try to qualify this time",
                points = 10,
                trigger = EventID == 0x02
                       && prev(EventID) == 0x13
                       && BonusRound_Moles == 0
    )         



/// /// /// RP Script
RP_LevelID = {
    0x00: "in the Question Dome",
    0x01: "in Narita Airport",
    0x02: "in a Plane",
    0x03: "in Guam",
    0x04: "in San Jose",
    0x05: "in Nevada",
    0x06: "in Key West",
    0x07: "in Kentucky",
    0x08: "in Washington DC",
    0x09: "in New York",
    0x0a: "away"
}

RP_Difficulty = {
    0: "Easy",
    0xffff: "Normal"
}


rich_presence_conditional_display(CharLetter1 == 0x00 && CharLetter2 == 0x00 && CharLetter3 == 0x00 && CharLetter4 == 0x00,
    "• The International Quiz!  •"
)

rich_presence_display("• {0} Mode - Quizzing {1} for Round {2}  •",
    rich_presence_lookup("Difficulty", Difficulty, RP_Difficulty),
    rich_presence_lookup("LevelID", StageID, RP_LevelID),
    rich_presence_value("RoundID", StageID+1)
)
