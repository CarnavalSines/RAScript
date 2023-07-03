// Yamato
// #ID = 24565

// 20230703 Version - Sines

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

// $0001: [8 Bit] Input Flag
//        Bit 0 | Up
//        Bit 1 | Down
//        Bit 2 | Left
//        Bit 3 | Right
//        Bit 4 | B > Aerial Shot
//        Bit 5 | A > Naval Shot
// $0010: [8 Bit] Current Round Kill count (Stars)
//        0x00 on Round Start
//        0x0F last value before next Round
// $0013: [8 Bit] In Game Flag
//        00 > Main Menu
//        FF > In Game
// $004E: [8 Bit] Pause flag
//        00 > Normal
//        FF > Pause
// $0159: [8 Bit] P1 Score BCD * 10 000
// $015A: [8 Bit] P1 Score BCD * 100
// $015B: [8 Bit] P2 Score BCD * 1
// $015C: [8 Bit] P2 Score BCD * 10 000
// $015D: [8 Bit] P2 Score BCD * 100
// $015E: [8 Bit] P2 Score BCD * 1
// $018E: [8 Bit] Round Count BCD
// $01B1: [8 Bit] P1 Life Count
//        Start at 0x3
// $01B2: [8 Bit] P2 Life Count
//        Start at 0x3
//        Only true in 2P mode

///Core
//Constant
AerialShot = bit4(0x01)
NavalShot = bit5(0x01)

KillCount = byte(0x10)
CurrentRound = bcd(byte(0x18e))

InGame = byte(0x13)
P1Score = bcd(byte(0x159))*10000 + bcd(byte(0x15a))*100 + bcd(byte(0x15b))
P2Score = byte(0x15c)*10000 + byte(0x15d)*100 + byte(0x15e)

P1Life = byte(0x1b1)
P2Life = byte(0x1b2)

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable

//----------------
//Function
function SinglePlayerCheck() => P2Score == 0 && P2Life == 0
function GameOver() => InGame == 0 && prev(InGame) == 0xff
function Deathless() => P1Life < prev(P1Life)

//----------------

///Achievement Code
// Progression
achievement(title = "Getting the Hang of it",
                description = "Clear the first Round",
                points = 2,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 0x02
                         && prev(CurrentRound) == 0x01
                         && prev(KillCount) == 0x0f
                         
)

achievement(title = "First day of Battle",
                description = "Clear Round 3",
                points = 3,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 0x04
                         && prev(CurrentRound) == 0x03
                         && prev(KillCount) == 0x0f
                         
)

achievement(title = "Endurance Fight, the Second Day",
                description = "Clear Round 6",
                points = 5,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 0x07
                         && prev(CurrentRound) == 0x06
                         && prev(KillCount) == 0x0f
                         
)

achievement(title = "Third Day, Fuelled by Yakisoba-Pan",
                description = "Clear Round 9",
                points = 10,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 10
                         && prev(CurrentRound) == 9
                         && prev(KillCount) == 0x0f
                         
)

achievement(title = "By the Fourth Day you knew, the Fight is Everything",
                description = "Clear Round 12",
                points = 10,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 13
                         && prev(CurrentRound) == 12
                         && prev(KillCount) == 0x0f
                         
)

achievement(title = "48h Vigilance, Hemborger Distribution",
                description = "From start Clear Round 6 without dying once",
                points = 10,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 0x07
                         && prev(CurrentRound) == 0x06
                         && prev(KillCount) == 0x0f
                         && once(CurrentRound == 0x01 && P1Score == 0)
                         && never(Deathless())
                         
)

achievement(title = "True Sons of Japan",
                description = "From start Clear Round 9 without dying once",
                points = 25,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 10
                         && prev(CurrentRound) == 9
                         && prev(KillCount) == 0x0f
                         && once(CurrentRound == 0x01 && P1Score == 0)
                         && never(Deathless())
                         
)

achievement(title = "Dreaming of Yakisoba-Pan",
                description = "From start Clear Round 3 without dying once",
                points = 10,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 4
                         && prev(CurrentRound) == 3
                         && prev(KillCount) == 0x0f
                         && once(CurrentRound == 0x01 && P1Score == 0)
                         && never(Deathless())
                         
)
achievement(title = "Blue Water",
                description = "Clear the first Round using only the anti-ship shot",
                points = 2,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 0x02
                         && prev(CurrentRound) == 0x01
                         && prev(KillCount) == 0x0f
                         && once(P1Score == 0)
                         && never(AerialShot == 1)
                         
)

achievement(title = "Blue Sky",
                description = "Clear the first Round using only the anti-air shot",
                points = 3,
                trigger = 
                            InGame == 0xff
                         && SinglePlayerCheck()
                         && CurrentRound == 0x02
                         && prev(CurrentRound) == 0x01
                         && prev(KillCount) == 0x0f
                         && once(P1Score == 0)
                         && never(NavalShot == 1)
                         
)

// leaderboard
leaderboard(
    title = "High Score",
    description = "For the glory of Japan, show them how strong the Yamatos is",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = P1Score,
    format = "VALUE"
)   