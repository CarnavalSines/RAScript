// Super Dimension Fortress Macross
// #ID = 24689

// 20230625 Version - Sines

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

// $0000: [8 Bit] Lower 4 | BCD Score * 10000
//        Also 00 on Menu screen > Upper 4 at 1 InGame
// $0001: [8 Bit] Lower 4 | BCD Score * 1000
// $0002: [8 Bit] Lower 4 | BCD Score * 100
// $0003: [8 Bit] Lower 4 | BCD Score * 10
// $0004: [8 Bit] Lower 4 | BCD Score * 1
// $0017: [8 Bit] Lower 4 | BCD Ship Countdown * 100
//        Upper 4 | 00 on regular gameplay, 1 in Zentradi Ship
// $0018: [8 Bit] Lower 4 | BCD Ship Countdown * 10
// $0019: [8 Bit] Lower 4 | BCD Ship Countdown * 1
// $00DC: [8 Bit] Life Counter
//        0x05 > Main Menu / Game Over
//        0x24 > 3 Ship remaining
//        0x23 > 2 Ship remaining
//        0x22 > 1 Ship remaining
//        0x21 > No Ship remaining
//        0x30 > Explosion with no Ship remaining
// $02F2: [8 Bit] Zentradi ship ready to be boarded
//        0x20 > Normal Phase
//        0x40 > Ready to be boarded (goes to 0xa0 briefly before)

///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


//----------------
//Variable

Score = low4(0x00)*10000 + low4(0x01)*1000 + low4(0x02)*100 + low4(0x03)*10 + low4(0x04)
Countdown = low4(0x17)*100 + low4(0x18)*10 + low4(0x19)
InGame = high4(0x00) == 1
InShip = high4(0x17) 
LifeCount = byte(0xdc) 

//----------------
//Function

function GameOver() => Score > 0 && InGame && byte(0xdc) == 0x30

//----------------
//Achievements

achievement(title = "Shooting Gallery",
                description = "Reach 500 Points while staying outside Zentradi Ships only and without dying",
                points = 2,
                trigger = 
                            InGame
                         && trigger_when(prev(Score) < 500
                         && Score >= 500)
                         && never(InShip == 1) 
                         && once(Score == 0)
                         && never(LifeCount != 0x24)
                         
)

achievement(title = "Space Ace",
                description = "Reach 1 000 Points while staying outside Zentradi Ships only and without dying",
                points = 3,
                trigger = 
                            InGame
                         && trigger_when(prev(Score) < 1000
                         && prev(Score) > 500 // used for the trigger icon
                         && Score >= 1000)
                         && never(InShip == 1) 
                         && once(Score == 0)
                         && never(LifeCount != 0x24)
                         
)

achievement(title = "Disco Party",
                description = "Destroy your first Zentradi Ship reactor",
                points = 2,
                trigger = 
                            InGame
                         && InShip == 1
                         && Score == prev(Score) + 300
                         
)

achievement(title = "Do you Remember Love ?",
                description = "Destroy your first Zentradi Ship and escape succesfully",
                points = 3,
                trigger = 
                            InGame
                         && InShip == 0
                         && prev(InShip) == 1
                         && Score >= prev(Score) + 100 // Escaping ship reward time remaining * 100, 1 being the minimum. Regular enemies are worth 20pts so they should not interfere
                         && prev(Countdown) < 100 // Avoid triggering on reactor kill

                         
)

achievement(title = "Fire Bomber",
                description = "Destroy two Zentradi Ship without dying",
                points = 5,
                trigger = 
                            InGame
                         && tally(2,InShip == 0
                         && prev(InShip) == 1
                         && Score >= prev(Score) + 100 // Escaping ship reward time remaining * 100, 1 being the minimum. Regular enemies are worth 20pts so they should not interfere
                         && prev(Countdown) < 100 // Avoid triggering on reactor kill
                         )
                         && LifeCount == 0x24

                         
)

achievement(title = "Galactic Fairy",
                description = "Destroy three Zentradi Ship without dying",
                points = 10,
                trigger = 
                            InGame
                         && tally(3,InShip == 0
                         && prev(InShip) == 1
                         && Score >= prev(Score) + 100 // Escaping ship reward time remaining * 100, 1 being the minimum. Regular enemies are worth 20pts so they should not interfere
                         && prev(Countdown) < 100 // Avoid triggering on reactor kill
                         )
                         && LifeCount == 0x24

                         
)

achievement(title = "Sound Force",
                description = "Reach 5 000 Points without dying",
                points = 5,
                trigger = 
                            InGame
                         && prev(Score) < 5000
                         && Score >= 5000
                         && LifeCount == 0x24

                         
)

achievement(title = "Skull Squadron",
                description = "Reach 20 000 Points",
                points = 10,
                trigger = 
                            InGame
                         && prev(Score) < 10000
                         && Score >= 10000


                         
)

achievement(title = "Virtuous Mission",
                description = "Destroy a Zentradi Ship reactor without killing any enemies",
                points = 25,
                trigger = 
                            InGame
                         && InShip == 1 
                         && once(repeated(5,InShip == 0) // anti flicker measure
                         && Score == prev(Score) + 300) // Reactor killed
                         && never(Score == prev(Score)+20) // Reset if killing an enemy 


                         
)

achievement(title = "PROTOCULTURE !",
                description = "Destroy a Zentradi Ship reactor and succesfully escape with 50sec or more remaining on the time",
                points = 25,
                trigger = 
                            InGame
                         && InShip == 0
                         && prev(InShip) == 1
                         && Score >= prev(Score) + 5000 // 50sec * 100 = 5000 minimum


                         
)


// Leaderboard 
leaderboard(
    title = "HighScore",
    description = "Save the human race !",
    start  = GameOver(),
    cancel = always_false(),
    submit = always_true(),
    value = Score,
    format = "VALUE"
)   
