// ~Hack~ Andaron Saga [Subset - Secrets Hunt]
// #ID = 30883
// 20240916 Version - Sines

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

ChapterNames = { 
                    0:"1 - Rambunctious Reunion",
                    1:"2 - Northern Raiders",
                    2:"3 - Glory of the Hunt",
                    3:"4 - Maiden of Light",
                    4:"5 - Shrouded Shrine",
                    5:"6 - Nest of Terrors",
                    6:"7 - Scalies Above!",
                    7:"8 - Grim Reunion",
                    8:"9 - Grand Crossing",
                    9:"10 - Malthrak Ablaze",
                    0xa:"11 - Storming the Castle",
                    0xb:"12 - Long Live the King",
                    0xc:"13 - Prison Break",
                    0xd:"14 - Deceit By Dawn",
                    0xe:"15 - Sea Skirmish",
                    0xf:"16 - Berserkergang",
                    0x10:"17 - Ethereal Legion",
                    0x11:"18 - Decisive Duel",
                    0x12:"19 - Call of the Void",
                    0x13:"20 - Pyrion's Envoy",
                    0x14:"21 - Trial by Fire",
                    0x15:"22 - Rightful Ruler",
                    0x16:"23 - Styxian Sands",
                    0x17:"24 - Tomb of Horrors",
                    0x18:"25 - Lich's Requiem",
                    0x19:"26 - Fortress of Flames",
                    0x1a:"27 - Abominations",
                    0x1b:"28 - Winds of Change",
                    0x1c:"29 - Against All Odds",
                    0x1d:"30 - Dire Pursuit",
                    0x1e:"31 - Light's Return",
                    0x1f:"32 - Dark Origin",
                    0x3f:"1x - First Light",
                    0x3e:"2x - Angvik's Forest",
                    0x3d:"4x - Counting the Cost",
                    0x3c:"6x - A Brief Respite",
                    0x3b:"7x - Heroes of Silvermist",
                    0x39:"9x - The Wedding",
                    0x37:"12x - Ashen Haven",
                    0x36:"14x - Last Light",
                    0x35:"16x - Skadi's Clemency",
                    0x34:"22x - Alliances Forged",
                    0x33:"25x - Declaration of War",
                    0x32:"30x - Before the Storm",
                    0x21:"32x - Andaron Saga",
                    0x20:"Epilogue"

                    }  

ASCIIStart = 0x326ac

// Variable

LastItemObtained = byte(0x05f4)
MapID = byte(0x33cfe)
TurnPhase = byte(0x33cff) // Player phase == 0
TurnCounter = byte(0x33d00)
LunaticDifficulty = bit6(0x33d04)
SecretFlagCheck = bit6(0x5254)
CharIDStart = byte(0x033e4c)
CurrentUnit = word(0x424ec)
BattleFlag = bit0(0x04296e)

function LoadCheck() => MapID == prev(MapID)
function LunaticCheck() => LunaticDifficulty == 1
function LastItemCheck(ItemCheckID) => LastItemObtained == ItemCheckID && prev(LastItemObtained) != ItemCheckID

    achievement(title="Never Tell Me the Odds",
                description = "Have a chat with Jesse in Chapter 1",
                points = 5,
                trigger = MapID == 0x00
                       && bit7(0x5272) == 1
                       && prev(bit7(0x5272)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Out of Order",
                description = "Obtain the Goddess Icon from Sigmar in Chapter 2",
                points = 5,
                trigger = MapID == 0x01
                       && LoadCheck()
                       && LastItemCheck(0x5f)
                       
) 

    achievement(title="Should Have Two Pairs",
                description = "Obtain the Boots from Drogon in Chapter 3",
                points = 5,
                trigger = MapID == 0x02
                       && LoadCheck()
                       && LastItemCheck(0x62)
                       
) 

    achievement(title="Dragon Dust",
                description = "Obtain the Spirit Dust from Embla in Chapter 4",
                points = 5,
                trigger = MapID == 0x03
                       && LoadCheck()
                       && LastItemCheck(0xc7)
                       
) 

    achievement(title="Flexing Muscles",
                description = "Obtain the Bulk Band from the Cyclops in Chapter 5",
                points = 5,
                trigger = MapID == 0x04
                       && LoadCheck()
                       && LastItemCheck(0xdf)
                       
) 

    achievement(title="Ward from Evil",
                description = "Obtain the Talisman from the Beholder in Chapter 6",
                points = 5,
                trigger = MapID == 0x05
                       && LoadCheck()
                       && LastItemCheck(0x61)
                       
) 

    achievement(title="Chicken Wings Delivery",
                description = "Obtain the Speedwings from the Miriam in Chapter 7",
                points = 5,
                trigger = MapID == 0x06
                       && LoadCheck()
                       && LastItemCheck(0x5e)
                       
) 

    achievement(title="Taking Action",
                description = "Speak to Albert with Hailey in Chapter 8",
                points = 5,
                trigger = MapID == 0x07
                       && bit5(0x5274) == 1
                       && prev(bit5(0x5274)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Green Hair, Red Flags",
                description = "Speak to Alicia with Shom in Chapter 9",
                points = 5,
                trigger = MapID == 0x08
                       && bit3(0x5274) == 1
                       && prev(bit3(0x5274)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Magnus the Unlucky",
                description = "Obtain the Goddess Icon from Magnus in Chapter 10",
                points = 5,
                trigger = MapID == 0x09
                       && LoadCheck()
                       && LastItemCheck(0x5f)
                       
) 

    achievement(title="Double Whammy",
                description = "Obtain the Sprit Dust and the Energy Ring from the Steel Knights in Chapter 11",
                points = 5,
                trigger = MapID == 0x0a
                       && LoadCheck()
                       && once(MapID == 0x0a && LastItemCheck(0xc7))
                       && once(MapID == 0x0a && LastItemCheck(0x5c))
                       && never(MapID != 0x0a)
) 

    achievement(title="Mortimer Time",
                description = "Witness Mortimer famous catchphrase in Chapter 12",
                points = 5,
                trigger = MapID == 0x0b
                       && LoadCheck()
                       && ascii_string_equals(0x0326b5, "It's Morting time!")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
) 

    achievement(title="Lucky What?",
                description = "Recruit the mysterious Crixus in Chapter 13",
                points = 5,
                trigger = MapID == 0x0c
                       && bit4(0x5274) == 1
                       && prev(bit4(0x5274)) == 0
                       && LoadCheck()
    )

    achievement(title="I Cant Fall Here",
                description = "Defeat Adalena in Chapter 14",
                points = 5,
                trigger = MapID == 0x0d
                       && LoadCheck()
                       && ascii_string_equals(0x0326b2, "This will never do")
                       && byte(0x0326b2) != prev(byte(0x0326b2))
                       
)     

    achievement(title="Early Culling",
                description = "Obtain the Fiery Chant Ring from Nial in Chapter 15",
                points = 5,
                trigger = MapID == 0x0e
                       && LoadCheck()
                       && LastItemCheck(0x7f)
                       
) 

    achievement(title="Wife Dead",
                description = "Obtain the Energy Ring from Yrma in Chapter 16",
                points = 5,
                trigger = MapID == 0x0f
                       && LoadCheck()
                       && LastItemCheck(0x5c)
                       
) 

    achievement(title="Back Again",
                description = "Obtain the Void Shield skill with Victoria or Caroline in Chapter 17",
                points = 5,
                trigger = MapID == 0x10
                       && bit7(0x5273) == 1
                       && prev(bit7(0x5273)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Sigmar Male",
                description = "Talk to Sigmar with Elmer in Chapter 18",
                points = 5,
                trigger = MapID == 0x11
                       && LoadCheck()
                       && (byte(0x46c85) == 0x5c && prev(byte(0x46c85)) == 0
                       || byte(0x46c86) == 0x5c && prev(byte(0x46c86)) == 0
                       || byte(0x46c87) == 0x5c && prev(byte(0x46c87)) == 0
                       || byte(0x46c88) == 0x5c && prev(byte(0x46c88)) == 0)
                       
) 

    achievement(title="Ordo Hereticus",
                description = "Defeat the Secret Skadi Witch and obtain her Nosferatu in Chapter 19",
                points = 5,
                trigger = MapID == 0x12
                       && LoadCheck()
                       && LastItemCheck(0x47)
                       && BattleFlag == 1
                       
) 

    achievement(title="Name of the Series",
                description = "Obtain the Dragonshield from the manakete in Chapter 20",
                points = 5,
                trigger = MapID == 0x13
                       && LoadCheck()
                       && LastItemCheck(0x60)
                       
) 

    achievement(title="Unique Weapon",
                description = "Obtain the Swordslayer from the Gladiator in Chapter 21",
                points = 5,
                trigger = MapID == 0x14
                       && LoadCheck()
                       && LastItemCheck(0x2b)
                       
) 

    achievement(title="Jumping Dreams",
                description = "Obtain the Master Lance from the Dragoon in Chapter 22",
                points = 5,
                trigger = MapID == 0x15
                       && LoadCheck()
                       && LastItemCheck(0x78)
                       
) 

    achievement(title="Skeletal Rush",
                description = "Ahmed has had enough! Witness his powered-up charge in Chapter 23",
                points = 10,
                trigger = MapID == 0x16
                       && bit0(0x5273) == 1
                       && prev(bit0(0x5273)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Bald Sage",
                description = "Talk to the Mangs Sage in Chapter 24 to get a new, even weirder, skill",
                points = 10,
                trigger = MapID == 0x17
                       && LoadCheck()
                       && ascii_string_equals(0x0326b5, "Sup. I fired the Weird Sage")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
)   

    achievement(title="That's Kind of Weird",
                description = "Obtain the Boots from a Dancer in Chapter 25",
                points = 10,
                trigger = MapID == 0x18
                       && LoadCheck()
                       && LastItemCheck(0x62)
                       
) 

    achievement(title="This one is free",
                description = "Witness the Rogues arrival in Chapter 26",
                points = 1,
                trigger = MapID == 0x19
                       && bit0(0x5272) == 1
                       && prev(bit0(0x5272)) == 0
                       && LoadCheck()
                       
) 

    achievement(title="Mommy Dearest",
                description = "Obtain the Runesword from Cassandra in Chapter 27",
                points = 10,
                trigger = MapID == 0x1a
                       && LoadCheck()
                       && LastItemCheck(0x11)
                       
) 

    achievement(title="Basic Science",
                description = "Obtain the Physic Staff from the secret Sage in Chapter 28",
                points = 10,
                trigger = MapID == 0x1b
                       && LoadCheck()
                       && LastItemCheck(0x4e)
                       
) 

    achievement(title="Glorious Destiny",
                description = "Witness Hubert rallying cry in Chapter 29",
                points = 5,
                trigger = MapID == 0x1c
                       && LoadCheck()
                       && ascii_string_equals(0x0326b1, "FOR THE GLORY OF HOUSE ROSE")
                       && byte(0x0326b1) != prev(byte(0x0326b1))
                       
)  

    achievement(title="The Eternal Secret",
                description = "Defeat the Secret Steel Knight and obtain his Eternal Seal in Chapter 30",
                points = 10,
                trigger = MapID == 0x1d
                       && LoadCheck()
                       && LastItemCheck(0xb7)
                       && BattleFlag == 1
                       
) 