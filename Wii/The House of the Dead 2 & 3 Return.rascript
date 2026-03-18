// The House of the Dead 2 & 3 Return
// #ID = 34724
// 20250316 Version - Sines

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

/// /// ///
/// House of the Dead 2
/// /// ///
GameIdentifier = byte(0x005b299f)

D2_InGameplayFlag = byte(0x500e3a)
D2_CurrentLife = byte(0x4078d7)
D2_P1score = dword_be(0x4078dc)
D2_Difficulty = byte(0x408fb0)
D2_LifeOption = byte(0x408fb1)
D2_CreditOption = byte(0x408fb2)

D2_CurrentMode = byte(0x500e39)
D2_StageClearFlag = byte(0x500fef)
D2_LevelID = byte(0x500ff7)
D2_SceneID = byte(0x500ff5)
D2_SubsceneID = byte(0x00500ff3)
D2_CreditRemaining = byte(0x407743)
D2_TotalCredit = byte(0x40774b)

D2_RescueNb_Stage1 = byte(0x409949)
D2_RescueNb_Stage2 = byte(0x40994b)
D2_RescueNb_Stage3 = byte(0x40994d)
D2_RescueNb_Stage4 = byte(0x40994f)
D2_RescueNb_FullRun = byte(0x500fdb)

D2_OGMode_RoganCostume = byte(0x40435a)
D2_OGMode_BrunoCostume = byte(0x40435b)
D2_OGMode_UFOItem = byte(0x40435f)
D2_OGMode_P1Item1 = byte(0x404368)
D2_OGMode_P1Item2 = byte(0x404369)

D2_BossMode_Stars_Judgement = byte(0x409af0)
D2_BossMode_Stars_HierophantA = byte(0x409af1)
D2_BossMode_Stars_HierophantB = byte(0x409af2)
D2_BossMode_Stars_TowerA = byte(0x409af3)
D2_BossMode_Stars_TowerB = byte(0x409af4)
D2_BossMode_Stars_StrengthA = byte(0x409af5)
D2_BossMode_Stars_StrengthB = byte(0x409af6)
D2_BossMode_Stars_Magician = byte(0x409af7)
D2_BossMode_Stars_Emperor = byte(0x409af8)
D2_BossMode_Stars_FightAll = byte(0x409af9)

D2_TrainingMode_CurrentStars = byte(0x500fc4)
D2_TrainingMode_CurrentMission = byte(0x500fc5)
D2_TrainingMode_Status = word_be(0x500fc8) // 0xffff during training, 0x0000 on success, 0x0001 on fail

D2_P2Shot = byte(0x00407c5d)

function D2_1CC_Check() =>
       D2_TotalCredit - D2_CreditRemaining == 1 
    && D2_TotalCredit != 0

function D2_P2Check() =>
       disable_when(D2_P2Shot > 0, until=(D2_LevelID == 0 && D2_SceneID == 0))

function D2_EventCheck(level, scene) =>
       D2_LevelID == level 
    && D2_SceneID == scene

/// Progression
    achievement(title="Shootin' Like It's 1998",
                description = "[HotD2] Complete Chapter 1 in Arcade mode Free Play and 2P Mode are blocked for the whole set.",
                points = 2,
                trigger = D2_LevelID == 1
                       && prev(D2_LevelID) == 0
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)   

    achievement(title="He Can’t Keep Getting Away With It",
                description = "[HotD2] Complete Chapter 2 in Arcade mode",
                points = 3,
                trigger = D2_LevelID == 2
                       && prev(D2_LevelID) == 1
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)   

    achievement(title="Cliffhanger",
                description = "[HotD2] Complete Chapter 3 in Arcade mode",
                points = 5,
                trigger = D2_LevelID == 3
                       && prev(D2_LevelID) == 2
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)   

    achievement(title="People of the AMS",
                description = "[HotD2] Complete Chapter 4 in Arcade mode",
                points = 5,
                trigger = D2_LevelID == 4
                       && prev(D2_LevelID) == 3
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
) 

    achievement(title="No Future",
                description = "[HotD2] Complete Chapter 5 in Arcade mode",
                points = 5,
                trigger = D2_LevelID == 5
                       && prev(D2_LevelID) == 4
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)   

    achievement(title="Protecting the Life Cycle",
                description = "[HotD2] Complete the Final Chapter in Arcade mode",
                points = 10,
                trigger = D2_LevelID == 6
                       && prev(D2_LevelID) == 5
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)   



/// /// /// Endings
    achievement(title="One Last Zombie",
                description = "[HotD2] Obtain the Zombie Ending in Arcade mode",
                points = 10,
                trigger = D2_LevelID == 9
                       && D2_SceneID == 0x07
                       && prev(D2_SceneID) == 0x06
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)   

    achievement(title="Group Celebration",
                description = "[HotD2] Obtain the Normal Ending in Arcade mode",
                points = 10,
                trigger = D2_LevelID == 9
                       && D2_SceneID == 0x07
                       && prev(D2_SceneID) == 0x04
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)  

    achievement(title="To the Next Battle",
                description = "[HotD2] Obtain the Good Ending in Arcade mode",
                points = 10,
                trigger = D2_LevelID == 9
                       && D2_SceneID == 0x07
                       && prev(D2_SceneID) == 0x05
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)  

/// /// /// Arcade Mode Alt Paths

    achievement(title="It's Not Easy Being Green",
                description = "[HotD2] Defeat the Hierophant A variant in Arcade mode",
                points = 2,
                trigger = D2_LevelID == 1
                       && D2_SceneID == 0x25
                       && D2_SubsceneID == 0x02
                       && prev(D2_SubsceneID) == 0x01
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
) 

    achievement(title="Emerald Splash",
                description = "[HotD2] Defeat the Hierophant B variant in Arcade mode",
                points = 2,
                trigger = D2_LevelID == 1
                       && D2_SceneID == 0x23
                       && D2_SubsceneID == 0x02
                       && prev(D2_SubsceneID) == 0x01
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
) 

    achievement(title="Headache",
                description = "[HotD2] Defeat the Tower A variant in Arcade mode",
                points = 2,
                trigger = D2_LevelID == 2
                       && D2_SceneID == 0x0b
                       && D2_SubsceneID == 0x02
                       && prev(D2_SubsceneID) == 0x01
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)

    achievement(title="Sand Rider",
                description = "[HotD2] Defeat the Tower B variant in Arcade mode",
                points = 2,
                trigger = D2_LevelID == 2
                       && D2_SceneID == 0x0d
                       && D2_SubsceneID == 0x02
                       && prev(D2_SubsceneID) == 0x01
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)

    achievement(title="Anonymous",
                description = "[HotD2] Defeat the Strength A variant in Arcade mode",
                points = 2,
                trigger = D2_LevelID == 3
                       && D2_SceneID == 0x17
                       && D2_SubsceneID == 0x02
                       && prev(D2_SubsceneID) == 0x01
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)

    achievement(title="Gladiator Duel",
                description = "[HotD2] Defeat the Strength B variant in Arcade mode",
                points = 2,
                trigger = D2_LevelID == 3
                       && D2_SceneID == 0x19
                       && D2_SubsceneID == 0x02
                       && prev(D2_SubsceneID) == 0x01
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)

/// /// /// Arcade Mode Challenges
    achievement(title="AMS Top G",
                description = "[HotD2] Complete Arcade mode on Very Hard difficulty",
                points = 10,
                trigger = D2_LevelID == 6
                       && prev(D2_LevelID) == 5
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_Difficulty == 0x04
                       && D2_P2Check()
                       && GameIdentifier == 0
)   

    achievement(title="Elite Beat Agent",
                description = "[HotD2] Complete Arcade mode on Very Hard difficulty without continuing (1CC)",
                points = 25,
                trigger = D2_LevelID == 6
                       && prev(D2_LevelID) == 5
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_Difficulty == 0x04
                       && D2_1CC_Check()
                       && D2_P2Check()
                       && GameIdentifier == 0
)   

    achievement(title="Protector of the Innocents",
                description = "[HotD2] Complete Chapter 1 in Arcade mode with 5 Civilians rescued",
                points = 3,
                trigger = D2_LevelID == 1
                       && prev(D2_LevelID) == 0
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_RescueNb_Stage1 == 5
                       && GameIdentifier == 0
)   

    achievement(title="City Panic",
                description = "[HotD2] Complete Chapter 2 in Arcade mode with 7 Civilians rescued",
                points = 5,
                trigger = D2_LevelID == 2
                       && prev(D2_LevelID) == 1
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_RescueNb_Stage2 == 7
                       && GameIdentifier == 0
)   

    achievement(title="Riverways Sweep",
                description = "[HotD2] Complete Chapter 3 in Arcade mode with 4 Civilians rescued",
                points = 5,
                trigger = D2_LevelID == 3
                       && prev(D2_LevelID) == 2
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_RescueNb_Stage3 == 4
                       && GameIdentifier == 0
)   

    achievement(title="Ruin Cleanup",
                description = "[HotD2] Complete Chapter 4 in Arcade mode with 3 Civilians rescued",
                points = 5,
                trigger = D2_LevelID == 4
                       && prev(D2_LevelID) == 3
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 0
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_RescueNb_Stage4 == 3
                       && GameIdentifier == 0
) 

/// /// /// Original Mode

    achievement(title="Emperor New Groove",
                description = "[HotD2] Complete the Final Chapter in Original mode",
                points = 10,
                trigger = D2_LevelID == 6
                       && prev(D2_LevelID) == 5
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 1
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && GameIdentifier == 0
)   

    achievement(title="The Power of Imagination",
                description = "[HotD2] Complete Original mode with the Toy Gun equipped",
                points = 5,
                trigger = D2_LevelID == 6
                       && prev(D2_LevelID) == 5
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 1
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && (D2_OGMode_P1Item1 == 0x0c
                       || D2_OGMode_P1Item2 == 0x0c)
                       && GameIdentifier == 0
)   

    achievement(title="Who Are You Again?",
                description = "[HotD2] Complete Original mode with a costume equipped",
                points = 5,
                trigger = D2_LevelID == 6
                       && prev(D2_LevelID) == 5
                       && D2_StageClearFlag == 1
                       && D2_CurrentMode == 1
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && ((D2_OGMode_P1Item1 > 0x15
                       && D2_OGMode_P1Item1 < 0x1d
                       )
                       || (D2_OGMode_P1Item2 > 0x15
                       && D2_OGMode_P1Item2 < 0x1d
                       ))
                       && GameIdentifier == 0
)  

    achievement(title="A Taste of the Future",
                description = "[HotD2] Find a Rogan Costume in Original mode",
                points = 5,
                trigger = D2_CurrentMode == 1
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_OGMode_RoganCostume == prev(D2_OGMode_RoganCostume) + 1
                       && D2_LevelID > 0
                       && GameIdentifier == 0
)   

    achievement(title="Explosive Potential",
                description = "[HotD2] Find a Bruno Costume in Original mode",
                points = 5,
                trigger = D2_CurrentMode == 1
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_OGMode_BrunoCostume == prev(D2_OGMode_BrunoCostume) + 1
                       && D2_LevelID > 0
                       && GameIdentifier == 0
)   

    achievement(title="Truth Is Out There",
                description = "[HotD2] Find a UFO?? item in Original mode",
                points = 5,
                trigger = D2_CurrentMode == 1
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_OGMode_UFOItem == prev(D2_OGMode_UFOItem) + 1
                       && GameIdentifier == 0
)  

/// /// /// Boss Mode
    achievement(title="Balancing the Scales",
                description = "[HotD2] Defeat Judgement in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_Judgement == 1
                       && prev(D2_BossMode_Stars_Judgement) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Blind Justice",
                description = "[HotD2] Defeat 5-Star Judgement in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_Judgement == 5
                       && prev(D2_BossMode_Stars_Judgement) == 4
                       && GameIdentifier == 0
) 

    achievement(title="Esoteric Swim",
                description = "[HotD2] Defeat Hierophant A in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_HierophantA == 1
                       && prev(D2_BossMode_Stars_HierophantA) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Sea of Corruption",
                description = "[HotD2] Defeat 5-Star Hierophant A in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_HierophantA == 5
                       && prev(D2_BossMode_Stars_HierophantA) == 4
                       && GameIdentifier == 0
) 

    achievement(title="Sure Footing",
                description = "[HotD2] Defeat Hierophant B in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_HierophantB == 1
                       && prev(D2_BossMode_Stars_HierophantB) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Master of the River",
                description = "[HotD2] Defeat 5-Star Hierophant B in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_HierophantB == 5
                       && prev(D2_BossMode_Stars_HierophantB) == 4
                       && GameIdentifier == 0
) 

    achievement(title="Cacophony",
                description = "[HotD2] Defeat Tower A in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_TowerA == 1
                       && prev(D2_BossMode_Stars_TowerA) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Sluggish Struggles",
                description = "[HotD2] Defeat 5-Star Tower A in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_TowerA == 5
                       && prev(D2_BossMode_Stars_TowerA) == 4
                       && GameIdentifier == 0
) 

    achievement(title="Infinite Knowledge",
                description = "[HotD2] Defeat Tower B in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_TowerB == 1
                       && prev(D2_BossMode_Stars_TowerB) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Leader of Change",
                description = "[HotD2] Defeat 5-Star Tower B in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_TowerB == 5
                       && prev(D2_BossMode_Stars_TowerB) == 4
                       && GameIdentifier == 0
) 

    achievement(title="You Like Movies About Gladiators?",
                description = "[HotD2] Defeat Strength A in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_StrengthA == 1
                       && prev(D2_BossMode_Stars_StrengthA) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Master of Arena",
                description = "[HotD2] Defeat 5-Star Strength A in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_StrengthA == 5
                       && prev(D2_BossMode_Stars_StrengthA) == 4
                       && GameIdentifier == 0
) 

    achievement(title="Inner Struggle",
                description = "[HotD2] Defeat Strength B in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_StrengthB == 1
                       && prev(D2_BossMode_Stars_StrengthB) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Headstrong",
                description = "[HotD2] Defeat 5-Star Strength B in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_StrengthB == 5
                       && prev(D2_BossMode_Stars_StrengthB) == 4
                       && GameIdentifier == 0
) 

    achievement(title="Red Bird",
                description = "[HotD2] Defeat Magician in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_Magician == 1
                       && prev(D2_BossMode_Stars_Magician) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Blast from the Past",
                description = "[HotD2] Defeat 5-Star Magician in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_Magician == 5
                       && prev(D2_BossMode_Stars_Magician) == 4
                       && GameIdentifier == 0
) 

    achievement(title="Usurper",
                description = "[HotD2] Defeat Emperor in Boss mode",
                points = 2,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_Emperor == 1
                       && prev(D2_BossMode_Stars_Emperor) == 0
                       && GameIdentifier == 0
) 

    achievement(title="True Ruler",
                description = "[HotD2] Defeat 5-Star Emperor in Boss mode",
                points = 3,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_Emperor == 5
                       && prev(D2_BossMode_Stars_Emperor) == 4
                       && GameIdentifier == 0
) 

    achievement(title="Endless Waves",
                description = "[HotD2] Defeat the Fight All gauntlet in Boss mode",
                points = 5,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_FightAll == 1
                       && prev(D2_BossMode_Stars_FightAll) == 0
                       && GameIdentifier == 0
) 

    achievement(title="Last Push",
                description = "[HotD2] Defeat the 5-Star Fight All gauntlet in Boss mode",
                points = 10,
                trigger = D2_CurrentMode == 2
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_BossMode_Stars_FightAll == 5
                       && prev(D2_BossMode_Stars_FightAll) == 4
                       && GameIdentifier == 0
) 

/// /// /// Training Mode
    achievement(title="Savior",
                description = "[HotD2] Clear Training 1 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x00
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Guardian Angel",
                description = "[HotD2] Clear the 5-Star Training 1 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x00
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

achievement(title="Sharpshooter",
                description = "[HotD2] Clear Training 2 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x01
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Surgical Strikes",
                description = "[HotD2] Clear the 5-Star Training 2 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x01
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Street Fighter",
                description = "[HotD2] Clear Training 3 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x02
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Barrel Blast",
                description = "[HotD2] Clear the 5-Star Training 3 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x02
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Game Over Frogger",
                description = "[HotD2] Clear Training 4 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x03
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Luck of the Draw",
                description = "[HotD2] Clear the 5-Star Training 4 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x03
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Cracked",
                description = "[HotD2] Clear Training 5 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x04
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Aura Pressure",
                description = "[HotD2] Clear the 5-Star Training 5 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x04
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Popping Balloons",
                description = "[HotD2] Clear Training 6 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x05
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Terminator",
                description = "[HotD2] Clear the 5-Star Training 6 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x05
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Eagle Eye",
                description = "[HotD2] Clear Training 7 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x06
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Death from Afar",
                description = "[HotD2] Clear the 5-Star Training 7 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x06
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Car Wash",
                description = "[HotD2] Clear Training 8 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x07
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="See You in House of the Dead 3!",
                description = "[HotD2] Clear the 5-Star Training 8 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x07
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Smart Training",
                description = "[HotD2] Clear Training 9 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x08
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Find Luigi",
                description = "[HotD2] Clear the 5-Star Training 9 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x08
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Lucky Gold",
                description = "[HotD2] Clear Training 10 in Training mode",
                points = 2,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x09
                       && D2_TrainingMode_CurrentStars == 0x00
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
) 

    achievement(title="Infinite Rotation",
                description = "[HotD2] Clear the 5-Star Training 10 in Training mode",
                points = 3,
                trigger = D2_CurrentMode == 3
                       && D2_CreditOption < 0x0a
                       && D2_P2Check()
                       && D2_TrainingMode_CurrentMission == 0x09
                       && D2_TrainingMode_CurrentStars == 0x04
                       && D2_TrainingMode_Status == 0x0000
                       && prev(D2_TrainingMode_Status) == 0xffff
                       && GameIdentifier == 0
)
/// /// ///
/// House of the Dead 3
/// /// ///

D3_InGameplayFlag = byte(0x5b283f) // 0x01 when entering a mode, 0x00 otherwise (including during HotD2)
D3_CurrentLife = dword_be(0x42f29c)
D3_P1Score = dword_be(0x42f2a4)
D3_P1RunRank = dword_be(0x42f2c0)
D3_CreditUsed = byte(0x42f2d3)

D3_Difficulty = byte(0x430280) // 0x02 is Normal (default), 0x04 is Very Hard
D3_LifeOption = byte(0x430282) // 0x02 is default of 3
D3_CreditOption = byte(0x430283) // Default of 0x05, 0x0a is Free Play

D3_ChapterID = byte(0x5b26dd)
D3_LevelID = byte(0x5b26df)
D3_SceneID = byte(0x5b26e1)
D3_SubsceneID = byte(0x5b26e3)

D3_ParkingFlag = byte(0x5b2721) // Parking if ON and LevelID == Parking
D3_DBR = byte(0x5b2722)
D3_L2Bio = byte(0x5b2723)
D3_EASTWing = byte(0x5b2724)

D3_RescueMode = byte(0x5b2773) // 0xff on normal game, 0x01 during Rescue event
D3_RescueRoomFlag = byte(0x5b2883)
D3_CrystalMult = byte(0x5b287b)

D3_TimeAttackTimer = dword_be(0x5b2814)
D3_CurrentMode = byte(0x5b283d)

D3_P2Shot = dword_be(0x42fa18)

function D3_AtLocation(level, scene, subscene) =>
       D3_LevelID == level 
    && D3_SceneID == scene 
    && D3_SubsceneID == subscene

function D3_P2Check() =>
       disable_when(D3_P2Shot > 0, until=(D3_AtLocation(0,0,0) && D3_P2Shot == 0))

/// Progression

    achievement(title="Running Out of Time",
                description = "[HotD3] Complete the Chapter 0 prologue in Arcade mode Free Play and 2P Mode are blocked for the whole set.",
                points = 2,
                trigger = D3_ChapterID == 1
                       && prev(D3_ChapterID) == 0
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Worried Daughter",
                description = "[HotD3] Complete Chapter 1 in Arcade mode",
                points = 3,
                trigger = D3_ChapterID == 2
                       && prev(D3_ChapterID) == 1
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Bewildered",
                description = "[HotD3] Complete Chapter 2 in Arcade mode",
                points = 5,
                trigger = D3_ChapterID == 3
                       && prev(D3_ChapterID) == 2
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Strained Bonds",
                description = "[HotD3] Complete Chapter 3 in Arcade mode",
                points = 5,
                trigger = D3_ChapterID == 4
                       && prev(D3_ChapterID) == 3
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Cartographer",
                description = "[HotD3] Complete Chapter 4 in Arcade mode",
                points = 5,
                trigger = D3_ChapterID == 5
                       && prev(D3_ChapterID) == 4
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Closing the Loop",
                description = "[HotD3] Complete Chapter 5 in Arcade mode",
                points = 5,
                trigger = D3_ChapterID == 6
                       && prev(D3_ChapterID) == 5
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

/// /// /// Endings

    achievement(title="Goodbye Father",
                description = "[HotD3] Obtain the Goodbye Father ending in any mode",
                points = 5,
                trigger = D3_ChapterID == 6
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1 || D3_CurrentMode == 2)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_AtLocation(7,2,1)
                       && prev(D3_SceneID) == 0x01
                       && prev(D3_SubsceneID) == 0x01
                       && D3_P2Check()
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Thriller",
                description = "[HotD3] Obtain the Zombie ending in any mode",
                points = 10,
                trigger = D3_ChapterID == 6
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1 || D3_CurrentMode == 2)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_AtLocation(7,3,1)
                       && prev(D3_SceneID) == 0x01
                       && prev(D3_SubsceneID) == 0x01
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Grand Theft Auto",
                description = "[HotD3] Obtain the Car ending in any mode",
                points = 10,
                trigger = D3_ChapterID == 6
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1 || D3_CurrentMode == 2)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_AtLocation(7,4,1)
                       && prev(D3_SceneID) == 0x01
                       && prev(D3_SubsceneID) == 0x01
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="True Purpose",
                description = "[HotD3] Obtain the Mystery Man ending in any mode",
                points = 25,
                trigger = D3_ChapterID == 6
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1 || D3_CurrentMode == 2)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_AtLocation(7,5,1)
                       && prev(D3_SceneID) == 0x01
                       && prev(D3_SubsceneID) == 0x01
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

/// /// /// Arcade Mode Alt Paths

    achievement(title="Front Entrance",
                description = "[HotD3] Go through the Entrance Path in Arcade mode",
                points = 2,
                trigger = D3_ChapterID == 2
                       && prev(D3_ChapterID) == 1
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 1
                       && D3_ParkingFlag == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Side Road",
                description = "[HotD3] Go through the Parking Path in Arcade mode",
                points = 2,
                trigger = D3_ChapterID == 2
                       && prev(D3_ChapterID) == 1
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 1
                       && D3_ParkingFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Intel Research",
                description = "[HotD3] Go through the EFI Genome Ward in Arcade mode",
                points = 2,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 2
                       && D3_DBR == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Playing the Fool",
                description = "[HotD3] Go through the DBR Institute in Arcade mode",
                points = 2,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 2
                       && D3_DBR == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Biohazard",
                description = "[HotD3] Go through the L3 Bio Lab in Arcade mode",
                points = 2,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 3
                       && D3_L2Bio == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Missing the Sun",
                description = "[HotD3] Go through the L2 Bio Plant in Arcade mode",
                points = 2,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 3
                       && D3_L2Bio == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="The Old West",
                description = "[HotD3] Go through the Information Systems Department WEST Wing in Arcade mode",
                points = 2,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 4
                       && D3_EASTWing == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Defying Death",
                description = "[HotD3] Go through the Information Systems Department EAST Wing in Arcade mode",
                points = 2,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 4
                       && D3_EASTWing == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

/// /// /// Arcade Mode Challenges

    achievement(title="Up for a Challenge",
                description = "[HotD3] Complete Arcade mode on Very Hard difficulty",
                points = 10,
                trigger = D3_ChapterID == 6
                       && prev(D3_ChapterID) == 5
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_Difficulty == 4
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Trigger Happy",
                description = "[HotD3] Complete Arcade mode without continuing (1CC)",
                points = 25,
                trigger = D3_ChapterID == 6
                       && prev(D3_ChapterID) == 5
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_CreditUsed == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Supreme Elite",
                description = "[HotD3] Complete Arcade mode with a SS Rank (Special Agent)",
                points = 50,
                trigger = D3_ChapterID == 6
                       && D3_CurrentMode == 0
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P1RunRank == 0
                       && prev(D3_P1RunRank) == 6
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

/// /// /// Extreme Mode & Challenges

    achievement(title="Wheel of Pain",
                description = "[HotD3] Complete Chapter 5 in Extreme mode",
                points = 10,
                trigger = D3_ChapterID == 6
                       && prev(D3_ChapterID) == 5
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Busting Open the Door",
                description = "[HotD3] Go through the Entrance path in Extreme mode",
                points = 3,
                trigger = D3_ChapterID == 2
                       && prev(D3_ChapterID) == 1
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 1
                       && D3_ParkingFlag == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Kansei Dorifto",
                description = "[HotD3] Go through the Parking path in Extreme mode",
                points = 3,
                trigger = D3_ChapterID == 2
                       && prev(D3_ChapterID) == 1
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 1
                       && D3_ParkingFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Lost Scholars",
                description = "[HotD3] Go through the EFI Genome Ward in Extreme mode",
                points = 3,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 2
                       && D3_DBR == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="It's the Circus",
                description = "[HotD3] Go through the DBR Institute in Extreme mode",
                points = 3,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 2
                       && D3_DBR == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Evil Citizens",
                description = "[HotD3] Go through the L3 Bio Lab in Extreme mode",
                points = 3,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 3
                       && D3_L2Bio == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Bushwacker",
                description = "[HotD3] Go through the L2 Bio Plant in Extreme mode",
                points = 3,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 3
                       && D3_L2Bio == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Stalker Problems",
                description = "[HotD3] Go through the Information Systems Department WEST Wing in Extreme mode",
                points = 3,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 4
                       && D3_EASTWing == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Do You Want to Live Forever?",
                description = "[HotD3] Go through the Information Systems Department EAST Wing in Extreme mode",
                points = 3,
                trigger = D3_ChapterID > prev(D3_ChapterID)
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_LevelID) == 4
                       && D3_EASTWing == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  


    achievement(title="Thrill Seeker",
                description = "[HotD3] Complete Extreme mode on Very Hard difficulty",
                points = 10,
                trigger = D3_ChapterID == 6
                       && prev(D3_ChapterID) == 5
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_Difficulty == 4
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="Extreme Lethality",
                description = "[HotD3] Complete Extreme mode without continuing (1CC)",
                points = 25,
                trigger = D3_ChapterID == 6
                       && prev(D3_ChapterID) == 5
                       && D3_CurrentMode == 1
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_CreditUsed == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

/// /// /// Time Attack Mode & Challenges

    achievement(title="No Fate but What We Make",
                description = "[HotD3] Complete Chapter 5 in Time Attack mode",
                points = 10,
                trigger = D3_ChapterID == 6
                       && prev(D3_ChapterID) == 5
                       && D3_CurrentMode == 2
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

    achievement(title="But the Future Refused to Change",
                description = "[HotD3] Complete Time Attack mode on Very Hard difficulty",
                points = 25,
                trigger = D3_ChapterID == 6
                       && prev(D3_ChapterID) == 5
                       && D3_CurrentMode == 2
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_Difficulty == 4
                       && D3_P2Check()
                       && GameIdentifier == 1
)    

/// /// /// Item Collection

function D3_ScoreIncreasedBy(amount) =>
    D3_P1Score >= prev(D3_P1Score) + amount
    && D3_P1Score <= prev(D3_P1Score) + (amount + 999)

Frog = 1000
MiniMage = 2000
MechaZombie = 3000

/// /// Bonus Life

    achievement(title="Life Hunter - Entrance",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Bonus Life item in the Entrance path",
                points = 1,
                trigger = D3_AtLocation(1,6,1)
                       && D3_CurrentLife == prev(D3_CurrentLife) + 1
                       && D3_RescueMode == 0xff
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_ParkingFlag == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Life Hunter - Parking",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Bonus Life item in the Parking path",
                points = 1,
                trigger = D3_AtLocation(1,2,5)
                       && D3_CurrentLife == prev(D3_CurrentLife) + 1
                       && D3_RescueMode == 0xff
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_ParkingFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Life Hunter - EFI Genome Ward",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Bonus Life item in the EFI Genome Ward path",
                points = 1,
                trigger = D3_AtLocation(2,0x0a,1)
                       && D3_CurrentLife == prev(D3_CurrentLife) + 1
                       && D3_RescueMode == 0xff
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_DBR == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Life Hunter - DBR Institute",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Bonus Life item in the DBR Institute path",
                points = 1,
                trigger = D3_AtLocation(2,5,1)
                       && D3_CurrentLife == prev(D3_CurrentLife) + 1
                       && D3_RescueMode == 0xff
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_DBR == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Life Hunter - WEST Wing",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Bonus Life item in the WEST Wing path",
                points = 1,
                trigger = D3_AtLocation(4,0x0f,1)
                       && D3_CurrentLife == prev(D3_CurrentLife) + 1
                       && D3_RescueMode == 0xff
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_EASTWing == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Life Hunter - EAST Wing",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Bonus Life item in the EAST Wing path",
                points = 1,
                trigger = (D3_AtLocation(4,5,1) || D3_AtLocation(4,6,1))
                       && D3_CurrentLife == prev(D3_CurrentLife) + 1
                       && D3_RescueMode == 0xff
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_EASTWing == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

/// /// Gold Frog

    achievement(title="Frogger - Chapter 1",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Gold Frog bonus item in Chapter 1",
                points = 1,
                trigger = D3_AtLocation(1,0,4)
                       && D3_ScoreIncreasedBy(Frog)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Frogger - DBR Institute",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Gold Frog bonus item in the DBR Institute path",
                points = 1,
                trigger = D3_AtLocation(2,4,3)
                       && D3_ScoreIncreasedBy(Frog)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_DBR == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Frogger - L3 Bio Lab",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Gold Frog bonus item in the L3 Bio Lab path",
                points = 1,
                trigger = D3_AtLocation(3,2,1)
                       && D3_ScoreIncreasedBy(Frog)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_L2Bio == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Frogger - L2 Bio Plant",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Gold Frog bonus item in the L2 Bio Plant path",
                points = 1,
                trigger = D3_AtLocation(3,0x0a,1)
                       && D3_ScoreIncreasedBy(Frog)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_L2Bio == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Frogger - WEST Wing",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Gold Frog bonus item in the WEST Wing path",
                points = 1,
                trigger = D3_AtLocation(4,0x10,1)
                       && D3_ScoreIncreasedBy(Frog)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_EASTWing == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Frogger - EAST Wing",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Gold Frog bonus item in the EAST Wing path",
                points = 1,
                trigger = D3_AtLocation(4,5,1)
                       && D3_ScoreIncreasedBy(Frog)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_EASTWing == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

/// /// Mini Magician

    achievement(title="AntiMage - Entrance",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Mini Magician bonus item in the Entrance path",
                points = 2,
                trigger = D3_AtLocation(1,5,1)
                       && D3_ScoreIncreasedBy(MiniMage)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_ParkingFlag == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="AntiMage - EFI Genome Ward",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Mini Magician bonus item in the EFI Genome Ward path",
                points = 2,
                trigger = D3_AtLocation(2,0x0b,1)
                       && D3_ScoreIncreasedBy(MiniMage)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_DBR == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="AntiMage - DBR Institute",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Mini Magician bonus item in the DBR Institute path",
                points = 2,
                trigger = D3_AtLocation(2,3,1)
                       && D3_ScoreIncreasedBy(MiniMage)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_DBR == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="AntiMage - L3 Bio Lab",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Mini Magician bonus item in the L3 Bio Lab path",
                points = 2,
                trigger = D3_AtLocation(3,5,1)
                       && D3_ScoreIncreasedBy(MiniMage)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_L2Bio == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="AntiMage - L2 Bio Plant",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Mini Magician bonus item in the L2 Bio Plant path",
                points = 2,
                trigger = D3_AtLocation(3,0x0d,1)
                       && D3_ScoreIncreasedBy(MiniMage)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_L2Bio == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="AntiMage - EAST Wing",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Mini Magician bonus item in the EAST Wing path",
                points = 2,
                trigger = D3_AtLocation(4,8,1)
                       && D3_ScoreIncreasedBy(MiniMage)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_EASTWing == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

/// /// Mecha Zombie

    achievement(title="Newtype - WEST Wing",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Mecha Zombie bonus item in the WEST Wing path",
                points = 3,
                trigger = D3_AtLocation(4,0x16,1)
                       && D3_ScoreIncreasedBy(MechaZombie)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_EASTWing == 0
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Newtype - Final Shooting",
                description = "[HotD3] In Arcade or Extreme mode, obtain the Mecha Zombie bonus item at the start of Chapter 5",
                points = 3,
                trigger = D3_AtLocation(5,0,3)
                       && D3_ScoreIncreasedBy(MechaZombie)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

/// /// /// Misc

    achievement(title="Knight Exemplar",
                description = "[HotD3] In Arcade or Extreme mode succeed every Rescue event and witness the Bonus room in Chapter 5",
                points = 10,
                trigger = D3_AtLocation(5,5,1)
                       && (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && prev(D3_SceneID) == 4
                       && D3_RescueRoomFlag == 1
                       && D3_P2Check()
                       && GameIdentifier == 1
)   

    achievement(title="Golden Spin",
                description = "[HotD3] In Arcade or Extreme mode spin a Crystal Coin to get a x15 multiplier displayed on screen",
                points = 5,
                trigger = (D3_CurrentMode == 0 || D3_CurrentMode == 1)
                       && D3_CreditOption < 0x0a
                       && D3_InGameplayFlag == 1
                       && D3_CrystalMult == 15
                       && prev(D3_CrystalMult) == 14
                       && D3_P2Check()
                       && GameIdentifier == 1
)  

    achievement(title="Elevator to Hell",
                description = "[HotD3] Complete the Elevator mini-game",
                points = 5,
                trigger = D3_CurrentMode == 0 
                       && D3_LevelID == 0x09
                       && D3_SubsceneID == 0x01
                       && prev(D3_SubsceneID) == 0x06
                       && GameIdentifier == 0
)  

/// /// /// /// /// /// /// /// ///
/// /// /// RP Script /// /// ///
/// /// /// /// /// /// /// /// ///

D2_RPMode = {
    0: "Arcade",
    1: "Original",
    2: "Boss",
    3: "Training",
    4: "Options",
    5: "Rankings",
    6: "Tutorial Movies",
    7: "Exit"
}

D2_RPLevels = {
    0: "Chapter 1: Prelude",
    1: "Chapter 2: Muddy",
    2: "Chapter 3: Darkness",
    3: "Chapter 4: Despair",
    4: "Chapter 5: Dawn",
    5: "Final Chapter: Original Sin",
    6: "Ending",
    7: "Ending"
}

D2_RPOriginalItem = {
    0x00: "Shotgun",
    0x01: "Machine Gun",
    0x02: "Grenade",
    0x03: "Power Up 1.2",
    0x04: "Power Up 1.5",
    0x05: "Power Up 2.0",
    0x06: "Bullet Blow",
    0x07: "Chamber +2",
    0x08: "Chamber +4",
    0x09: "Chamber +8",
    0x0a: "Chamber Inf",
    0x0b: "Custom Air Gun",
    0x0c: "Toy Gun",
    0x0d: "Bass Lure",
    0x0e: "Life +2",
    0x0f: "Life +5",
    0x10: "Credit +2",
    0x11: "Credit +5",
    0x12: "Credit +10",
    0x13: "Credit Inf",
    0x14: "Primitive Meat",
    0x15: "Rotten Meat",
    0x16: "Amy Costume",
    0x17: "Harry Costume",
    0x18: "Goldman Costume",
    0x19: "G Costume",
    0x1a: "Rogan Costume",
    0x1b: "Bruno Costume",
    0x1c: "Civilian Costume",
    0x1d: "Life 1/4",
    0x1e: "First Aid Kit",
    0x1f: "UFO??",
    0x20: "Double Score",
    0xff: "Empty"
}

D2_RPBoss = {
    0x00: "Judgement",
    0x01: "Hierophant A",
    0x02: "Hierophant B",
    0x03: "Tower A",
    0x04: "Tower B",
    0x05: "Strength A",
    0x06: "Strength B",
    0x07: "Magician",
    0x08: "Emperor",
    0x09: "Fight All"
}

D3_RPMode = {
    0: "Arcade",
    1: "Extreme",
    2: "Time Attack",
    3: "Options",
    4: "Rankings",
    5: "Tutorial Movies"
}

RPDifficulty = {
    0: "Very Easy",
    1: "Easy",
    2: "Normal",
    3: "Hard",
    4: "Very Hard"
}
rich_presence_conditional_display(GameIdentifier == 0 && D2_CurrentMode == 0,
    "• House of the Dead 2 • {0} Mode • AMS Agents are in the {1} • Score: {2} • {3} •",
    rich_presence_lookup("D2Mode", D2_CurrentMode, D2_RPMode),
    rich_presence_lookup("D2Chapter", D2_LevelID , D2_RPLevels),
    rich_presence_value("D2Score", D2_P1score),
    rich_presence_lookup("D2Difficulty", D2_Difficulty , RPDifficulty)
)

rich_presence_conditional_display(GameIdentifier == 0 && D2_CurrentMode == 1,
    "• House of the Dead 2 • {0} Mode • AMS Agents are in the {1} - Equipment: {4} * {5} • Score: {2} • {3} •",
    rich_presence_lookup("D2Mode", D2_CurrentMode, D2_RPMode),
    rich_presence_lookup("D2Chapter", D2_LevelID , D2_RPLevels),
    rich_presence_value("D2Score", D2_P1score),
    rich_presence_lookup("D2Difficulty", D2_Difficulty , RPDifficulty),
    rich_presence_lookup("D2OriginalItems", D2_OGMode_P1Item1, D2_RPOriginalItem),
    rich_presence_lookup("D2OriginalItems", D2_OGMode_P1Item2, D2_RPOriginalItem)
)

rich_presence_conditional_display(GameIdentifier == 0 && D2_CurrentMode == 2,
    "• House of the Dead 2 • {0} Mode • Fighting {1} - {2} Stars •",
    rich_presence_lookup("D2Mode", D2_CurrentMode, D2_RPMode),
    rich_presence_lookup("D2Boss", byte(0x500d09) , D2_RPBoss),
    rich_presence_value("D2BossStars", byte(0x501075)+1)
)

rich_presence_conditional_display(GameIdentifier == 0 && D2_CurrentMode == 3,
    "• House of the Dead 2 • {0} Mode • Fighting {1} - {2} Stars •",
    rich_presence_lookup("D2Mode", D2_CurrentMode, D2_RPMode),
    rich_presence_value("D2Training", byte(0x500fc5)+1),
    rich_presence_value("D2TrainingStars", byte(0x500fc4)+1)
)

rich_presence_conditional_display(GameIdentifier == 0 && D2_CurrentMode > 3,
    "• House of the Dead 2 •"
)

rich_presence_conditional_display(GameIdentifier == 1 && D3_CurrentMode == 0,
    "• House of the Dead 3 • {0} Mode • Lisa and G fighting for Mankind in Chapter {1} • Score: {2} • {3} •",
    rich_presence_lookup("D3Mode", D3_CurrentMode, D3_RPMode),
    rich_presence_value("D3Chapter", D3_ChapterID),
    rich_presence_value("D3Score", D3_P1Score),
    rich_presence_lookup("D3Difficulty", D3_Difficulty , RPDifficulty)
)

rich_presence_conditional_display(GameIdentifier == 1 && D3_CurrentMode == 1,
    "• House of the Dead 3 • {0} Mode • Lisa and G EXTREMELY fighting for Mankind in Chapter {1} • Score: {2} • {3} •",
    rich_presence_lookup("D3Mode", D3_CurrentMode, D3_RPMode),
    rich_presence_value("D3Chapter", D3_ChapterID),
    rich_presence_value("D3Score", D3_P1Score),
    rich_presence_lookup("D3Difficulty", D3_Difficulty , RPDifficulty)
)

rich_presence_conditional_display(GameIdentifier == 1 && D3_CurrentMode == 2,
    "• House of the Dead 3 • {0} Mode • Lisa and G fighting against the clock for Mankind in Chapter {1} • Score: {2} • {3} •",
    rich_presence_lookup("D3Mode", D3_CurrentMode, D3_RPMode),
    rich_presence_value("D3Chapter", D3_ChapterID),
    rich_presence_value("D3Score", D3_P1Score),
    rich_presence_lookup("D3Difficulty", D3_Difficulty , RPDifficulty)
)

rich_presence_conditional_display(GameIdentifier == 1 && D3_CurrentMode > 2,
    "• House of the Dead 3 •"
)

rich_presence_display("• The House(s) of the DEAD •"
)
