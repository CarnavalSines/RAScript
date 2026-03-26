// Mobile Suit Gundam: Char's Counterattack
// #ID = 20422
// 20260326 Version - Sines

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

ModeID = byte(0x604a8)

BattleMode_FightID = byte(0x604b9)
BattleMode_P1Machine = byte(0x604d0)
BattleMode_P1Pilot = byte(0x604d2)
BattleMode_P1Health = word(0x1237cc)
BattleMode_P2Health = word(0x1267e8)

StoryMode_MissionID = word(0x60558)
StoryMode_HighestMission = byte(0x60751)

ClearFlag = word(0x13682c)
AmuroClear = bit0(0x60750)
CharClear = bit1(0x60750)

/// /// /// Story Mode
/// Amuro Mode

    achievement(title="Back to Earth",
                description = "Clear Chapter 1 of Amuro Mode",
                points = 2,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x01
                       && prev(StoryMode_MissionID) == 0x00
    )

    achievement(title="Ghost of Solomon",
                description = "Clear Chapter 2 of Amuro Mode",
                points = 2,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x02
                       && prev(StoryMode_MissionID) == 0x01
    )    

    achievement(title="Last Shooting",
                description = "Clear Chapter 3 of Amuro Mode",
                points = 3,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x03
                       && prev(StoryMode_MissionID) == 0x02
    )

    achievement(title="Fifth Luna Incident",
                description = "Clear Chapter 4 of Amuro Mode",
                points = 3,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x04
                       && prev(StoryMode_MissionID) == 0x03
    )    

    achievement(title="Weight of Gravity",
                description = "Clear Chapter 5 of Amuro Mode",
                points = 5,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x05
                       && prev(StoryMode_MissionID) == 0x04
    )    

    achievement(title="Beyond the Time",
                description = "Clear Chapter 6 of Amuro Mode",
                points = 10,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x05
                       && AmuroClear == 0x01
                       && prev(AmuroClear) == 0x00
    )    

/// Char Mode

    achievement(title="Other Side",
                description = "Clear Chapter 1 of Char Mode",
                points = 2,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x07
                       && prev(StoryMode_MissionID) == 0x06
    )

    achievement(title="Motherly Loss",
                description = "Clear Chapter 2 of Char Mode",
                points = 3,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x08
                       && prev(StoryMode_MissionID) == 0x07
    )    

    achievement(title="End of the War",
                description = "Clear Chapter 3 of Char Mode",
                points = 3,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x09
                       && prev(StoryMode_MissionID) == 0x08
    )

    achievement(title="Technological Superiority",
                description = "Clear Chapter 4 of Char Mode",
                points = 5,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x0a
                       && prev(StoryMode_MissionID) == 0x09
    )    

    achievement(title="Extremely Wicked",
                description = "Clear Chapter 5 of Char Mode",
                points = 5,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x0b
                       && prev(StoryMode_MissionID) == 0x0a
    )    

    achievement(title="Mobius Strip",
                description = "Clear Chapter 6 of Char Mode",
                points = 10,
                trigger = prev(ModeID) == 0x01
                       && StoryMode_MissionID == 0x0b
                       && CharClear == 0x01
                       && prev(CharClear) == 0x00
    )  

/// /// /// Battle Mode    

    achievement(title="This Mobile Suit Is Not for Show!",
                description = "Complete Battle Mode piloting the Nu Gundam",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x00
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )  

    achievement(title="Red Ashes",
                description = "Complete Battle Mode piloting the Sazabi",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x01
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )  

    achievement(title="Aspiring Newtype",
                description = "Complete Battle Mode piloting the Jagd Doga",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x02
                       && BattleMode_P1Pilot == 0x04
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )  

    achievement(title="Pink Troubles",
                description = "Complete Battle Mode piloting Quess Paraya's Jagd Doga",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x02
                       && BattleMode_P1Pilot == 0x05
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )  

        achievement(title="Mechanic's Delight",
                description = "Complete Battle Mode piloting the ReGz",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x03
                       && BattleMode_P1Pilot == 0x07
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )  

        achievement(title="Superior Skill on Inferior Hardware",
                description = "Complete Battle Mode piloting Amuro Ray's ReGz",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x03
                       && BattleMode_P1Pilot == 0x06
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )      

        achievement(title="Fly Gundam!",
                description = "Complete Battle Mode piloting the RX-78-2 Gundam",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x04
                       && BattleMode_P1Pilot == 0x08
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )          

        achievement(title="Glimpse Into What Could Have Been",
                description = "Complete Battle Mode piloting the RX-78-3 G3 Gundam",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x04
                       && BattleMode_P1Pilot == 0x09
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )         

        achievement(title="Three Time Faster",
                description = "Complete Battle Mode piloting Char's Zaku II",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x05
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )             

        achievement(title="Boosted Performance",
                description = "Complete Battle Mode piloting Char's Gelgoog",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x06
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )                 

        achievement(title="Legs in Option",
                description = "Complete Battle Mode piloting the Zeong",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x07
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )                     

        achievement(title="Watch Out, He is a CHAR",
                description = "Complete Battle Mode piloting the Hyaku Shiki",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x08
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )                     

        achievement(title="Never Going to Give You Up",
                description = "Complete Battle Mode piloting the Rick Dom",
                points = 5,
                trigger = ModeID == 0x02
                       && BattleMode_FightID == 0x08
                       && BattleMode_P1Machine == 0x09
                       && BattleMode_P1Health > 0
                       && BattleMode_P2Health == 0
                       && ClearFlag == 1
                       && prev(ClearFlag) == 0
    )     

/// RP Script
RP_MachineID = {
    0x00: "the Nu Gundam",
    0x01: "the Sazabi",
    0x02: "Jagd Doga",
    0x03: "ReGz",
    0x04: "RX-78-2 Gundam",
    0x05: "Char's Zaku II",
    0x06: "Char's Gelgoog",
    0x07: "the Zeong",
    0x08: "the Hyaku Shiki",
    0x09: "Char's Rick Dom"
}

RP_Mode = {
    0: "Main Menu",
    1: "Story Mode",
    2: "Battle Mode",
    3: "2P Battle Mode"
}

rich_presence_conditional_display(ModeID == 1 && StoryMode_MissionID >= 0 && StoryMode_MissionID < 6,
    "• {0} - Amuro is struggling in Chapter {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("MissionID", StoryMode_MissionID +1)
)

rich_presence_conditional_display(ModeID == 1 && StoryMode_MissionID >= 6,
    "• {0} - Char is laughing at you in Chapter {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("MissionID", StoryMode_MissionID -5)
)

rich_presence_conditional_display(ModeID == 2 && BattleMode_P1Machine == 2 && BattleMode_P1Pilot == 0x04,
    "• {0} - Piloting Gyuney's Jagd Doga in fight {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("FightID", BattleMode_FightID +1)
)

rich_presence_conditional_display(ModeID == 2 && BattleMode_P1Machine == 2 && BattleMode_P1Pilot == 0x05,
    "• {0} - Piloting Quess Paraya's Jagd Doga in fight {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("FightID", BattleMode_FightID +1)
)

rich_presence_conditional_display(ModeID == 2 && BattleMode_P1Machine == 3 && BattleMode_P1Pilot == 0x06,
    "• {0} - Piloting Amuro Ray's ReGz in fight {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("FightID", BattleMode_FightID +1)
)

rich_presence_conditional_display(ModeID == 2 && BattleMode_P1Machine == 3 && BattleMode_P1Pilot == 0x07,
    "• {0} - Piloting Kayra Sue's ReGz in fight {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("FightID", BattleMode_FightID +1)
)

rich_presence_conditional_display(ModeID == 2 && BattleMode_P1Machine == 4 && BattleMode_P1Pilot == 0x08,
    "• {0} - Piloting the RX-78-2 Gundam in fight {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("FightID", BattleMode_FightID +1)
)

rich_presence_conditional_display(ModeID == 2 && BattleMode_P1Machine == 4 && BattleMode_P1Pilot == 0x09,
    "• {0} - Piloting the RX-78-3 G3 Gundam in fight {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("FightID", BattleMode_FightID +1)
)

rich_presence_conditional_display(ModeID == 2 && BattleMode_P1Machine < 10 ,
    "• {0} - Piloting {2} in fight {1} •",
    rich_presence_lookup("RPMode", ModeID, RP_Mode),
    rich_presence_value("FightID", BattleMode_FightID +1),
    rich_presence_lookup("MachineID", BattleMode_P1Machine, RP_MachineID)
)

rich_presence_display("• When you attack the Char, the Char's Strike Back"
)