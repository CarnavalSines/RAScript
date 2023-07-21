// Flying Hamster
// #ID = 5967
// 20230720 Version - Sines

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



// $87173D: [8 Bit] Language Option
// $871740: [8 Bit] Credit Remaining
// $871750: [32 Bit] Score
// $8718A8: [32 Bit] Game Data Pointer
//          +0xF7FFFDA8=[16 Bit] Boss 1 Health
//          +0xF8000058=Hearts
//          +0xF80000C0= Ammunition for non default weapons
//          +0xF80000C4=8Bit Weapon ID
//          +0xF80000C8= 8Bit Max Charged Attack Flag
// $89F64D: [8 Bit] Music Slider
//          Max 0x80
//          Min 0x00
// $1461F58: Secret Boss health pointer 2
// $18C1BD8: [8 Bit] Tentative Ammunition for non default weapons
// $18C1BDC: [8 Bit] Weapon ID
//           00 > Default
//           01 > Apple
//           02 > Sunflower Seed
//           03 > Banana
//           04 > Beer
//           05 > Fireball
//           06 > Bee
//           07 > Egg
//           08 > Octopus
//           09 > Thorns
//           0a > Dango
// $18C1BE0: [8 Bit] Max Charged Attack Flag
//           0x01 on launching a max charged attack
// $1A4D9A8: Secret boss health pointer 1
// $1AB1C34: [8 Bit] Continue Select Level
// $1B1C81C: [8 Bit] Level ID (at least from Continue Menu)
// $1EB133C: [8 Bit] Sound Effects
//           Max 0xff
//           Min 0x00
// $1F40A4C: [8 Bit] Level ID
//           0x04 > 0x05 | Game Ending Credits
//           Secret World: 0xFF
// $1F40A84: [32 Bit] Boss 5 Pointer
//           +0xF8000708=[16 Bit] Boss 5 Phase 1 Health
//           +0xF8000D58=[16 Bit] Boss 5 Phase 2 Health
// $1F40B38: [8 Bit] Game Pause
//           Pause Menu
// $1F40B39: [8 Bit] Hard Mode Flag
// $1F40BD8: [8 Bit] Levels SubID
//           Level 1 Mini Boss > 2
// $1FBF63C: [32 Bit] Boss Health Pointer 1
//           +0xF8000708=[16 Bit] Boss 1 Health
//           +0xF8000520=[16 Bit] Mini Boss 1 Health
//           +0xF7FFE438=[16 Bit] Boss 3 Health
//           +0xF7FFFF20=[16 Bit] Boss 4 Health
// $1FBF64C: [32 Bit] Boss Health Pointer 2
//           +0xF8001588=[16 Bit] Boss 2 Health
// $1FBF730: [32 Bit] Secret Boss Health Pointer
//           +0xF8000918=[16 Bit] Secret Boss Health


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
CreditsRemaining = byte(0x871740) // 871740
Score = dword(0x871750)
GameState = byte(0x01f40bf0) // 00 Main Menu > 01 InGame > 02 Level Beaten > 03 Credit Roll

GameDataPointer = dword(0x8718a8)
PlayerHealthOffset = 0xF8000058
PlayerAmmoCountOffset = 0xF80000C0
PlayerWeaponOffset = 0xF80000C4
PlayerSpecialAttackFlagOffset = 0xF80000C8

PlayerHealth = byte(GameDataPointer + PlayerHealthOffset )
PlayerAmmoCount = byte(GameDataPointer + PlayerAmmoCountOffset)
PlayerWeapon = byte(GameDataPointer + PlayerWeaponOffset)
PlayerSpecialAttackFlag = byte(GameDataPointer + PlayerSpecialAttackFlagOffset) // Goes to 1 when using max charged attack

LevelID = byte(0x1f40a4c)
LevelSubID = byte(0x1f40bd8)
HardModeFlag = byte(0x1f40b39)

BossHealthPointer1 = dword(0x1fbf63c)
BossHealthPointer2 = dword(0x1fbf64c)
BossHealthPointer3 = dword(0x1f40a4c)
BossHealthPointerSecret = dword(0x1fbf730)

Boss1HealthOffset = 0xF7FFFDA8
Boss2HealthOffset = 0xF8001588
Boss3HealthOffset = 0xF7FFE438
Boss4HealthOffset = 0xF7FFFF20
Boss5Phase1HealthOffset = 0xF8000708
Boss5Phase2HealthOffset = 0xF8000D58
BossSecretHealthOffset = 0xF8000918

Boss1Health = word(GameDataPointer + Boss1HealthOffset)
Boss2Health = word(BossHealthPointer2 + Boss2HealthOffset)
Boss3Health = word(BossHealthPointer1 + Boss3HealthOffset)
Boss4Health = word (BossHealthPointer1 + Boss4HealthOffset)
Boss5Phase1Health = word(BossHealthPointer3 + Boss5Phase1HealthOffset)
Boss5Phase2Health = word(BossHealthPointer3 + Boss5Phase2HealthOffset)
BossSecretHealth = word(BossHealthPointerSecret + BossSecretHealthOffset)


//----------------
//Function
function LevelClear(Level,Points,Title)
{
    achievement(title=Title,
                description = "Complete Level " + Level+1,
                points = Points,
                trigger = LevelID == Level+1
                       && LevelSubID == 0 
                       && GameState == 2
                       && prev(GameState) == 1
                       && PlayerHealth > 0
                       
)              
}

function LevelClearHard(Level,Points,Title)
{
    achievement(title=Title,
                description = "Complete Level " + Level+1 +" in Hard Mode",
                points = Points,
                trigger = LevelID == Level+1
                       && LevelSubID == 0 
                       && GameState == 2
                       && prev(GameState) == 1
                       && PlayerHealth > 0
                       && HardModeFlag == 1
                       
)              
}

//----------------
///Achievement Code
// Progression
LevelClear(0,5,"Howling Start")     
LevelClear(1,5,"PenGun Gang")  
LevelClear(2,5,"Ninja Rat")  
LevelClear(3,10,"Of Course it's Tentacles")  
LevelClear(4,25,"Infinity and Beyond")       
achievement(title="The Pharaoh are from Space",
                description = "Complete the Secret Level ",
                points = 10,
                trigger = LevelID == 0xFF
                       && GameState == 1
                       && PlayerHealth > 0
                       && BossSecretHealth == 0
                       && prev(BossSecretHealth) >0
                       )
                       
LevelClearHard(0,10,"Here We Go Again")  
LevelClearHard(1,10,"No More Mister Nice Penguin")  
LevelClearHard(2,10,"Rising Sun")  
LevelClearHard(3,25,"Deep Under the Sea")  
LevelClearHard(4,25,"Full Circle")   

achievement(title="The Secret of Kawaii",
                description = "Complete the Secret Level in Hard Mode",
                points = 25,
                trigger = LevelID == 0xFF
                       && GameState == 1
                       && PlayerHealth > 0
                       && BossSecretHealth == 0
                       && prev(BossSecretHealth) >0
                       && HardModeFlag == 1
                       )   
                       
achievement(title="Hamster's Wrath",
                description = "Complete the game in one Credit (No Death)",
                points = 50,
                trigger = LevelID == 0x05
                       && GameState == 2
                       && prev(GameState) == 1
                       && PlayerHealth > 0
                       && once(LevelID == 0 && LevelSubID == 0 && Score == 0 && GameState == 1) // Start of the game check
                       && never(CreditsRemaining < prev(CreditsRemaining)) // No death (or continue)
                       && never(GameState == 0) // No going back on main menu
                       )   
achievement(title="Hamster's Devotion",
                description = "Complete the game in one Credit on Hard Mode (No Death)",
                points = 100,
                trigger = LevelID == 0x05
                       && GameState == 2
                       && prev(GameState) == 1
                       && PlayerHealth > 0
                       && HardModeFlag == 1
                       && once(LevelID == 0 && LevelSubID == 0 && Score == 0 && GameState == 1 && HardModeFlag == 1) // Start of the game check in Hard Mode
                       && never(CreditsRemaining < prev(CreditsRemaining)) // No death (or continue)
                       && never(GameState == 0) // No going back on main menu
                       )                            

achievement(title="Spit-Shine Forest",
                description = "Complete Level 1 without getting any weapons outside of the default attack ",
                points = 5,
                trigger = LevelID == 0x00
                       && trigger_when(Boss1Health == 0
                       && prev(Boss1Health) > 0)
                       && PlayerHealth > 0
                       && once(LevelID == 0 && LevelSubID == 0 && Score == 0 && GameState == 1)
                       && never(PlayerWeapon != 0)
                       && never(GameState == 0)
)


achievement(title="Spit-Shine Pyramid",
                description = "Complete Level 2 without getting any weapons outside of the default attack [Level Select from main Menu authorized as long as you select the start of the level]",
                points = 5,
                trigger = LevelID == 0x01
                       && trigger_when(Boss2Health == 0
                       && prev(Boss2Health) > 0)
                       && PlayerHealth > 0
                       && (once(LevelID == 1 && GameState == 2) || once(LevelID == 0x01 && LevelSubID == 0 && prev(GameState) == 0 && never(GameState==0))) // Either continuation from Level 1 or load first part from main menu
                       && never(PlayerWeapon != 0)
)     

achievement(title="Spit-Shine Weeb",
                description = "Complete Level 3 without getting any weapons outside of the default attack [Level Select from main Menu authorized as long as you select the start of the level]",
                points = 10,
                trigger = LevelID == 0x02
                       && trigger_when(Boss3Health == 0
                       && prev(Boss3Health) > 0)
                       && PlayerHealth > 0
                       && (once(LevelID == 2 && GameState == 2) || once(LevelID == 0x02 && LevelSubID == 0 && prev(GameState) == 0 && never(GameState==0))) // Either continuation from Level 1 or load first part from main menu
                       && never(PlayerWeapon != 0)
)  

achievement(title="Spit-Shine Ocean",
                description = "Complete Level 4 without getting any weapons outside of the default attack [Level Select from main Menu authorized as long as you select the start of the level]",
                points = 10,
                trigger = LevelID == 0x03
                       && trigger_when(Boss4Health == 0
                       && prev(Boss4Health) > 0)
                       && PlayerHealth > 0
                       && (once(LevelID == 3 && GameState == 2) || once(LevelID == 0x03 && LevelSubID == 0 && prev(GameState) == 0 && never(GameState==0))) // Either continuation from Level 1 or load first part from main menu
                       && never(PlayerWeapon != 0)
)       

achievement(title="Spit-Shine Spaceship",
                description = "Complete Level 5 without getting any weapons outside of the default attack [Level Select from main Menu authorized as long as you select the start of the level]",
                points = 25,
                trigger = LevelID == 0x04
                       && trigger_when(Boss5Phase2Health == 0
                       && prev(Boss5Phase2Health) > 0)
                       && PlayerHealth > 0
                       && (once(LevelID == 4 && GameState == 2) || once(LevelID == 0x04 && LevelSubID == 0 && prev(GameState) == 0 && never(GameState==0))) // Either continuation from Level 1 or load first part from main menu
                       && never(PlayerWeapon != 0)
)   

achievement(title="Brave Rodent",
                description = "Get a Score of 500k or more",
                points = 5,
                trigger = GameState == 1
                       && PlayerHealth > 0
                       && Score >= 500000
                       && prev(Score) < 500000
                       )     
                       
achievement(title="Master Hamster",
                description = "Get a Score of 1M or more",
                points = 10,
                trigger = GameState == 1
                       && PlayerHealth > 0
                       && Score >= 1000000
                       && prev(Score) < 1000000
                       )        
                       
achievement(title="Press S to Spit",
                description = "Use your default weapon charged attack",
                points = 1,
                trigger = GameState == 1
                       && PlayerWeapon == 0
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )
                       
achievement(title="Doctor's Away",
                description = "Use the Apple charged attack",
                points = 1,
                trigger = GameState == 1
                       && PlayerWeapon == 1
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )     
                       
achievement(title="Stun Seed in your Mouth",
                description = "Use the Sunflower Seed charged attack",
                points = 1,
                trigger = GameState == 1
                       && PlayerWeapon == 2
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )   
                       
achievement(title="ROTAT E",
                description = "Use the Banana charged attack",
                points = 1,
                trigger = GameState == 1
                       && PlayerWeapon == 3
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )   
                       
achievement(title="JetStream Sam",
                description = "Use the Beer charged attack",
                points = 1,
                trigger = GameState == 1
                       && PlayerWeapon == 4
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )  
                       
achievement(title="Flower Power",
                description = "Use the Fireball charged attack",
                points = 2,
                trigger = GameState == 1
                       && PlayerWeapon == 5
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )    
                       
achievement(title="Wicker Hamster",
                description = "Use the Bee charged attack",
                points = 1,
                trigger = GameState == 1
                       && PlayerWeapon == 6
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       ) 
                       
achievement(title="Definitely not First",
                description = "Use the Egg charged attack",
                points = 1,
                trigger = GameState == 1
                       && PlayerWeapon == 7
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )      
                       
achievement(title="WAH",
                description = "Use the Octopus charged attack",
                points = 2,
                trigger = GameState == 1
                       && PlayerWeapon == 8
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )      
                       
achievement(title="Rose Bits Storm",
                description = "Use the Thorn charged attack",
                points = 2,
                trigger = GameState == 1
                       && PlayerWeapon == 9
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )  
                       
achievement(title="Perfect for Monster Hunting",
                description = "Use the Dango charged attack",
                points = 2,
                trigger = GameState == 1
                       && PlayerWeapon == 0xa
                       && PlayerSpecialAttackFlag == 1
                       && prev(PlayerSpecialAttackFlag) == 0
                       )                          
// leaderboard
