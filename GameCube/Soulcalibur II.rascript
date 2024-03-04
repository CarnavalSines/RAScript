// Soulcalibur II
// #ID = 3536
// 20240303 Version - Sines

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

///Core
//Constant
Difficulty = { 
                    0:"Easy",
                    1:"Normal",
                    2:"Hard",
                    3:"Very Hard",
                    4:"Ultra Hard",
                    5:"Extremely Hard"

                    }  

CharacterList = { 
                    01:"Mitsurugi",
                    02:"Seung Mina",
                    03:"Taki",
                    04:"Maxi",
                    05:"Voldo",
                    06:"Sophitia",
                    0x0b:"Ivy",
                    0x0c:"Kilik",
                    0x0d:"Xianghua",
                    0x0f:"Yoshimitsu",
                    0x11:"Nightmare",
                    0x12:"Astaroth",
                    0x13:"Inferno",
                    0x14:"Cervantes",
                    0x15:"Raphael",
                    0x16:"Talim",
                    0x17:"Cassandra",
                    0x18:"Charade",
                    0x19:"Necrid",
                    0x1a:"Yunsung",
                    0x1b:"Link",
                    0x1e:"Lizardman",
                    0x1f:"Assassin",
                    0x20:"Berserker"

                    }                      
CostumeUnlock = { 
                    00:0x40216a, // Raphael
                    01:0x40216d, // Talim
                    02:0x402172, // Cassandra
                    03:0x402175, // Mitsurugi
                    04:0x402178, // Taki
                    05:0x40217b, // Voldo
                    06:0x40217e, // Nightmare
                    07:0x402181, // Astaroth
                    08:0x402184, // Ivy
                    09:0x402189, // Xinghua
                    10:0x402190, // Link 1
                    11:0x402191, // Link 2
                    12:0x402194, // Sophitia
                    13:0x402197  // Seung Mina
                    }
Arcade_dic = { // {0}: CharID - {1}: CharName - {2}: Arcade Cheevo Title - {3}: Combo Hits - {4}: TotalDmgRequired - {5}: Combo Trials Cheevo Title
                    0x01: [01, "Mitsurugi", "One Man Army", 3, 100, "Way of the Sword"],
                    0x02: [02, "Seung Mina", "Korean Backdash", 8, 100, "Slashed to Ribbons"],
                    0x03: [03, "Taki", "Pirate Slayer", 3, 75, "Shadow Jutsu"],
                    0x04: [04, "Maxi", "Sea Journey", 4, 100, "Swift Concussion"],
                    0x05: [05, "Voldo", "Eternal Guardian", 4, 100, "Italian Spider-Man"],
                    0x06: [06, "Sophitia", "In the Name of Love", 3, 100, "Seasoned Warrior"],
                    0x07: [0x0b, "Ivy", "Curse of Blood", 4, 100, "No Step on Snek"], // Manually added an additional reset for Ivy Combo Trial to prevent cheese
                    0x08: [0x0c, "Kilik", "Inner Demons", 4, 100, "Bigger Stick"],
                    0x09: [0x0d, "Xianghua", "Soul Calibur's True Wielder", 3, 80, "Bee Sting"],
                    0x0a: [0x0f, "Yoshimitsu", "Bandit King", 3, 90, "Death From Above"],
                    0x0b: [0x11, "Nightmare", "Hope of Redemption", 3, 110, "It Was Much Too Big to Be Called a Sword"],
                    0x0c: [0x12, "Astaroth", "Violence Incarnate", 4, 120, "Cleaving Fury"],
                    0x0d: [0x14, "Cervantes", "Dread Pirate", 3, 100, "Gunblade Wielder"],
                    0x0e: [0x15, "Raphael", "Insidious Corruption", 4, 100, "Fancy French Fencing"],
                    0x0f: [0x16, "Talim", "Flow of the Wind", 4, 90, "Elemental Fairy"],
                    0x10: [0x17, "Cassandra", "Heirlooms", 4, 100, "Flowing Valkyrie"],
                    0x11: [0x18, "Charade", "Eye of Terror", 1, 100, "NOCHEEVO"],
                    0x12: [0x19, "Necrid", "Voidout", 4, 90, "Chaos Manifestation"],
                    0x13: [0x1a, "Yunsung", "Inner Strength", 3, 80, "Air Control"],
                    0x14: [0x1b, "Link", "A Link Between Worlds", 3, 80, "Waker of Wind"]

                    } 
                    
unlock_dict_US = { // {0}: Start of addresses - {1}: End of addresses - {2}: Cheevo Name - {3}: Points - {4}:Description
    0: [0x402160,0x402167, "Full Deck", 10, "Character"],
    1: [0x40219e,0x4021a8, "Content Fiend", 5, "Alternative Mode"],
    2: [0x4021a9,0x4021b2, "Enjoyer of Fine Arts", 5, "piece of Art"],
    3: [0x4021b3,0x4021b7, "Across the World", 5, "Stage"],
    4: [0x4021b8,0x4021c1, "Weapon Lord - Raphael", 5, "Weapon for Raphael"],
    5: [0x4021c2,0x4021cb, "Weapon Lady - Talim", 5, "Weapon for Talim"],
    6: [0x4021cc,0x4021d5, "Weapon Lord - Yunsung", 5, "Weapon for Yunsung"],
    7: [0x4021d6,0x4021df, "Weapon Lady - Cassandra", 5, "Weapon for Cassandra"],
    8: [0x4021e0,0x4021e9, "Weapon Lord - Mitsurugi", 5, "Weapon for Mitsurugi"],
    9: [0x4021ea,0x4021f3, "Weapon Lady - Taki", 5, "Weapon for Taki"],
    10: [0x4021f4,0x4021fd, "Weapon Lord - Voldo", 5, "Weapon for Voldo"],
    11: [0x4021fe,0x402207, "Weapon Lord - Nightmare", 5, "Weapon for Nightmare"],
    12: [0x402208,0x402211, "Weapon Lord - Astaroth", 5, "Weapon for Astaroth"],
    13: [0x402212,0x40221b, "Weapon Lady - Ivy", 5, "Weapon for Ivy"],
    14: [0x40221c,0x402225, "Weapon Lord - Kilik", 5, "Weapon for Kilik"],
    15: [0x402226,0x40222f, "Weapon Lady - Xianghua", 5, "Weapon for Xianghua"],
    16: [0x402230,0x402239, "Weapon Lord - Maxi", 5, "Weapon for Maxi"],
    17: [0x40223a,0x402243, "Weapon Lord - Necrid", 5, "Weapon for Necrid"],
    18: [0x402244,0x40224d, "Weapon Lord - Link", 5, "Weapon for Link"],
    19: [0x40224e,0x402257, "Weapon Lady - Sophitia", 5, "Weapon for Sophitia"],
    20: [0x402258,0x402261, "Weapon Lady - Seung Mina", 5, "Weapon for Seung Mina"],
    21: [0x402262,0x40226b, "Weapon Lord - Yoshimitsu", 5, "Weapon for Yoshimitsu"],
    22: [0x40226c,0x402275, "Weapon Lord - Cervantes", 5, "Weapon for Cervantes"]
}
_characters = 0
_modes = 1
_art = 2
_stages = 3
_weapon_raphael = 4
_weapon_talim = 5
_weapon_yunsung = 6
_weapon_cassandra = 7
_weapon_mitsurugi = 8
_weapon_taki = 9
_weapon_voldo = 10
_weapon_nightmare = 11
_weapon_astaroth = 12
_weapon_ivy = 13
_weapon_kilik = 14
_weapon_xianghua = 15
_weapon_maxi = 16
_weapon_necrid = 17
_weapon_link = 18
_weapon_sophitia = 19
_weapon_seungmina = 20
_weapon_yoshimitsu = 21
_weapon_cervantes = 22

WMChapters_dict_US = { // {0}: Start of addresses - {1}: End of addresses - {2}: Chapter Name - {3}: Points - {4}:Cheevo Name
    0: [0x3eee8c,0x3eee94, "Chapter 1",5, "Regulus"],
    1: [0x3eee98,0x3eeea0, "Chapter 2",5, "Thuban"],
    2: [0x3eeea4,0x3eeeb0, "Chapter 3",5, "Benetnasch"],
    3: [0x3eeeb4,0x3eeec4, "Chapter 4",5, "Mizar"],
    4: [0x3eeec8,0x3eeecc, "Chapter 5",5, "Altair"],
    5: [0x3eeed0,0x3eeee4, "Chapter 6",5, "Aldebaran"],
    6: [0x3eeee8,0x3eeef0, "Chapter 7",5, "Rigel"],
    7: [0x3eeef4,0x3eef08, "Chapter 8",5, "Merek"],
    8: [0x3eef0c,0x3eef18, "Chapter 9",5, "Algol"],
    9: [0x3eef1c,0x3eef24, "Chapter 10",10, "Antares"],
    10: [0x3eef28,0x3eef28, "Sub Chapter 1",5, "Shedar"],
    11: [0x3eef2c,0x3eef38, "Sub Chapter 2",5, "Alioth"],
    12: [0x3eef3c,0x3eef44, "Sub Chapter 3",10, "Pollux"],
    13: [0x3eef48,0x3eef58, "Sub Chapter 4",10, "Procyon"],
    14: [0x3eef5c,0x3eef64, "Extra Chapter 1",5, "Castor"],
    15: [0x3eef68,0x3eef70, "Extra Chapter 2",5, "Cepheus"],
    16: [0x3eef74,0x3eef7c, "Chapter 1 - Extra",10, "Regulus Redux"],
    17: [0x3eef80,0x3eef88, "Chapter 2 - Extra",10, "Thuban Redux"],
    18: [0x3eef8c,0x3eef98, "Chapter 3 - Extra",10, "Benetnasch Redux"],
    19: [0x3eef9c,0x3eefac, "Chapter 4 - Extra",10, "Mizar Redux"],
    20: [0x3eefb0,0x3eefb4, "Chapter 5 - Extra",10, "Altair Redux"],
    21: [0x3eefb8,0x3eefcc, "Chapter 6 - Extra",10, "Aldebaran Redux"],
    22: [0x3eefd0,0x3eefd8, "Chapter 7 - Extra",10, "Rigel Redux"],
    23: [0x3eefdc,0x3eeff0, "Chapter 8 - Extra",10, "Merek Redux"],
    24: [0x3eeff4,0x3ef000, "Chapter 9 - Extra",10, "Algol Redux"],
    25: [0x3ef004,0x3ef00c, "Chapter 10 - Extra",25, "Antares Redux"],
    26: [0x3ef010,0x3ef010, "Sub Chapter 1 - Extra",10, "Shedar Redux"],
    27: [0x3ef014,0x3ef020, "Sub Chapter 2 - Extra",10, "Alioth Redux"],
    28: [0x3ef024,0x3ef02c, "Sub Chapter 3 - Extra",10, "Pollux Redux"],
    29: [0x3ef030,0x3ef040, "Sub Chapter 4 - Extra",10, "Procyon Redux"],
    30: [0x3ef044,0x3ef04c, "Extra Chapter 1 - Extra",10, "Castor Redux"],
    31: [0x3ef050,0x3ef058, "Extra Chapter 2 - Extra",10, "Cepheus Redux"]
}

// Helper Functions
/// Global Region Check
function RegionCheck(Region) => ascii_string_equals(0x00, Region)	
Region_US = "GRSEAF"
Region_EU = "GRSPAF"

ScreenMode_EU = byte(0x41adc1) 
Screen50Hz = 0x2c
Screen60Hz = 0x6c

/// Current Mode
OffsetCurrentMode_US = 0
OffsetCurrentMode_EU = 0x14080

function ModeSelect(Region) => byte(0x3f4705+Region)	
function SubModeSelect(Region) => byte(0x3f4715+Region)	
function SubSubModeSelect(Region) => byte(0x3f4725+Region)	


/// Option Menus
OffsetOption_US = 0
OffsetOption_EU = 0x7910

function DifficultyLevel(Region) => byte(0x28752b+Region)	
function FightCount(Region) => byte(0x287583+Region)
function LifeGauge(Region) => byte(0x287633+Region)
function RoundTime(Region) => byte(0x28768b+Region)
function CharacterSwitchFlag(Region) => byte(0x28773b+Region)
function StageSelect(Region) => byte(0x287793+Region)
function NeutralGuard(Region) => byte(0x2877eb+Region)

/// P1 Char Info
OffsetP1Info_US = 0
OffsetP1Info_EU = 0x13f80

function P1CharID(Region) => byte(0x34d519+Region)	
function P1WeaponID(Region) => byte(0x34d54d+Region)
function P1RoundWon(Region) => byte(0x34ea0d+Region)	

P2RoundWon_US = byte(0x36faad)
P2RoundWon_EU = byte(0x383a4d)

Timer_US = dword_be(0x3618b8)
Timer_EU = dword_be(0x375858)

CurrentStage_US = byte(0x3afc93)
CurrentStage_EU = byte(0x3c3c53)

/// Team Battle
TeamBattleSlot1_US = byte(0x361821)
TeamBattleSlot2_US = byte(0x361829)
TeamBattleSlot3_US = byte(0x361831)

TeamBattleSlot1_EU = byte(0x3757c1)
TeamBattleSlot2_EU = byte(0x3757c9)
TeamBattleSlot3_EU = byte(0x3757d1)


/// Training Mode
OffsetTraining_US = 0
OffsetTraining_EU = 0x14080

TrainingModeFreestyleMode_US = byte(0x3edd73)
TrainingModeFreestyleMode_EU = byte(0x401d33)

function TrainingType(Region) => byte(0x3edee7+Region)
function TrainingTotalDamage(Region) => float_be(0x3edef0+Region)

/// Weapon Master
OffsetWeaponMaster_US = 0
OffsetWeaponMaster_EU = 0x14080

/// Used for RP and not much else
function WeaponMasterCurrentChapter(Region) => byte(0x3ee827+Region)
function WeaponMasterCurrentStage(Region) => byte(0x3ee82b+Region)
function WeaponMasterExp(Region) => dword_be(0x3eee78+Region)
function WeaponMasterGold(Region) => dword_be(0x3ef05c+Region)
function WeaponMasterCurrentCharacter(Region) => byte(0x3ef065+Region)



/// Unlocks
OffsetUnlock_US = 0
OffsetUnlock_EU = 0x14080

// Functions 
function DefaultConfiguration_US() => RegionCheck(Region_US) && FightCount(OffsetOption_US) == 1 && LifeGauge(OffsetOption_US) == 1 && RoundTime(OffsetOption_US) == 4 
                                   && CharacterSwitchFlag(OffsetOption_US) == 0 && NeutralGuard(OffsetOption_US) == 1

function DefaultConfiguration_EU() => RegionCheck(Region_EU) && FightCount(OffsetOption_EU) == 1 && LifeGauge(OffsetOption_EU) == 1 && RoundTime(OffsetOption_EU) == 4 
                                   && CharacterSwitchFlag(OffsetOption_EU) == 0 && NeutralGuard(OffsetOption_EU) == 1


///Original Mode
//// Arcade
//--- --- ---
function ArcadeProg(Char){
	
    title = Arcade_dic[Char][2]
	points = 5
	description = format("Clear Arcade Mode with {0} on Normal difficulty or higher [Default Settings]", Arcade_dic[Char][1])
	trigger = (ModeSelect(OffsetCurrentMode_US) == 0
			&& SubModeSelect(OffsetCurrentMode_US) == 0
			&& P1CharID(OffsetP1Info_US) == Arcade_dic[Char][0]
			&& CurrentStage_US == 8
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && DifficultyLevel(OffsetOption_US) >= 1
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 0
			&& P1CharID(OffsetP1Info_EU) == Arcade_dic[Char][0]
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && DifficultyLevel(OffsetOption_EU) >= 1
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function ArcadeDifficulty(Difficulty,Title,Points,difficulty_name){
	
    title = Title
	points = Points
	description = format("Clear Arcade Mode on {0} [Default Settings]", difficulty_name)
	trigger = (ModeSelect(OffsetCurrentMode_US) == 0
			&& SubModeSelect(OffsetCurrentMode_US) == 0
			&& CurrentStage_US == 8
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && DifficultyLevel(OffsetOption_US) >= Difficulty
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 0
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && DifficultyLevel(OffsetOption_EU) >= Difficulty
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}


for Char in Arcade_dic
    ArcadeProg(Char)

ArcadeDifficulty(2,"Mild Spices",5,"Hard difficulty or higher")  
ArcadeDifficulty(3,"Milk Not Included",10,"Very Hard difficulty or higher")  
ArcadeDifficulty(4,"Manly Tears",10,"Ultra Hard difficulty or higher")  
ArcadeDifficulty(5,"Spicy Meatballs",25,"Extremely Hard difficulty")  

    achievement(title="The Abyss Stares Back",
                description = "Clear Arcade Mode on Extremely Hard difficulty without using any continues [Default Settings]",
                points = 50,
                trigger = (ModeSelect(OffsetCurrentMode_US) == 0
			                && SubModeSelect(OffsetCurrentMode_US) == 0
			                && trigger_when(CurrentStage_US == 8
                            && P1RoundWon(OffsetP1Info_US) == 1
                            && prev(P1RoundWon(OffsetP1Info_US)) == 0)
                            && DifficultyLevel(OffsetOption_US) == 5
                            && once(CurrentStage_US == 2 && prev(CurrentStage_US)== 1 && RegionCheck(Region_US))
                            && never(P2RoundWon_US == 2 && RegionCheck(Region_US))
                            && never(CurrentStage_US == 8 && P2RoundWon_US == 1 && prev(P2RoundWon_US) == 1 && RegionCheck(Region_US))
                            && DefaultConfiguration_US()
                            && RegionCheck(Region_US)) // US Block

                            || (ModeSelect(OffsetCurrentMode_EU) == 0
			                && SubModeSelect(OffsetCurrentMode_EU) == 0
			                && trigger_when(CurrentStage_EU == 8
                            && P1RoundWon(OffsetP1Info_EU) == 1
                            && prev(P1RoundWon(OffsetP1Info_EU)) == 0)
                            && DifficultyLevel(OffsetOption_EU) == 5
                            && once(CurrentStage_EU == 2 && prev(CurrentStage_EU)== 1 && RegionCheck(Region_EU))
                            && never(P2RoundWon_EU == 2 && RegionCheck(Region_EU))
                            && never(CurrentStage_EU == 8 && P2RoundWon_EU == 1 && prev(P2RoundWon_EU) == 1 && RegionCheck(Region_US))
                            && DefaultConfiguration_EU()
                            && RegionCheck(Region_EU)) // EU Block
)    

//// Time Attack
//--- --- ---
    achievement(title="Desire for Velocity",
                description = "Clear Standard Time Attack under 4 minutes",
                points = 10,
                trigger = 
            (ModeSelect(OffsetCurrentMode_US) == 0
			&& SubModeSelect(OffsetCurrentMode_US) == 2
            && SubSubModeSelect(OffsetCurrentMode_US) == 0
			&& CurrentStage_US == 8
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && Timer_US <= 14400 // 60fps * 14400 frames = 4min
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 0
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 14400 // 60FPS
            && ScreenMode_EU == Screen60Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 60Hz

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 0
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 12000 // 50FPS
            && ScreenMode_EU == Screen50Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 50Hz
)    

    achievement(title="Dreams of Rapidity",
                description = "Clear Alternative Time Attack under 4 minutes",
                points = 10,
                trigger = 
            (ModeSelect(OffsetCurrentMode_US) == 0
			&& SubModeSelect(OffsetCurrentMode_US) == 2
            && SubSubModeSelect(OffsetCurrentMode_US) == 1
			&& CurrentStage_US == 8
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && Timer_US <= 14400 // 60fps * 14400 frames = 4min
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 1
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 14400 // 60FPS
            && ScreenMode_EU == Screen60Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 60Hz

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 1
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 12000 // 50FPS
            && ScreenMode_EU == Screen50Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 50Hz
)    

    achievement(title="Rushed Promptitude",
                description = "Clear Extreme Time Attack under 5 minutes",
                points = 25,
                trigger = 
            (ModeSelect(OffsetCurrentMode_US) == 0
			&& SubModeSelect(OffsetCurrentMode_US) == 2
            && SubSubModeSelect(OffsetCurrentMode_US) == 2
			&& CurrentStage_US == 16
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && Timer_US <= 18000 // 60fps * 18000 frames = 6min
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 2
			&& CurrentStage_EU == 16
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 18000 // 60FPS
            && ScreenMode_EU == Screen60Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 60Hz

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 2
			&& CurrentStage_EU == 16
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 15000 // 50FPS
            && ScreenMode_EU == Screen50Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 50Hz
)    

//// Survival
//--- --- ---
function SurvivalClear(Clear,Title,Points){
	
    title = Title
	points = Points
	description = "Defeat "+ Clear+ " enemies in Survival Mode"
	trigger = (ModeSelect(OffsetCurrentMode_US) == 0
			&& SubModeSelect(OffsetCurrentMode_US) == 3
			&& CurrentStage_US == Clear+1
            && prev(CurrentStage_US) == Clear
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 3
			&& CurrentStage_EU == Clear+1
            && prev(CurrentStage_EU) == Clear
            && RegionCheck(Region_EU)) // EU Block
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

SurvivalClear(5,"Learning the Ropes",5)
SurvivalClear(10,"Heard No Bell",5)
SurvivalClear(15,"Eye of the Tiger",10)

//// Team Battle
//--- --- ---
    achievement(title="Group Effort",
                description = "Clear Team Battle on any difficulty [Default Settings]",
                points = 5,
                trigger = (ModeSelect(OffsetCurrentMode_US) == 0
			                && SubModeSelect(OffsetCurrentMode_US) == 4
			                && CurrentStage_US == 5
                            && P1RoundWon(OffsetP1Info_US) == 3
                            && prev(P1RoundWon(OffsetP1Info_US)) == 2
                            && DefaultConfiguration_US()
                            && RegionCheck(Region_US)) // US Block

                            || (ModeSelect(OffsetCurrentMode_EU) == 0
			                && SubModeSelect(OffsetCurrentMode_EU) == 4
			                && CurrentStage_EU == 5
                            && P1RoundWon(OffsetP1Info_EU) == 3
                            && prev(P1RoundWon(OffsetP1Info_EU)) == 2
                            && DefaultConfiguration_EU()
                            && RegionCheck(Region_EU)) // EU Block
)   

    achievement(title="Shared Madness",
                description = "Clear Team Battle on Extremely Hard difficulty [Default Settings]",
                points = 25,
                trigger = (ModeSelect(OffsetCurrentMode_US) == 0
			                && SubModeSelect(OffsetCurrentMode_US) == 4
			                && CurrentStage_US == 5
                            && P1RoundWon(OffsetP1Info_US) == 3
                            && prev(P1RoundWon(OffsetP1Info_US)) == 2
                            && DifficultyLevel(OffsetOption_US) == 5
                            && DefaultConfiguration_US()
                            && RegionCheck(Region_US)) // US Block

                            || (ModeSelect(OffsetCurrentMode_EU) == 0
			                && SubModeSelect(OffsetCurrentMode_EU) == 4
			                && CurrentStage_EU == 5
                            && P1RoundWon(OffsetP1Info_EU) == 3
                            && prev(P1RoundWon(OffsetP1Info_EU)) == 2
                            && DifficultyLevel(OffsetOption_EU) == 5
                            && DefaultConfiguration_EU()
                            && RegionCheck(Region_EU)) // EU Block
)   

//// Practice Mode - Combo Trials
//--- --- ---
function ComboTrials(Char){
	
    title = Arcade_dic[Char][5]
	points = 5
	description = format("In Practice Mode perform a {0}+ Hit combo worth {1} or more damage with {2}. CPU set to Freestyle - Stand Guard 2nd Attack", Arcade_dic[Char][3],Arcade_dic[Char][4],Arcade_dic[Char][1])
	trigger = (ModeSelect(OffsetCurrentMode_US) == 0
			&& SubModeSelect(OffsetCurrentMode_US) == 6
			&& P1CharID(OffsetP1Info_US) == Arcade_dic[Char][0]
            && TrainingModeFreestyleMode_US == 3
            && TrainingType(OffsetTraining_US) == 0
            && TrainingTotalDamage(OffsetTraining_US) >=  Arcade_dic[Char][4] 
            && repeated(Arcade_dic[Char][3],TrainingTotalDamage(OffsetTraining_US) !=  prev(TrainingTotalDamage(OffsetTraining_US)))
            && never(TrainingTotalDamage(OffsetTraining_US) ==  0 && RegionCheck(Region_US)) // Reset if the combo gets dropped
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 0
			&& SubModeSelect(OffsetCurrentMode_EU) == 6
			&& P1CharID(OffsetP1Info_EU) == Arcade_dic[Char][0]
            && TrainingModeFreestyleMode_EU == 3
            && TrainingType(OffsetTraining_EU) == 0
            && TrainingTotalDamage(OffsetTraining_EU) >=  Arcade_dic[Char][4]
            && repeated(Arcade_dic[Char][3],TrainingTotalDamage(OffsetTraining_EU) !=  prev(TrainingTotalDamage(OffsetTraining_EU)))
            && never(TrainingTotalDamage(OffsetTraining_EU) ==  0 && RegionCheck(Region_EU)) // Reset if the combo gets dropped
            && RegionCheck(Region_EU)) // EU Block
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Char in Arcade_dic
    ComboTrials(Char)

// Manually added an additional reset for Ivy Combo Trial to prevent cheese
// Make sure Charade is not accidentaly uploaded for Combo Trial


///Extra Mode
//// Arcade
//--- --- ---
function ArcadeDifficultyEXTRA(Difficulty,Title,Points,difficulty_name){
	
    title = Title
	points = Points
	description = format("Clear Extra Arcade Mode on {0} [Default Settings]", difficulty_name)
	trigger = (ModeSelect(OffsetCurrentMode_US) == 1
			&& SubModeSelect(OffsetCurrentMode_US) == 0
			&& CurrentStage_US == 8
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && DifficultyLevel(OffsetOption_US) >= Difficulty
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 0
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && DifficultyLevel(OffsetOption_EU) >= Difficulty
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

ArcadeDifficultyEXTRA(1,"Extra Fun",2,"Normal difficulty or higher")  
ArcadeDifficultyEXTRA(2,"The Fun Never Stops",3,"Hard difficulty or higher")  
ArcadeDifficultyEXTRA(3,"I Want Off This Wild Ride",10,"Very Hard difficulty or higher")  
ArcadeDifficultyEXTRA(4,"Xultra",10,"Ultra Hard difficulty or higher")  
ArcadeDifficultyEXTRA(5,"Extra Extreme",25,"Extremely Hard difficulty")  

    achievement(title="No Laughing Matter",
                description = "Clear Extra Arcade Mode on Extremely Hard difficulty using a joke weapon [Default Settings]",
                points = 25,
                trigger = (ModeSelect(OffsetCurrentMode_US) == 1
			                && SubModeSelect(OffsetCurrentMode_US) == 0
			                && CurrentStage_US == 8
                            && P1RoundWon(OffsetP1Info_US) == 1
                            && prev(P1RoundWon(OffsetP1Info_US)) == 0
                            && DifficultyLevel(OffsetOption_US) == 5
                            && P1WeaponID(OffsetP1Info_US) == 0x0b
                            && DefaultConfiguration_US()
                            && RegionCheck(Region_US)) // US Block

                            || (ModeSelect(OffsetCurrentMode_EU) == 1
			                && SubModeSelect(OffsetCurrentMode_EU) == 0
			                && CurrentStage_EU == 8
                            && P1RoundWon(OffsetP1Info_EU) == 1
                            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
                            && DifficultyLevel(OffsetOption_EU) == 5
                            && P1WeaponID(OffsetP1Info_EU) == 0x0b
                            && DefaultConfiguration_EU()
                            && RegionCheck(Region_EU)) // EU Block
)    

//// Time Attack
//--- --- ---
    achievement(title="Extra Quick",
                description = "Clear Extra Standard Time Attack under 4 minutes",
                points = 10,
                trigger = 
            (ModeSelect(OffsetCurrentMode_US) == 1
			&& SubModeSelect(OffsetCurrentMode_US) == 2
            && SubSubModeSelect(OffsetCurrentMode_US) == 0
			&& CurrentStage_US == 8
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && Timer_US <= 14400 // 60fps * 14400 frames = 4min
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 0
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 14400 // 60FPS
            && ScreenMode_EU == Screen60Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 60Hz

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 0
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 12000 // 50FPS
            && ScreenMode_EU == Screen50Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 50Hz
)    

    achievement(title="Alternatively, Also Extra Quick!",
                description = "Clear Extra Alternative Time Attack under 4 minutes",
                points = 10,
                trigger = 
            (ModeSelect(OffsetCurrentMode_US) == 1
			&& SubModeSelect(OffsetCurrentMode_US) == 2
            && SubSubModeSelect(OffsetCurrentMode_US) == 1
			&& CurrentStage_US == 8
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && Timer_US <= 14400 // 60fps * 14400 frames = 4min
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 1
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 14400 // 60FPS
            && ScreenMode_EU == Screen60Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 60Hz

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 1
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 12000 // 50FPS
            && ScreenMode_EU == Screen50Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 50Hz
)    

    achievement(title="An Extremely Extra Kind of Person",
                description = "Clear Extra Extreme Time Attack under 6 minutes",
                points = 25,
                trigger = 
            (ModeSelect(OffsetCurrentMode_US) == 1
			&& SubModeSelect(OffsetCurrentMode_US) == 2
            && SubSubModeSelect(OffsetCurrentMode_US) == 2
			&& CurrentStage_US == 8
            && P1RoundWon(OffsetP1Info_US) == 1
            && prev(P1RoundWon(OffsetP1Info_US)) == 0
            && Timer_US <= 21600 // 60fps * 21600 frames = 6min
            && DefaultConfiguration_US()
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 2
			&& CurrentStage_EU == 8
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 21600 // 60FPS
            && ScreenMode_EU == Screen60Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 60Hz

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 2
            && SubSubModeSelect(OffsetCurrentMode_EU) == 2
			&& CurrentStage_EU == 20
            && P1RoundWon(OffsetP1Info_EU) == 1
            && prev(P1RoundWon(OffsetP1Info_EU)) == 0
            && Timer_EU <= 18000 // 50FPS
            && ScreenMode_EU == Screen50Hz
            && DefaultConfiguration_EU()
            && RegionCheck(Region_EU)) // EU Block 50Hz
)    

//// Survival
//--- --- ---
function SurvivalClearEXTRA(Clear,Title,Points){
	
    title = Title
	points = Points
	description = "Defeat "+ Clear+ " enemies in Extra Survival Standard Mode"
	trigger = (ModeSelect(OffsetCurrentMode_US) == 1
			&& SubModeSelect(OffsetCurrentMode_US) == 3
            && SubSubModeSelect(OffsetCurrentMode_US) == 0
			&& CurrentStage_US == Clear+1
            && prev(CurrentStage_US) == Clear
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 3
            && SubSubModeSelect(OffsetCurrentMode_EU) == 0
			&& CurrentStage_EU == Clear+1
            && prev(CurrentStage_EU) == Clear
            && RegionCheck(Region_EU)) // EU Block
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

SurvivalClearEXTRA(10,"Groove On",5)
SurvivalClearEXTRA(20,"Extra Survivor",10)

    achievement(title="One Punch Kill",
                description = "Defeat 20 enemies in Extra Survival Deathmatch Mode",
                points = 10,
                trigger = 
            (ModeSelect(OffsetCurrentMode_US) == 1
			&& SubModeSelect(OffsetCurrentMode_US) == 3
            && SubSubModeSelect(OffsetCurrentMode_US) == 1
			&& CurrentStage_US == 21
            && prev(CurrentStage_US) == 20
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 3
            && SubSubModeSelect(OffsetCurrentMode_EU) == 1
			&& CurrentStage_EU == 21
            && prev(CurrentStage_EU) == 20
            && RegionCheck(Region_EU)) // EU Block 60Hz

)    

function SurvivalClearNoHealEXTRA(Clear,Title,Points){
	
    title = Title
	points = Points
	description = "Defeat "+ Clear+ " enemies in Extra Survival Standard Mode"
	trigger = (ModeSelect(OffsetCurrentMode_US) == 1
			&& SubModeSelect(OffsetCurrentMode_US) == 3
            && SubSubModeSelect(OffsetCurrentMode_US) == 2
			&& CurrentStage_US == Clear+1
            && prev(CurrentStage_US) == Clear
            && RegionCheck(Region_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 1
			&& SubModeSelect(OffsetCurrentMode_EU) == 3
            && SubSubModeSelect(OffsetCurrentMode_EU) == 2
			&& CurrentStage_EU == Clear+1
            && prev(CurrentStage_EU) == Clear
            && RegionCheck(Region_EU)) // EU Block
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

SurvivalClearNoHealEXTRA(5,"Tanking Not Advised",5)
SurvivalClearNoHealEXTRA(15,"The Immortal",25)

//// Team Battle
//--- --- ---
    achievement(title="Extra Party Time",
                description = "Clear Extra Team Battle on any difficulty [Default Settings]",
                points = 5,
                trigger = (ModeSelect(OffsetCurrentMode_US) == 1
			                && SubModeSelect(OffsetCurrentMode_US) == 4
			                && CurrentStage_US == 5
                            && P1RoundWon(OffsetP1Info_US) == 3
                            && prev(P1RoundWon(OffsetP1Info_US)) == 2
                            && DefaultConfiguration_US()
                            && RegionCheck(Region_US)) // US Block

                            || (ModeSelect(OffsetCurrentMode_EU) == 1
			                && SubModeSelect(OffsetCurrentMode_EU) == 4
			                && CurrentStage_EU == 5
                            && P1RoundWon(OffsetP1Info_EU) == 3
                            && prev(P1RoundWon(OffsetP1Info_EU)) == 2
                            && DefaultConfiguration_EU()
                            && RegionCheck(Region_EU)) // EU Block
)   

    achievement(title="F is for FUN, E is for EXTRA FUN",
                description = "Clear Extra Team Battle on Extremely Hard difficulty [Default Settings]",
                points = 25,
                trigger = (ModeSelect(OffsetCurrentMode_US) == 1
			                && SubModeSelect(OffsetCurrentMode_US) == 4
			                && CurrentStage_US == 5
                            && P1RoundWon(OffsetP1Info_US) == 3
                            && prev(P1RoundWon(OffsetP1Info_US)) == 2
                            && DifficultyLevel(OffsetOption_US) == 5
                            && DefaultConfiguration_US()
                            && RegionCheck(Region_US)) // US Block

                            || (ModeSelect(OffsetCurrentMode_EU) == 1
			                && SubModeSelect(OffsetCurrentMode_EU) == 4
			                && CurrentStage_EU == 5
                            && P1RoundWon(OffsetP1Info_EU) == 3
                            && prev(P1RoundWon(OffsetP1Info_EU)) == 2
                            && DifficultyLevel(OffsetOption_EU) == 5
                            && DefaultConfiguration_EU()
                            && RegionCheck(Region_EU)) // EU Block
)   

    achievement(title="The Whole Circus",
                description = "Clear Extra Team Battle on Hard difficulty or higher using the following characters in this exact order: Lizardman, Assassin and Berserker [Default Settings]",
                points = 10,
                trigger = (ModeSelect(OffsetCurrentMode_US) == 1
			                && SubModeSelect(OffsetCurrentMode_US) == 4
			                && CurrentStage_US == 5
                            && P1RoundWon(OffsetP1Info_US) == 3
                            && prev(P1RoundWon(OffsetP1Info_US)) == 2
                            && DifficultyLevel(OffsetOption_US) == 3
                            && TeamBattleSlot1_US == 0x1e
                            && TeamBattleSlot2_US == 0x1f
                            && TeamBattleSlot3_US == 0x20
                            && DefaultConfiguration_US()
                            && RegionCheck(Region_US)) // US Block

                            || (ModeSelect(OffsetCurrentMode_EU) == 1
			                && SubModeSelect(OffsetCurrentMode_EU) == 4
			                && CurrentStage_EU == 5
                            && P1RoundWon(OffsetP1Info_EU) == 3
                            && prev(P1RoundWon(OffsetP1Info_EU)) == 2
                            && DifficultyLevel(OffsetOption_EU) == 3
                            && TeamBattleSlot1_US == 0x1e
                            && TeamBattleSlot2_US == 0x1f
                            && TeamBattleSlot3_US == 0x20
                            && DefaultConfiguration_EU()
                            && RegionCheck(Region_EU)) // EU Block
)   

///Weapon Master Mode
//// All
//--- --- ---

function StageClearCheck_US(Chapter,RegionOffset){
	startAddress = WMChapters_dict_US[Chapter][0] + RegionOffset
	endAddress = WMChapters_dict_US[Chapter][1] + RegionOffset

	result = 0
	totalClears = 0
	
    for address in range(startAddress, endAddress, 4){				
        result = result + bit3(address)
        totalClears = totalClears + 1
    }

	return measured(result == totalClears)
}

function prevStageClearCheck_US(Chapter, RegionOffset){
	startAddress = WMChapters_dict_US[Chapter][0] + RegionOffset
	endAddress = WMChapters_dict_US[Chapter][1] + RegionOffset

	result = 0
	totalClears = 0
	
    for address in range(startAddress, endAddress, 4){				
        result = result + prev(bit3(address))
        totalClears = totalClears + 1
    }

	return result == totalClears - 1
}

function WeaponMasterClear(Chapter){
	
	title = WMChapters_dict_US[Chapter][4]
	points = WMChapters_dict_US[Chapter][3]
	description = format("Clear all {0} Missions in Weapon Master", WMChapters_dict_US[Chapter][2])
	
	trigger =  (ModeSelect(OffsetCurrentMode_US) == 2
            && RegionCheck(Region_US)
            && StageClearCheck_US(Chapter,OffsetWeaponMaster_US) 
			&& prevStageClearCheck_US(Chapter,OffsetWeaponMaster_US)) // US Block

            || (ModeSelect(OffsetCurrentMode_EU) == 2
            && RegionCheck(Region_EU)
            && StageClearCheck_US(Chapter,OffsetWeaponMaster_EU) 
			&& prevStageClearCheck_US(Chapter,OffsetWeaponMaster_EU)) // EU Block
	
	achievement(title = title, points = points, description = description, trigger = trigger)
}

for Chapters in WMChapters_dict_US
    WeaponMasterClear(Chapters)

///Unlocks
//// All
//--- --- ---
function UnlockCheck(unlock,RegionOffset){
	startAddress = unlock_dict_US[unlock][0] + RegionOffset
	endAddress = unlock_dict_US[unlock][1] + RegionOffset

	result = 0
	totalClears = 0
	
    for address in range(startAddress, endAddress){				
        result = result + bit1(address)
        totalClears = totalClears + 1
    }

	return measured(result == totalClears)
}

function prevUnlockCheck(unlock, RegionOffset){
	startAddress = unlock_dict_US[unlock][0] + RegionOffset
	endAddress = unlock_dict_US[unlock][1] + RegionOffset

	result = 0
	totalClears = 0
	
    for address in range(startAddress, endAddress){				
        result = result + prev(bit1(address))
        totalClears = totalClears + 1
    }

	return result == totalClears - 1
}

function CheevoUnlocks(unlock){
	
	title = unlock_dict_US[unlock][2]
	points = unlock_dict_US[unlock][3]
	description = format("Unlock every {0}", unlock_dict_US[unlock][4])
	
	trigger =  (RegionCheck(Region_US)
            && UnlockCheck(unlock,OffsetUnlock_US) 
			&& prevUnlockCheck(unlock,OffsetUnlock_US)) // US Block

            || (RegionCheck(Region_EU)
            && UnlockCheck(unlock,OffsetUnlock_EU) 
			&& prevUnlockCheck(unlock,OffsetUnlock_EU)) // EU Block
	
	achievement(title = title, points = points, description = description, trigger = trigger)
}

for unlocks in unlock_dict_US
    CheevoUnlocks(unlocks)


function CostumeCheck(RegionOffset){

	result = 0
	totalClears = 0
	
    for i in range(0,13) {	
        address = CostumeUnlock[i] + RegionOffset			
        result = result + bit1(address)
        totalClears = totalClears + 1
    }

	return measured(result == totalClears)
}

function prevCostumeCheck(RegionOffset){


	result = 0
	totalClears = 0
	
    for i in range(0,13) {	
        address = CostumeUnlock[i] + RegionOffset			
        result = result + prev(bit1(address))
        totalClears = totalClears + 1
    }

	return result == totalClears - 1
}

    achievement(title="Playing Dress Up",
                description = "Unlock every Alternative Costume",
                points = 5,
                trigger = (RegionCheck(Region_US)
                          && CostumeCheck(OffsetUnlock_US) 
			              && prevCostumeCheck(OffsetUnlock_US)) // US Block

                          || (RegionCheck(Region_EU)
                          && CostumeCheck(OffsetUnlock_EU) 
			              && prevCostumeCheck(OffsetUnlock_EU)) // EU Block
)   

// --- --- --- --- --- ---
// // Rich Presence
// --- --- --- --- --- ---
/// Arcade US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 0 && SubModeSelect(OffsetCurrentMode_US) == 0 && CurrentStage_US > 1,
    "• ⚔️ Arcade Mode • {0} is fighting in Stage {1} • {2} Difficulty •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US),
    rich_presence_lookup("Difficulty", DifficultyLevel(OffsetOption_US), Difficulty)) 
/// Arcade EU    
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 0 && SubModeSelect(OffsetCurrentMode_EU) == 0 && CurrentStage_EU > 1,
    "• ⚔️ Arcade Mode • {0} is fighting in Stage {1} • {2} Difficulty •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU),
    rich_presence_lookup("Difficulty", DifficultyLevel(OffsetOption_EU), Difficulty)) 

/// Time Attack US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 0 && SubModeSelect(OffsetCurrentMode_US) == 2 && SubSubModeSelect(OffsetCurrentMode_US) == 0,
    "• ⏳ Time Attack - Standard Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 0 && SubModeSelect(OffsetCurrentMode_US) == 2 && SubSubModeSelect(OffsetCurrentMode_US) == 1,
    "• ⏳ Time Attack - Alternative Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 0 && SubModeSelect(OffsetCurrentMode_US) == 2 && SubSubModeSelect(OffsetCurrentMode_US) == 2,
    "• ⏳ Time Attack - Extreme Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

/// Time Attack EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 0 && SubModeSelect(OffsetCurrentMode_EU) == 2 && SubSubModeSelect(OffsetCurrentMode_EU) == 0,
    "• ⏳ Time Attack - Standard Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU)) 

rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 0 && SubModeSelect(OffsetCurrentMode_EU) == 2 && SubSubModeSelect(OffsetCurrentMode_EU) == 1,
    "• ⏳ Time Attack - Alternative Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU)) 

rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 0 && SubModeSelect(OffsetCurrentMode_EU) == 2 && SubSubModeSelect(OffsetCurrentMode_EU) == 2,
    "• ⏳ Time Attack - Extreme Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU))     

/// Survival US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 0 && SubModeSelect(OffsetCurrentMode_US) == 3,
    "• ⚔️ Survival Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 
/// Survival EU    
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 0 && SubModeSelect(OffsetCurrentMode_EU) == 3,
    "• ⚔️ Survival Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU)) 

/// Team Battle US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 0 && SubModeSelect(OffsetCurrentMode_US) == 4,
    "• ⚔️⚔️⚔️ Team Battle Mode • {0}, {1} and {2} are fighting in Stage {3} • {4} Difficulty •",
    rich_presence_lookup("Character", TeamBattleSlot1_US, CharacterList),
    rich_presence_lookup("Character", TeamBattleSlot2_US, CharacterList),
    rich_presence_lookup("Character", TeamBattleSlot3_US, CharacterList),
    rich_presence_value("Stage", CurrentStage_US),
    rich_presence_lookup("Difficulty", DifficultyLevel(OffsetOption_US), Difficulty)) 

/// Team Battle EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 0 && SubModeSelect(OffsetCurrentMode_EU) == 4,
    "• ⚔️⚔️⚔️ Team Battle Mode • {0}, {1} and {2} are fighting in Stage {3} • {4} Difficulty •",
    rich_presence_lookup("Character", TeamBattleSlot1_EU, CharacterList),
    rich_presence_lookup("Character", TeamBattleSlot2_EU, CharacterList),
    rich_presence_lookup("Character", TeamBattleSlot3_EU, CharacterList),
    rich_presence_value("Stage", CurrentStage_EU),
    rich_presence_lookup("Difficulty", DifficultyLevel(OffsetOption_EU), Difficulty))     

/// Practice Mode US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 0 && SubModeSelect(OffsetCurrentMode_US) == 6,
    "• ⚔️ Practice Mode • Practicing with {0} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList))   

/// Practice Mode EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 0 && SubModeSelect(OffsetCurrentMode_EU) == 6,
    "• ⚔️ Practice Mode • Practicing with {0} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList))  

/// EXTRA Arcade US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 0 && CurrentStage_US > 1,
    "• ⚔️ Extra Arcade Mode • {0} is fighting in Stage {1} • {2} Difficulty •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US),
    rich_presence_lookup("Difficulty", DifficultyLevel(OffsetOption_US), Difficulty)) 
/// EXTRA Arcade EU    
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 0 && CurrentStage_EU > 1,
    "• ⚔️ Extra Arcade Mode • {0} is fighting in Stage {1} • {2} Difficulty •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU),
    rich_presence_lookup("Difficulty", DifficultyLevel(OffsetOption_EU), Difficulty)) 

/// EXTRA Time Attack US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 2 && SubSubModeSelect(OffsetCurrentMode_US) == 0,
    "• ⏳ Extra Time Attack - Standard Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 2 && SubSubModeSelect(OffsetCurrentMode_US) == 1,
    "• ⏳ Extra Time Attack - Alternative Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 2 && SubSubModeSelect(OffsetCurrentMode_US) == 2,
    "• ⏳ Extra Time Attack - Extreme Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

/// EXTRA Time Attack EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 2 && SubSubModeSelect(OffsetCurrentMode_EU) == 0,
    "• ⏳ Extra Time Attack - Standard Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU)) 

rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 2 && SubSubModeSelect(OffsetCurrentMode_EU) == 1,
    "• ⏳ Extra Time Attack - Alternative Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU)) 

rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 2 && SubSubModeSelect(OffsetCurrentMode_EU) == 2,
    "• ⏳ Extra Time Attack - Extreme Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU))     

/// EXTRA Survival US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 3 && SubSubModeSelect(OffsetCurrentMode_US) == 0,
    "• ⚔️ Extra Survival - Standard Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 3 && SubSubModeSelect(OffsetCurrentMode_US) == 1,
    "• ⚔️ Extra Survival - Death Match Mode ☠️ • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 3 && SubSubModeSelect(OffsetCurrentMode_US) == 2,
    "• ⚔️ Extra Survival - No Recovery Mode 🍎 • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList),
    rich_presence_value("Stage", CurrentStage_US)) 

/// EXTRA Survival EU    
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 3 && SubSubModeSelect(OffsetCurrentMode_EU) == 0,
    "• ⚔️ Extra Survival - Standard Mode • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU)) 

rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 3 && SubSubModeSelect(OffsetCurrentMode_EU) == 1,
    "• ⚔️ Extra Survival - Death Match Mode ☠️ • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU)) 

rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 3 && SubSubModeSelect(OffsetCurrentMode_EU) == 2,
    "• ⚔️ Extra Survival - No Recovery Mode 🍎 • {0} is fighting in Stage {1} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList),
    rich_presence_value("Stage", CurrentStage_EU))     

/// EXTRA Team Battle US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 4,
    "• ⚔️⚔️⚔️ Extra Team Battle Mode • {0}, {1} and {2} are fighting in Stage {3} • {4} Difficulty •",
    rich_presence_lookup("Character", TeamBattleSlot1_US, CharacterList),
    rich_presence_lookup("Character", TeamBattleSlot2_US, CharacterList),
    rich_presence_lookup("Character", TeamBattleSlot3_US, CharacterList),
    rich_presence_value("Stage", CurrentStage_US),
    rich_presence_lookup("Difficulty", DifficultyLevel(OffsetOption_US), Difficulty)) 

/// EXTRA Team Battle EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 4,
    "• ⚔️⚔️⚔️ Extra Team Battle Mode • {0}, {1} and {2} are fighting in Stage {3} • {4} Difficulty •",
    rich_presence_lookup("Character", TeamBattleSlot1_EU, CharacterList),
    rich_presence_lookup("Character", TeamBattleSlot2_EU, CharacterList),
    rich_presence_lookup("Character", TeamBattleSlot3_EU, CharacterList),
    rich_presence_value("Stage", CurrentStage_EU),
    rich_presence_lookup("Difficulty", DifficultyLevel(OffsetOption_EU), Difficulty)) 

/// EXTRA Practice Mode US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 1 && SubModeSelect(OffsetCurrentMode_US) == 6,
    "• ⚔️ Extra Practice Mode • Practicing with {0} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_US), CharacterList))   

/// EXTRA Practice Mode EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 1 && SubModeSelect(OffsetCurrentMode_EU) == 6,
    "• ⚔️ Extra Practice Mode • Practicing with {0} •",
    rich_presence_lookup("Character", P1CharID(OffsetP1Info_EU), CharacterList))    

/// Weapon Master US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 2,
    "• ⚔️ Weapon Master Mode ⚔️ • {0} is wandering around in Chapter {1} - Stage {2} • {3}💰 - {4} Exp•",
    rich_presence_lookup("Character", WeaponMasterCurrentCharacter(OffsetWeaponMaster_US), CharacterList),
    rich_presence_value("Chapter", WeaponMasterCurrentChapter(OffsetWeaponMaster_US)+1),
    rich_presence_value("Stage", WeaponMasterCurrentStage(OffsetWeaponMaster_US)+1),
    rich_presence_value("Gold", WeaponMasterGold(OffsetWeaponMaster_US)),
    rich_presence_value("Experience", WeaponMasterExp(OffsetWeaponMaster_US)))            

/// Weapon Master EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 2,
    "• ⚔️ Weapon Master Mode ⚔️ • {0} is wandering around in Chapter {1} - Stage {2} • {3}💰 - {4} Exp•",
    rich_presence_lookup("Character", WeaponMasterCurrentCharacter(OffsetWeaponMaster_EU), CharacterList),
    rich_presence_value("Chapter", WeaponMasterCurrentChapter(OffsetWeaponMaster_EU)+1),
    rich_presence_value("Stage", WeaponMasterCurrentStage(OffsetWeaponMaster_EU)+1),
    rich_presence_value("Gold", WeaponMasterGold(OffsetWeaponMaster_EU)),
    rich_presence_value("Experience", WeaponMasterExp(OffsetWeaponMaster_EU)))   

/// Museum US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 3,
    "• 🎭 This Belongs in a Museum! 🎭 •")      

/// Museum EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 3,
    "• 🎭 This Belongs in a Museum! 🎭 •")  

/// Options US
rich_presence_conditional_display(
    RegionCheck(Region_US) && ModeSelect(OffsetCurrentMode_US) == 4,
    "• 🛠️ Sorting Out the Options 🛠️ •")      

/// Options EU
rich_presence_conditional_display(
    RegionCheck(Region_EU) && ModeSelect(OffsetCurrentMode_EU) == 4,
    "• 🛠️ Sorting Out the Options 🛠️ •")  
///Default 
rich_presence_display(
    "• ⚔️ Transcending History and the World, a Tale of Souls and Swords, Eternally Retold ⚔️ •"

)