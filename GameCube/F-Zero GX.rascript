// F-Zero GX
// #ID = 9699
// 20240219 Version - Sines

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

// $000000: [6 Byte] ASCII Game ID
//          GFZE01
//          Oops all pointers, keeping previous code notes to show the data structure
// $0030C8: [32 Bit BE] Memory Pointer
//          * Story Mode Info *
//          +0x801ba0dc | [8 Bit] Story Mode ID
//          +0x801ba0dd | [8 Bit] Story Difficulty Mode
//          --- --- ---
//          * Ongoing Race *
//          +0x801bdc6b | [8 Bit] Story Mode Checks
//          +0x801bdc71 | [8 Bit] Race Status 1
//          +0x801bdc72 | [8 Bit] Race Status 2
//          +0x801bdc76 | [8 Bit] Course ID
//          +0x801bdd16 | [8 Bit] Current Cup ID
//          +0x801bdd17 | [8 Bit] Current Cup Course Number
//          +0x801bdd48 | [16 Bit BE] Ranking Points
//          +0x801bdd4c | [8 Bit] Total Ranking
//          +0x801bddc4 | [8 Bit] Pilot ID
//          +0x801bddc6 | [8 Bit] Machine ID (Only relevant when Custom Machine)
//          --- --- ---
//          * Shop and Bitflags Unlocks *
//          +0x80239102 | [8 Bit] Bitflags Pilot Unlocked
//          +0x80239108 | [8 Bit] Custom Parts Shop
//          +x080239164 | [8 Bit] Bitflags Story Mode Shop
//          +x080239194 | [8 Bit] Bitflags Story Mode Hard Mode Unlock
//          +x0802391c4 | [8 Bit] Bitflags Story Mode Very Hard Mode Unlock
//          +0x8023d9f8 | [32 Bit BE] Tickets
//          +0x8023da00 | [8 Bit] AX Course Item Shop
//          +0x8203da17 | [8 Bit] Sound Item Shop
//          +0x8203da38 | [8 Bit] Staff Ghost Item Shop
//          +0x8023dc5d | [8 Bit] Grand Prix Unlocks
//          +0x8023dc66 | [8 Bit] Interview Bitflags Start (Follows Pilot ID)
//          +0x8023dcb8 | [8 Bit] Master Cup Movie Unlocked (Follows Pilot ID)
//          --- --- ---
//          * Race Speed *
//          +0x802494a8 | [32 Bit] Float BE Current Speed
//          --- --- ---
//          * Race Status Menu Select Info *
//          +0x802453e1 | [8 Bit] Current Mode
//          +0x802453e9 | [8 Bit] Grand Prix Difficulty
//          +0x802453ef | [8 Bit] Selected Pilot
//          +0x802453f4 | [8 Bit] Machine Color
//          +0x8024546d | [8 Bit] Cup Select
//          +0x8024546f | [8 Bit] Course Select
//          --- --- ---
//          * Time Attack Data *
//          +0x80a7b140 | [32 Bit BE] Frame Timer Current Lap Time (Practice and Time Attack Only)
//          +0x80a7b1c4 | [32 Bit BE] Frame Timer Total Time  (Practice and Time Attack Only)
// $00D83A: pin record times
// $3749FC: [8 Bit] Story Mode ID
// $3749FD: [8 Bit] Story Difficulty Mode
//          00 > Normal
//          01 > Hard
//          02 > Very Hard
// $374AF8: [68 Byte] ASCII Movie Name (Cutscene)
// $37858B: [8 Bit] Story Mode Checks
//          Bit 0 | On during racing
//          Bit 1 | If Bit 0 = 1 and Bit 1 = 1 then Mission Failed.
//          | If Bit 0 = 0 and Bit 1 = 1 then Mission Success
// $378591: [8 Bit] Race Status 1
//          Bit 0 | Finished
//          Bit 2 | Timer Display (Story Mode)
//          Bit 3 | Retired (Story Mode Time Up)
//          Bit 4 | Racing
//          Bit 6 | Cup Won
// $378592: [8 Bit] Race Status 2
//          Bit 3 | Replay > Flag do not reset until checking next course
//          Bit 4 | Course Result
//          Bit 5 | Retired
//          Bit 6 | Racing ?
// $378596: [8 Bit] Course ID
// $378634: [16 Bit BE] Mission Timer
//          Not display only but it seems that something else can also trigger a mission failed
// $378636: [8 Bit] Current Cup ID
// $378637: [8 Bit] Current Cup Course Number
// $378668: [16 Bit BE] Ranking Points
// $37866C: [8 Bit] Total Ranking
// $378672: Pin
// $3786E6: [8 Bit] Pilot ID
// $37870C: Pin Mission ID
// $3F3A22: [8 Bit] Bitflags Pilot Unlocked
//          Bit 0 | Phoenix
// $3F3A23: [8 Bit] Bitflags Pilot Unlocked
//          Bit 0 | Digi-Boy
//          Bit 1 | Dai San Gen
//          Bit 2 | Spade
//          Bit 3 | Daigoroh
//          Bit 4 | Princia
//          Bit 5 | Lily
//          Bit 6 | PJ
//          Bit 7 | QQQ
// $3F3A24: [8 Bit] Bitflags Pilot Unlocked
//          Bit 0 | Blood Falcon
//          Bit 1 | John Tanaka
//          Bit 2 | Draq
//          Bit 3 | Roger Buster
//          Bit 4 | Dr. Clash
//          Bit 5 | Black Shadow
//          Bit 6 | Deathborn
//          Bit 7 | Don Genie
// $3F3A25: [8 Bit] Bitflags Pilot Unlocked
//          Bit 0 | Antonio Guster
//          Bit 1 | Beastman
//          Bit 2 | Leon
//          Bit 3 | Super Arrow
//          Bit 4 | Mrs Arrow
//          Bit 5 | Gomar & Shioh
//          Bit 6 | Silver Neelsen
//          Bit 7 | Michael Chain
// $3F3A26: [8 Bit] Bitflags Pilot Unlocked
//          Bit 0 | Mr. EAD
//          Bit 1 | James McCloud
//          Bit 2 | Billy
//          Bit 3 | Kate Alen
//          Bit 4 | Zoda
//          Bit 5 | Jack Levin
//          Bit 6 | Bio Rex
//          Bit 7 | The Skull
// $3F3A27: [8 Bit] Bitflags Pilot Unlocked
//          Bit 0 | Mighty Gazelle
//          Bit 1 | Jody Summer
//          Bit 2 | Dr. Stewart (Default Unlock)
//          Bit 3 | Baba
//          Bit 4 | Samurai Goroh (Default Unlock)
//          Bit 5 | Pico (Default Unlock)
//          Bit 6 | Captain Falcon (Default Unlock)
//          Bit 7 | Octoman
// $3F3A28: [8 Bit] Custom Parts Shop
//          Bit 0 | Booster Devilfish -RX
//          Bit 1 | Booster Mars -EX (JP Transfert Only, DO NOT ASK OF THE PLAYERS)
//          Bit 2 | Booster Titan -G4
//          Bit 3 | Booster Extreme -ZZ
//          Bit 4 | Booster Thunderbolt -V2
//          Bit 5 | Booster Boxer -2C
//          Bit 6 | Booster Shuttle -M2
//          Bit 7 | Booster Punisher -4X
// $3F3A29: [8 Bit] Custom Parts Shop
//          Bit 0 | Cockpit Disk
//          Bit 1 | Cockpit Energy Crest
//          Bit 2 | Booster Euros -01
//          Bit 3 | Booster Triangle -GT
//          Bit 4 | Booster Velocity -J
//          Bit 6 | Booster Saturn -SG
//          Bit 7 | Booster Bluster -X
// $3F3A2A: [8 Bit] Custom Parts Shop
//          Bit 0 | Cockpit Crystal Egg
//          Bit 1 | Cockpit Windy Shark
//          Bit 2 | Cockpit Red Rex
//          Bit 3 | Cockpit Sonic Soldier
//          Bit 4 | Cockpit Maximum Star
//          Bit 5 | Cockpit Moon Snail
//          Bit 6 | Cockpit Crazy Buffalo (JP Transfert Only, DO NOT ASK OF THE PLAYERS)
//          Bit 7 | Cockpit Scud Viper
// $3F3A2B: [8 Bit] Custom Parts Shop
//          Bit 0 | Cockpit Aerial Bullet
//          Bit 1 | Cockpit Spark Bird
//          Bit 3 | Cockpit Dark Chaser
//          Bit 4 | Cockpit Garnet Phantom
//          Bit 5 | Cockpit Bright Spear
//          Bit 6 | Cockpit Hyper Stream
//          Bit 7 | Cockpit Super Lynx
// $3F3A2C: [8 Bit] Custom Parts Shop
//          Bit 0 | Body Liberty Manta
//          Bit 1 | Cockpit Wonder Worm
//          Bit 2 | Cockpit Rush Cyclone
//          Bit 3 | Cockpit Combat Cannon
//          Bit 4 | Cockpit Muscle Gorilla
//          Bit 5 | Cockpit Cyber Fox
//          Bit 6 | Cockpit Heat Snake
//          Bit 7 | Cockpit Rave Drifter
// $3F3A2D: [8 Bit] Custom Parts Shop
//          Bit 0 | Body Silver Sword
//          Bit 1 | Body Rage Knight
//          Bit 2 | Body Rapid Barrel
//          Bit 3 | Body Sky Horse
//          Bit 4 | Body Aqua Goose
//          Bit 5 | Body Space Cancer
//          Bit 6 | Body Metal Shell
//          Bit 7 | Body Speedy Dragon
// $3F3A2E: [8 Bit] Custom Parts Shop
//          Bit 0 | Body Blood Raven
//          Bit 2 | Body Optical Wing
//          Bit 3 | Body Mad Bull (JP Transfert Only, DO NOT ASK OF THE PLAYERS)
//          Bit 4 | Body Big Tyrant
//          Bit 5 | Body Grand Base
//          Bit 6 | Body Fire Wolf
//          Bit 7 | Body Dread Hammer
// $3F3A2F: [8 Bit] Custom Parts Shop
//          Bit 0 | Body Brave Eagle
//          Bit 1 | Body Galaxy Falcon
//          Bit 2 | Body Giant Planet
//          Bit 3 | Body Megalo Cruiser
//          Bit 4 | Body Splash Whale
//          Bit 5 | Body Wild Chariot
//          Bit 6 | Body Valiant Jaguar
//          Bit 7 | Body Holy Spider
// $3F3A36: [8 Bit] Custom Parts Shop
//          Bit 0 | Booster Comet -V
//          Bit 1 | Booster Crwon -77
//          Bit 2 | Booster Triple -Z
// $3F3A37: [8 Bit] Custom Parts Shop
//          Bit 0 | Booster Scorpion -R
//          Bit 1 | Booster Raider -88
//          Bit 2 | Booster Impulse 220
//          Bit 3 | Booster Bazooka -YS
//          Bit 4 | Booster Meteor -RR
//          Bit 5 | Booster Tiger -RZ
//          Bit 6 | Booster Hornet -FX
//          Bit 7 | Booster Jupiter -Q
// $3F3A68: [32 Bit] Machine Shop Item Availability
//          Goes to 0 when item bought
// $3F3A84: [8 Bit] Bitflags Story Mode Shop
//          Bit 0 | Chapter 7
//          Bit 1 | Chapter 6
//          Bit 2 | Chapter 5
//          Bit 3 | Chapter 4
//          Bit 4 | Chapter 3
//          Bit 5 | Chapter 2
//          Bit 6 | Chapter 1
//          Bit 7 | Prologue
// $3F3A85: [8 Bit] Bitflags Story Mode Shop
//          Bit 6 | Chapter 9
//          Bit 7 | Chapter 8
// $3F3AB4: [8 Bit] Bitflags Story Mode Hard Unlock
//          Bit 0 | Chapter 7
//          Bit 1 | Chapter 6
//          Bit 2 | Chapter 5
//          Bit 3 | Chapter 4
//          Bit 4 | Chapter 3
//          Bit 5 | Chapter 2
//          Bit 6 | Chapter 1
// $3F3AB5: [8 Bit] Bitflags Story Mode Hard Unlock
//          Bit 6 | Chapter 9
//          Bit 7 | Chapter 8
// $3F3AE4: [8 Bit] Bitflags Story Mode Very Hard Unlock
//          Bit 0 | Chapter 7
//          Bit 1 | Chapter 6
//          Bit 2 | Chapter 5
//          Bit 3 | Chapter 4
//          Bit 4 | Chapter 3
//          Bit 5 | Chapter 2
//          Bit 6 | Chapter 1
// $3F3AE5: [8 Bit] Bitflags Story Mode Very Hard Unlock
//          Bit 6 | Chapter 9
//          Bit 7 | Chapter 8
// $3F455C: [32 Bit BE] Mute City Twist Road Time Attack Best Lap
//          Not frame counter
//          byte 2 & 3 > Minutes
//          byte 4 & 5 > Seconds
//          bytes 5, 6 & 7 > Miliseconds
// $3F4578: [16 Bit BE] Time Attack Mute City Twist Road Max Speed
// $3F8318: [32 Bit BE] Tickets
// $3F8320: [8 Bit] AX Course Item Shop
//          Bit 2 | AX Course Spiral
//          Bit 3 | AX Course Thunder Road
//          Bit 4 | AX Course Cylinder Wave
//          Bit 5 | AX Course Meteor Stream
//          Bit 6 | AX Course Screw Drive
//          Bit 7 | AX Course Sonic Oval
//          
//          Unlock AX Cup when all courses are bought except Sonic Oval
// $3F8337: [8 Bit] Sound Item Shop
//          Bit 0 | Sounds of Mute City
//          Bit 1 | Sounds of Big Blue
// $3F8358: [8 Bit] Staff Ghost Item Shop
//          Twist Road
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8359: [8 Bit] Staff Ghost Item Shop
//          Split Oval
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F835A: [8 Bit] Staff Ghost Item Shop
//          Surface Slide
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F835B: [8 Bit] Staff Ghost Item Shop
//          Loop Cross
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F835C: [8 Bit] Staff Ghost Item Shop
//          Multiplex
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F835E: [8 Bit] Staff Ghost Item Shop
//          Drift Highway
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F835F: [8 Bit] Staff Ghost Item Shop
//          Aero Dive
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8360: [8 Bit] Staff Ghost Item Shop
//          Mobius Ring
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8361: [8 Bit] Staff Ghost Item Shop
//          Long Pipe
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8362: [8 Bit] Staff Ghost Item Shop
//          Serial Gaps
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8364: [8 Bit] Staff Ghost Item Shop
//          Cylinder Knot
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8365: [8 Bit] Staff Ghost Item Shop
//          Intersection
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8366: [8 Bit] Staff Ghost Item Shop
//          Double Branches
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8367: [8 Bit] Staff Ghost Item Shop
//          Half Pipe
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8368: [8 Bit] Staff Ghost Item Shop
//          Ordeal
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F836A: [8 Bit] Staff Ghost Item Shop
//          Trident
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F836B: [8 Bit] Staff Ghost Item Shop
//          Lateral Shift
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F836C: [8 Bit] Staff Ghost Item Shop
//          Undulation
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F836D: [8 Bit] Staff Ghost Item Shop
//          Dragon Slope
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F836E: [8 Bit] Staff Ghost Item Shop
//          Slim-line Slits
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8370: [8 Bit] Staff Ghost Item Shop
//          Screw Drive
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8371: [8 Bit] Staff Ghost Item Shop
//          Meteor Stream
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8372: [8 Bit] Staff Ghost Item Shop
//          Cylinder Wave
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8373: [8 Bit] Staff Ghost Item Shop
//          Thunder Road
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8374: [8 Bit] Staff Ghost Item Shop
//          Spiral
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F8375: [8 Bit] Staff Ghost Item Shop
//          Sonic Oval
//          Bit 1 | "New" Display
//          Bit 2 | Item Bought
// $3F857D: [8 Bit] Bitflags Grand Prix
//          Bit 0 | Master Difficulty Unlocked
// $3F857E: [8 Bit] Bitflags Grand Prix
//          Bit 0 | Diamond Cup Unlocked
// $3F857F: [8 Bit] Bitflags Grand Prix Clear
//          Bit 0 | Ruby Cup Novice Clear
//          Bit 1 | Sapphire Cup Novice Clear
//          Bit 2 | Emerald Cup Novice Clear
//          Bit 3 | Diamond Cup Novice Clear
//          Bit 4 | AX Cup Novice Clear
// $3F8580: [8 Bit] Bitflags Grand Prix Clear
//          Bit 0 | Ruby Cup Standard Clear
//          Bit 1 | Sapphire Cup Standard Clear
//          Bit 2 | Emerald Cup Standard Clear
//          Bit 3 | Diamond Cup Standard Clear
//          Bit 4 | AX Cup Standard Clear
// $3F8581: [8 Bit] Bitflags Grand Prix Clear
//          Bit 0 | Ruby Cup Expert Clear
//          Bit 1 | Sapphire Cup Expert Clear
//          Bit 2 | Emerald Cup Expert Clear
//          Bit 3 | Diamond Cup Expert Clear
//          Bit 4 | AX Cup Expert Clear
// $3F8582: [8 Bit] Bitflags Grand Prix Clear
//          Bit 0 | Ruby Cup Master Clear
//          Bit 1 | Sapphire Cup Master Clear
//          Bit 2 | Emerald Cup Master Clear
//          Bit 3 | Diamond Cup Master Clear
//          Bit 4 | AX Cup Master Clear
// $3F8586: [8 Bit] Interview Bitflags
//          Bit 0 | Mighty Gazelle 11
//          Bit 1 | Mighty Gazelle 13
//          Bit 2 | Mighty Gazelle 14
//          Bit 3 | Mighty Gazelle 15
//          Bit 4 | Mighty Gazelle 16
//          Bit 5 | Mighty Gazelle 4
//          Bit 6 | Mighty Gazelle 8
//          Bit 7 | Mighty Gazelle 12
// $3F8587: [8 Bit] Interview Bitflags
//          Bit 0 | Mighty Gazelle 1
//          Bit 1 | Mighty Gazelle 2
//          Bit 2 | Mighty Gazelle 3
//          Bit 3 | Mighty Gazelle 5
//          Bit 4 | Mighty Gazelle 6
//          Bit 5 | Mighty Gazelle 7
//          Bit 6 | Mighty Gazelle 9
//          Bit 7 | Mighty Gazelle 10
// $3F8588: [8 Bit] Interview Bitflags
//          Bit 0 | Jody Summer 11
//          Bit 1 | Jody Summer 13
//          Bit 2 | Jody Summer 14
//          Bit 3 | Jody Summer 15
//          Bit 4 | Jody Summer 16
//          Bit 5 | Jody Summer 4
//          Bit 6 | Jody Summer 8
//          Bit 7 | Jody Summer 12
// $3F8589: [8 Bit] Interview Bitflags
//          Bit 0 | Jody Summer 1
//          Bit 1 | Jody Summer 2
//          Bit 2 | Jody Summer 3
//          Bit 3 | Jody Summer 5
//          Bit 4 | Jody Summer 6
//          Bit 5 | Jody Summer 7
//          Bit 6 | Jody Summer 9
//          Bit 7 | Jody Summer 10
// $3F858A: [8 Bit] Interview Bitflags
//          Bit 0 | Dr. Stewart 11
//          Bit 1 | Dr. Stewart 13
//          Bit 2 | Dr. Stewart 14
//          Bit 3 | Dr. Stewart 15
//          Bit 4 | Dr. Stewart 16
//          Bit 5 | Dr. Stewart 4
//          Bit 6 | Dr. Stewart 8
//          Bit 7 | Dr. Stewart 12
// $3F858B: [8 Bit] Interview Bitflags
//          Bit 0 | Dr. Stewart 1
//          Bit 1 | Dr. Stewart 2
//          Bit 2 | Dr. Stewart 3
//          Bit 3 | Dr. Stewart 5
//          Bit 4 | Dr. Stewart 6
//          Bit 5 | Dr. Stewart 7
//          Bit 6 | Dr. Stewart 9
//          Bit 7 | Dr. Stewart 10
// $3F858C: [8 Bit] Interview Bitflags
//          Bit 0 | Baba 11
//          Bit 1 | Baba 13
//          Bit 2 | Baba 14
//          Bit 3 | Baba 15
//          Bit 4 | Baba 16
//          Bit 5 | Baba 4
//          Bit 6 | Baba 8
//          Bit 7 | Baba 12
// $3F858D: [8 Bit] Interview Bitflags
//          Bit 0 | Baba 1
//          Bit 1 | Baba 2
//          Bit 2 | Baba 3
//          Bit 3 | Baba 5
//          Bit 4 | Baba 6
//          Bit 5 | Baba 7
//          Bit 6 | Baba 9
//          Bit 7 | Baba 10
// $3F858E: [8 Bit] Interview Bitflags
//          Bit 0 | Samurai Goroh 11
//          Bit 1 | Samurai Goroh 13
//          Bit 2 | Samurai Goroh 14
//          Bit 3 | Samurai Goroh 15
//          Bit 4 | Samurai Goroh 16
//          Bit 5 | Samurai Goroh 4
//          Bit 6 | Samurai Goroh 8
//          Bit 7 | Samurai Goroh 12
// $3F858F: [8 Bit] Interview Bitflags
//          Bit 0 | Samurai Goroh 1
//          Bit 1 | Samurai Goroh 2
//          Bit 2 | Samurai Goroh 3
//          Bit 3 | Samurai Goroh 5
//          Bit 4 | Samurai Goroh 6
//          Bit 5 | Samurai Goroh 7
//          Bit 6 | Samurai Goroh 9
//          Bit 7 | Samurai Goroh 10
// $3F8590: [8 Bit] Interview Bitflags
//          Bit 0 | Pico 11
//          Bit 1 | Pico 13
//          Bit 2 | Pico 14
//          Bit 3 | Pico 15
//          Bit 4 | Pico 16
//          Bit 5 | Pico 4
//          Bit 6 | Pico 8
//          Bit 7 | Pico 12
// $3F8591: [8 Bit] Interview Bitflags
//          Bit 0 | Pico 1
//          Bit 1 | Pico 2
//          Bit 2 | Pico 3
//          Bit 3 | Pico 5
//          Bit 4 | Pico 6
//          Bit 5 | Pico 7
//          Bit 6 | Pico 9
//          Bit 7 | Pico 10
// $3F8592: [8 Bit] Interview Bitflags
//          Bit 0 | Captain Falcon 11
//          Bit 1 | Captain Falcon 13
//          Bit 2 | Captain Falcon 14
//          Bit 3 | Captain Falcon 15
//          Bit 4 | Captain Falcon 16
//          Bit 5 | Captain Falcon 4
//          Bit 6 | Captain Falcon 8
//          Bit 7 | Captain Falcon 12
// $3F8593: [8 Bit] Interview Bitflags
//          Bit 0 | Captain Falcon 1
//          Bit 1 | Captain Falcon 2
//          Bit 2 | Captain Falcon 3
//          Bit 3 | Captain Falcon 5
//          Bit 4 | Captain Falcon 6
//          Bit 5 | Captain Falcon 7
//          Bit 6 | Captain Falcon 9
//          Bit 7 | Captain Falcon 10
// $3F8594: [8 Bit] Interview Bitflags
//          Bit 0 | Octoman 11
//          Bit 1 | Octoman 13
//          Bit 2 | Octoman 14
//          Bit 3 | Octoman 15
//          Bit 4 | Octoman 16
//          Bit 5 | Octoman 4
//          Bit 6 | Octoman 8
//          Bit 7 | Octoman 12
// $3F8595: [8 Bit] Interview Bitflags
//          Bit 0 | Octoman 1
//          Bit 1 | Octoman 2
//          Bit 2 | Octoman 3
//          Bit 3 | Octoman 5
//          Bit 4 | Octoman 6
//          Bit 5 | Octoman 7
//          Bit 6 | Octoman 9
//          Bit 7 | Octoman 10
// $3F8596: [8 Bit] Interview Bitflags
//          Bit 0 | Mr. EAD 11
//          Bit 1 | Mr. EAD 13
//          Bit 2 | Mr. EAD 14
//          Bit 3 | Mr. EAD 15
//          Bit 4 | Mr. EAD 16
//          Bit 5 | Mr. EAD 4
//          Bit 6 | Mr. EAD 8
//          Bit 7 | Mr. EAD 12
// $3F8597: [8 Bit] Interview Bitflags
//          Bit 0 | Mr. EAD 1
//          Bit 1 | Mr. EAD 2
//          Bit 2 | Mr. EAD 3
//          Bit 3 | Mr. EAD 5
//          Bit 4 | Mr. EAD 6
//          Bit 5 | Mr. EAD 7
//          Bit 6 | Mr. EAD 9
//          Bit 7 | Mr. EAD 10
// $3F8598: [8 Bit] Interview Bitflags
//          Bit 0 | James McCloud 11
//          Bit 1 | James McCloud 13
//          Bit 2 | James McCloud 14
//          Bit 3 | James McCloud 15
//          Bit 4 | James McCloud 16
//          Bit 5 | James McCloud 4
//          Bit 6 | James McCloud 8
//          Bit 7 | James McCloud 12
// $3F8599: [8 Bit] Interview Bitflags
//          Bit 0 | James McCloud 1
//          Bit 1 | James McCloud 2
//          Bit 2 | James McCloud 3
//          Bit 3 | James McCloud 5
//          Bit 4 | James McCloud 6
//          Bit 5 | James McCloud 7
//          Bit 6 | James McCloud 9
//          Bit 7 | James McCloud 10
// $3F859A: [8 Bit] Interview Bitflags
//          Bit 0 | Billy 11
//          Bit 1 | Billy 13
//          Bit 2 | Billy 14
//          Bit 3 | Billy 15
//          Bit 4 | Billy 16
//          Bit 5 | Billy 4
//          Bit 6 | Billy 8
//          Bit 7 | Billy 12
// $3F859B: [8 Bit] Interview Bitflags
//          Bit 0 | Billy 1
//          Bit 1 | Billy 2
//          Bit 2 | Billy 3
//          Bit 3 | Billy 5
//          Bit 4 | Billy 6
//          Bit 5 | Billy 7
//          Bit 6 | Billy 9
//          Bit 7 | Billy 10
// $3F859C: [8 Bit] Interview Bitflags
//          Bit 0 | Kate Alen 11
//          Bit 1 | Kate Alen 13
//          Bit 2 | Kate Alen 14
//          Bit 3 | Kate Alen 15
//          Bit 4 | Kate Alen 16
//          Bit 5 | Kate Alen 4
//          Bit 6 | Kate Alen 8
//          Bit 7 | Kate Alen 12
// $3F859D: [8 Bit] Interview Bitflags
//          Bit 0 | Kate Alen 1
//          Bit 1 | Kate Alen 2
//          Bit 2 | Kate Alen 3
//          Bit 3 | Kate Alen 5
//          Bit 4 | Kate Alen 6
//          Bit 5 | Kate Alen 7
//          Bit 6 | Kate Alen 9
//          Bit 7 | Kate Alen 10
// $3F859E: [8 Bit] Interview Bitflags
//          Bit 0 | Zoda 11
//          Bit 1 | Zoda 13
//          Bit 2 | Zoda 14
//          Bit 3 | Zoda 15
//          Bit 4 | Zoda 16
//          Bit 5 | Zoda 4
//          Bit 6 | Zoda 8
//          Bit 7 | Zoda 12
// $3F859F: [8 Bit] Interview Bitflags
//          Bit 0 | Zoda 1
//          Bit 1 | Zoda 2
//          Bit 2 | Zoda 3
//          Bit 3 | Zoda 5
//          Bit 4 | Zoda 6
//          Bit 5 | Zoda 7
//          Bit 6 | Zoda 9
//          Bit 7 | Zoda 10
// $3F85A0: [8 Bit] Interview Bitflags
//          Bit 0 | Jack Levin 11
//          Bit 1 | Jack Levin 13
//          Bit 2 | Jack Levin 14
//          Bit 3 | Jack Levin 15
//          Bit 4 | Jack Levin 16
//          Bit 5 | Jack Levin 4
//          Bit 6 | Jack Levin 8
//          Bit 7 | Jack Levin 12
// $3F85A1: [8 Bit] Interview Bitflags
//          Bit 0 | Jack Levin 1
//          Bit 1 | Jack Levin 2
//          Bit 2 | Jack Levin 3
//          Bit 3 | Jack Levin 5
//          Bit 4 | Jack Levin 6
//          Bit 5 | Jack Levin 7
//          Bit 6 | Jack Levin 9
//          Bit 7 | Jack Levin 10
// $3F85A2: [8 Bit] Interview Bitflags
//          Bit 0 | Bio Rex 11
//          Bit 1 | Bio Rex 13
//          Bit 2 | Bio Rex 14
//          Bit 3 | Bio Rex 15
//          Bit 4 | Bio Rex 16
//          Bit 5 | Bio Rex 4
//          Bit 6 | Bio Rex 8
//          Bit 7 | Bio Rex 12
// $3F85A3: [8 Bit] Interview Bitflags
//          Bit 0 | Bio Rex 1
//          Bit 1 | Bio Rex 2
//          Bit 2 | Bio Rex 3
//          Bit 3 | Bio Rex 5
//          Bit 4 | Bio Rex 6
//          Bit 5 | Bio Rex 7
//          Bit 6 | Bio Rex 9
//          Bit 7 | Bio Rex 10
// $3F85A4: [8 Bit] Interview Bitflags
//          Bit 0 | The Skull 11
//          Bit 1 | The Skull 13
//          Bit 2 | The Skull 14
//          Bit 3 | The Skull 15
//          Bit 4 | The Skull 16
//          Bit 5 | The Skull 4
//          Bit 6 | The Skull 8
//          Bit 7 | The Skull 12
// $3F85A5: [8 Bit] Interview Bitflags
//          Bit 0 | The Skull 1
//          Bit 1 | The Skull 2
//          Bit 2 | The Skull 3
//          Bit 3 | The Skull 5
//          Bit 4 | The Skull 6
//          Bit 5 | The Skull 7
//          Bit 6 | The Skull 9
//          Bit 7 | The Skull 10
// $3F85A6: [8 Bit] Interview Bitflags
//          Bit 0 | Antonio Guster 11
//          Bit 1 | Antonio Guster 13
//          Bit 2 | Antonio Guster 14
//          Bit 3 | Antonio Guster 15
//          Bit 4 | Antonio Guster 16
//          Bit 5 | Antonio Guster 4
//          Bit 6 | Antonio Guster 8
//          Bit 7 | Antonio Guster 12
// $3F85A7: [8 Bit] Interview Bitflags
//          Bit 0 | Antonio Guster 1
//          Bit 1 | Antonio Guster 2
//          Bit 2 | Antonio Guster 3
//          Bit 3 | Antonio Guster 5
//          Bit 4 | Antonio Guster 6
//          Bit 5 | Antonio Guster 7
//          Bit 6 | Antonio Guster 9
//          Bit 7 | Antonio Guster 10
// $3F85A8: [8 Bit] Interview Bitflags
//          Bit 0 | Beastman 11
//          Bit 1 | Beastman 13
//          Bit 2 | Beastman 14
//          Bit 3 | Beastman 15
//          Bit 4 | Beastman 16
//          Bit 5 | Beastman 4
//          Bit 6 | Beastman 8
//          Bit 7 | Beastman 12
// $3F85A9: [8 Bit] Interview Bitflags
//          Bit 0 | Beastman 1
//          Bit 1 | Beastman 2
//          Bit 2 | Beastman 3
//          Bit 3 | Beastman 5
//          Bit 4 | Beastman 6
//          Bit 5 | Beastman 7
//          Bit 6 | Beastman 9
//          Bit 7 | Beastman 10
// $3F85AA: [8 Bit] Interview Bitflags
//          Bit 0 | Leon 11
//          Bit 1 | Leon 13
//          Bit 2 | Leon 14
//          Bit 3 | Leon 15
//          Bit 4 | Leon 16
//          Bit 5 | Leon 4
//          Bit 6 | Leon 8
//          Bit 7 | Leon 12
// $3F85AB: [8 Bit] Interview Bitflags
//          Bit 0 | Leon 1
//          Bit 1 | Leon 2
//          Bit 2 | Leon 3
//          Bit 3 | Leon 5
//          Bit 4 | Leon 6
//          Bit 5 | Leon 7
//          Bit 6 | Leon 9
//          Bit 7 | Leon 10
// $3F85AC: [8 Bit] Interview Bitflags
//          Bit 0 | Super Arrow 11
//          Bit 1 | Super Arrow 13
//          Bit 2 | Super Arrow 14
//          Bit 3 | Super Arrow 15
//          Bit 4 | Super Arrow 16
//          Bit 5 | Super Arrow 4
//          Bit 6 | Super Arrow 8
//          Bit 7 | Super Arrow 12
// $3F85AD: [8 Bit] Interview Bitflags
//          Bit 0 | Super Arrow 1
//          Bit 1 | Super Arrow 2
//          Bit 2 | Super Arrow 3
//          Bit 3 | Super Arrow 5
//          Bit 4 | Super Arrow 6
//          Bit 5 | Super Arrow 7
//          Bit 6 | Super Arrow 9
//          Bit 7 | Super Arrow 10
// $3F85AE: [8 Bit] Interview Bitflags
//          Bit 0 | Mrs. Arrow 11
//          Bit 1 | Mrs. Arrow 13
//          Bit 2 | Mrs. Arrow 14
//          Bit 3 | Mrs. Arrow 15
//          Bit 4 | Mrs. Arrow 16
//          Bit 5 | Mrs. Arrow 4
//          Bit 6 | Mrs. Arrow 8
//          Bit 7 | Mrs. Arrow 12
// $3F85AF: [8 Bit] Interview Bitflags
//          Bit 0 | Mrs. Arrow 1
//          Bit 1 | Mrs. Arrow 2
//          Bit 2 | Mrs. Arrow 3
//          Bit 3 | Mrs. Arrow 5
//          Bit 4 | Mrs. Arrow 6
//          Bit 5 | Mrs. Arrow 7
//          Bit 6 | Mrs. Arrow 9
//          Bit 7 | Mrs. Arrow 10
// $3F85B0: [8 Bit] Interview Bitflags
//          Bit 0 | Gomar & Shioh 11
//          Bit 1 | Gomar & Shioh 13
//          Bit 2 | Gomar & Shioh 14
//          Bit 3 | Gomar & Shioh 15
//          Bit 4 | Gomar & Shioh 16
//          Bit 5 | Gomar & Shioh 4
//          Bit 6 | Gomar & Shioh 8
//          Bit 7 | Gomar & Shioh 12
// $3F85B1: [8 Bit] Interview Bitflags
//          Bit 0 | Gomar & Shioh 1
//          Bit 1 | Gomar & Shioh 2
//          Bit 2 | Gomar & Shioh 3
//          Bit 3 | Gomar & Shioh 5
//          Bit 4 | Gomar & Shioh 6
//          Bit 5 | Gomar & Shioh 7
//          Bit 6 | Gomar & Shioh 9
//          Bit 7 | Gomar & Shioh 10
// $3F85B2: [8 Bit] Interview Bitflags
//          Bit 0 | Silver Neelsen 11
//          Bit 1 | Silver Neelsen 13
//          Bit 2 | Silver Neelsen 14
//          Bit 3 | Silver Neelsen 15
//          Bit 4 | Silver Neelsen 16
//          Bit 5 | Silver Neelsen 4
//          Bit 6 | Silver Neelsen 8
//          Bit 7 | Silver Neelsen 12
// $3F85B3: [8 Bit] Interview Bitflags
//          Bit 0 | Silver Neelsen 1
//          Bit 1 | Silver Neelsen 2
//          Bit 2 | Silver Neelsen 3
//          Bit 3 | Silver Neelsen 5
//          Bit 4 | Silver Neelsen 6
//          Bit 5 | Silver Neelsen 7
//          Bit 6 | Silver Neelsen 9
//          Bit 7 | Silver Neelsen 10
// $3F85B4: [8 Bit] Interview Bitflags
//          Bit 0 | Michael Chain 11
//          Bit 1 | Michael Chain 13
//          Bit 2 | Michael Chain 14
//          Bit 3 | Michael Chain 15
//          Bit 4 | Michael Chain 16
//          Bit 5 | Michael Chain 4
//          Bit 6 | Michael Chain 8
//          Bit 7 | Michael Chain 12
// $3F85B5: [8 Bit] Interview Bitflags
//          Bit 0 | Michael Chain 1
//          Bit 1 | Michael Chain 2
//          Bit 2 | Michael Chain 3
//          Bit 3 | Michael Chain 5
//          Bit 4 | Michael Chain 6
//          Bit 5 | Michael Chain 7
//          Bit 6 | Michael Chain 9
//          Bit 7 | Michael Chain 10
// $3F85B6: [8 Bit] Interview Bitflags
//          Bit 0 | Blood Falcon 11
//          Bit 1 | Blood Falcon 13
//          Bit 2 | Blood Falcon 14
//          Bit 3 | Blood Falcon 15
//          Bit 4 | Blood Falcon 16
//          Bit 5 | Blood Falcon 4
//          Bit 6 | Blood Falcon 8
//          Bit 7 | Blood Falcon 12
// $3F85B7: [8 Bit] Interview Bitflags
//          Bit 0 | Blood Falcon 1
//          Bit 1 | Blood Falcon 2
//          Bit 2 | Blood Falcon 3
//          Bit 3 | Blood Falcon 5
//          Bit 4 | Blood Falcon 6
//          Bit 5 | Blood Falcon 7
//          Bit 6 | Blood Falcon 9
//          Bit 7 | Blood Falcon 10
// $3F85B8: [8 Bit] Interview Bitflags
//          Bit 0 | John Tanaka 11
//          Bit 1 | John Tanaka 13
//          Bit 2 | John Tanaka 14
//          Bit 3 | John Tanaka 15
//          Bit 4 | John Tanaka 16
//          Bit 5 | John Tanaka 4
//          Bit 6 | John Tanaka 8
//          Bit 7 | John Tanaka 12
// $3F85B9: [8 Bit] Interview Bitflags
//          Bit 0 | John Tanaka 1
//          Bit 1 | John Tanaka 2
//          Bit 2 | John Tanaka 3
//          Bit 3 | John Tanaka 5
//          Bit 4 | John Tanaka 6
//          Bit 5 | John Tanaka 7
//          Bit 6 | John Tanaka 9
//          Bit 7 | John Tanaka 10
// $3F85BA: [8 Bit] Interview Bitflags
//          Bit 0 | Draq 11
//          Bit 1 | Draq 13
//          Bit 2 | Draq 14
//          Bit 3 | Draq 15
//          Bit 4 | Draq 16
//          Bit 5 | Draq 4
//          Bit 6 | Draq 8
//          Bit 7 | Draq 12
// $3F85BB: [8 Bit] Interview Bitflags
//          Bit 0 | Draq 1
//          Bit 1 | Draq 2
//          Bit 2 | Draq 3
//          Bit 3 | Draq 5
//          Bit 4 | Draq 6
//          Bit 5 | Draq 7
//          Bit 6 | Draq 9
//          Bit 7 | Draq 10
// $3F85BC: [8 Bit] Interview Bitflags
//          Bit 0 | Roger Buster 11
//          Bit 1 | Roger Buster 13
//          Bit 2 | Roger Buster 14
//          Bit 3 | Roger Buster 15
//          Bit 4 | Roger Buster 16
//          Bit 5 | Roger Buster 4
//          Bit 6 | Roger Buster 8
//          Bit 7 | Roger Buster 12
// $3F85BD: [8 Bit] Interview Bitflags
//          Bit 0 | Roger Buster 1
//          Bit 1 | Roger Buster 2
//          Bit 2 | Roger Buster 3
//          Bit 3 | Roger Buster 5
//          Bit 4 | Roger Buster 6
//          Bit 5 | Roger Buster 7
//          Bit 6 | Roger Buster 9
//          Bit 7 | Roger Buster 10
// $3F85BE: [8 Bit] Interview Bitflags
//          Bit 0 | Dr. Clash 11
//          Bit 1 | Dr. Clash 13
//          Bit 2 | Dr. Clash 14
//          Bit 3 | Dr. Clash 15
//          Bit 4 | Dr. Clash 16
//          Bit 5 | Dr. Clash 4
//          Bit 6 | Dr. Clash 8
//          Bit 7 | Dr. Clash 12
// $3F85BF: [8 Bit] Interview Bitflags
//          Bit 0 | Dr. Clash 1
//          Bit 1 | Dr. Clash 2
//          Bit 2 | Dr. Clash 3
//          Bit 3 | Dr. Clash 5
//          Bit 4 | Dr. Clash 6
//          Bit 5 | Dr. Clash 7
//          Bit 6 | Dr. Clash 9
//          Bit 7 | Dr. Clash 10
// $3F85C0: [8 Bit] Interview Bitflags
//          Bit 0 | Black Shadow 11
//          Bit 1 | Black Shadow 13
//          Bit 2 | Black Shadow 14
//          Bit 3 | Black Shadow 15
//          Bit 4 | Black Shadow 16
//          Bit 5 | Black Shadow 4
//          Bit 6 | Black Shadow 8
//          Bit 7 | Black Shadow 12
// $3F85C1: [8 Bit] Interview Bitflags
//          Bit 0 | Black Shadow 1
//          Bit 1 | Black Shadow 2
//          Bit 2 | Black Shadow 3
//          Bit 3 | Black Shadow 5
//          Bit 4 | Black Shadow 6
//          Bit 5 | Black Shadow 7
//          Bit 6 | Black Shadow 9
//          Bit 7 | Black Shadow 10
// $3F85C2: [8 Bit] Interview Bitflags
//          Bit 0 | Deathborn 11
//          Bit 1 | Deathborn 13
//          Bit 2 | Deathborn 14
//          Bit 3 | Deathborn 15
//          Bit 4 | Deathborn 16
//          Bit 5 | Deathborn 4
//          Bit 6 | Deathborn 8
//          Bit 7 | Deathborn 12
// $3F85C3: [8 Bit] Interview Bitflags
//          Bit 0 | Deathborn 1
//          Bit 1 | Deathborn 2
//          Bit 2 | Deathborn 3
//          Bit 3 | Deathborn 5
//          Bit 4 | Deathborn 6
//          Bit 5 | Deathborn 7
//          Bit 6 | Deathborn 9
//          Bit 7 | Deathborn 10
// $3F85C4: [8 Bit] Interview Bitflags
//          Bit 0 | Don Genie 11
//          Bit 1 | Don Genie 13
//          Bit 2 | Don Genie 14
//          Bit 3 | Don Genie 15
//          Bit 4 | Don Genie 16
//          Bit 5 | Don Genie 4
//          Bit 6 | Don Genie 8
//          Bit 7 | Don Genie 12
// $3F85C5: [8 Bit] Interview Bitflags
//          Bit 0 | Don Genie 1
//          Bit 1 | Don Genie 2
//          Bit 2 | Don Genie 3
//          Bit 3 | Don Genie 5
//          Bit 4 | Don Genie 6
//          Bit 5 | Don Genie 7
//          Bit 6 | Don Genie 9
//          Bit 7 | Don Genie 10
// $3F85C6: [8 Bit] Interview Bitflags
//          Bit 0 | Digi-Boy 11
//          Bit 1 | Digi-Boy 13
//          Bit 2 | Digi-Boy 14
//          Bit 3 | Digi-Boy 15
//          Bit 4 | Digi-Boy 16
//          Bit 5 | Digi-Boy 4
//          Bit 6 | Digi-Boy 8
//          Bit 7 | Digi-Boy 12
// $3F85C7: [8 Bit] Interview Bitflags
//          Bit 0 | Digi-Boy 1
//          Bit 1 | Digi-Boy 2
//          Bit 2 | Digi-Boy 3
//          Bit 3 | Digi-Boy 5
//          Bit 4 | Digi-Boy 6
//          Bit 5 | Digi-Boy 7
//          Bit 6 | Digi-Boy 9
//          Bit 7 | Digi-Boy 10
// $3F85C8: [8 Bit] Interview Bitflags
//          Bit 0 | Dai San Gen 11
//          Bit 1 | Dai San Gen 13
//          Bit 2 | Dai San Gen 14
//          Bit 3 | Dai San Gen 15
//          Bit 4 | Dai San Gen 16
//          Bit 5 | Dai San Gen 4
//          Bit 6 | Dai San Gen 8
//          Bit 7 | Dai San Gen 12
// $3F85C9: [8 Bit] Interview Bitflags
//          Bit 0 | Dai San Gen 1
//          Bit 1 | Dai San Gen 2
//          Bit 2 | Dai San Gen 3
//          Bit 3 | Dai San Gen 5
//          Bit 4 | Dai San Gen 6
//          Bit 5 | Dai San Gen 7
//          Bit 6 | Dai San Gen 9
//          Bit 7 | Dai San Gen 10
// $3F85CA: [8 Bit] Interview Bitflags
//          Bit 0 | Spade 11
//          Bit 1 | Spade 13
//          Bit 2 | Spade 14
//          Bit 3 | Spade 15
//          Bit 4 | Spade 16
//          Bit 5 | Spade 4
//          Bit 6 | Spade 8
//          Bit 7 | Spade 12
// $3F85CB: [8 Bit] Interview Bitflags
//          Bit 0 | Spade 1
//          Bit 1 | Spade 2
//          Bit 2 | Spade 3
//          Bit 3 | Spade 5
//          Bit 4 | Spade 6
//          Bit 5 | Spade 7
//          Bit 6 | Spade 9
//          Bit 7 | Spade 10
// $3F85CC: [8 Bit] Interview Bitflags
//          Bit 0 | Daigoroh 11
//          Bit 1 | Daigoroh 13
//          Bit 2 | Daigoroh 14
//          Bit 3 | Daigoroh 15
//          Bit 4 | Daigoroh 16
//          Bit 5 | Daigoroh 4
//          Bit 6 | Daigoroh 8
//          Bit 7 | Daigoroh 12
// $3F85CD: [8 Bit] Interview Bitflags
//          Bit 0 | Daigoroh 1
//          Bit 1 | Daigoroh 2
//          Bit 2 | Daigoroh 3
//          Bit 3 | Daigoroh 5
//          Bit 4 | Daigoroh 6
//          Bit 5 | Daigoroh 7
//          Bit 6 | Daigoroh 9
//          Bit 7 | Daigoroh 10
// $3F85CE: [8 Bit] Interview Bitflags
//          Bit 0 | Princia 11
//          Bit 1 | Princia 13
//          Bit 2 | Princia 14
//          Bit 3 | Princia 15
//          Bit 4 | Princia 16
//          Bit 5 | Princia 4
//          Bit 6 | Princia 8
//          Bit 7 | Princia 12
// $3F85CF: [8 Bit] Interview Bitflags
//          Bit 0 | Princia 1
//          Bit 1 | Princia 2
//          Bit 2 | Princia 3
//          Bit 3 | Princia 5
//          Bit 4 | Princia 6
//          Bit 5 | Princia 7
//          Bit 6 | Princia 9
//          Bit 7 | Princia 10
// $3F85D0: [8 Bit] Interview Bitflags
//          Bit 0 | Lily 11
//          Bit 1 | Lily 13
//          Bit 2 | Lily 14
//          Bit 3 | Lily 15
//          Bit 4 | Lily 16
//          Bit 5 | Lily 4
//          Bit 6 | Lily 8
//          Bit 7 | Lily 12
// $3F85D1: [8 Bit] Interview Bitflags
//          Bit 0 | Lily 1
//          Bit 1 | Lily 2
//          Bit 2 | Lily 3
//          Bit 3 | Lily 5
//          Bit 4 | Lily 6
//          Bit 5 | Lily 7
//          Bit 6 | Lily 9
//          Bit 7 | Lily 10
// $3F85D2: [8 Bit] Interview Bitflags
//          Bit 0 | PJ 11
//          Bit 1 | PJ 13
//          Bit 2 | PJ 14
//          Bit 3 | PJ 15
//          Bit 4 | PJ 16
//          Bit 5 | PJ 4
//          Bit 6 | PJ 8
//          Bit 7 | PJ 12
// $3F85D3: [8 Bit] Interview Bitflags
//          Bit 0 | PJ 1
//          Bit 1 | PJ 2
//          Bit 2 | PJ 3
//          Bit 3 | PJ 5
//          Bit 4 | PJ 6
//          Bit 5 | PJ 7
//          Bit 6 | PJ 9
//          Bit 7 | PJ 10
// $3F85D4: [8 Bit] Interview Bitflags
//          Bit 0 | QQQ 11
//          Bit 1 | QQQ 13
//          Bit 2 | QQQ 14
//          Bit 3 | QQQ 15
//          Bit 4 | QQQ 16
//          Bit 5 | QQQ 4
//          Bit 6 | QQQ 8
//          Bit 7 | QQQ 12
// $3F85D5: [8 Bit] Interview Bitflags
//          Bit 0 | QQQ 1
//          Bit 1 | QQQ 2
//          Bit 2 | QQQ 3
//          Bit 3 | QQQ 5
//          Bit 4 | QQQ 6
//          Bit 5 | QQQ 7
//          Bit 6 | QQQ 9
//          Bit 7 | QQQ 10
// $3F85D6: [8 Bit] Interview Bitflags
//          Bit 0 | Phoenix 11
//          Bit 1 | Phoenix 13
//          Bit 2 | Phoenix 14
//          Bit 3 | Phoenix 15
//          Bit 4 | Phoenix 16
//          Bit 5 | Phoenix 4
//          Bit 6 | Phoenix 8
//          Bit 7 | Phoenix 12
// $3F85D7: [8 Bit] Interview Bitflags
//          Bit 0 | Phoenix 1
//          Bit 1 | Phoenix 2
//          Bit 2 | Phoenix 3
//          Bit 3 | Phoenix 5
//          Bit 4 | Phoenix 6
//          Bit 5 | Phoenix 7
//          Bit 6 | Phoenix 9
//          Bit 7 | Phoenix 10
// $3F85D8: [8 Bit] Master Cup Movie Unlocked
//          Mighty Gazelle
// $3F85D9: [8 Bit] Master Cup Movie Unlocked
//          Jody Summer
// $3F85DA: [8 Bit] Master Cup Movie Unlocked
//          Dr. Stewart
// $3F85DB: [8 Bit] Master Cup Movie Unlocked
//          Baba
// $3F85DC: [8 Bit] Master Cup Movie Unlocked
//          Samurai Goroh
// $3F85DD: [8 Bit] Master Cup Movie Unlocked
//          Pico
// $3F85DE: [8 Bit] Master Cup Movie Unlocked
//          Captain Falcon
// $3F85DF: [8 Bit] Master Cup Movie Unlocked
//          Octoman
// $3F85E0: [8 Bit] Master Cup Movie Unlocked
//          Mr. EAD
// $3F85E1: [8 Bit] Master Cup Movie Unlocked
//          James McCloud
// $3F85E2: [8 Bit] Master Cup Movie Unlocked
//          Billy
// $3F85E3: [8 Bit] Master Cup Movie Unlocked
//          Kate Alen
// $3F85E4: [8 Bit] Master Cup Movie Unlocked
//          Zoda
// $3F85E5: [8 Bit] Master Cup Movie Unlocked
//          Jack Levin
// $3F85E6: [8 Bit] Master Cup Movie Unlocked
//          Bio Rex
// $3F85E7: [8 Bit] Master Cup Movie Unlocked
//          The Skull
// $3F85E8: [8 Bit] Master Cup Movie Unlocked
//          Antonio Guster
// $3F85E9: [8 Bit] Master Cup Movie Unlocked
//          Beastman
// $3F85EA: [8 Bit] Master Cup Movie Unlocked
//          Leon
// $3F85EB: [8 Bit] Master Cup Movie Unlocked
//          Super Arrow
// $3F85EC: [8 Bit] Master Cup Movie Unlocked
//          Mrs. Arrow
// $3F85ED: [8 Bit] Master Cup Movie Unlocked
//          Gomar & Shioh
// $3F85EE: [8 Bit] Master Cup Movie Unlocked
//          Silver Neelsen
// $3F85EF: [8 Bit] Master Cup Movie Unlocked
//          Michael Chain
// $3F85F0: [8 Bit] Master Cup Movie Unlocked
//          Blood Falcon
// $3F85F1: [8 Bit] Master Cup Movie Unlocked
//          John Tanaka
// $3F85F2: [8 Bit] Master Cup Movie Unlocked
//          Draq
// $3F85F3: [8 Bit] Master Cup Movie Unlocked
//          Roger Buster
// $3F85F4: [8 Bit] Master Cup Movie Unlocked
//          Dr. Clash
// $3F85F5: [8 Bit] Master Cup Movie Unlocked
//          Black Shadow
// $3F85F6: [8 Bit] Master Cup Movie Unlocked
//          Deathborn
// $3F85F7: [8 Bit] Master Cup Movie Unlocked
//          Don Genie
// $3F85F8: [8 Bit] Master Cup Movie Unlocked
//          Digi-Boy
// $3F85F9: [8 Bit] Master Cup Movie Unlocked
//          Dai San Gen
// $3F85FA: [8 Bit] Master Cup Movie Unlocked
//          Spade
// $3F85FB: [8 Bit] Master Cup Movie Unlocked
//          Daigoroh
// $3F85FC: [8 Bit] Master Cup Movie Unlocked
//          Princia
// $3F85FD: [8 Bit] Master Cup Movie Unlocked
//          Lily
// $3F85FE: [8 Bit] Master Cup Movie Unlocked
//          PJ
// $3F85FF: [8 Bit] Master Cup Movie Unlocked
//          QQQ
// $3F8600: [8 Bit] Master Cup Movie Unlocked
//          Phoenix
// $3FFD01: [8 Bit] Current Mode
//          0xFF on Menu
//          01 > Grand Prix
//          02 > Time Attack
//          03 > Practice
//          04 > Story
//          05 > Customize
//          06 > Options
//          07 > Replay
//          08 > Pilot Profiles
// $3FFD09: [8 Bit] Grand Prix Difficulty
//          00 > Novice
//          01 > Standard
//          02 > Expert
//          03 > Master
// $3FFD0F: [8 Bit] Selected Pilot
// $3FFD14: [8 Bit] Machine Color
// $3FFD8D: [8 Bit] Cup Select
// $3FFD8F: [8 Bit] Course Select
// $3FFF81: [8 Bit] Pilot Profile Select PilotID
// $403DC8: [32 Bit] Float BE Current Speed
//          Only update while racing
// $623F21: [8 Bit] Main menu select cursor
// $C35A60: [32 Bit BE] Frame Timer Current Lap Time (Practice and Time Attack Only)
// $C35A6C: [32 Bit BE] Frame Timer Latest finished Lap Time  (Practice and Time Attack Only)
// $C35A78: Lap 1
// $C35ACC: Lap 2
// $C35AE4: [32 Bit BE] Frame Timer Total Time  (Practice and Time Attack Only)
// $C46A22: [8 Bit] Kill Count in race
//          Max 0x1e (hex 29)
// $C9CC44: [16 Bit BE] Energy
// $C9D7A2: [16 Bit BE] Current Lap Time

///Core
//Constant
Modes = { 
                    1:"Grand Prix",
                    2:"Time Attack",
                    3:"Practice",
                    4:"Story",
                    5:"Customize",
                    6:"Options",
                    7:"Replay",
                    8:"Pilot Profiles",
                    0xff:"Main Menu"

                    }  

PilotName = { 
               0:"Mighty Gazelle",
               1:"Jody Summer",
               2:"Dr. Stewart",
               3:"Baba",
               4:"Samurai Goroh",
               5:"Pico",
               6:"Captain Falcon",
               7:"Octoman",
               8:"Mr. EAD",
               9:"James McCloud",
               10:"Billy",
               11:"Kate Allen",
               12:"Zoda",
               13:"Jack Levin",
               14:"Bio Rex",
               15:"The Skull",
               16:"Antonio Guster",
               17:"Beastman",
               18:"Leon",
               19:"Super Arrow",
               20:"Mrs. Arrow",
               21:"Gomar & Shioh",
               22:"Silver Neelsen",
               23:"Michael Chain",
               24:"Blood Falcon",
               25:"John Tanaka",
               26:"Draq",
               27:"Roguer Buster",
               28:"Dr. Clash",
               29:"Black Shadow",
               30:"Deathborn",
               31:"Don Genie",
               32:"Digi-boy",
               33:"Dai San Gen",
               34:"Spade",
               35:"Daigoroh",
               36:"Princia",
               37:"Lily",
               38:"PJ",
               39:"QQQ",
               40:"Phoenix"

           }      

CourseIDList = { 
               1:"Mute City: Twist Road",
               3:"Mute City: Serial Gaps",
               5:"Aeropolis: Multiplex",
               7:"Port Town: Aero Dive",
               8:"Lightning: Loop Cross",
               9:"Lightning: Half Pipe",
               10:"Green Plant: Intersection",
               11:"Green Plant: Mobius Ring",
               13:"Port Town: Long Pipe",
               14:"Big Blue: Drift Highway",
               15:"Fire Field: Cylinder Knot",
               16:"Casino Palace: Split Oval",
               17:"Fire Field: Undulation",
               21:"Aeropolis: Dragon Slope",
               24:"Cosmo Terminal: Trident",
               25:"Sand Ocean: Lateral Shift",
               26:"Sand Ocean: Surface Slide",
               27:"Big Blue: Ordeal",
               28:"Phantom Road: Slim-Line Slits",
               29:"Casino Palace: Double Branches",
               31:"Aeropolis: Screw Drive",
               32:"Outer Space: Meteor Stream",
               33:"Port Town: Cylinder Wave",
               34:"Lightning: Thunder Road",
               35:"Green Plant: Spiral",
               36:"Mute City: Sonic Oval"

           }  

GPDifficultyList = { 
                    0:"Novice",
                    1:"Standard",
                    2:"Expert",
                    3:"Master"

                    }  

GPCupNames = { 
                    1:"Ruby",
                    2:"Sapphire",
                    3:"Emerald",
                    4:"Diamond",
                    5:"AX"

                    }     

StoryDifficultyList = { 
                    0:"Normal",
                    1:"Hard",
                    2:"Very Hard"

                    }   

StoryCheevoNames = { 
                    1:"Training",
                    2:"Revenge",
                    3:"Sneaky Race",
                    4:"Bloody Chain",
                    5:"Escape",
                    6:"Movie Spoof",
                    7:"Grand Prix",
                    8:"Underworld",
                    9:"Creators Fight"

                    }                         

CustomMachineDisplay = { 
                    0x32:"Custom Machine",
                    0x33:"Custom Machine",
                    0x34:"Custom Machine",
                    0x35:"Custom Machine"


                    }                                       

MasterEndingName = { 
               0:"Scooter Hensin!",
               1:"Federation's Grace",
               2:"Fabulous Rose",
               3:"Secret Training",
               4:"Spiritual Transport",
               5:"Teenage Mutant Assassin Turtle",
               6:"Self Sacrifice",
               7:"Oiled Squid",
               8:"Dear Mario, I've Made you a Cake",
               9:"No Wife, No Son, Only FEVER",
               10:"Monkey Ball",
               11:"Galactic Superstar",
               12:"Mad Scientist",
               13:"Teen Idol",
               14:"Savage Nature",
               15:"It Live",
               16:"Fresh Cleaning",
               17:"Professional Jobber",
               18:"Animal Shelter",
               19:"Owlman Solo",
               20:"Out the Chart",
               21:"Synchronised Ritual",
               22:"Creaking Bones",
               23:"Overcooking",
               24:"Growth Spurt",
               25:"Cyberdancer",
               26:"Gamer Rage",
               27:"Dangerous Delivery",
               28:"PHD in Vacation",
               29:"Bloopers",
               30:"Hype Machine",
               31:"Absolute Menace",
               32:"Cyber-Expert",
               33:"Lost in Thoughts",
               34:"Vodoo Cooking",
               35:"Studying the Blade",
               36:"Magical Girl Princia",
               37:"Autonomous Cleaner",
               38:"All I Want",
               39:"Shark Fishing",
               40:"Time Hero"

           }    

InterviewCheevoName = { 
               0:"Red Gazelle",
               1:"White Cat",
               2:"Golden Fox",
               3:"Iron Tiger",
               4:"Fire Stingray",
               5:"Wild Goose",
               6:"Blue Falcon",
               7:"Deep Claw",
               8:"Great Star",
               9:"Little Wyvern",
               10:"Mad Wolf",
               11:"Super Piranha",
               12:"Death Anchor",
               13:"Astro Robin",
               14:"Big Fang",
               15:"Sonic Phantom",
               16:"Green Panther",
               17:"Hyper Speeder",
               18:"Space Angler",
               19:"King Meteor",
               20:"Queen Meteor",
               21:"Twin Noritta",
               22:"Night Thunder",
               23:"Wild Boar",
               24:"Blood Hawk",
               25:"Wonder Wasp",
               26:"Mighty Typhoon",
               27:"Mighty Hurricane",
               28:"Crazy Bear",
               29:"Black Bull",
               30:"Dark Schneider",
               31:"Fat Shark",
               32:"Cosmic Dolphin",
               33:"Pink Spider",
               34:"Magic Seagull",
               35:"Silver Rat",
               36:"Spark Moon",
               37:"Bunny Flash",
               38:"Groovy Taxi",
               39:"Rolling Turtle",
               40:"Rainbow Phoenix"

           }               

MasterInterviewCheevoName = { 
               0:"Cyborg Pilot",
               1:"Spokesperson",
               2:"Retired Surgeon",
               3:"Wild Dancer",
               4:"Bandit Samurai",
               5:"Assassin in a Half Shell",
               6:"Show Me Your Moves!",
               7:"Takoran Racing",
               8:"Mass Produced Plumber",
               9:"Only Human",
               10:"Monkey See, Monkey Do",
               11:"Dangerous Diva",
               12:"Miscolored Earthling",
               13:"Pretty Boy",
               14:"Feral Hunter",
               15:"F-MAX Legend",
               16:"It's a Mohawk",
               17:"Big Game's Hunter",
               18:"Symbol of Hope",
               19:"Flying Kick",
               20:"Beauty And Skills",
               21:"Full Sync",
               22:"Never Retiring",
               23:"Unbreakable Bonds",
               24:"Les Enfants Terribles",
               25:"First in Speed, Last in Love",
               26:"Underground Racer",
               27:"Mechanical Savant",
               28:"Professor Disrespect",
               29:"Nightshade",
               30:"Lord Death",
               31:"Speedrun Strategy",
               32:"Digiboy, Digital Monster",
               33:"Coordination Crew",
               34:"Ace of Spade",
               35:"Junior Menace",
               36:"Supergrass Princess?",
               37:"Unwanted Win",
               38:"Always on Time",
               39:"Super-Advanced Junk",
               40:"29th Century Boy"

           }    

GhostTracks = { 
               0:"Mute City: Twist Road",
               1:"Casino Palace: Split Oval",
               2:"Sand Ocean: Surface Slide",
               3:"Lightning: Loop Cross",
               4:"Aeropolis: Multiplex",
               5:"Big Blue: Drift Highway",
               6:"Port Town: Aero Dive",
               7:"Green Plant: Mobius Ring",
               8:"Port Town: Long Pipe",
               9:"Mute City: Serial Gaps",
               10:"Fire Field: Cylinder Knot",
               11:"Green Plant: Intersection",
               12:"Casino Palace: Double Branches",
               13:"Lightning: Half Pipe",
               14:"Big Blue: Ordeal",
               15:"Cosmo Terminal: Trident",
               16:"Sand Ocean: Lateral Shift",
               17:"Fire Field: Undulation",
               18:"Aeropolis: Dragon Slope",
               19:"Phantom Road: Slim-Line Slits",
               20:"Aeropolis: Screw Drive",
               21:"Outer Space: Meteor Stream",
               22:"Port Town: Cylinder Wave",
               23:"Lightning: Thunder Road",
               24:"Green Plant: Spiral",
               25:"Mute City: Sonic Oval"

           }                          

GhostHunterName = { 
               0:"As Seen in Mario Kart",
               1:"Gambling Time",
               2:"It Gets Everywhere",
               3:"Thunder Force",
               4:"Aerial Sights",
               5:"Waterslide Not Included",
               6:"Rising Above",
               7:"Morbing Time",
               8:"Tunnel Snakes Rules!",
               9:"Not Scared of Heights",
               10:"Through the Fire",
               11:"Forest Stroll",
               12:"Double or Nothing",
               13:"Lightning Strikes Again",
               14:"Big Ordeal",
               15:"Three Way Vertigo",
               16:"Sand Tombs",
               17:"And the Flames",
               18:"Traffic Jam",
               19:"Illusury Road",
               20:"In for a Loop",
               21:"Death From Above",
               22:"Tube-ular Fun",
               23:"Ride the Lightning",
               24:"Green Hill Death Zone",
               25:"A Final Lap"
           }    

GhostBusterName = { 
               1:"It's the First Track, How Hard Can It Be?",
               3:"Bombs Away!",
               5:"Leeloo Dallas Multiplex",
               7:"Fly High",
               8:"What the Hell is a MTS?",
               9:"Air Time",
               10:"Eco-Urbanism Gone Wrong",
               11:"And Then He Morbed Everywhere",
               13:"Ceci N'est Pas Une Pipe",
               14:"Just As Advertised: Drift City",
               15:"Gordian Knot from Hell",
               16:"Snake Eyes",
               17:"Game of Lava Chicken",
               21:"It's Not the Fall: It's the Reception",
               24:"King of the Concrete Sea",
               25:"Quantum Out of Bound",
               26:"Desert Power",
               27:"Blue Water, Blue Sky",
               28:"Threading the Needle",
               29:"Pick A Lane",
               31:"Hidden Giant ROB",
               32:"The Speedster from Outer Space",
               33:"Serpent's Tail",
               34:"Cloud City",
               35:"Who Dares Win",
               36:"It's the Last Track, How Easy Can It Be?"

           }  

GhostBusterTimes = { 
               1:"00:59:964",
               3:"01:26:549",
               5:"02:15:297",
               7:"02:25:689",
               8:"1:59:907",
               9:"02:50:296",
               10:"02:24:897",
               11:"01:35:169",
               13:"02:26:802",
               14:"01:07:331",
               15:"02:40:909",
               16:"00:56:691",
               17:"02:06:916",
               21:"02:59:076",
               24:"02:58:650",
               25:"02:09:849",
               26:"01:56:743",
               27:"02:50:808",
               28:"02:03:268",
               29:"02:59:117",
               31:"01:06:690",
               32:"01:38:178",
               33:"02:06:837",
               34:"03:18:272",
               35:"03:50:740",
               36:"00:46:893"

           }   

GhostBusterFrames = { 
               1:3596,
               3:5191,
               5:8116,
               7:8740,
               8:7193,
               9:10216,
               10:8692,
               11:5709,
               13:8807,
               14:4039,
               15:9653,
               16:3401,
               17:7613,
               21:10744,
               24:10718,
               25:7790,
               26:7004,
               27:10247,
               28:7395,
               29:10746,
               31:4001,
               32:5890,
               33:7609,
               34:11896,
               35:13844,
               36:2813

           }                
//Variables
MasterPointer = dword_be(0x30c8)

/// Story Mode Info
StoryModeID = byte(MasterPointer +0x801ba0dc) 
StoryModeDifficulty = byte(MasterPointer +0x801ba0dd)

/// Ongoing Race Info
StoryModeCheck1 = bit0(MasterPointer+0x801bdc6b)
StoryModeCheck2 = bit1(MasterPointer+0x801bdc6b)

RetiredFlag = bit3(MasterPointer+0x801bdc71)
CupWinFlag = bit6(MasterPointer+0x801bdc71)
CourseResultScreen = bit4(MasterPointer+0x801bdc72)

CourseID = byte(MasterPointer +0x801bdc76)
CupID = byte(MasterPointer +0x801bdd16)

RankingPoints = word_be(MasterPointer +0x801bdd48)
CupRank = byte(MasterPointer +0x801bdd4c)

PilotID = byte(MasterPointer +0x801bddc4)
MachineID = byte(MasterPointer +0x801bddc6)
/// Shop & Bitflags Info
PilotUnlockAddress1 = (MasterPointer + 0x80239102)
CustomPartAddress1 = (MasterPointer + 0x80239108)
AXBitUnlock = (MasterPointer + 0x8023da00)
SoundBitUnlock = (MasterPointer + 0x8203da17)

MasterModeVideoAddress1 = (MasterPointer + 0x8023dcb8)
InterviewAddress1 = (MasterPointer + 0x8023dc66)
StaffGhostBitUnlock = (MasterPointer + 0x8023da38)
TracksBitFlags = { 
               0:bit2(StaffGhostBitUnlock),
               1:bit2(StaffGhostBitUnlock+1),
               2:bit2(StaffGhostBitUnlock+2),
               3:bit2(StaffGhostBitUnlock+3),
               4:bit2(StaffGhostBitUnlock+4),
               5:bit2(StaffGhostBitUnlock+6),
               6:bit2(StaffGhostBitUnlock+7),
               7:bit2(StaffGhostBitUnlock+8),
               8:bit2(StaffGhostBitUnlock+9),
               9:bit2(StaffGhostBitUnlock+10),
               10:bit2(StaffGhostBitUnlock+12),
               11:bit2(StaffGhostBitUnlock+13),
               12:bit2(StaffGhostBitUnlock+14),
               13:bit2(StaffGhostBitUnlock+15),
               14:bit2(StaffGhostBitUnlock+16),
               15:bit2(StaffGhostBitUnlock+18),
               16:bit2(StaffGhostBitUnlock+19),
               17:bit2(StaffGhostBitUnlock+20),
               18:bit2(StaffGhostBitUnlock+21),
               19:bit2(StaffGhostBitUnlock+22),
               20:bit2(StaffGhostBitUnlock+24),
               21:bit2(StaffGhostBitUnlock+25),
               22:bit2(StaffGhostBitUnlock+26),
               23:bit2(StaffGhostBitUnlock+27),
               24:bit2(StaffGhostBitUnlock+28),
               25:bit2(StaffGhostBitUnlock+29)
           }  
/// Race Speed

/// Race Status Menu Select Info
CurrentMode = byte(MasterPointer + 0x802453e1)
GrandPrixDifficulty = byte(MasterPointer +0x802453e9)

/// Time Attack Data
TimeAttackTotalTime = dword_be(MasterPointer +0x80a7b1c4)  // Frame counter at 60FPS

//----------------
//Function
function StoryModeWin() => StoryModeCheck1 == 0 && StoryModeCheck2 == 1 && prev(StoryModeCheck2) == 0

function CheevoCupNovice(Cup,Points)
{
    achievement(title=GPCupNames[Cup] + " Jack",
                description = "Win the " + GPCupNames[Cup]+" Cup in Novice Difficulty",
                points = Points,
                trigger = CurrentMode == 1
                       && CupID == Cup
                       && CupRank == 0
                       && GrandPrixDifficulty == 00
                       && CupWinFlag == 1
                       && prev(CupWinFlag) == 0
)              
}

function CheevoCupStandard(Cup,Points)
{
    achievement(title=GPCupNames[Cup] + " Queen",
                description = "Win the " + GPCupNames[Cup]+" Cup in Standard Difficulty",
                points = Points,
                trigger = CurrentMode == 1
                       && CupID == Cup
                       && CupRank == 0
                       && GrandPrixDifficulty == 1
                       && CupWinFlag == 1
                       && prev(CupWinFlag) == 0
)              
}

function CheevoCupExpert(Cup,Points)
{
    achievement(title=GPCupNames[Cup] + " King",
                description = "Win the " + GPCupNames[Cup]+" Cup in Expert Difficulty",
                points = Points,
                trigger = CurrentMode == 1
                       && CupID == Cup
                       && CupRank == 0
                       && GrandPrixDifficulty == 2
                       && CupWinFlag == 1
                       && prev(CupWinFlag) == 0
)              
}

function CheevoCupMaster(Cup,Points)
{
    achievement(title=GPCupNames[Cup] + " Master",
                description = "Win the " + GPCupNames[Cup]+" Cup in Master Difficulty",
                points = Points,
                trigger = CurrentMode == 1
                       && CupID == Cup
                       && CupRank == 0
                       && GrandPrixDifficulty == 3
                       && CupWinFlag == 1
                       && prev(CupWinFlag) == 0
)              
}

function StoryModeProg(StoryStage,StoryDifficulty,Points)
{
    achievement(title = StoryDifficultyList[StoryDifficulty]+" " +StoryCheevoNames[StoryStage],
                description = "Clear Mission "+ StoryStage + " of Story Mode in " + StoryDifficultyList[StoryDifficulty] +" Difficulty",
                points = Points,
                trigger = 
                            StoryModeID == StoryStage
                         && CurrentMode == 4
                         && StoryModeDifficulty == StoryDifficulty
                         && StoryModeWin()
)             
}

function MasterEndingCheevo(CharID)
{
    achievement(title = MasterEndingName[CharID],
                description = "Unlock "+PilotName[CharID]+" Ending video by clearing any Cup in Master difficulty",
                points = 25,
                trigger = 
                            CurrentMode == 1
                         && GrandPrixDifficulty == 3   
                         && byte(MasterModeVideoAddress1 +CharID) == 1
                         && prev(byte(MasterModeVideoAddress1 +CharID)) == 0
)             
}

function InterviewCheevo(CharID)
{
    achievement(title = InterviewCheevoName[CharID],
                description = "Answer all regular interview questions for "+PilotName[CharID],
                points = 25,
                trigger = 
                            CurrentMode == 1
                         && bit0(InterviewAddress1+CharID*2) + bit5(InterviewAddress1+CharID*2) + bit6(InterviewAddress1+CharID*2) + bit7(InterviewAddress1+CharID*2) 
                         + bitcount(InterviewAddress1+1+CharID*2) == 12
                         && prev(bit0(InterviewAddress1+CharID*2) + bit5(InterviewAddress1+CharID*2) + bit6(InterviewAddress1+CharID*2) + bit7(InterviewAddress1+CharID*2) 
                         + bitcount(InterviewAddress1+1+CharID*2)) == 11
)             
}

function MasterInterviewCheevo(CharID)
{
    achievement(title = MasterInterviewCheevoName[CharID],
                description = "Answer all Master Cup interview questions for "+PilotName[CharID],
                points = 50,
                trigger = 
                            CurrentMode == 1
                         && bit1(InterviewAddress1+CharID*2) + bit2(InterviewAddress1+CharID*2) + bit3(InterviewAddress1+CharID*2) + bit4(InterviewAddress1+CharID*2) == 4
                         && prev(bit1(InterviewAddress1+CharID*2) + bit2(InterviewAddress1+CharID) + bit3(InterviewAddress1+CharID*2) + bit4(InterviewAddress1+CharID*2)) == 3
)             
}

function GhostHunter(Falcus)
{
    achievement(title = GhostHunterName[Falcus],
                description = "Get a good enough Time on "+GhostTracks[Falcus]+ " to unlock and buy the Staff Ghost",
                points = 25,
                trigger = 
                            CurrentMode == 5 //Shopping
                         && TracksBitFlags[Falcus] == 1
                         && prev(TracksBitFlags[Falcus]) == 0
)             
}

function GhostBuster(Auburn)
{
    achievement(title = GhostBusterName[Auburn],
                description = "Become the Ultimate GhostBuster and beat the "+CourseIDList[Auburn]+ " Staff Ghost time of "+GhostBusterTimes[Auburn] ,
                points = 50,
                trigger = 
                            CourseID == Auburn
                            && CurrentMode == 2 
                            && CourseResultScreen == 1 
                            && prev(CourseResultScreen) == 0
                            && TimeAttackTotalTime <= GhostBusterFrames[Auburn]
)             
}
function TimeAttackLeaderboard(TimeAttackCourse)
{
    leaderboard(
    title = CourseIDList[TimeAttackCourse]+" Time Attack",
    description = "Fastest Total Time",
    start  = CourseID == TimeAttackCourse && CurrentMode == 2 && CourseResultScreen == 1 && prev(CourseResultScreen) == 0,
    cancel = always_false(),
    submit = always_true(),
    value = TimeAttackTotalTime,
    format = "VALUE",
    lower_is_better=true
)   
}      
//----------------
///Achievement Code
// --- --- --- --- --- ---
// Progression Cup
// --- --- --- --- --- ---
for i in range (1,5)
CheevoCupNovice(i,5)

for i in range (1,5)
CheevoCupStandard(i,10)

for i in range (1,5)
CheevoCupExpert(i,10)

for i in range (1,5)
CheevoCupMaster(i,25)

// --- --- --- --- --- ---
// Progression Story Mode
// --- --- --- --- --- ---
for i in range(1,9)
StoryModeProg(i,0,5)

for i in range(1,9)
StoryModeProg(i,1,10)

for i in range(1,9)
StoryModeProg(i,2,25)
// --- --- --- --- --- ---
// Shop Unlocks
// --- --- --- --- --- ---
    achievement(title = "Car Collector",
                description = "Unlock at least Half of the total Pilot roster",
                points = 10,
                trigger = 
                            CurrentMode == 5 // Shopping
                         && bitcount(PilotUnlockAddress1) + bitcount(PilotUnlockAddress1+1) + bitcount(PilotUnlockAddress1+2) + bitcount(PilotUnlockAddress1+3) + bitcount(PilotUnlockAddress1+4) + bitcount(PilotUnlockAddress1+5) == 21
                         && prev(bitcount(PilotUnlockAddress1) + bitcount(PilotUnlockAddress1+1) + bitcount(PilotUnlockAddress1+2) + bitcount(PilotUnlockAddress1+3) + bitcount(PilotUnlockAddress1+4) + bitcount(PilotUnlockAddress1+5)) == 20  
)  

    achievement(title = "Everyone is Here!",
                description = "Unlock the full Pilot roster",
                points = 25,
                trigger = 
                            CurrentMode == 5 // Shopping
                         && bitcount(PilotUnlockAddress1) + bitcount(PilotUnlockAddress1+1) + bitcount(PilotUnlockAddress1+2) + bitcount(PilotUnlockAddress1+3) + bitcount(PilotUnlockAddress1+4) + bitcount(PilotUnlockAddress1+5) == 41
                         && prev(bitcount(PilotUnlockAddress1) + bitcount(PilotUnlockAddress1+1) + bitcount(PilotUnlockAddress1+2) + bitcount(PilotUnlockAddress1+3) + bitcount(PilotUnlockAddress1+4) + bitcount(PilotUnlockAddress1+5)) == 40  
)  

    achievement(title = "You've Got Boost Power!",
                description = "Buy every Booster Machine Parts in the shop",
                points = 25,
                trigger = 
                            CurrentMode == 5 // Shopping
                         && bitcount(CustomPartAddress1) + bit2(CustomPartAddress1+1) + bit3(CustomPartAddress1+1) + bit4(CustomPartAddress1+1) + bit6(CustomPartAddress1+1) 
                         + bit7(CustomPartAddress1+1) + bitcount(CustomPartAddress1+14) + bitcount(CustomPartAddress1+15) == 23
                         && prev(bitcount(CustomPartAddress1) + bit2(CustomPartAddress1+1) + bit3(CustomPartAddress1+1) + bit4(CustomPartAddress1+1) + bit6(CustomPartAddress1+1) 
                         + bit7(CustomPartAddress1+1) + bitcount(CustomPartAddress1+14) + bitcount(CustomPartAddress1+15)) == 22
)  

    achievement(title = "No Place Like Home",
                description = "Buy every Cockpit Machine Parts in the shop",
                points = 25,
                trigger = 
                            CurrentMode == 5 // Shopping
                         && bit0(CustomPartAddress1+1) + bit1(CustomPartAddress1+1) + bitcount(CustomPartAddress1+2) + bitcount(CustomPartAddress1+3) + bit1(CustomPartAddress1+4) 
                         + bit2(CustomPartAddress1+4) + bit3(CustomPartAddress1+4) + bit4(CustomPartAddress1+4) + bit5(CustomPartAddress1+4) + bit6(CustomPartAddress1+4) 
                         + bit7(CustomPartAddress1+4) == 23
                         && prev(bit0(CustomPartAddress1+1) + bit1(CustomPartAddress1+1) + bitcount(CustomPartAddress1+2) + bitcount(CustomPartAddress1+3) + bit1(CustomPartAddress1+4) 
                         + bit2(CustomPartAddress1+4) + bit3(CustomPartAddress1+4) + bit4(CustomPartAddress1+4) + bit5(CustomPartAddress1+4) + bit6(CustomPartAddress1+4) 
                         + bit7(CustomPartAddress1+4)) == 22
)  

    achievement(title = "Strength of Mind and Body",
                description = "Buy every Body Machine Parts in the shop",
                points = 25,
                trigger = 
                            CurrentMode == 5 // Shopping
                         && bit1(CustomPartAddress1+4) + bitcount(CustomPartAddress1+5) + bitcount(CustomPartAddress1+5) + bitcount(CustomPartAddress1+6) 
                         + bitcount(CustomPartAddress1+7) == 23
                         && prev(bit1(CustomPartAddress1+4) + bitcount(CustomPartAddress1+5) + bitcount(CustomPartAddress1+5) + bitcount(CustomPartAddress1+6) 
                         + bitcount(CustomPartAddress1+7)) == 22
)  

    achievement(title = "Power of the Triforce",
                description = "Buy all the F-Zero AX Courses in the shop",
                points = 10,
                trigger = 
                            CurrentMode == 5 // Shopping
                         && bitcount(AXBitUnlock) == 6
                         && prev(bitcount(AXBitUnlock)) == 5
)  

    achievement(title = "Sounds of the Past",
                description = "Buy all the alternative soundtracks in the shop",
                points = 10,
                trigger = 
                            CurrentMode == 5 // Shopping
                         && bit0(SoundBitUnlock) + bit1(SoundBitUnlock) == 2
                         && prev(bit0(SoundBitUnlock) + bit1(SoundBitUnlock)) == 1
)  
// --- --- --- --- --- ---
// Character Master Ending
// --- --- --- --- --- ---
for i in range(0,40)
MasterEndingCheevo(i)
// --- --- --- --- --- ---
// Character Interview Questions
// --- --- --- --- --- ---
for i in range(0,40)
InterviewCheevo(i)

for i in range(0,40)
MasterInterviewCheevo(i)
// --- --- --- --- --- ---
// Staff Ghost
// --- --- --- --- --- ---
for i in range(0,25)
GhostHunter(i)

GhostBuster(1)
GhostBuster(3)
GhostBuster(5)
for i in range (7,11)
GhostBuster(i)
for i in range (13,17)
GhostBuster(i)
GhostBuster(21)
for i in range (24,29)
GhostBuster(i)
for i in range (31,36)
GhostBuster(i)
// --- --- --- --- --- ---
// Misc Dev Challenges
// --- --- --- --- --- ---



// Rich Presence
/// Grand Prix RP
rich_presence_conditional_display(
    CurrentMode == 1,
    "• {0} • {1} Cup - {2} Difficulty • Rank {3} - {4} Points • {5} racing on {6} • {7}",
    rich_presence_lookup("Modes", CurrentMode, Modes),
    rich_presence_lookup("Cup", CupID, GPCupNames),
    rich_presence_lookup("CupDifficulty", GrandPrixDifficulty, GPDifficultyList),
    rich_presence_value("Rank", CupRank+1),
    rich_presence_value("RankPoints", RankingPoints),    
    rich_presence_lookup("Pilot", PilotID, PilotName),
    rich_presence_lookup("Course", CourseID, CourseIDList),
    rich_presence_lookup("CustomMachine", MachineID, CustomMachineDisplay)) 
/// Time Attack & Practice Mode RP
rich_presence_conditional_display(
    CurrentMode == 2 || CurrentMode == 3,
    "• {0} Mode • {1} - Track: {2} • {3}",
    rich_presence_lookup("Modes", CurrentMode, Modes),
    rich_presence_lookup("Pilot", PilotID, PilotName),
    rich_presence_lookup("Course", CourseID, CourseIDList),
    rich_presence_lookup("CustomMachine", MachineID, CustomMachineDisplay)) 
/// Story Mode RP
rich_presence_conditional_display(
    CurrentMode == 4,
    "• {0} Mode • Chapter {1} - {2} Difficulty •",
    rich_presence_lookup("Modes", CurrentMode, Modes),
    rich_presence_value("Chapter", StoryModeID),
    rich_presence_lookup("Difficulty", StoryModeDifficulty, StoryDifficultyList))  
/// Default ++
rich_presence_conditional_display(
    CurrentMode == 0xFF || CurrentMode == 5 || CurrentMode == 6 || CurrentMode == 7 || CurrentMode == 8,
    "• {0} •",
    rich_presence_lookup("Modes", CurrentMode, Modes))  

///Default 
rich_presence_display(
    "• 🏎️ Battle at over 2000 km/h in monster machines that break the sound barrier! 🏎️ •"

)

// Leaderboard
TimeAttackLeaderboard(1)
TimeAttackLeaderboard(3)
TimeAttackLeaderboard(5)
for i in range (7,11)
TimeAttackLeaderboard(i)
for i in range (13,17)
TimeAttackLeaderboard(i)
TimeAttackLeaderboard(21)
for i in range (24,29)
TimeAttackLeaderboard(i)
for i in range (31,36)
TimeAttackLeaderboard(i)
