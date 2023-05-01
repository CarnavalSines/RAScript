// ~Homebrew~ Wreckman
// #ID = 24160

// 20230501 Version - Sines

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

// $07981F: [8 Bit] Game State
//          01 > "Ready!" Prompt on game start and respawn
//          02 > In Game
//          03 / 04 > Dying
//          05 > Game Over
// $079820: [8 Bit] Board number
//          Start at 01, increase by 1 every new board
//          In hexa
// $079824: [32 Bit] Life Count
//          In game display max out at 4 but can have a higher value
//          Game Over when 0x01>0x00
// $079844: [32 Bit] Score
// $07A934: [8 Bit] Invicibility indicator
//          01 > Normal
//          06 > Can "eat" cars

///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable
Score = dword(0x079844)
GameState = byte(0x07981F)
InGame = GameState == 2
GameOver = GameState == 5

LifeCounter = dword(0x079824)
CurrentBoard = byte(0x079820)
//----------------
//Function
function FruitCheck(Points) => Score == (prev(Score) + Points )

//----------------

///Achievement Code
 achievement(title = "The First Run",
                description = "Clear the first board",
                points = 5,
                trigger = 
                (   LifeCounter > 0
                 && prev(CurrentBoard) == 1
                 && CurrentBoard == 2
                )
                )
                
 achievement(title = "Straight Road",
                description = "Clear the fifth board",
                points = 10,
                trigger = 
                (   LifeCounter > 0
                 && prev(CurrentBoard) == 5
                 && CurrentBoard == 6
                )
                )      
                
 achievement(title = "Seasoned Rider",
                description = "Clear the tenth board",
                points = 10,
                trigger = 
                (   LifeCounter > 0
                 && prev(CurrentBoard) == 10
                 && CurrentBoard == 11
                )
                )                
                
 achievement(title = "Et Tutti Frutti",
                description = "Clear board 15",
                points = 25,
                trigger = 
                (   LifeCounter > 0
                 && prev(CurrentBoard) == 15
                 && CurrentBoard == 16
                )
                )                
 
 achievement(title = "Big 50",
                description = "Reach a Score of at least 50k",
                points = 10,
                trigger = 
                (   LifeCounter > 0
                 && prev(Score) < 50000
                 && Score >= 50000
                )
                ) 
                
 achievement(title = "Big 100",
                description = "Reach a Score of at least 100k",
                points = 25,
                trigger = 
                (   LifeCounter > 0
                 && prev(Score) < 100000
                 && Score >= 100000
                )
                )                 
                
 achievement(title = "Clean Driving [m]",
                description = "Clear the first board without crashing once",
                points = 5,
                trigger = 
                (   once(Score == 0) 
                 && prev(CurrentBoard) == 1
                 && CurrentBoard == 2
                 && never(LifeCounter < prev(LifeCounter)) // reset on death
                )
                )                   
 achievement(title = "Mysterious Red Square",
                description = "Collect the first bonus item",
                points = 5,
                trigger = 
                (   InGame
                 && FruitCheck(100)  
                )
                )                   
                
 achievement(title = "Mysterious Blue Pellet",
                description = "Collect the second bonus item",
                points = 5,
                trigger = 
                (   InGame
                 && FruitCheck(300)  
                )
                )  
                
 achievement(title = "Mysterious but Familiar Yellow Ball",
                description = "Collect the third bonus item",
                points = 5,
                trigger = 
                (   InGame
                 && FruitCheck(500)  
                )
                )   
                
 achievement(title = "THREE",
                description = "Collect the fourth bonus item",
                points = 5,
                trigger = 
                (   InGame
                 && FruitCheck(700)  
                )
                )                    
                
 achievement(title = "DEE",
                description = "Collect the fifth bonus item",
                points = 10,
                trigger = 
                (   InGame
                 && FruitCheck(1000)  
                )
                )                    
                
 achievement(title = "O",
                description = "Collect the sixth bonus item",
                points = 10,
                trigger = 
                (   InGame
                 && FruitCheck(2000)  
                )
                )                    
                
 achievement(title = "Crispy Logo",
                description = "Collect the seventh bonus item",
                points = 10,
                trigger = 
                (   InGame
                 && FruitCheck(3000)  
                )
                )                    
                
 achievement(title = "I'm Loving It",
                description = "Collect the eigth bonus item",
                points = 10,
                trigger = 
                (   InGame
                 && FruitCheck(5000)  
                )
                )                    
                
///Leaderboard
leaderboard(
    title = "Juiciest Car",
    description = "High Score",
    start  = prev(Score) == 0 && Score > 0 && InGame,
    cancel = always_false(),
    submit = LifeCounter == 0 && prev(LifeCounter) > 0,
    value = Score,
    format = "VALUE"
)
