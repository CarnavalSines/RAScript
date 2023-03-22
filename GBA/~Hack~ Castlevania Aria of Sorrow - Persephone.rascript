// ~Hack~ Castlevania: Aria of Sorrow - Persephone
// #ID = 14177


// 20230321 Version - Sines

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

// $000000: --- --- ---
//          Hack of Aria of Sorrow
//          Most the notes are lifted from the original game, credit to the respective dev
//          --- --- ---
// $0020DA: [8 Bit] Looks to be Music ID
// $008010: [8-Bit] Game state.
//          00 > Konami Logo
//          01 > Title Screen
//          02 > Game Start
//          04 > In-game
//          05 > Game Over
//          06 > Credits
//          07 > Intro
//          08 > Boss Rush (File Select)
//          0A > Soul Trade (File Select)
//          0B > Sound Mode
//          0C > Licensing
//          0D > Language Select
//          10 > Debug Menu
// $00801B: [8 Bit] Save the game ? Prompt
//          04 On prompt pop-up
// $008020: [8Bit] Player Name (1st Character)
// $008021: [8Bit] Player Name (2nd Character)
// $008022: [8Bit] Player Name (3rd Character)
// $008023: [8Bit] Player Name (4th Character)
// $008024: [8Bit] Player Name (5th Character)
// $008025: [8Bit] Player Name (6th Character)
// $008026: [8Bit] Player Name (7th Character)
// $008027: [8Bit] Player Name (8th Character)
// $008060: [8 Bit] Extra modes bitflags
//          Bit 0 | Julius Mode / NOUSE / NOSOUL
//          Bit 1 | Hard Mode / Boss Rush / Sound Test
// $008088: [32 Bit] Room Transition ID
//          Creaking Skull Fight > 0x0850f58c
//          Chaos > 0x0852253c before fight
//          > 0x08522abc first phase
//          > 0x08522bdc second phase
//          0x0852362c post fight 1
//          0x08522c54 post fight 2 (before credits)
// $00809E: [8-Bit] Area ID.
//          00 > Castle Corridor
//          01 > Chapel
//          02 > Study
//          03 > Dance Hall
//          04 > Inner Quarters
//          05 > Floating Garden
//          06 > Clock Tower
//          07 > Underground Reservoir
//          08 > Arena
//          09 > Top Floor
//          0A > Forbidden Area
//          0B > Chaotic Realm
// $00809F: [8-Bit] Room ID
// $0080A1: [Upper4] Difficulty.
//          [Lower4] New Game+ flag.
// $0080A2: [8-Bit] Copied file flag
// $0080AC: [32-Bit] IGT/Frames
// $0080B4: Map data starts here. Explored rooms are attached to bitflags in side-by-side 32-Bit addresses. The first address in a set marks the individual tiles as explored, whereas the second address increments the completion percentage
// $008341: Shop ? TBC
// $008342: [8 Bit] Dialogue Bitflags ?
//          Bit 3 | Start of Game Carmilla "I never left here"
// $008346: [8 Bit] Special Mode Flags
//          Bit 4 | NOUSE
//          Bit 5 | NOSOUL
// $008360: [8 Bit] Start of event flags
//          Bit 1 | Obtained Grave Keeper
//          Bit 2 | Obtained Feather Robe
//          Bit 3 | Obtained Valkyrie Feather
// $008364: [8 Bit] Event Flags
//          Bit 1 | Obtained Dash Kick
// $00837E: [8 Bit] Boss Kill Flags tbc
//          Bit 0 | Graham
//          Bit 1 | Death
//          Bit 2 | Julius
//          Bit 3 | ??
//          Bit 4 | Headhunter
//          Bit 5 | Legion
//          Bit 6 | Balore
//          Bit 7 | Chaos
// $00837F: [8 Bit] Boss Kill Flags
//          Bit 2 | Manticore
//          Bit 3 | Creaking Skull
//          Bit 4 | Big Golem
//          Bit 7 | Great Armor
// $00842D: [8 Bit] Boss Rush Clear Flag on Bit 2 tbc
// $0084CC: [8 Bit] Boss Rush Status
//          10 > Normal
//          11 > In Boss Rush
// $0084D0: [32-Bit] Language.
//          01 > English
//          02 > French
//          03 > German
// $0084EE: [8-Bit] Player state
//          01 > Doing a physical attack
//          02 > Casting a Bullet Soul
//          03 > Using Skeleton Blaze
//          04 > Recovering from a fall
//          05 > Using Hippogryph
//          06 > Recovering from a ceiling bonk
//          07 > Using Kicker Skeleton
//          08 > In Giant Bat form
//          09 > In Devil/Manticore/Curly form
//          0A > Using Final Guard/Bone Pillar/Catoblepas
//          0B > Using Omnia Vanitas
//          0C > Standing hurt animation
//          0D > Mid-air hurt animation
//          10 > Dying animation
//          11 > Having souls drained
// $0092E4: [32-Bit] Great Armor/Big Golem boss door position
// $009368: [32-Bit] Legion/Balore/Julius boss door position
// $0093EC: [32-Bit] Creaking Skull/Headhunter/Graham boss door position
// $009470: [32-Bit] Manticore boss door position
// $0094F4: [32-Bit] Death boss door position.
// $01B268: [8 Bit] Weapon Equipment
//          00 > Maid Heels
//          01 > Steel Heels
//          02 > Platinum Heels
//          03 > Onyx Heels
//          05 > Valkyrie Chain
//          07 > Lapis Heels
//          08 > Gray Heels
//          09 > Green Heels
//          0a > White Heels
//          0b > Blue Heels
//          0c > Purple Heels
//          0d > Red Heels
//          0e > Witch's Heels
//          0f > Black Heels
//          10 > Yellow Heels
//          24 > Sword Familiar
//          2b > Spear
//          2c > Broom
//          2d > Lance
//          2e > Valkyrie Spear
//          2f > Umbrella
//          31 > Gabolg
//          32 > Heels of Bonds
//          33 > Valkyrie Boots
//          39 > Positron Rifle
//          3a > White Gloves
//          FF > Nothing
// $01B269: [8 Bit] Equipped RED Soul
//          00 > None
//          01 > Fire Iron
//          02 > Flame Demon
//          03 > Silverware
//          04 > Mr. Truffles
//          05 > Frying Pan
//          06 > Fire Truffles
//          07 > Killer Fish
//          08 > Dark Inferno
//          09 > Exploding Apple
//          0a > Ghost
//          0b > Siren
//          0c > Tiny Doves
//          0d > Durga
//          0e > Rock Armor
//          0f > Thunder Truffles
//          10 > Arachne
//          11 > Mother Clucker
//          12 > Butcher Knife
//          13 > Curry
//          14 > Altair
//          15 > Holy Truffles
//          16 > Ice Beam
//          17 > Werewolf
//          18 > Old Shoes
//          19 > Une
//          1a > Pin Cushion
//          1b > Frost Truffles
//          1c > Ukoback
//          1d > Fish Head
//          1e > Shuriken
//          1f > Sequens Umbra
//          20 > Eggs
//          21 > Demon Seed
//          22 > Bloody Cleaver
//          23 > Lunging Kick
//          24 > Flurry Kick
//          25 > Biphron
//          26 > Dinner Bell
//          27 > Beam Skeleton
//          28 > Skull Milione
//          29 > Umbra Truffles
//          2a > Spinning Wheel
//          2b > Blue Crow
//          2c > Omega Truffles
//          2d > Lightning Doll
//          2e > Valkyrie
//          2f > Giant Bomb
//          30 > Red Minotaur
//          31 > Legion
//          32 > Kick of Scorn
//          33 > Dessert
//          34 > Nemesis
//          35 > Killer Mantle
//          36 > Kyoma Demon
//          37 > Chronomage
// $01B26A: [8 Bit] Equipped BLUE Soul
//          00 > None
//          01 > Feather Rober
//          02 > Grand Witch
//          03 > Dash Kick
//          04 > Flame Barrier
//          05 > Umbrella
//          06 > Barrier
//          07 > Parry
//          08 > Great Armor
//          09 > Catoblepas
//          0a > Bone Pillar
//          0b > Cagnazzo
//          0c > Big Golem
//          0d > Shadow Knight
//          0e > Creaking Skull
//          0f > Medusa Head
//          10 > Demon Vacuum
//          11 > Alura Une
//          12 > Clone Rush
//          13 > Poltergist
//          14 > Gale Rush
//          15 > Ninth Gate
//          16 > Imp
//          17 > Broom Familiar
//          18 > Glass Slippers
// $01B26B: [8 Bit] Equipped YELLOW Soul
//          00 > None
//          01 > Buyoant Soles
//          02 > Scylla
//          03 > Red Crow
//          04 > Steel Skin
//          05 > Dead Warrior
//          06 > Peeping Eye
//          07 > Siphon Spell
//          08 > Flesh Golem
//          09 > Seduction
//          0a > Meditation
//          0b > Wooden Golem
//          0c > Zombie
//          0d > Blood Pact
//          0e > Headhunter
//          0f > Basilisk
//          10 > Erinys
//          11 > Mimic
//          12 > Arc Demon
//          13 > Poison Worm
//          14 > Ectoplasm
//          15 > Gargoyle
//          16 > Skeleton Knight
//          17 > Minotaur
//          18 > Golem
//          19 > Triton
//          1a > White Dragon
//          1b > Quezlcoatl
//          1c > Gorgon
//          1d > Dead Crusader
//          1e > Aerial Ace
//          1f > Lilith
//          20 > Bael
//          21 > Stolas
//          22 > Ghost Dancer
//          23 > Gremlin
// $01B279: [8 Bit] Persephone Level
// $01B27A: [16 Bit] Current HP
// $01B27C: [16 Bit] Current MP
// $01B288: [16 Bit] Luck Stat
// $01B31C: [8 Bit] Souls Data RED
//          Upper 4 | Flame Demon > Red Minotaur
//          Lower 4 | Fire Iron > Winged Skeleton
// $01B31D: [8 Bit] Souls Data RED
//          Upper 4 | Mr Truffles > Zombie
//          Lower 4 | Silverware > Merman
// $01B31E: [8 Bit] Souls Data RED
//          Upper 4 | Fire Truffles > Wooden Golem
//          Lower 4 | Frying Pan > Peeping Eye
// $01B31F: [8 Bit] Souls Data RED
//          Upper 4 | Dark Inferno > Balore
//          Lower 4 | Killer Fish > White Dragon
// $01B320: [8 Bit] Souls Data RED
//          Upper 4 | Ghost > Zombie Soldier
//          Lower 4 | Exploding Apple > Skull Archer
// $01B321: [8 Bit] Souls Data RED
//          Upper 4 | Tiny Doves > Ghost
//          Lower 4 | Siren > Skeleton Knight
// $01B322: [8 Bit] Souls Data RED
//          Upper 4 | Rock Armor > Tiny Devil
//          Lower 4 | Durga > Siren
// $01B323: [8 Bit] Souls Data RED
//          Upper 4 | Arachne > Giant Ghost
//          Lower 4 | Thunder Truffle > Buer
// $01B324: [8 Bit] Souls Data RED
//          Upper 4 | Butcher Knife > Arachne
//          Lower 4 | Mother Clucker > Minotaur
// $01B325: [8 Bit] Souls Data RED
//          Upper 4 | Altair > Curly
//          Lower 4 | Curry > Catoblepas
// $01B326: [8 Bit] Souls Data RED
//          Upper 4 | Ice Beam > Red Crow
//          Lower 4 | Holy Truffles > Killer Mantle
// $01B327: [8 Bit] Souls Data RED
//          Upper 4 | Old Shoes > Gremlin
//          Lower 4 | Werewolf > Imp
// $01B328: [8 Bit] Souls Data RED
//          Upper 4 | Pin Cushion > Giant Worm
//          Lower 4 | Une > Great Armor
// $01B329: [8 Bit] Souls Data RED
//          Upper 4 | Ukoback > Werejaguar
//          Lower 4 | Frost Truffles > Needles
// $01B32A: [8 Bit] Souls Data RED
//          Upper 4 | Shuriken > Gorgon
//          Lower 4 | Fish Head > Man-Eater
// $01B32B: [8 Bit] Souls Data RED
//          Upper 4 | Eggs > Triton
//          Lower 4 | Sequens Umbra > Fish Head
// $01B32C: [8 Bit] Souls Data RED
//          Upper 4 | Bloody Cleaver > Cagnazzo
//          Lower 4 | Demon Seed > Big Golem
// $01B32D: [8 Bit] Souls Data RED
//          Upper 4 | Flurry Kick > Kicker Skeleton
//          Lower 4 | Lunging Kick > Ripper
// $01B32E: [8 Bit] Souls Data RED
//          Upper 4 | Dinner Bell > Biphron
//          Lower 4 | Biphron > Alura Une
// $01B32F: [8 Bit] Souls Data RED
//          Upper 4 | Skull Milione > Demon Lord
//          Lower 4 | Beam Skeleton > Alastor
// $01B330: [8 Bit] Souls Data RED
//          Upper 4 | Spinning Wheel > Giant Skeleton
//          Lower 4 | Umbra Truffles > Skull Milione
// $01B331: [8 Bit] Souls Data RED
//          Upper 4 | Omega Truffles > Fixed Item
//          Lower 4 | Blue Crow > Iron Golem
// $01B332: [8 Bit] Souls Data RED
//          Upper 4 | Valkyrie > Kyoma Demon
//          Lower 4 | Lightning Doll > Bomber Armor
// $01B333: [8 Bit] Souls Data RED
//          Upper 4 | Red Minotaur > Gargoyle
//          Lower 4 | Giant Bomb > Medusa Head
// $01B334: [8 Bit] Souls Data RED
//          Upper 4 | Kick of Scorn > Legion
//          Lower 4 | Legion > Death
// $01B335: [8 Bit] Souls Data RED
//          Upper 4 | Nemesis > Doppelganger 10
//          Lower 4 | Desert > Ghost Dancer
// $01B336: [8 Bit] Souls Data RED
//          Upper 4 | Kyoma Demon > Lilith
//          Lower 4 | Killer Mantle > Weretiger
// $01B337: [8 Bit] Souls Data RED
//          Lower 4 | Chronomage > Nemesis
// $01B354: [8 Bit] Souls Data BLUE
//          Upper 4 | Grand Witch > Grand Witch
//          Lower 4 | Feather Robe> Fixed Item
// $01B355: [8 Bit] Souls Data BLUE
//          Upper 4 | Flame Barrier > Bone Pillar
//          Lower 4 | Dash Kick > Fixed Item
// $01B356: [8 Bit] Souls Data BLUE
//          Upper 4 | Barrier > Durga
//          Lower 4 | Umbrella > Chronomage
// $01B357: [8 Bit] Souls Data BLUE
//          Upper 4 | Great Armor > Lightning Doll
//          Lower 4 | Parry > Stolas
// $01B358: [8 Bit] Souls Data BLUE
//          Upper 4 | Bone Pillar > Axe Armor
//          Lower 4 | Catoblepas > Quezlcoatl
// $01B359: [8 Bit] Souls Data BLUE
//          Upper 4 | Big Golem > Slime
//          Lower 4 | Cagnazzo > Arc Demon
// $01B35A: [8 Bit] Souls Data BLUE
//          Upper 4 | Creaking Skull > Killer Doll
//          Lower 4 | Shadow Knight > Flame Demon
// $01B35B: [8 Bit] Souls Data BLUE
//          Upper 4 | Demon Vacuum > Bat
//          Lower 4 | Medusa Head > Harpy
// $01B35C: [8 Bit] Souls Data BLUE
//          Upper 4 | Clone Rush > Dead Warrior
//          Lower 4 | Alura Une > Ukoback
// $01B35D: [8 Bit] Souls Data BLUE
//          Upper 4 | Gale Rush > Valkyrie
//          Lower 4 | Poltergeist > Golem
// $01B35E: [8 Bit] Souls Data BLUE
//          Upper 4 | Imp > Devil
//          Lower 4 | Ninth Gate > Flesh Golem
// $01B35F: [8 Bit] Souls Data BLUE
//          Upper 4 | Glass Slippers > Headhunter
//          Lower 4 | Broom Familiar > Beam Skeleton
// $01B36E: [8 Bit] Souls Data YELLOW
//          Upper 4 | Scylla > Fixed Item
//          Lower 4 | Buyant Soles > Fixed Item
// $01B36F: [8 Bit] Souls Data YELLOW
//          Upper 4 | Steel Skin > Skeleton
//          Lower 4 | Red Crow > Dead Crusader
// $01B370: [8 Bit] Souls Data YELLOW
//          Upper 4 | Peeping Eye > Killer Fish
//          Lower 4 | Dead Warrior > Cockatrice
// $01B371: [8 Bit] Souls Data YELLOW
//          Upper 4 | Flesh Golem > Mandragora
//          Lower 4 | Siphon Spell > Bael
// $01B372: [8 Bit] Souls Data YELLOW
//          Upper 4 | Meditation > Une
//          Lower 4 | Seduction > Creaking Skull
// $01B373: [8 Bit] Souls Data YELLOW
//          Upper 4 | Zombie > Basilisk
//          Lower 4 | Wooden Golem > Zombie Officer
// $01B374: [8 Bit] Souls Data YELLOW
//          Upper 4 | Headhunter > Student Witch
//          Lower 4 | Blood Pact > Dopperlganger 40
// $01B375: [8 Bit] Souls Data YELLOW
//          Upper 4 | Erinys > Shadow Knight
//          Lower 4 | Basilisk > Rubicant
// $01B376: [8 Bit] Souls Data YELLOW
//          Upper 4 | Arc Demon > Poison Worm
//          Lower 4 | Mimic > Succubus
// $01B377: [8 Bit] Souls Data YELLOW
//          Upper 4 | Ectoplasm > Evil Butcher
//          Lower 4 | Poison Worm > Dryad
// $01B378: [8 Bit] Souls Data YELLOW
//          Upper 4 | Skeleton Knight > Final Guard
//          Lower 4 | Gargoyle > Mudman
// $01B379: [8 Bit] Souls Data YELLOW
//          Upper 4 | Golem > Disc Armor
//          Lower 4 | Minotaur > Rock Armor
// $01B37A: [8 Bit] Souls Data YELLOW
//          Upper 4 | White Dragon > Blue Crow
//          Lower 4 | Triton > Nightmare
// $01B37B: [8 Bit] Souls Data YELLOW
//          Upper 4 | Gorgon > Werewolf
//          Lower 4 | Quezlcoatl > Fleaman
// $01B37C: [8 Bit] Souls Data YELLOW
//          Upper 4 | Aerial Ace > Altair
//          Lower 4 | Dead Crusader > Sky Fish
// $01B37D: [8 Bit] Souls Data YELLOW
//          Upper 4 | Bael > Gladiator
//          Lower 4 | Lilith > Tsuchinoko
// $01B37E: [8 Bit] Souls Data YELLOW
//          Upper 4 | Ghost Dancer > Ectoplasm
//          Lower 4 | Stolas > Mimic
// $01B37F: [8 Bit] Souls Data YELLOW
//          Lower 4 | Gremlin > Manticore
// $01B396: Bitflags Currently equipped Ability Souls.
//          [Bit 5] Galamoth
//          [Bit 4] Hippogryph
//          [Bit 3] Kicker Skeleton
//          [Bit 2] Malphas
//          [Bit 1] Skeleton Blaze
//          [Bit 0] Grave Keeper
// $01B3A0: Bitflags Enemy Data entries.
//          [Bit 7] Killer Fish
//          [Bit 6] Peeping Eye
//          [Bit 5] Skull Archer
//          [Bit 4] Axe Armor
//          [Bit 3] Merman
//          [Bit 2] Skeleton
//          [Bit 1] Zombie
//          [Bit 0] Bat
// $01B3A1: Bitflags Enemy Data entries.
//          [Bit 7] Siren
//          [Bit 6] Ghost
//          [Bit 5] Skeleton Knight
//          [Bit 4] Zombie Soldier
//          [Bit 3] White Dragon
//          [Bit 2] Buer
//          [Bit 1] Blue Crow
//          [Bit 0] Bone Pillar
// $01B3A2: Bitflgas Enemy Data entries.
//          [Bit 7] Arachne
//          [Bit 6] Student Witch
//          [Bit 5] Minotaur
//          [Bit 4] Winged Skeleton
//          [Bit 3] Giant Ghost
//          [Bit 2] Rock Armor
//          [Bit 1] Durga
//          [Bit 0] Tiny Devil
// $01B3A3: Bitflags Enemy Data entries.
//          [Bit 7] Killer Doll
//          [Bit 6] Waiter Skeleton
//          [Bit 5] Ghost Dancer
//          [Bit 4] Catoblepas
//          [Bit 3] Ectoplasm
//          [Bit 2] Quezlcoatl
//          [Bit 1] Evil Butcher
//          [Bit 0] Fleaman
// $01B3A4: Bitflags Enemy Data entries.
//          [Bit 7] Kyoma Demon
//          [Bit 6] Nemesis
//          [Bit 5] Lilith
//          [Bit 4] Persephone
//          [Bit 3] Tsuchinoko
//          [Bit 2] Wooden Golem
//          [Bit 1] Creaking Skull
//          [Bit 0] Zombie Officer
// $01B3A5: Bitflags Enemy Data entries.
//          [Bit 7] Dead Warrior
//          [Bit 6] Cockatrice
//          [Bit 5] Red Crow
//          [Bit 4] Altair
//          [Bit 3] Curly
//          [Bit 2] Witch
//          [Bit 1] Valkyrie
//          [Bit 0] Chronomage
// $01B3A6: Bitflags Enemy Data entries.
//          [Bit 7] Gremlin
//          [Bit 6] Manticore
//          [Bit 5] Golem
//          [Bit 4] Disc Armor
//          [Bit 3] Gorgon
//          [Bit 2] Werewolf
//          [Bit 1] Imp
//          [Bit 0] Devil
// $01B3A7: Bitflags Enemy Data entries.
//          [Bit 7] Needles
//          [Bit 6] Giant Worm
//          [Bit 5] Une
//          [Bit 4] Great Armor
//          [Bit 3] Lightning Doll
//          [Bit 2] Bomber Armor
//          [Bit 1] Medusa Head
//          [Bit 0] Harpy
// $01B3A8: Bitflags Enemy Data entries.
//          [Bit 7] Poison Worm
//          [Bit 6] Dryad
//          [Bit 5] Big Golem
//          [Bit 4] Slime
//          [Bit 3] Triton
//          [Bit 2] Nightmare
//          [Bit 1] Fish Head
//          [Bit 0] Man-Eater
// $01B3A9: Bitflags Enemy Data entries.
//          [Bit 7] Mandragora
//          [Bit 6] Biphron
//          [Bit 5] Alura Une
//          [Bit 4] Ukoback
//          [Bit 3] Werejaguar
//          [Bit 2] Ripper
//          [Bit 1] Cagnazzo
//          [Bit 0] Arc Demon
// $01B3AA: Bitflags Enemy Data entries.
//          [Bit 7] Gargoyle
//          [Bit 6] Mudman
//          [Bit 5] Killer Mantle
//          [Bit 4] Weretiger
//          [Bit 3] Kicker Skeleton
//          [Bit 2] Dead Crusader
//          [Bit 1] Sky Fish
//          [Bit 0] Flesh Golem
// $01B3AB: Bitflags Enemy Data entries.
//          [Bit 7] Succubus
//          [Bit 6] Bael
//          [Bit 5] Gladiator
//          [Bit 4] Giant Skeleton
//          [Bit 3] Skull Millione
//          [Bit 2] Alastor
//          [Bit 1] Beam Skeleton
//          [Bit 0] Red Minotaur
// $01B3AC: Bitflags Enemy Data entries.
//          [Bit 7] Final Guard
//          [Bit 6] Demon Lord
//          [Bit 5] Iron Golem
//          [Bit 4] Basilisk
//          [Bit 3] Lubicant
//          [Bit 2] Erinys
//          [Bit 1] Stolas
//          [Bit 0] Mimic
// $01B3AD: Bitflags Enemy Data entries.
//          [Bit 7] Graham
//          [Bit 6] Belmont
//          [Bit 5] Balore
//          [Bit 4] Legion
//          [Bit 3] Death
//          [Bit 2] Headhunter
//          [Bit 1] Shadow Knight
//          [Bit 0] Flame Demon


///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

BossKillFlag = { 
			0:bit3(0x837f), 
			1:bit2(0x837f), 
			2:bit7(0x837f), 
			3:bit4(0x837f), 
			4:bit4(0x837e),
			5:bit1(0x837e),
			6:bit5(0x837e),
			7:bit6(0x837e),
			8:bit0(0x837e),
			9:bit2(0x837e),
			10:bit7(0x837e)
}

BossKillName = { 
			0:"Creaking Skull", 
			1:"Manticore", 
			2:"Great Armor", 
			3:"Big Golem", 
			4:"Headhunter",
			5:"Death",
			6:"Legion",
			7:"Balore",
			8:"Corrupted Soma",
			9:"Doppelganger",
			10:"Chaos"
}


BossKillCheevoName = { 
			0:"Removing Bones", 
			1:"Taking out the Dog", 
			2:"Cleaning Armor", 
			3:"Sweeping Dirt", 
			4:"Dusting-off Trophies",
			5:"Health Check",
			6:"Cemetary Sterilization",
			7:"Lens Cleanse",
			8:"New Management",
			9:"Trusty Ally",
			10:"All Cleaned Up"
}
//----------------
//Variable
GameState = byte(0x8010) 
InGame = GameState == 4
GameOver = GameState == 5
CreditRoll = GameState == 6

PlayingMaid = byte(0x1b266) == 0
DifficultyMode = high4(0x80a1)
NormalMode = DifficultyMode == 0
HardMode = DifficultyMode == 1

NGPlusFlag = low4(0x80a1)

IGTime = dword(0x80ac) //60fps

NOUSEMode = bit4(0x8346) == 1
NOSOULMode = bit5(0x8346) == 1

BossRushMode = byte(0x84cc) == 0x11
BossRushClearFlag = byte(0x842d)
BossRushIGTime = dword(0x9260) //60fps

PlayerActionState = byte(0x84ee)
WeaponEquipped = byte(0x1b268)
REDSoulEquipped = byte(0x1b269)
BLUESoulEquipped = byte(0x1b26a)
YELLOWSoulEquipped = byte(0x1b26b)

CurrentHP = byte(0x1b27a)
CurrentMP = byte(0x1b27c)

LCKStat = word(0x1b288)
RoomTransition = dword(0x008088) //  Used for boss challenges

//----------------
//Function
function DamagelessCheck() => prev(CurrentHP) > CurrentHP
function NoManaUsed() => prev(CurrentMP) > CurrentMP

function BossRushClear() => BossRushMode && CurrentHP > 0 && prev(BossRushClearFlag) < BossRushClearFlag
function HardModeCheck() => HardMode && NGPlusFlag == 0

function AllRedSouls() 
{return
        high4(0x1b31c) >= 1
     && low4(0x1b31c) >= 1  
     && high4(0x1b31d) >= 1
     && low4(0x1b31d) >= 1
     && high4(0x1b31e) >= 1
     && low4(0x1b31e) >= 1
     && high4(0x1b31f) >= 1
     && low4(0x1b31f) >= 1
     && high4(0x1b320) >= 1
     && low4(0x1b320) >= 1
     && high4(0x1b321) >= 1
     && low4(0x1b321) >= 1
     && high4(0x1b322) >= 1
     && low4(0x1b322) >= 1
     && high4(0x1b323) >= 1
     && low4(0x1b323) >= 1
     && high4(0x1b324) >= 1
     && low4(0x1b324) >= 1
     && high4(0x1b325) >= 1
     && low4(0x1b325) >= 1
     && high4(0x1b326) >= 1
     && low4(0x1b326) >= 1
     && high4(0x1b327) >= 1
     && low4(0x1b327) >= 1
     && high4(0x1b328) >= 1
     && low4(0x1b328) >= 1
     && high4(0x1b329) >= 1
     && low4(0x1b329) >= 1
     && high4(0x1b32a) >= 1
     && low4(0x1b32a) >= 1
     && high4(0x1b32b) >= 1
     && low4(0x1b32b) >= 1
     && high4(0x1b32c) >= 1
     && low4(0x1b32c) >= 1
     && high4(0x1b32d) >= 1
     && low4(0x1b32d) >= 1
     && high4(0x1b32e) >= 1
     && low4(0x1b32e) >= 1
     && high4(0x1b32f) >= 1
     && low4(0x1b32f) >= 1
     && high4(0x1b330) >= 1
     && low4(0x1b330) >= 1
     && high4(0x1b331) >= 1
     && low4(0x1b331) >= 1
     && high4(0x1b332) >= 1
     && low4(0x1b332) >= 1
     && high4(0x1b333) >= 1
     && low4(0x1b333) >= 1
     && high4(0x1b334) >= 1
     && low4(0x1b334) >= 1
     && high4(0x1b335) >= 1
     && low4(0x1b335) >= 1
     && high4(0x1b336) >= 1
     && low4(0x1b336) >= 1
     && low4(0x1b337) >= 1
}

function AllBlueSouls() 
{return
        high4(0x1b354) >= 1
     && low4(0x1b354) >= 1
     && high4(0x1b355) >= 1
     && low4(0x1b355) >= 1
     && high4(0x1b356) >= 1
     && low4(0x1b356) >= 1
     && high4(0x1b357) >= 1
     && low4(0x1b357) >= 1
     && high4(0x1b358) >= 1
     && low4(0x1b358) >= 1
     && high4(0x1b359) >= 1
     && low4(0x1b359) >= 1
     && high4(0x1b35a) >= 1
     && low4(0x1b35a) >= 1
     && high4(0x1b35b) >= 1
     && low4(0x1b35b) >= 1
     && high4(0x1b35c) >= 1
     && low4(0x1b35c) >= 1
     && high4(0x1b35d) >= 1
     && low4(0x1b35d) >= 1
     && high4(0x1b35e) >= 1
     && low4(0x1b35e) >= 1
     && high4(0x1b35f) >= 1
     && low4(0x1b35f) >= 1     
}

function AllYellowSouls() 
{return     
        high4(0x1b36e) >= 1
     && low4(0x1b36e) >= 1
     && high4(0x1b36f) >= 1
     && low4(0x1b36f) >= 1
     && high4(0x1b370) >= 1
     && low4(0x1b370) >= 1
     && high4(0x1b371) >= 1
     && low4(0x1b371) >= 1
     && high4(0x1b372) >= 1
     && low4(0x1b372) >= 1
     && high4(0x1b373) >= 1
     && low4(0x1b373) >= 1
     && high4(0x1b374) >= 1
     && low4(0x1b374) >= 1
     && high4(0x1b375) >= 1
     && low4(0x1b375) >= 1
     && high4(0x1b376) >= 1
     && low4(0x1b376) >= 1
     && high4(0x1b377) >= 1
     && low4(0x1b377) >= 1
     && high4(0x1b378) >= 1
     && low4(0x1b378) >= 1
     && high4(0x1b379) >= 1
     && low4(0x1b379) >= 1
     && high4(0x1b37a) >= 1
     && low4(0x1b37a) >= 1
     && high4(0x1b37b) >= 1
     && low4(0x1b37b) >= 1
     && high4(0x1b37c) >= 1
     && low4(0x1b37c) >= 1
     && high4(0x1b37d) >= 1
     && low4(0x1b37d) >= 1
     && high4(0x1b37e) >= 1
     && low4(0x1b37e) >= 1
     && low4(0x1b37f) >= 1     
}     

function prevAllRedSouls() 
{return
        prev(high4(0x1b31c)) == 0
     || prev(low4(0x1b31c)) == 0  
     || prev(high4(0x1b31d)) == 0
     || prev(low4(0x1b31d)) == 0
     || prev(high4(0x1b31e)) == 0
     || prev(low4(0x1b31e)) == 0
     || prev(high4(0x1b31f)) == 0
     || prev(low4(0x1b31f)) == 0
     || prev(high4(0x1b320)) == 0
     || prev(low4(0x1b320)) == 0
     || prev(high4(0x1b321)) == 0
     || prev(low4(0x1b321)) == 0
     || prev(high4(0x1b322)) == 0
     || prev(low4(0x1b322)) == 0
     || prev(high4(0x1b323)) == 0
     || prev(low4(0x1b323)) == 0
     || prev(high4(0x1b324)) == 0
     || prev(low4(0x1b324)) == 0
     || prev(high4(0x1b325)) == 0
     || prev(low4(0x1b325)) == 0
     || prev(high4(0x1b326)) == 0
     || prev(low4(0x1b326)) == 0
     || prev(high4(0x1b327)) == 0
     || prev(low4(0x1b327)) == 0
     || prev(high4(0x1b328)) == 0
     || prev(low4(0x1b328)) == 0
     || prev(high4(0x1b329)) == 0
     || prev(low4(0x1b329)) == 0
     || prev(high4(0x1b32a)) == 0
     || prev(low4(0x1b32a)) == 0
     || prev(high4(0x1b32b)) == 0
     || prev(low4(0x1b32b)) == 0
     || prev(high4(0x1b32c)) == 0
     || prev(low4(0x1b32c)) == 0
     || prev(high4(0x1b32d)) == 0
     || prev(low4(0x1b32d)) == 0
     || prev(high4(0x1b32e)) == 0
     || prev(low4(0x1b32e)) == 0
     || prev(high4(0x1b32f)) == 0
     || prev(low4(0x1b32f)) == 0
     || prev(high4(0x1b330)) == 0
     || prev(low4(0x1b330)) == 0
     || prev(high4(0x1b331)) == 0
     || prev(low4(0x1b331)) == 0
     || prev(high4(0x1b332)) == 0
     || prev(low4(0x1b332)) == 0
     || prev(high4(0x1b333)) == 0
     || prev(low4(0x1b333)) == 0
     || prev(high4(0x1b334)) == 0
     || prev(low4(0x1b334)) == 0
     || prev(high4(0x1b335)) == 0
     || prev(low4(0x1b335)) == 0
     || prev(high4(0x1b336)) == 0
     || prev(low4(0x1b336)) == 0
     || prev(low4(0x1b337)) == 0
}

function prevAllBlueSouls() 
{return
        prev(high4(0x1b354)) == 0
     || prev(low4(0x1b354)) == 0
     || prev(high4(0x1b355)) == 0
     || prev(low4(0x1b355)) == 0
     || prev(high4(0x1b356)) == 0
     || prev(low4(0x1b356)) == 0
     || prev(high4(0x1b357)) == 0
     || prev(low4(0x1b357)) == 0
     || prev(high4(0x1b358)) == 0
     || prev(low4(0x1b358)) == 0
     || prev(high4(0x1b359)) == 0
     || prev(low4(0x1b359)) == 0
     || prev(high4(0x1b35a)) == 0
     || prev(low4(0x1b35a)) == 0
     || prev(high4(0x1b35b)) == 0
     || prev(low4(0x1b35b)) == 0
     || prev(high4(0x1b35c)) == 0
     || prev(low4(0x1b35c)) == 0
     || prev(high4(0x1b35d)) == 0
     || prev(low4(0x1b35d)) == 0
     || prev(high4(0x1b35e)) == 0
     || prev(low4(0x1b35e)) == 0
     || prev(high4(0x1b35f)) == 0
     || prev(low4(0x1b35f)) == 0     
}

function prevAllYellowSouls() 
{return     
        prev(high4(0x1b36e)) == 0
     || prev(low4(0x1b36e)) == 0
     || prev(high4(0x1b36f)) == 0
     || prev(low4(0x1b36f)) == 0
     || prev(high4(0x1b370)) == 0
     || prev(low4(0x1b370)) == 0
     || prev(high4(0x1b371)) == 0
     || prev(low4(0x1b371)) == 0
     || prev(high4(0x1b372)) == 0
     || prev(low4(0x1b372)) == 0
     || prev(high4(0x1b373)) == 0
     || prev(low4(0x1b373)) == 0
     || prev(high4(0x1b374)) == 0
     || prev(low4(0x1b374)) == 0
     || prev(high4(0x1b375)) == 0
     || prev(low4(0x1b375)) == 0
     || prev(high4(0x1b376)) == 0
     || prev(low4(0x1b376)) == 0
     || prev(high4(0x1b377)) == 0
     || prev(low4(0x1b377)) == 0
     || prev(high4(0x1b378)) == 0
     || prev(low4(0x1b378)) == 0
     || prev(high4(0x1b379)) == 0
     || prev(low4(0x1b379)) == 0
     || prev(high4(0x1b37a)) == 0
     || prev(low4(0x1b37a)) == 0
     || prev(high4(0x1b37b)) == 0
     || prev(low4(0x1b37b)) == 0
     || prev(high4(0x1b37c)) == 0
     || prev(low4(0x1b37c)) == 0
     || prev(high4(0x1b37d)) == 0
     || prev(low4(0x1b37d)) == 0
     || prev(high4(0x1b37e)) == 0
     || prev(low4(0x1b37e)) == 0
     || prev(low4(0x1b37f)) == 0     
}   

function AllSouls()
{return   
        AllYellowSouls()
     && AllRedSouls()
     && AllBlueSouls()
     
}     

function prevAllSouls()
{return   
        tally(1,prevAllYellowSouls()
     || prevAllRedSouls()
     || prevAllBlueSouls())
     
}    

function BossKillProgression(points,BossID)
{
    achievement(title = BossKillCheevoName[BossID],
                description = "Defeat " + BossKillName[BossID],
                points = points,
                trigger = 
                            InGame
                         && PlayingMaid
                         && BossKillFlag[BossID] == 1
                         && prev(BossKillFlag[BossID]) == 0
                )
}

function BossKillNOUSE(title,points,BossID)
{
    achievement(title = title,
                description = "Defeat " + BossKillName[BossID]+ " in NOUSE Mode",
                points = points,
                trigger = 
                            InGame
                         && PlayingMaid
                         && BossKillFlag[BossID] == 1
                         && prev(BossKillFlag[BossID]) == 0
                         && NOUSEMode
                )
}

function BossKillNOSOUL(title,points,BossID)
{
    achievement(title = title,
                description = "Defeat " + BossKillName[BossID]+ " in NOSOUL Mode",
                points = points,
                trigger = 
                            InGame
                         && PlayingMaid
                         && BossKillFlag[BossID] == 1
                         && prev(BossKillFlag[BossID]) == 0
                         && NOSOULMode
                )
}
//----------------
///Achievement Code
// Progression
BossKillProgression(3,0)

for i in range (1,2)
    BossKillProgression(5,i)
    
for i in range (3,9)
    BossKillProgression(10,i)
    
BossKillProgression(25,10)

achievement(title = "Count's Betrayal",
                description = "Defeat the Corrupted Soma and watch the normal Ending",
                points = 2,
                trigger = 
                            once(InGame
                         && PlayingMaid
                         && prior(dword(0x8088)) == 0x851fd70
                         && dword(0x8088) == 0x8522c54)
                         && CreditRoll
                         && never(dword(0x8088) != 0x8522c54)
                         
                )
// Hard Mode
achievement(title = "Immaculate Bones [m]",
                description = "[Hard Mode | No NG+] Defeat Creaking Skull without taking damage equipped with only Mr Truffles (other Souls AND Equipment empty) ",
                points = 3,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[0] == 1
                         && prev(BossKillFlag[0]) == 0)
                         && HardModeCheck()
                         && never(DamagelessCheck())
                         && never(GameOver)
                         && never(RoomTransition != 0x850f58c) // room id check
                         && once(dword(0x93ec) == 0 && prev(dword(0x93ec)) == 1) // door slide animation check
                         && WeaponEquipped == 0xff
                         && byte(0x01b26c) == 0xff
                         && byte(0x01b26d) == 0xff
                         && REDSoulEquipped == 0x04 //MrTruffles
                         && BLUESoulEquipped == 00
                         && YELLOWSoulEquipped == 00
                         
                )

achievement(title = "Immaculate Tail [m]",
                description = "[Hard Mode | No NG+] Defeat Manticore without taking damage equipped with only Siren (other Souls AND Equipment empty) ",
                points = 5,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[1] == 1
                         && prev(BossKillFlag[1]) == 0)
                         && HardModeCheck()
                         && never(DamagelessCheck())
                         && never(GameOver)
                         && never(RoomTransition != 0x8511dcc) // room id check
                         && once(dword(0x009470) == 0 && prev(dword(0x009470)) == 1) // door slide animation check
                         && WeaponEquipped == 0xff
                         && byte(0x01b26c) == 0xff
                         && byte(0x01b26d) == 0xff
                         && REDSoulEquipped == 0x0b //Siren
                         && BLUESoulEquipped == 00
                         && YELLOWSoulEquipped == 00
                         
                )
                
achievement(title = "Immaculate Armor [m]",
                description = "[Hard Mode | No NG+] Defeat Great Armor equipped with Curry as Red Soul and Steel Heels as your weapon",
                points = 5,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[2] == 1
                         && prev(BossKillFlag[2]) == 0)
                         && HardModeCheck()
                       //  && never(DamagelessCheck())
                         && never(GameOver)
                         && never(RoomTransition != 0x85134ac) // room id check
                         && once(dword(0x0092e4) == 0 && prev(dword(0x0092e4)) == 1) // door slide animation check
                         && WeaponEquipped == 0x01
                      //   && byte(0x01b26c) == 0xff
                      //   && byte(0x01b26d) == 0xff
                         && REDSoulEquipped == 0x13 //Curry
                       //  && BLUESoulEquipped == 00
                       //  && YELLOWSoulEquipped == 00
                         
                )       
                
achievement(title = "Immaculate Dirt [m]",
                description = "[Hard Mode | No NG+] Defeat Big Golem equipped with Mother Clucker as Red Soul",
                points = 10,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[3] == 1
                         && prev(BossKillFlag[3]) == 0)
                         && HardModeCheck()
                   //      && never(DamagelessCheck())
                         && never(GameOver)
                         && never(RoomTransition != 0x8514b48) // room id check
                         && once(dword(0x0092e4) == 0 && prev(dword(0x0092e4)) == 1) // door slide animation check
                 //        && WeaponEquipped == 0xff
                 //        && byte(0x01b26c) == 0xff
                 //        && byte(0x01b26d) == 0xff
                         && REDSoulEquipped == 0x11 //Mother Clucker
                 //        && BLUESoulEquipped == 00
                 //        && YELLOWSoulEquipped == 00
                         
                )       
                
achievement(title = "Immaculate Trophy [m]",
                description = "[Hard Mode | No NG+] Defeat Headhunter without spending any MP ",
                points = 10,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[4] == 1
                         && prev(BossKillFlag[4]) == 0)
                         && HardModeCheck()
                         && never(NoManaUsed())
                         && never(GameOver)
                         && never(RoomTransition != 0x8516200) // room id check
                         && once(dword(0x0093ec) == 0 && prev(dword(0x0093ec)) == 1) // door slide animation check
                 //        && WeaponEquipped == 0xff
                 //        && byte(0x01b26c) == 0xff
                 //        && byte(0x01b26d) == 0xff
                 //        && REDSoulEquipped == 0x0b //Siren
                 //        && BLUESoulEquipped == 00
                 //        && YELLOWSoulEquipped == 00
                         
                )   
                
achievement(title = "Immaculate Death [m]",
                description = "[Hard Mode | No NG+] Defeat Death equipped with Old Shoes as Red Soul and Green Heels as your weapon",
                points = 10,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[5] == 1
                         && prev(BossKillFlag[5]) == 0)
                         && HardModeCheck()
                     //    && never(DamagelessCheck())
                         && never(GameOver)
                         && never(RoomTransition != 0x8518838) // room id check
                         && once(dword(0x0094f4) == 0 && prev(dword(0x0094f4)) == 1) // door slide animation check
                         && WeaponEquipped == 0x09
                       //  && byte(0x01b26c) == 0xff
                       //  && byte(0x01b26d) == 0xff
                         && REDSoulEquipped == 0x18 //Old Shoes
                      //   && BLUESoulEquipped == 00
                      //   && YELLOWSoulEquipped == 00
                         
                )   
                
                
achievement(title = "Immaculate Cemetary [m]",
                description = "[Hard Mode | No NG+] Defeat Legion equipped with Valkyrie as Red Soul and Blue Heels as your weapon",
                points = 10,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[6] == 1
                         && prev(BossKillFlag[6]) == 0)
                         && HardModeCheck()
                      //   && never(DamagelessCheck())
                         && never(GameOver)
                         && never(RoomTransition != 0x851bfd4) // room id check
                         && once(dword(0x009368) == 0 && prev(dword(0x009368)) == 1) // door slide animation check
                         && WeaponEquipped == 0x0b
                       //  && byte(0x01b26c) == 0xff
                       //  && byte(0x01b26d) == 0xff
                         && REDSoulEquipped == 0x2e //Valkyrie
                       //  && BLUESoulEquipped == 00
                       //  && YELLOWSoulEquipped == 00
                         
                )


achievement(title = "Immaculate Valkyrie [m]",
                description = "[Hard Mode | No NG+] Defeat Balore equipped with with the complete Valkyrie set (Weapon, Armor and Accessory) and without spending any MP",
                points = 10,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[7] == 1
                         && prev(BossKillFlag[7]) == 0)
                         && HardModeCheck()
                         && never(NoManaUsed())
                         && never(GameOver)
                         && never(RoomTransition != 0x851e528) // room id check
                         && once(dword(0x009368) == 0 && prev(dword(0x009368)) == 1) // door slide animation check
                         && WeaponEquipped == 0x33
                         && byte(0x01b26c) == 0x0f
                         && byte(0x01b26d) == 0x20
                //         && REDSoulEquipped == 0x0b //Siren
                //         && BLUESoulEquipped == 00
                //         && YELLOWSoulEquipped == 00
                         
                )          
                
                
achievement(title = "Immaculate Valkyrie [m]",
                description = "[Hard Mode | No NG+] Defeat the Corrupted Soma equipped with the Broom and without spending any MP",
                points = 10,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[8] == 1
                         && prev(BossKillFlag[8]) == 0)
                         && HardModeCheck()
                         && never(NoManaUsed())
                         && never(GameOver)
                         && never(RoomTransition != 0x851fd70) // room id check
                         && once(dword(0x0093ec) == 0 && prev(dword(0x0093ec)) == 1) // door slide animation check
                         && WeaponEquipped == 0x2c
                //         && byte(0x01b26c) == 0x0f
                //         && byte(0x01b26d) == 0x20
                //         && REDSoulEquipped == 0x0b //Siren
                //         && BLUESoulEquipped == 00
                //         && YELLOWSoulEquipped == 00
                         
                )   
                
                
achievement(title = "Immaculate Rider Kick [m]",
                description = "[Hard Mode | No NG+] Defeat Doppelganger using only divekicks",
                points = 25,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[9] == 1
                         && prev(BossKillFlag[9]) == 0)
                         && HardModeCheck()
                //         && never(NoManaUsed())
                         && never(GameOver)
                         && never(RoomTransition != 0x85176f8) // room id check
                         && once(dword(0x009368) == 0 && prev(dword(0x009368)) == 1) // door slide animation check
                         && never(PlayerActionState == 1)
                         && never(PlayerActionState == 2)
                         && never(PlayerActionState == 3)
                         && never(PlayerActionState == 9)
                         && never(PlayerActionState == 0xa)
                         && never(PlayerActionState == 0xb)
                //         && WeaponEquipped == 0x2c
                //         && byte(0x01b26c) == 0x0f
                //         && byte(0x01b26d) == 0x20
                //         && REDSoulEquipped == 0x0b //Siren
                //         && BLUESoulEquipped == 00
                //         && YELLOWSoulEquipped == 00
                         
                ) 
                
achievement(title = "Immaculate Maid [m]",
                description = "[Hard Mode | No NG+] Defeat the Chaos equipped with the following - Weapon: Valkyrie Chain, Red Soul:Sequens Umbra, Blue Soul:Broom Familiar",
                points = 25,
                trigger = 
                            InGame
                         && PlayingMaid
                         && trigger_when(BossKillFlag[10] == 1
                         && prev(BossKillFlag[10]) == 0)
                         && HardModeCheck()
                      //   && never(NoManaUsed())
                         && never(GameOver)
                         && never(RoomTransition == 0 )// on soft reset
                         && once(byte(0x0084ee) == 0 && prev(byte(0x0084ee)) == 1) // door slide animation check
                         && WeaponEquipped == 0x05
                //         && byte(0x01b26c) == 0x0f
                //         && byte(0x01b26d) == 0x20
                         && REDSoulEquipped == 0x1f //Siren
                         && BLUESoulEquipped == 0x17
                //         && YELLOWSoulEquipped == 00
                         
                )   
                                
// Bonus Mode
/// Boss Rush
achievement(title = "Brief  Dusting",
                description = "Complete the Boss Rush in 6 minutes or less as Persephone and obtain the Sword Familiar",
                points = 5,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(byte(0x01b2d8)) == 0
                         && byte(0x01b2d8) == 1

                         
                )

achievement(title = "Quick Cleansing",
                description = "Complete the Boss Rush in 5 minutes or less as Persephone and obtain the Positron Rifle",
                points = 5,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(byte(0x01b2ed)) == 0
                         && byte(0x01b2ed) == 1

                         
                )
achievement(title = "Speed Cleaning",
                description = "Complete the Boss Rush in 4 minutes or less as Persephone and obtain the White Gloves",
                points = 10,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(byte(0x01b2ee)) == 0
                         && byte(0x01b2ee) == 1

                         
                )
                
achievement(title = "Efficiency of the Common Folk",
                description = "Complete the Boss Rush mode in NOSOUL mode",
                points = 5,
                trigger = 
                            InGame
                         && PlayingMaid
                         && NOSOULMode
                         && BossRushClear()

                         
                )                
/// NOSOUL
BossKillNOSOUL("Simple Cleaning Lady",3,0)
BossKillNOSOUL("Simple Au Pair",10,5)
BossKillNOSOUL("Simple Maid",25,10)
    achievement(title = "Not-so-Simple Maid",
                description = "Defeat Chaos in NOSOUL Mode Hard Difficulty [No NG+]",
                points = 25,
                trigger = 
                            InGame
                         && PlayingMaid
                         && BossKillFlag[10] == 1
                         && prev(BossKillFlag[10]) == 0
                         && NOSOULMode
                         && HardModeCheck()
                )
                
/// NOUSE
BossKillNOUSE("Frugal Cleaning Lady",3,0)
BossKillNOUSE("Frugal Au Pair",10,5)
BossKillNOUSE("Frugal Maid",25,10)     
    achievement(title = "Stingy Maid",
                description = "Defeat Chaos in NOUSE Mode Hard Difficulty [No NG+]",
                points = 25,
                trigger = 
                            InGame
                         && PlayingMaid
                         && BossKillFlag[10] == 1
                         && prev(BossKillFlag[10]) == 0
                         && NOUSEMode
                         && HardModeCheck()
                )

           
// Item / Soul Collection
achievement(title = "Full Sweep",
                description = "Collect All Souls",
                points = 50,
                trigger = 
                            InGame
                         && PlayingMaid
                         && tally(10,AllSouls() )
                         && prevAllSouls()

                         
                )
                
achievement(title = "Mr Kitty",
                description = "Find Mr Truffles",
                points = 2,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(high4(0x1b31d)) == 0
                         && high4(0x1b31d) == 1

                         
                )         
                
achievement(title = "Warm Kitty",
                description = "Find Fire Truffles",
                points = 2,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(high4(0x1b31e)) == 0
                         && high4(0x1b31e) == 1

                         
                )       
achievement(title = "Lightning Kitty",
                description = "Find Thunder Truffles",
                points = 2,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(low4(0x1b323)) == 0
                         && low4(0x1b323) == 1

                         
                )     
                
achievement(title = "Saint Kitty",
                description = "Find Holy Truffles",
                points = 2,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(low4(0x1b326)) == 0
                         && low4(0x1b326) == 1     
                )                     

achievement(title = "Cold Kitty",
                description = "Find Frost Truffles",
                points = 2,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(low4(0x1b329)) == 0
                         && low4(0x1b329) == 1     
                )       
                
achievement(title = "Black Kitty",
                description = "Find Umbra Truffles",
                points = 5,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(low4(0x1b330)) == 0
                         && low4(0x1b330) == 1     
                )   
                
achievement(title = "Omni Kitty",
                description = "Find Omega Truffles",
                points = 5,
                trigger = 
                            InGame
                         && PlayingMaid
                         && prev(high4(0x1b331)) == 0
                         && high4(0x1b331) == 1

                         
                )                   
// Other
achievement(title = "Need for Clean [m]",
                description = "Obtain the Dash Kick before Valkyrie Wing",
                points = 5,
                trigger = 
                            InGame
                         && PlayingMaid
                         && low4(0x01b394) == 0 //Valkyrie Wing off
                         && prev(low4(0x1b355)) == 0
                         && low4(0x1b355) == 1

                         
                )      



//----------------
/// Leaderboards



