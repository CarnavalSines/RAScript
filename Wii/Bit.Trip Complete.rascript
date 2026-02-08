// Bit.Trip Complete
// #ID = 34618
// 20250928 Version - Sines

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

CurrentGame = dword_be(0xb2e5b4) // 00 beat | 01 core | 02 void | 03 runner | 04 fate | 05 flux | 06 main menu
function ChallengeCheck(FirstChallenge){

	result = 0
	totalClears = 0
	
    for i in range(0,19) {	
        address = FirstChallenge + (i*4)	
        result = result + bit1(address)
        totalClears = totalClears + 1
    }

	return result == totalClears
}

function prevChallengeCheck(FirstChallenge){


	result = 0
	totalClears = 0
	
    for i in range(0,19) {	
        address = FirstChallenge + (i*4)			
        result = result + prev(bit1(address))
        totalClears = totalClears + 1
    }

	return result == totalClears - 1
}


//////// Bit. Trip Beat
///Core
//Constant

Beat_Mode = dword_be(0x80e0dc)
Beat_Difficulty = dword_be(0xb2a098)
Beat_CurrentScore = dword_be(0xa27b40)
Beat_ScoreMulti = dword_be(0x80f238)

Beat_LevelID = dword_be(0xa1fc98)
Beat_ChallengeID = dword_be(0xa21e0c)
Beat_Streak = dword_be(0xa27b48)
Beat_ChallengeStart = dword_be(0xb29e88)
Beat_ChallengeEnd = dword_be(0xb29ed4)

Beat_LevelOneClear = byte(0xb2a640)
Beat_LevelTwoClear = byte(0xb2a641)
Beat_LevelThreeClear = byte(0xb2a642)

Beat_EasyScoreOne = dword_be(0xb2a0a4)
Beat_EasyScoreTwo = dword_be(0xb2a144)
Beat_EasyScoreThree = dword_be(0xb2a1e4)
Beat_NormalScoreOne = dword_be(0xb2a284)
Beat_NormalScoreTwo = dword_be(0xb2a324)
Beat_NormalScoreThree = dword_be(0xb2a3c4)
Beat_HardScoreOne = dword_be(0xb2a464)
Beat_HardScoreTwo = dword_be(0xb2a504)
Beat_HardScoreThree = dword_be(0xb2a5a4)

Beat_EasyPerfectOne = byte(0xb2a0a8)
Beat_EasyPerfectTwo = byte(0xb2a148)
Beat_EasyPerfectThree = byte(0xb2a1e8)
Beat_NormalPerfectOne = byte(0xb2a288)
Beat_NormalPerfectTwo = byte(0xb2a328)
Beat_NormalPerfectThree = byte(0xb2a3c8)
Beat_HardPerfectOne = byte(0xb2a468)
Beat_HardPerfectTwo = byte(0xb2a508)
Beat_HardPerfectThree = byte(0xb2a5a8)



    achievement(title="Escape From the Negative Zone",
                description = "[BEAT] Escape from the NETHER Mode",
                points = 1,
                trigger = CurrentGame == 0
                       && Beat_LevelID >= 0
                       && Beat_LevelID < 4
                       && Beat_CurrentScore > 0
                       && Beat_Mode == 1
                       && prev(Beat_Mode) == 2
)    

    achievement(title="Mega Evolution",
                description = "[BEAT] Enter MEGA Mode",
                points = 2,
                trigger = CurrentGame == 0
                       && Beat_LevelID >= 0
                       && Beat_LevelID < 4
                       && Beat_CurrentScore > 0
                       && Beat_Mode == 0
                       && prev(Beat_Mode) == 1
)    


    achievement(title="Crusty Juggler",
                description = "[BEAT] Get a 100 Beats streak",
                points = 5,
                trigger = CurrentGame == 0
                       && Beat_LevelID >= 0
                       && Beat_LevelID < 4
                       && Beat_CurrentScore > 0
                       && Beat_Streak >= 100
                       && prev(Beat_Streak) < 100
)    

    achievement(title="Listening to the Beat",
                description = "[BEAT] Clear the level Transition",
                points = 10,
                trigger = CurrentGame == 0
                       && Beat_LevelID == 0
                       && Beat_LevelOneClear == 1
                       && prev(Beat_LevelOneClear) == 0
)    

    achievement(title="Great Breakout",
                description = "[BEAT] Clear the level Descent",
                points = 10,
                trigger = CurrentGame == 0
                       && Beat_LevelID == 1
                       && Beat_LevelTwoClear == 1
                       && prev(Beat_LevelTwoClear) == 0
)    

    achievement(title="Pong Duel",
                description = "[BEAT] Clear the level Growth",
                points = 25,
                trigger = CurrentGame == 0
                       && Beat_LevelID == 2
                       && Beat_LevelThreeClear == 1
                       && prev(Beat_LevelThreeClear) == 0
)    

    achievement(title="I AM ONLY A MAN",
                description = "[BEAT] Complete every Challenges",
                points = 50,
                trigger = CurrentGame == 0
                       && Beat_LevelID == 3
                       && ChallengeCheck(0xb29e8b)
                       && prevChallengeCheck(0xb29e8b)
)  

    achievement(title="Requires Complete Perfection",
                description = "[BEAT] Perfect the level Transition",
                points = 100,
                trigger = CurrentGame == 0
                       && Beat_LevelID == 0
                       && ((Beat_EasyPerfectOne == 1 && prev(Beat_EasyPerfectOne) == 0)
                       || (Beat_NormalPerfectOne == 1 && prev(Beat_NormalPerfectOne) == 0)
                       || (Beat_HardPerfectOne == 1 && prev(Beat_HardPerfectOne) == 0)
                       )
                       
)    

    achievement(title="Grindy. Excessive. Pointless?",
                description = "[BEAT] Perfect the level Descent",
                points = 100,
                trigger = CurrentGame == 0
                       && Beat_LevelID == 1
                       && ((Beat_EasyPerfectTwo == 1 && prev(Beat_EasyPerfectTwo) == 0)
                       || (Beat_NormalPerfectTwo == 1 && prev(Beat_NormalPerfectTwo) == 0)
                       || (Beat_HardPerfectTwo == 1 && prev(Beat_HardPerfectTwo) == 0)
                       )
                       
)    

    achievement(title="No RNG Reliance, Great Purpose",
                description = "[BEAT] Perfect the level Growth",
                points = 100,
                trigger = CurrentGame == 0
                       && Beat_LevelID == 2
                       && ((Beat_EasyPerfectThree == 1 && prev(Beat_EasyPerfectThree) == 0)
                       || (Beat_NormalPerfectThree == 1 && prev(Beat_NormalPerfectThree) == 0)
                       || (Beat_HardPerfectThree == 1 && prev(Beat_HardPerfectThree) == 0)
                       )
                       
)    



//////// Bit. Trip Core

Core_ScoreMulti = dword_be(0x80d928)
Core_Mode = dword_be(0x80dc90)
Core_CurrentScore = dword_be(0xa17c8c)
Core_LevelID = dword_be(0xa1917c)
Core_Difficulty = dword_be(0xb2a648)
Core_ChallengeID = dword_be(0xa1b2f4)

Core_EasyScoreOne = dword_be(0xb2a654)
Core_EasyScoreTwo = dword_be(0xb2a6f4)
Core_EasyScoreThree = dword_be(0xb2a794)
Core_NormalScoreOne = dword_be(0xb2a834)
Core_NormalScoreTwo = dword_be(0xb2a8d4)
Core_NormalScoreThree = dword_be(0xb2a974)
Core_HardScoreOne = dword_be(0xb2aa14)
Core_HardScoreTwo = dword_be(0xb2aab4)
Core_HardScoreThree = dword_be(0xb2ab54)

Core_EasyPerfectOne = byte(0xb2a658)
Core_EasyPerfectTwo = byte(0xb2a6f8)
Core_EasyPerfectThree = byte(0xb2a798)
Core_NormalPerfectOne = byte(0xb2a838)
Core_NormalPerfectTwo = byte(0xb2a8d8)
Core_NormalPerfectThree = byte(0xb2a978)
Core_HardPerfectOne = byte(0xb2aa18)
Core_HardPerfectTwo = byte(0xb2aab8)
Core_HardPerfectThree = byte(0xb2ab58)

Core_LevelOneClear = byte(0xb2abf0)
Core_LevelTwoClear = byte(0xb2abf1)
Core_LevelThreeClear = byte(0xb2abf2)


    achievement(title="Support System",
                description = "[CORE] Escape from the NETHER Mode",
                points = 1,
                trigger = CurrentGame == 1
                       && Core_LevelID >= 0
                       && Core_LevelID < 4
                       && Core_CurrentScore > 0
                       && Core_Mode == 1
                       && prev(Core_Mode) == 0
)    

    achievement(title="Super Rhythm",
                description = "[CORE] Enter SUPER Mode",
                points = 5,
                trigger = CurrentGame == 1
                       && Core_LevelID >= 0
                       && Core_LevelID < 4
                       && Core_CurrentScore > 0
                       && Core_Mode == 3
                       && prev(Core_Mode) == 2
)  

    achievement(title="Grooving Zone",
                description = "[CORE] Get a score multiplier of 50",
                points = 5,
                trigger = CurrentGame == 1
                       && Core_LevelID >= 0
                       && Core_LevelID < 4
                       && Core_CurrentScore > 0
                       && Core_ScoreMulti >= 50
                       && prev(Core_ScoreMulti) < 50
)  

    achievement(title="Veridis Quo",
                description = "[CORE] Clear the level Discovery",
                points = 10,
                trigger = CurrentGame == 1
                       && Core_LevelID == 0
                       && Core_LevelOneClear == 1
                       && prev(Core_LevelOneClear) == 0
)   

    achievement(title="Hello World",
                description = "[CORE] Clear the level Exploration",
                points = 10,
                trigger = CurrentGame == 1
                       && Core_LevelID == 1
                       && Core_LevelTwoClear == 1
                       && prev(Core_LevelTwoClear) == 0
)   

    achievement(title="Space Asteroids",
                description = "[CORE] Clear the level Control",
                points = 25,
                trigger = CurrentGame == 1
                       && Core_LevelID == 2
                       && Core_LevelThreeClear == 1
                       && prev(Core_LevelThreeClear) == 0
)   

    achievement(title="I AM NOT ALONE",
                description = "[CORE] Complete every Challenges",
                points = 50,
                trigger = CurrentGame == 1
                       && Core_LevelID == 3
                       && ChallengeCheck(0xb29edb)
                       && prevChallengeCheck(0xb29edb)
)  

    achievement(title="Very Disco",
                description = "[CORE] Perfect the level Discovery",
                points = 100,
                trigger = CurrentGame == 1
                       && Core_LevelID == 0
                       && ((Core_EasyPerfectOne == 1 && prev(Core_EasyPerfectOne) == 0)
                       || (Core_NormalPerfectOne == 1 && prev(Core_NormalPerfectOne) == 0)
                       || (Core_HardPerfectOne == 1 && prev(Core_HardPerfectOne) == 0)
                       )
                       
)    

    achievement(title="City Defender",
                description = "[CORE] Perfect the level Exploration",
                points = 100,
                trigger = CurrentGame == 1
                       && Core_LevelID == 1
                       && ((Core_EasyPerfectTwo == 1 && prev(Core_EasyPerfectTwo) == 0)
                       || (Core_NormalPerfectTwo == 1 && prev(Core_NormalPerfectTwo) == 0)
                       || (Core_HardPerfectTwo == 1 && prev(Core_HardPerfectTwo) == 0)
                       )
                       
)    

    achievement(title="Independance",
                description = "[CORE] Perfect the level Control",
                points = 100,
                trigger = CurrentGame == 1
                       && Core_LevelID == 2
                       && ((Core_EasyPerfectThree == 1 && prev(Core_EasyPerfectThree) == 0)
                       || (Core_NormalPerfectThree == 1 && prev(Core_NormalPerfectThree) == 0)
                       || (Core_HardPerfectThree == 1 && prev(Core_HardPerfectThree) == 0)
                       )
                       
)    


//////// Bit. Trip Void

Void_Mode = dword_be(0x80be48)
Void_CurrentScore = dword_be(0xa0c190)
Void_Streak = dword_be(0xa0c198)
Void_LevelID = dword_be(0xa0df48)

Void_ChallengeID = dword_be(0xa0f424)
Void_Difficulty = dword_be(0xb2abf8)

Void_EasyScoreOne = dword_be(0xb2ac04)
Void_EasyScoreTwo = dword_be(0xb2aca4)
Void_NormalScoreThree = dword_be(0xb2ad44)
Void_NormalScoreOne = dword_be(0xb2ade4)
Void_NormalScoreTwo = dword_be(0xb2ae84)
Void_NormalScoreThree = dword_be(0xb2af24)
Void_HardScoreOne = dword_be(0xb2afc4)
Void_HardScoreTwo = dword_be(0xb2b064)
Void_HardScoreThree = dword_be(0xb2b104)

Void_EasyPerfectOne = byte(0xb2ac08)
Void_EasyPerfectTwo = byte(0xb2aca8)
Void_EasyPerfectThree = byte(0xb2ad48)
Void_NormalPerfectOne = byte(0xb2ade8)
Void_NormalPerfectTwo = byte(0xb2ae88)
Void_NormalPerfectThree = byte(0xb2af28)
Void_HardPerfectOne = byte(0xb2afc8)
Void_HardPerfectTwo = byte(0xb2b068)
Void_HardPerfectThree = byte(0xb2b108)

Void_LevelOneClear = byte(0xb2b1a0)
Void_LevelTwoClear = byte(0xb2b1a1)
Void_LevelThreeClear = byte(0xb2b1a2)

    achievement(title="The VOID Stares Back",
                description = "[VOID] Escape from the NETHER Mode",
                points = 1,
                trigger = CurrentGame == 2
                       && Void_LevelID >= 0
                       && Void_LevelID < 4
                       && Void_CurrentScore > 0
                       && Void_Mode == 1
                       && prev(Void_Mode) == 0
)    

    achievement(title="Ultra Instinct",
                description = "[VOID] Enter ULTRA Mode",
                points = 5,
                trigger = CurrentGame == 2
                       && Void_LevelID >= 0
                       && Void_LevelID < 4
                       && Void_CurrentScore > 0
                       && Void_Mode == 4
                       && prev(Void_Mode) == 3
)    

    achievement(title="Disgusting Greed",
                description = "[VOID] Catch 200 Black Dots in a row",
                points = 5,
                trigger = CurrentGame == 2
                       && Void_LevelID >= 0
                       && Void_LevelID < 4
                       && Void_CurrentScore > 0
                       && Void_Streak >= 200
                       && prev(Void_Streak) < 200
)    

    achievement(title="It Can Run Doom",
                description = "[VOID] Clear the level ID",
                points = 10,
                trigger = CurrentGame == 2
                       && Void_LevelID == 0
                       && Void_LevelOneClear == 1
                       && prev(Void_LevelOneClear) == 0
)   

    achievement(title="Therefore I Am",
                description = "[VOID] Clear the level Ego",
                points = 10,
                trigger = CurrentGame == 2
                       && Void_LevelID == 1
                       && Void_LevelTwoClear == 1
                       && prev(Void_LevelTwoClear) == 0
)   

    achievement(title="Social Butterfly",
                description = "[VOID] Clear the level Super-Ego",
                points = 25,
                trigger = CurrentGame == 2
                       && Void_LevelID == 2
                       && Void_LevelThreeClear == 1
                       && prev(Void_LevelThreeClear) == 0
)   

    achievement(title="I AM READY",
                description = "[VOID] Complete every Challenges",
                points = 50,
                trigger = CurrentGame == 2
                       && Void_LevelID == 3
                       && ChallengeCheck(0xb29f2b)
                       && prevChallengeCheck(0xb29f2b)
)  

    achievement(title="Self Discovery",
                description = "[VOID] Perfect the level ID",
                points = 100,
                trigger = CurrentGame == 2
                       && Void_LevelID == 0
                       && ((Void_EasyPerfectOne == 1 && prev(Void_EasyPerfectOne) == 0)
                       || (Void_NormalPerfectOne == 1 && prev(Void_NormalPerfectOne) == 0)
                       || (Void_HardPerfectOne == 1 && prev(Void_HardPerfectOne) == 0)
                       )
                       
)   

    achievement(title="I Am Thou, Thou Art I",
                description = "[VOID] Perfect the level Ego",
                points = 100,
                trigger = CurrentGame == 2
                       && Void_LevelID == 1
                       && ((Void_EasyPerfectTwo == 1 && prev(Void_EasyPerfectTwo) == 0)
                       || (Void_NormalPerfectTwo == 1 && prev(Void_NormalPerfectTwo) == 0)
                       || (Void_HardPerfectTwo == 1 && prev(Void_HardPerfectTwo) == 0)
                       )
                       
)   

    achievement(title="Breaking the 4th Wall",
                description = "[VOID] Perfect the level Super-Ego",
                points = 100,
                trigger = CurrentGame == 2
                       && Void_LevelID == 2
                       && ((Void_EasyPerfectThree == 1 && prev(Void_EasyPerfectThree) == 0)
                       || (Void_NormalPerfectThree == 1 && prev(Void_NormalPerfectThree) == 0)
                       || (Void_HardPerfectThree == 1 && prev(Void_HardPerfectThree) == 0)
                       )
                       
)   

//////// Bit. Trip Runner

Runner_ZoneID = dword_be(0xa283e4)
Runner_LevelID = dword_be(0xa283ec)
Runner_Difficulty = dword_be(0xb2b1a8)
Runner_ChallengeID = dword_be(0xa48d3c)

function DoublePerfectCheck(FirstChallenge){

	result = 0
	totalClears = 0
	
    for i in range(0,10) {	
        address = FirstChallenge + (i*28)	
        result = result + byte(address)
        totalClears = totalClears + 1
    }

	return result == totalClears
}

function prevDoublePerfectCheck(FirstChallenge){


	result = 0
	totalClears = 0
	
    for i in range(0,10) {	
        address = FirstChallenge + (i*28)			
        result = result + prev(byte(address))
        totalClears = totalClears + 1
    }

	return result == totalClears - 1
}
    achievement(title="Jump, Bit, Jump",
                description = "[RUNNER] Prove you have mastered the art of Jumping and clear Level 1-1",
                points = 2,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 0
                       && Runner_LevelID == 0
                       && (byte(0xb2b1ac) == 1
                       && prev(byte(0xb2b1ac)) == 0
                       || byte(0xb2b59c) == 1
                       && prev(byte(0xb2b59c)) == 0
                       || byte(0xb2b98c) == 1
                       && prev(byte(0xb2b98c)) == 0)
)    

    achievement(title="Slide, Bit, Slide",
                description = "[RUNNER] Show how good you are at Sliding and clear Level 1-3",
                points = 2,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 0
                       && Runner_LevelID == 2
                       && (byte(0xb2b1e4) == 1
                       && prev(byte(0xb2b1e4)) == 0
                       || byte(0xb2b5d4) == 1
                       && prev(byte(0xb2b5d4)) == 0
                       || byte(0xb2b9c4) == 1
                       && prev(byte(0xb2b9c4)) == 0)
)    

    achievement(title="Kick, Bit, Kick",
                description = "[RUNNER] Learn Kung-Fu and Kick your way through Level 1-5",
                points = 3,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 0
                       && Runner_LevelID == 4
                       && (byte(0xb2b21c) == 1
                       && prev(byte(0xb2b21c)) == 0
                       || byte(0xb2b60c) == 1
                       && prev(byte(0xb2b60c)) == 0
                       || byte(0xb2b9fc) == 1
                       && prev(byte(0xb2b9fc)) == 0)
)    

    achievement(title="Spring to Action",
                description = "[RUNNER] Acquire the power of Springs and clear Level 1-7",
                points = 3,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 0
                       && Runner_LevelID == 6
                       && (byte(0xb2b254) == 1
                       && prev(byte(0xb2b254)) == 0
                       || byte(0xb2b644) == 1
                       && prev(byte(0xb2b644)) == 0
                       || byte(0xb2ba34) == 1
                       && prev(byte(0xb2ba34)) == 0)
)    

    achievement(title="Escaping the Mines",
                description = "[RUNNER] Defeat Mingrawn Timbletot and complete Zone 1",
                points = 10,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 0
                       && Runner_LevelID == 0x0b
                       && (byte(0xb2b2e0) == 1
                       && prev(byte(0xb2b2e0)) == 0
                       || byte(0xb2b6d0) == 1
                       && prev(byte(0xb2b6d0)) == 0
                       || byte(0xb2bac0) == 1
                       && prev(byte(0xb2bac0)) == 0)
)    

    achievement(title="Don't Trip Bit Runner",
                description = "[RUNNER] Clear Level 2-3",
                points = 3,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 1
                       && Runner_LevelID == 2
                       && (byte(0xb2b334) == 1
                       && prev(byte(0xb2b334)) == 0
                       || byte(0xb2b724) == 1
                       && prev(byte(0xb2b724)) == 0
                       || byte(0xb2bb14) == 1
                       && prev(byte(0xb2bb14)) == 0)
)    

    achievement(title="Brisk Jog",
                description = "[RUNNER] Clear Level 2-7",
                points = 3,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 1
                       && Runner_LevelID == 6
                       && (byte(0xb2b3a4) == 1
                       && prev(byte(0xb2b3a4)) == 0
                       || byte(0xb2b794) == 1
                       && prev(byte(0xb2b794)) == 0
                       || byte(0xb2bb84) == 1
                       && prev(byte(0xb2bb84)) == 0)
)    

    achievement(title="Don't Ask Him about Capitalism",
                description = "[RUNNER] Defeat Non Trotski and complete Zone 2",
                points = 10,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 1
                       && Runner_LevelID == 0x0b
                       && (byte(0xb2b430) == 1
                       && prev(byte(0xb2b430)) == 0
                       || byte(0xb2b820) == 1
                       && prev(byte(0xb2b820)) == 0
                       || byte(0xb2bc10) == 1
                       && prev(byte(0xb2bc10)) == 0)
)   

    achievement(title="Third Strike Parry",
                description = "[RUNNER] Just say No and Block your way through Level 3-1",
                points = 3,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 2
                       && Runner_LevelID == 0
                       && (byte(0xb2b44c) == 1
                       && prev(byte(0xb2b44c)) == 0
                       || byte(0xb2b83c) == 1
                       && prev(byte(0xb2b83c)) == 0
                       || byte(0xb2bc2c) == 1
                       && prev(byte(0xb2bc2c)) == 0)
)    

    achievement(title="Meatboy Meet Bro",
                description = "[RUNNER] Witness a strange red creature and clear Level 3-7",
                points = 10,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 2
                       && Runner_LevelID == 6
                       && (byte(0xb2b4f4) == 1
                       && prev(byte(0xb2b4f4)) == 0
                       || byte(0xb2b8e4) == 1
                       && prev(byte(0xb2b8e4)) == 0
                       || byte(0xb2bcd4) == 1
                       && prev(byte(0xb2bcd4)) == 0)
)    

    achievement(title="Canabalting",
                description = "[RUNNER] Scale tall buildings and clear Zone 3",
                points = 10,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 2
                       && Runner_LevelID == 0x0b
                       && (byte(0xb2b580) == 1
                       && prev(byte(0xb2b580)) == 0
                       || byte(0xb2b970) == 1
                       && prev(byte(0xb2b970)) == 0
                       || byte(0xb2bd60) == 1
                       && prev(byte(0xb2bd60)) == 0)
)   

    achievement(title="POWER OF FRIENDSHIP",
                description = "[RUNNER] Complete every Challenges",
                points = 50,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 3
                       && ChallengeCheck(0xb29f7b)
                       && prevChallengeCheck(0xb29f7b)
)  

    achievement(title="Going Above Perfect",
                description = "[RUNNER] Double Perfect all of Zone 1 - Impetus in Hard Difficulty",
                points = 50,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 0
                       && DoublePerfectCheck(0xb2b98e)
                       && prevDoublePerfectCheck(0xb2b98e)
                       
)   

    achievement(title="Flat-Out Run of the Rhythm Alien",
                description = "[RUNNER] Double Perfect all of Zone 2 - Tenacity in Hard Difficulty",
                points = 50,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 1
                       && DoublePerfectCheck(0xb2bade)
                       && prevDoublePerfectCheck(0xb2bade)
                       
)   

    achievement(title="Making a Note Here: Huge Sucess",
                description = "[RUNNER] Double Perfect all of Zone 3 - Triumph in Hard Difficulty",
                points = 50,
                trigger = CurrentGame == 3
                       && Runner_ZoneID == 2
                       && DoublePerfectCheck(0xb2bc2e)
                       && prevDoublePerfectCheck(0xb2bc2e)
                       
)   

//////// Bit. Trip Fate
Fate_Mode = dword_be(0x807d98)
Fate_LevelID = dword_be(0x90c674)
Fate_ChallengeID = dword_be(0x931ad4)
Fate_Weapon = dword_be(0x9402e4)
Fate_CurrentScore = dword_be(0x95cdc8)
Fate_Difficulty = dword_be(0xb2bd7c)

Fate_EasyLevelOneClear = byte(0xb2bd80)
Fate_EasyLevelTwoClear = byte(0xb2bd9c)
Fate_EasyLevelThreeClear = byte(0xb2bdb8)
Fate_EasyLevelFourClear = byte(0xb2bdd4)
Fate_EasyLevelFiveClear = byte(0xb2bdf0)
Fate_EasyLevelSixClear = byte(0xb2be0c)
Fate_NormalLevelOneClear = byte(0xb2be28)
Fate_NormalLevelTwoClear = byte(0xb2be44)
Fate_NormalLevelThreeClear = byte(0xb2be60)
Fate_NormalLevelFourClear = byte(0xb2be7c)
Fate_NormalLevelFiveClear = byte(0xb2be98)
Fate_NormalLevelSixClear = byte(0xb2beb4)
Fate_HardLevelOneClear = byte(0xb2bed0)
Fate_HardLevelTwoClear = byte(0xb2beec)
Fate_HardLevelThreeClear = byte(0xb2bf08)
Fate_HardLevelFourClear = byte(0xb2bf24)
Fate_HardLevelFiveClear = byte(0xb2bf40)
Fate_HardLevelSixClear = byte(0xb2bf5c)

Fate_EasyScoreOne = dword_be(0xb2bd84)
Fate_EasyScoreTwo = dword_be(0xb2bda0)
Fate_EasyScoreThree = dword_be(0xb2bdbc)
Fate_EasyScoreFour = dword_be(0xb2bdd8)
Fate_EasyScoreFive = dword_be(0xb2bdf4)
Fate_EasyScoreSix = dword_be(0xb2be10)
Fate_NormalScoreOne = dword_be(0xb2be2c)
Fate_NormalScoreTwo = dword_be(0xb2be48)
Fate_NormalScoreThree = dword_be(0xb2be64)
Fate_NormalScoreFour = dword_be(0xb2be80)
Fate_NormalScoreFive = dword_be(0xb2be9c)
Fate_NormalScoreSix = dword_be(0xb2beb8)
Fate_HardScoreOne = dword_be(0xb2bed4)
Fate_HardScoreTwo = dword_be(0xb2bef0)
Fate_HardScoreThree = dword_be(0xb2bf0c)
Fate_HardScoreFour = dword_be(0xb2bf28)
Fate_HardScoreFive = dword_be(0xb2bf44)
Fate_HardScoreSix = dword_be(0xb2bf60)

Fate_EasyPerfectOne = byte(0xb2bd88)
Fate_EasyPerfectTwo = byte(0xb2bda4)
Fate_EasyPerfectThree = byte(0xb2bdc0)
Fate_EasyPerfectFour = byte(0xb2bddc)
Fate_EasyPerfectFive = byte(0xb2bdf8)
Fate_EasyPerfectSix = byte(0xb2be14)
Fate_NormalPerfectOne = byte(0xb2be30)
Fate_NormalPerfectTwo = byte(0xb2be4c)
Fate_NormalPerfectThree = byte(0xb2be68)
Fate_NormalPerfectFour = byte(0xb2be84)
Fate_NormalPerfectFive = byte(0xb2bea0)
Fate_NormalPerfectSix = byte(0xb2bebc)
Fate_HardPerfectOne = byte(0xb2bed8)
Fate_HardPerfectTwo = byte(0xb2bef4)
Fate_HardPerfectThree = byte(0xb2bf10)
Fate_HardPerfectFour = byte(0xb2bf2c)
Fate_HardPerfectFive = byte(0xb2bf48)
Fate_HardPerfectSix = byte(0xb2bf64)


    achievement(title="No Fate But What We Make Four Ourselves",
                description = "[FATE] Escape from the NETHER Mode",
                points = 1,
                trigger = CurrentGame == 4
                       && Fate_LevelID >= 0
                       && Fate_LevelID < 6
                       && Fate_CurrentScore > 0
                       && Fate_Mode == 1
                       && prev(Fate_Mode) == 0
)    

    achievement(title="Giga Impact",
                description = "[FATE] Power-up to GIGA Mode",
                points = 5,
                trigger = CurrentGame == 4
                       && Fate_LevelID >= 0
                       && Fate_LevelID < 6
                       && Fate_CurrentScore > 0
                       && Fate_Mode == 6
                       && prev(Fate_Mode) == 5
)    

    achievement(title="Full Length",
                description = "[FATE] Obtain the aid of Junior Melchkin",
                points = 1,
                trigger = CurrentGame == 4
                       && Fate_LevelID >= 0
                       && Fate_LevelID < 6
                       && Fate_CurrentScore > 0
                       && Fate_Weapon == 1
                       && prev(Fate_Weapon) == 0
)    

    achievement(title="Understand The Power of Love",
                description = "[FATE] Obtain the aid of CommanderGirlVideo",
                points = 1,
                trigger = CurrentGame == 4
                       && Fate_LevelID >= 0
                       && Fate_LevelID < 6
                       && Fate_CurrentScore > 0
                       && Fate_Weapon == 2
                       && prev(Fate_Weapon) == 0
)    

    achievement(title="Squishy Red Fellow",
                description = "[FATE] Obtain the aid of Meat Boy",
                points = 1,
                trigger = CurrentGame == 4
                       && Fate_LevelID >= 0
                       && Fate_LevelID < 6
                       && Fate_CurrentScore > 0
                       && Fate_Weapon == 3
                       && prev(Fate_Weapon) == 0
)    

    achievement(title="Benefits of Great Curves",
                description = "[FATE] Obtain the aid of Mr. Robotube",
                points = 1,
                trigger = CurrentGame == 4
                       && Fate_LevelID >= 0
                       && Fate_LevelID < 6
                       && Fate_CurrentScore > 0
                       && Fate_Weapon == 4
                       && prev(Fate_Weapon) == 0
)    

    achievement(title="Ambivalent Fate",
                description = "[FATE] Clear the level Determination",
                points = 5,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 0
                       && (Fate_EasyLevelOneClear == 1
                       && prev(Fate_EasyLevelOneClear) == 0
                       || Fate_NormalLevelOneClear == 1
                       && prev(Fate_NormalLevelOneClear) == 0
                       || Fate_HardLevelOneClear == 1
                       && prev(Fate_HardLevelOneClear) == 0)
)   

    achievement(title="Running Out",
                description = "[FATE] Clear the level Patience",
                points = 5,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 1
                       && (Fate_EasyLevelTwoClear == 1
                       && prev(Fate_EasyLevelTwoClear) == 0
                       || Fate_NormalLevelTwoClear == 1
                       && prev(Fate_NormalLevelTwoClear) == 0
                       || Fate_HardLevelTwoClear == 1
                       && prev(Fate_HardLevelTwoClear) == 0)
)   

    achievement(title="Empty Hand",
                description = "[FATE] Clear the level Desperation",
                points = 10,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 2
                       && (Fate_EasyLevelThreeClear == 1
                       && prev(Fate_EasyLevelThreeClear) == 0
                       || Fate_NormalLevelThreeClear == 1
                       && prev(Fate_NormalLevelThreeClear) == 0
                       || Fate_HardLevelThreeClear == 1
                       && prev(Fate_HardLevelThreeClear) == 0)
)   

    achievement(title="Rising Temperature",
                description = "[FATE] Clear the level Frustration",
                points = 10,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 3
                       && (Fate_EasyLevelFourClear == 1
                       && prev(Fate_EasyLevelFourClear) == 0
                       || Fate_NormalLevelFourClear == 1
                       && prev(Fate_NormalLevelFourClear) == 0
                       || Fate_HardLevelFourClear == 1
                       && prev(Fate_HardLevelFourClear) == 0)
)   

    achievement(title="End of Innocence",
                description = "[FATE] Clear the level Anger",
                points = 10,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 4
                       && (Fate_EasyLevelFiveClear == 1
                       && prev(Fate_EasyLevelFiveClear) == 0
                       || Fate_NormalLevelFiveClear == 1
                       && prev(Fate_NormalLevelFiveClear) == 0
                       || Fate_HardLevelFiveClear == 1
                       && prev(Fate_HardLevelFiveClear) == 0)
)   

    achievement(title="Pride Goeth Before",
                description = "[FATE] Clear the level Fall",
                points = 10,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 5
                       && (Fate_EasyLevelSixClear == 1
                       && prev(Fate_EasyLevelSixClear) == 0
                       || Fate_NormalLevelSixClear == 1
                       && prev(Fate_NormalLevelSixClear) == 0
                       || Fate_HardLevelSixClear == 1
                       && prev(Fate_HardLevelSixClear) == 0)
)   

    achievement(title="Silence Falls",
                description = "[FATE] Complete every Challenges",
                points = 50,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 7
                       && ChallengeCheck(0xb29fcb)
                       && prevChallengeCheck(0xb29fcb)
)  

    achievement(title="Trigger Happy",
                description = "[FATE] Perfect the level Determination",
                points = 10,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 0
                       && ((Fate_EasyPerfectOne == 1 && prev(Fate_EasyPerfectOne) == 0)
                       || (Fate_NormalPerfectOne == 1 && prev(Fate_NormalPerfectOne) == 0)
                       || (Fate_HardPerfectOne == 1 && prev(Fate_HardPerfectOne) == 0)
                       )
                       
)   

    achievement(title="Ambush Predator",
                description = "[FATE] Perfect the level Patience",
                points = 10,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 1
                       && ((Fate_EasyPerfectTwo == 1 && prev(Fate_EasyPerfectTwo) == 0)
                       || (Fate_NormalPerfectTwo == 1 && prev(Fate_NormalPerfectTwo) == 0)
                       || (Fate_HardPerfectTwo == 1 && prev(Fate_HardPerfectTwo) == 0)
                       )
                       
)   

    achievement(title="Spicing Up",
                description = "[FATE] Perfect the level Desperation",
                points = 10,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 2
                       && ((Fate_EasyPerfectThree == 1 && prev(Fate_EasyPerfectThree) == 0)
                       || (Fate_NormalPerfectThree == 1 && prev(Fate_NormalPerfectThree) == 0)
                       || (Fate_HardPerfectThree == 1 && prev(Fate_HardPerfectThree) == 0)
                       )
                       
)   

    achievement(title="Going Insane",
                description = "[FATE] Perfect the level Frustration",
                points = 25,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 3
                       && ((Fate_EasyPerfectFour == 1 && prev(Fate_EasyPerfectFour) == 0)
                       || (Fate_NormalPerfectFour == 1 && prev(Fate_NormalPerfectFour) == 0)
                       || (Fate_HardPerfectFour == 1 && prev(Fate_HardPerfectFour) == 0)
                       )
                       
)   

    achievement(title="Why Don't You Play The Game",
                description = "[FATE] Perfect the level Anger",
                points = 25,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 4
                       && ((Fate_EasyPerfectFive == 1 && prev(Fate_EasyPerfectFive) == 0)
                       || (Fate_NormalPerfectFive == 1 && prev(Fate_NormalPerfectFive) == 0)
                       || (Fate_HardPerfectFive == 1 && prev(Fate_HardPerfectFive) == 0)
                       )
                       
)   

    achievement(title="Git Gud? I'll Show You Git Gud!",
                description = "[FATE] Perfect the level Fall",
                points = 50,
                trigger = CurrentGame == 4
                       && Fate_LevelID == 5
                       && ((Fate_EasyPerfectSix == 1 && prev(Fate_EasyPerfectSix) == 0)
                       || (Fate_NormalPerfectSix == 1 && prev(Fate_NormalPerfectSix) == 0)
                       || (Fate_HardPerfectSix == 1 && prev(Fate_HardPerfectSix) == 0)
                       )
                       
)   


//////// Bit. Trip Flux
Flux_Mode = dword_be(0x815420)
Flux_CurrentScore = dword_be(0xaa8408)
Flux_LevelID = dword_be(0xaafc1c)
Flux_ChallengeID = dword_be(0xabab8c)
Flux_Streak = dword_be(0xaa840c)
Flux_Difficulty = dword_be(0xb2bf78)

Flux_EasyLevelOneClear = byte(0xb2bf7c)
Flux_EasyLevelTwoClear = byte(0xb2bfa0)
Flux_EasyLevelThreeClear = byte(0xb2bfc4)
Flux_NormalLevelOneClear = byte(0xb2c00c)
Flux_NormalLevelTwoClear = byte(0xb2c030)
Flux_NormalLevelThreeClear = byte(0xb2c054)
Flux_HardLevelOneClear = byte(0xb2c09c)
Flux_HardLevelTwoClear = byte(0xb2c0c0)
Flux_HardLevelThreeClear = byte(0xb2c0e4)

Flux_EasyScoreOne = dword_be(0xb2bf80)
Flux_EasyScoreTwo = dword_be(0xb2bfa4)
Flux_EasyScoreThree = dword_be(0xb2bfc8)
Flux_NormalScoreOne = dword_be(0xb2c010)
Flux_NormalScoreTwo = dword_be(0xb2c034)
Flux_NormalScoreThree = dword_be(0xb2c058)
Flux_HardScoreOne = dword_be(0xb2c0a0)
Flux_HardScoreTwo = dword_be(0xb2c0c4)
Flux_HardScoreThree = dword_be(0xb2c0e8)

Flux_EasyPerfectOne = byte(0xb2bf84)
Flux_EasyPerfectTwo = byte(0xb2bfa8)
Flux_EasyPerfectThree = byte(0xb2bfcc)
Flux_NormalPerfectOne = byte(0xb2c014)
Flux_NormalPerfectTwo = byte(0xb2c038)
Flux_NormalPerfectThree = byte(0xb2c05c)
Flux_HardPerfectOne = byte(0xb2c0a4)
Flux_HardPerfectTwo = byte(0xb2c0c8)
Flux_HardPerfectThree = byte(0xb2c0ec)


    achievement(title="Dust to Dust",
                description = "[FLUX] Escape from the NETHER Mode",
                points = 1,
                trigger = CurrentGame == 5
                       && Flux_LevelID >= 0
                       && Flux_LevelID < 3
                       && Flux_CurrentScore > 0
                       && Flux_Mode == 1
                       && prev(Flux_Mode) == 0
)    

    achievement(title="Meta Transcendence",
                description = "[FLUX] Escape from your mortal coil and reach META Mode",
                points = 5,
                trigger = CurrentGame == 5
                       && Flux_LevelID >= 0
                       && Flux_LevelID < 3
                       && Flux_CurrentScore > 0
                       && Flux_Mode == 7
                       && prev(Flux_Mode) == 6
)    

    achievement(title="Feels Like Home",
                description = "[FLUX] Get a 200 Beats Streak",
                points = 5,
                trigger = CurrentGame == 5
                       && Flux_LevelID >= 0
                       && Flux_LevelID < 3
                       && Flux_CurrentScore > 0
                       && Flux_Streak >= 200
                       && prev(Flux_Streak) < 200
)    

    achievement(title="The Great Fanny",
                description = "[FLUX] Clear the level Epiphany",
                points = 10,
                trigger = CurrentGame == 5
                       && Flux_LevelID == 0
                       && (Flux_EasyLevelOneClear == 1
                       && prev(Flux_EasyLevelOneClear) == 0
                       || Flux_NormalLevelOneClear == 1
                       && prev(Flux_NormalLevelOneClear) == 0
                       || Flux_HardLevelOneClear == 1
                       && prev(Flux_HardLevelOneClear) == 0)
)   

    achievement(title="As Ception Always Said",
                description = "[FLUX] Clear the level Perception",
                points = 10,
                trigger = CurrentGame == 5
                       && Flux_LevelID == 1
                       && (Flux_EasyLevelTwoClear == 1
                       && prev(Flux_EasyLevelTwoClear) == 0
                       || Flux_NormalLevelTwoClear == 1
                       && prev(Flux_NormalLevelTwoClear) == 0
                       || Flux_HardLevelTwoClear == 1
                       && prev(Flux_HardLevelTwoClear) == 0)
)   

    achievement(title="Sister From the Middle East",
                description = "[FLUX] Clear the level Catharsis",
                points = 10,
                trigger = CurrentGame == 5
                       && Flux_LevelID == 2
                       && (Flux_EasyLevelThreeClear == 1
                       && prev(Flux_EasyLevelThreeClear) == 0
                       || Flux_NormalLevelThreeClear == 1
                       && prev(Flux_NormalLevelThreeClear) == 0
                       || Flux_HardLevelThreeClear == 1
                       && prev(Flux_HardLevelThreeClear) == 0)
)   

    achievement(title="SIMPLY",
                description = "[FLUX] Complete every Challenges",
                points = 50,
                trigger = CurrentGame == 0
                       && Flux_LevelID == 5
                       && ChallengeCheck(0xb2a01b)
                       && prevChallengeCheck(0xb2a01b)
)  

    achievement(title="A Lesson Is Learned",
                description = "[FLUX] Perfect the level Epiphany",
                points = 100,
                trigger = CurrentGame == 5
                       && Flux_LevelID == 0
                       && ((Flux_EasyPerfectOne == 1 && prev(Flux_EasyPerfectOne) == 0)
                       || (Flux_NormalPerfectOne == 1 && prev(Flux_NormalPerfectOne) == 0)
                       || (Flux_HardPerfectOne == 1 && prev(Flux_HardPerfectOne) == 0)
                       )
                       
)   

    achievement(title="Life Is Simply",
                description = "[FLUX] Perfect the level Perception",
                points = 100,
                trigger = CurrentGame == 5
                       && Flux_LevelID == 1
                       && ((Flux_EasyPerfectTwo == 1 && prev(Flux_EasyPerfectTwo) == 0)
                       || (Flux_NormalPerfectTwo == 1 && prev(Flux_NormalPerfectTwo) == 0)
                       || (Flux_HardPerfectTwo == 1 && prev(Flux_HardPerfectTwo) == 0)
                       )
                       
)   

    achievement(title="There Is No Death",
                description = "[FLUX] Perfect the level Catharsis",
                points = 100,
                trigger = CurrentGame == 5
                       && Flux_LevelID == 2
                       && ((Flux_EasyPerfectThree == 1 && prev(Flux_EasyPerfectThree) == 0)
                       || (Flux_NormalPerfectThree == 1 && prev(Flux_NormalPerfectThree) == 0)
                       || (Flux_HardPerfectThree == 1 && prev(Flux_HardPerfectThree) == 0)
                       )
                       
)   

//////// RP Script

RPDifficulty = { 
                    0x00:"Easy",
                    0x01:"Normal",
                    0x02:"Hard"

                    }    



//// RP Beat
Beat_RPLevel = { 
                    0x00:"Transition",
                    0x01:"Descent",
                    0x02:"Growth"

                    }     



rich_presence_conditional_display(
    CurrentGame == 0 && Beat_LevelID < 3,
    "• Moving to the BEAT - {0} - {1} Difficulty • {2} •",
    rich_presence_lookup("BeatRPLevel", Beat_LevelID, Beat_RPLevel),
    rich_presence_lookup("RPDifficulty", Beat_Difficulty, RPDifficulty),
    rich_presence_value("Score", Beat_CurrentScore)
)

rich_presence_conditional_display(
    CurrentGame == 0 && Beat_LevelID == 3 && Beat_ChallengeID < 21,
    "• Moving to the BEAT - Challenge Mode - {0} •",
    rich_presence_value("ChallengeID", Beat_ChallengeID + 1)

)

rich_presence_conditional_display(
    CurrentGame == 0 && Beat_LevelID == 3 && Beat_ChallengeID > 20,
    "• Moving to the BEAT - Challenge Mode - Take Your Pick •"

)

rich_presence_conditional_display(
    CurrentGame == 0 && Beat_LevelID > 3 ,
    "• Moving to the BEAT •"

)

//// RP Core
Core_RPLevel = { 
                    0x00:"Discovery",
                    0x01:"Exploration",
                    0x02:"Control"

                    }   

rich_presence_conditional_display(
    CurrentGame == 1 && Core_LevelID < 3,
    "• Forming CORE values - {0} - {1} Difficulty • {2} •",
    rich_presence_lookup("CoreRPLevel", Core_LevelID, Core_RPLevel),
    rich_presence_lookup("RPDifficulty", Core_Difficulty, RPDifficulty),
    rich_presence_value("Score", Core_CurrentScore)
)

rich_presence_conditional_display(
    CurrentGame == 1 && Core_LevelID == 3 && Core_ChallengeID < 21,
    "• Forming CORE values - Challenge Mode - {0} •",
    rich_presence_value("ChallengeID", Core_ChallengeID + 1)

)

rich_presence_conditional_display(
    CurrentGame == 1 && Core_LevelID == 3 && Core_ChallengeID > 20,
    "• Forming CORE values - Challenge Mode - Take Your Pick •"

)

rich_presence_conditional_display(
    CurrentGame == 1 && Core_LevelID > 3 ,
    "• Forming CORE values •"

)


//// RP Void
Void_RPLevel = { 
                    0x00:"ID",
                    0x01:"Ego",
                    0x02:"Super-Ego"

                    }   

rich_presence_conditional_display(
    CurrentGame == 2 && Void_LevelID < 3,
    "• Staring at the empty VOID of your soul - {0} - {1} Difficulty • {2} •",
    rich_presence_lookup("VoidRPLevel", Void_LevelID, Void_RPLevel),
    rich_presence_lookup("RPDifficulty", Void_Difficulty, RPDifficulty),
    rich_presence_value("Score", Void_CurrentScore)
)

rich_presence_conditional_display(
    CurrentGame == 2 && Void_LevelID == 3 && Void_ChallengeID < 21,
    "• Staring at the empty VOID of your soul - Challenge Mode - {0} •",
    rich_presence_value("ChallengeID", Void_ChallengeID + 1)

)

rich_presence_conditional_display(
    CurrentGame == 2 && Void_LevelID == 3 && Void_ChallengeID > 20,
    "• Staring at the empty VOID of your soul - Challenge Mode - Take Your Pick •"

)

rich_presence_conditional_display(
    CurrentGame == 2 && Void_LevelID > 3 ,
    "• Staring at the empty VOID of your soul •"

)

//// RP Runner
  

rich_presence_conditional_display(
    CurrentGame == 3 && Runner_ZoneID < 3 && Runner_LevelID < 0x0b,
    "• Taking independance as a marathon RUNNER - {0}-{1} - {2} Difficulty •",
    rich_presence_value("ZoneID", Runner_ZoneID + 1),
    rich_presence_value("LevelID", Runner_LevelID + 1),
    rich_presence_lookup("RPDifficulty", Runner_Difficulty, RPDifficulty)
)

rich_presence_conditional_display(
    CurrentGame == 3 && Runner_ZoneID < 3 && Runner_LevelID == 0x0b,
    "• Taking independance as a marathon RUNNER - {0}-Boss - {1} Difficulty •",
    rich_presence_value("ZoneID", Runner_ZoneID + 1),
    rich_presence_lookup("RPDifficulty", Runner_Difficulty, RPDifficulty)
)

rich_presence_conditional_display(
    CurrentGame == 3 && Runner_ZoneID == 3 && Runner_ChallengeID < 21,
    "• Taking independance as a marathon RUNNER - Challenge Mode - {0} •",
    rich_presence_value("ChallengeID", Runner_ChallengeID + 1)

)

rich_presence_conditional_display(
    CurrentGame == 3 && Runner_ZoneID == 3 && Runner_ChallengeID > 20,
    "• Taking independance as a marathon RUNNER - Challenge Mode - Take Your Pick •"

)

rich_presence_conditional_display(
    CurrentGame == 3 && Runner_ZoneID > 3 ,
    "• Taking independance as a marathon RUNNER •"

)

//// RP Fate
Fate_RPLevel = { 
                    0x00:"Determination",
                    0x01:"Patience",
                    0x02:"Desperation",
                    0x03:"Frustration",
                    0x04:"Anger",
                    0x05:"Fall"

                    }   

rich_presence_conditional_display(
    CurrentGame == 4 && Fate_LevelID < 6,
    "• There's no running from FATE - {0} - {1} Difficulty • {2} •",
    rich_presence_lookup("FateRPLevel", Fate_LevelID, Fate_RPLevel),
    rich_presence_lookup("RPDifficulty", Fate_Difficulty, RPDifficulty),
    rich_presence_value("Score", Fate_CurrentScore)
)

rich_presence_conditional_display(
    CurrentGame == 4 && Fate_LevelID == 7 && Fate_ChallengeID < 21,
    "• There's no running from FATE - Challenge Mode - {0} •",
    rich_presence_value("ChallengeID", Fate_ChallengeID + 1)

)

rich_presence_conditional_display(
    CurrentGame == 4 && Fate_LevelID == 7 && Fate_ChallengeID > 20,
    "• There's no running from FATE - Challenge Mode - Take Your Pick •"

)

rich_presence_conditional_display(
    CurrentGame == 4 ,
    "• There's no running from FATE •"

)

//// RP Flux
Flux_RPLevel = { 
                    0x00:"Epiphany",
                    0x01:"Perception",
                    0x02:"Catharsis"

                    }   

rich_presence_conditional_display(
    CurrentGame == 5 && Flux_LevelID < 3,
    "• A full cycle, the FLUX of life - {0} - {1} Difficulty • {2} •",
    rich_presence_lookup("FluxRPLevel", Flux_LevelID, Flux_RPLevel),
    rich_presence_lookup("RPDifficulty", Flux_Difficulty, RPDifficulty),
    rich_presence_value("Score", Flux_CurrentScore)
)

rich_presence_conditional_display(
    CurrentGame == 5 && Fate_LevelID == 5 && Fate_ChallengeID < 21,
    "• A full cycle, the FLUX of life - Challenge Mode - {0} •",
    rich_presence_value("ChallengeID", Flux_ChallengeID + 1)

)

rich_presence_conditional_display(
    CurrentGame == 5 && Fate_LevelID == 5 && Fate_ChallengeID > 20,
    "• A full cycle, the FLUX of life - Challenge Mode - Take Your Pick •"

)

rich_presence_conditional_display(
    CurrentGame == 5 && Fate_LevelID > 3 ,
    "• A full cycle, the FLUX of life •"

)



rich_presence_display(
    "• A Complete Circle of Life, Death and Rebirth • "

)  