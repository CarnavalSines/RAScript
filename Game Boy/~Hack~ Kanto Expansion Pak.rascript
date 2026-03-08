// ~Hack~ Kanto Expansion Pak
// #ID = 28237
// 20260306 Version - Sines

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

TrainerID = byte(0xd040)
FightWonFlag = bit0(0xd164)
PartySize = byte(0xd172)
SetModeFlag = bit6(0xd370)
MapID = byte(0xd378)
PostGameFlag = bit0(0xd889)
LoadedFlag = byte(0xcfda)
BattleTentFightNb = byte(0xd70e)

PkmnID1 = byte(0xd173)
PkmnID2 = byte(0xd174)
PkmnID3 = byte(0xd175)
PkmnID4 = byte(0xd176)
PkmnID5 = byte(0xd177)
PkmnID6 = byte(0xd178)

PkmnLV1 = byte(0xd19b)
PkmnLV2 = byte(0xd1c7)
PkmnLV3 = byte(0xd1f3)
PkmnLV4 = byte(0xd21f)
PkmnLV5 = byte(0xd24b)
PkmnLV6 = byte(0xd277)

BadgeList = byte(0xd371)


function LoadCheck() => MapID == prev(MapID) && LoadedFlag != 0xff && bit1(0xd76b) == 1
function LoadCheckRematch() => MapID == prev(MapID) && bit1(0xd76b) == 1
function BitCheck(bit) => bit == 1 && prev(bit) == 0

/// /// /// Progression /// /// ///

    achievement(title="Journey Has Started",
                description = "Obtain the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd76e))
)

    achievement(title="DIY Gym",
                description = "Defeat Yujirou and obtain...a cap?",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit5(0xd76c))
)

    achievement(title="Stonewalled",
                description = "Defeat Brock and obtain the Boulder Badge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit7(0xd775))
)

    achievement(title="Washed Up",
                description = "Defeat Misty and obtain the Cascade Badge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd77f))
)

    achievement(title="Thunderstruck",
                description = "Defeat Lt. Surge and obtain the Thunder Badge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit7(0xd793))
)

    achievement(title="Spill Session",
                description = "Share the Tea with the guards",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit6(0xd748))
)

    achievement(title="Lawn & Order",
                description = "Defeat Erika and obtain the Rainbow Badge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd79c))
)

    achievement(title="Poisoned Chalice",
                description = "Defeat Koga and obtain the Soul Badge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd7b2))
)

    achievement(title="Mind Games",
                description = "Defeat Sabrina and obtain the Marsh Badge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd7d3))
)

    achievement(title="Burned Out",
                description = "Defeat Blaine and obtain the Volcano Badge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd7ba))
)

    achievement(title="Norwood 3",
                description = "Defeat Giovanni and obtain the Earth Badge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit7(0xd83b))
)

    achievement(title="Top of the World",
                description = "Defeat the Elite Four and prove that you are the very best like no one ever was",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd887))
)

/// /// /// Rival Fights /// /// ///
    achievement(title="Fancy Meeting",
                description = "Defeat your rival during a chance meeting on Route 22",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit5(0xd80b))
)

    achievement(title="Nugget Wisdom",
                description = "Defeat your rival before the Nugget Bridge",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd77a))
)

    achievement(title="I'm On a Boat",
                description = "Defeat your rival on the S.S. Anne",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit2(0xd683))
)

    achievement(title="Paying Respects",
                description = "Defeat your rival in Lavender Town",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit7(0xd786))
)

    achievement(title="McLane School of Rescue",
                description = "Defeat your rival in the Silph Co. Building",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd84f))
)

    achievement(title="Last Duel",
                description = "Defeat your rival on Route 22 just before the last push of your journey",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit6(0xd80b))
)
/// /// /// Rocket Duo Fights /// /// ///
    achievement(title="Prepare for Troubles",
                description = "Defeat Jessie & James in Mt. Moon",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit2(0xd816))
)

    achievement(title="Make it Double",
                description = "Defeat Jessie & James in the Rocket Hideout",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit2(0xd83b))
)

    achievement(title="Hostage Negotiation",
                description = "Defeat Jessie & James in the Pokemon Tower",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd78b))
)

    achievement(title="Blasting Off Again",
                description = "Defeat Jessie & James in the Silph Co. Building",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit4(0xd857))
)

    achievement(title="Well Earned Break", // Rematch type of fight even the first time, hence the different structure
                description = "Defeat Jessie & James in Citrine City",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x51
                       && TrainerID == 0x34
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0
)
/// /// /// Misc Challenges /// /// ///

    achievement(title="Helping Hand",
                description = "Collect 5 Poke balls from Prof. Oak",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit3(0xd76b))
)

    achievement(title="Fish Market",
                description = "Buy a Magikarp from a shady seller",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit7(0xd7e6))
)

    achievement(title="The Old Speedrun Trick",
                description = "Use a Moon Stone on a Nidorino or Nidorina before you beat Misty. Classic speedrun strat can never fail!",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit5(0xd30c))
                       && bit1(0xd371) == 0
)

    achievement(title="Raining Cats AND Dogs",
                description = "Complete the Beauty Event in Vermilion City",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit2(0xd791))
)

    achievement(title="He Can't Keep Getting Away With It!",
                description = "Buy a Ditto from a shady seller",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit7(0xd831))
)

    achievement(title="This Time for Sure",
                description = "Buy a Cubone from a shady seller",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit6(0xd831))
)

    achievement(title="Virtua Fighter",
                description = "Defeat Shinjuku Jacky in the Celadon Mansion",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit2(0xd768))
)

    achievement(title="Damn You Abrams!",
                description = "Obtain the Mystery Box",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit4(0xd877))
)

    achievement(title="Hard Work and Guts",
                description = "Defeat the Karate Master",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd7d1))
)

    achievement(title="National Quiz",
                description = "Defeat Blaine after a flawless Quiz run, fighting no one except the Gym Leader",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd7ba))
                       && bit2(0xd7ba) == 0
                       && bit3(0xd7ba) == 0
                       && bit4(0xd7ba) == 0
                       && bit5(0xd7ba) == 0
                       && bit6(0xd7ba) == 0
                       && bit7(0xd7ba) == 0
                       && bit0(0xd7bb) == 0
)

    achievement(title="Emotional Support Lapras",
                description = "Obtain the Battle Shy Lapras",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit3(0xd7c3))
)

    achievement(title="Like Taking Candies from a NPC",
                description = "Obtain the Candy Jar in the Indigo Plateau",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd858))
)

    achievement(title="Anime Only Vision",
                description = "Defeat or Capture the Dragonite in the Underwater Tunnel",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd82f))
)

    achievement(title="Marketplace of Creatures",
                description = "Perform all of the non-repeatable in-game trades",
                points = 10,
                trigger = LoadCheck()
                       && measured(bitcount(0xd757) + bit0(0xd758) == 9)
                       && prev(bitcount(0xd757) + bit0(0xd758)) == 8
)

    achievement(title="The Rumors Were True!",
                description = "Push the fabled Mew Truck",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit4(0xd716))
)

    achievement(title="Battle Maniac",
                description = "Get a 20 win streak in the Battle Tent",
                points = 10,
                trigger = LoadCheck()
                       && BattleTentFightNb == 20
                       && prev(BattleTentFightNb) == 19
                       && MapID == 0xf8
)
/// /// /// Dungeon Cleaner /// /// ///
    achievement(title="Forest Cryptid",
                description = "Defeat every trainers in Viridian Forest",
                points = 10,
                trigger = LoadCheck()
                       && measured(bit2(0xd813) + bit3(0xd813) + bit4(0xd813) == 3)
                       && prev(bit2(0xd813) + bit3(0xd813) + bit4(0xd813)) == 2
)

    achievement(title="Moon's Haunted",
                description = "Defeat every trainers in Mt. Moon",
                points = 10,
                trigger = LoadCheck()
                       && measured(bitcount(0xd815) + bit1(0xd816) + bit3(0xd816) + bit4(0xd816) + bit5(0xd816) == 11)
                       && prev(bitcount(0xd815) + bit1(0xd816) + bit3(0xd816) + bit4(0xd816) + bit5(0xd816)) == 10
)

    achievement(title="Battle Cruiser",
                description = "Defeat every trainers in the S.S. Anne",
                points = 10,
                trigger = LoadCheck()
                       && measured(bitcount(0xd81f) + bitcount(0xd825) + bitcount(0xd827) + bitcount(0xd829) == 16)
                       && prev(bitcount(0xd81f) + bitcount(0xd825) + bitcount(0xd827) + bitcount(0xd829)) == 15
)

    achievement(title="Kiss in the Dark",
                description = "Defeat every trainers in the Rock Tunnel",
                points = 10,
                trigger = LoadCheck()
                       && measured(bitcount(0xd7f2) + bitcount(0xd89d) + bit0(0xd89e)  == 15)
                       && prev(bitcount(0xd7f2) + bitcount(0xd89d) + bit0(0xd89e)) == 14
)

    achievement(title="Spiritual Ascension",
                description = "Defeat every trainers in the Pokemon Tower. Hey is it me or does it feel smaller?",
                points = 10,
                trigger = LoadCheck()
                       && measured(bitcount(0xd789) + bit1(0xd78a) + bit2(0xd78a) + bit3(0xd78a) == 7)
                       && prev(bitcount(0xd789) + bit1(0xd78a) + bit2(0xd78a) + bit3(0xd78a)) == 6
)

    achievement(title="Hostile Takeover",
                description = "Defeat every trainers in Silph Co.",
                points = 10,
                trigger = LoadCheck()
                       && measured(bitcount(0xd847) + bitcount(0xd84b) + bit5(0xd84f) + bit6(0xd84f) + bit7(0xd84f) + bit0(0xd850) == 11)
                       && prev(bitcount(0xd847) + bitcount(0xd84b) + bit5(0xd84f) + bit6(0xd84f) + bit7(0xd84f) + bit0(0xd850)) == 10
)

    achievement(title="Daylight Savings",
                description = "Defeat or capture every Voltorb and Electrode static encounters in the Power Plant",
                points = 10,
                trigger = LoadCheck()
                       && measured(bitcount(0xd7f3) + bit0(0xd7f4) == 8)
                       && prev(bitcount(0xd7f3) + bit0(0xd7f4)) == 7
)

    achievement(title="Butler's Duty",
                description = "Defeat every trainers in the Pokemon Mansion",
                points = 10,
                trigger = LoadCheck()
                       && measured(bit1(0xd7b8) + bit1(0xd867) + bit1(0xd869) + bit2(0xd869) + bit1(0xd86b) + bit2(0xd86b) == 6)
                       && prev(bit1(0xd7b8) + bit1(0xd867) + bit1(0xd869) + bit2(0xd869) + bit1(0xd86b) + bit2(0xd86b)) == 5
)

    achievement(title="Final Stretch",
                description = "Defeat every trainers in Victory Road",
                points = 10,
                trigger = LoadCheck()
                       && measured(bitcount(0xd80e) + bitcount(0xd833) + bit1(0xd889) + bit2(0xd889) == 11)
                       && prev(bitcount(0xd80e) + bitcount(0xd833) + bit1(0xd889) + bit2(0xd889)) == 10
)

    achievement(title="Postgame Cleaner",
                description = "Defeat every trainers in the Citrine Area",
                points = 10,
                trigger = LoadCheck()
                       && measured(bit2(0xd82d) + bit3(0xd82d) + bit4(0xd82d) + bitcount(0xd8a5) + bit1(0xd877) + bit2(0xd877) + bitcount(0xd8a3)  == 12)
                       && prev(bit2(0xd82d) + bit3(0xd82d) + bit4(0xd82d) + bitcount(0xd8a5) + bit1(0xd877) + bit2(0xd877) + bitcount(0xd8a3) ) == 11
)
/// /// /// Local Expert /// /// ///

function YuijirouPoolCheck(pkmnID) => unless(pkmnID != 0xa5 // Rattata
                       && pkmnID != 0x24 // Pidgey
                       && pkmnID != 0x86 // Coinpur
                       && pkmnID != 0x0f // Nidoran♀
                       && pkmnID != 0x03 // Nidoran♂
                       && pkmnID != 0x05 // Spearow
                       && pkmnID != 0x39 // Mankey
                       && pkmnID != 0x85 // Magikarp
                       && pkmnID != 0x9c // Orfry
                       && pkmnID != 0xa6 // Raticate
                       && pkmnID != 0x96 // Pidgeotto
                       && pkmnID != 0x97 // Pidgeot
                       && pkmnID != 0x4d // Meowth
                       && pkmnID != 0x90 // Persian
                       && pkmnID != 0xa8 // Nidorina
                       && pkmnID != 0x10 // Nidoqueen
                       && pkmnID != 0x20 // Nidoreign
                       && pkmnID != 0xa7 // Nidorino
                       && pkmnID != 0x07 // Nidoking
                       && pkmnID != 0x23 // Fearow
                       && pkmnID != 0x75 // Primeape
                       && pkmnID != 0xde // Annihilape
                       && pkmnID != 0x16 // Gyarados
                       && pkmnID != 0x9d // Goldeen
                       && pkmnID != 0x9e // Seaking
                       )

    achievement(title="Local Expert - Kid Next Door",
                description = "Defeat Yujirou using a full party of Pokémon only found on Route 1 and Route 22 or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && MapID == 0x48
                       && TrainerID == 0x2f
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && YuijirouPoolCheck(PkmnID1)
                       && YuijirouPoolCheck(PkmnID2)
                       && YuijirouPoolCheck(PkmnID3)
                       && YuijirouPoolCheck(PkmnID4)
                       && YuijirouPoolCheck(PkmnID5)
                       && YuijirouPoolCheck(PkmnID6)
)

function BrockPoolCheck(pkmnID) => unless(pkmnID != 0x24 // Pidgey
                       && pkmnID != 0xa5 // Rattata
                       && pkmnID != 0x86 // Coinpur
                       && pkmnID != 0x7b // Caterpie
                       && pkmnID != 0x70 // Weedle
                       && pkmnID != 0xd9 // Gentlarva
                       && pkmnID != 0x9f // Kotora
                       && pkmnID != 0xa6 // Raticate
                       && pkmnID != 0x96 // Pidgeotto
                       && pkmnID != 0x97 // Pidgeot
                       && pkmnID != 0x4d // Meowth
                       && pkmnID != 0x90 // Persian
                       && pkmnID != 0x7c // Metapod
                       && pkmnID != 0x7d // Butterfree
                       && pkmnID != 0x71 // Kakuna
                       && pkmnID != 0x72 // Beedrill
                       && pkmnID != 0xda // Pupal
                       && pkmnID != 0xdb // Carapthor
                       && pkmnID != 0xa0 // Gaotora
                       && pkmnID != 0xa1 // Gorotora
                       )

    achievement(title="Local Expert - Forest Spirit",
                description = "Defeat Brock using a full party of Pokémon only found on Route 2 and Viridian Forest or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && MapID == 0x39
                       && TrainerID == 0x21
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && BrockPoolCheck(PkmnID1)
                       && BrockPoolCheck(PkmnID2)
                       && BrockPoolCheck(PkmnID3)
                       && BrockPoolCheck(PkmnID4)
                       && BrockPoolCheck(PkmnID5)
                       && BrockPoolCheck(PkmnID6)
)

function MistyPoolCheck(pkmnID) => unless(pkmnID != 0x45 // Bittybat
                       && pkmnID != 0xa9 // Geodude
                       && pkmnID != 0x60 // Sandshrew
                       && pkmnID != 0x6d // Paras
                       && pkmnID != 0x04 // Clefairy
                       && pkmnID != 0xa5 // Rattata
                       && pkmnID != 0x24 // Pidgey
                       && pkmnID != 0x6c // Ekans
                       && pkmnID != 0x39 // Mankey
                       && pkmnID != 0x51 // Vulpiii
                       && pkmnID != 0x64 // Jigglypuff
                       && pkmnID != 0x85 // Magikarp
                       && pkmnID != 0x47 // Poliwag
                       && pkmnID != 0x9c // Orfry
                       && pkmnID != 0x2f // Psyduck
                       && pkmnID != 0x6b // Zubat
                       && pkmnID != 0x82 // Golbat
                       && pkmnID != 0xcf // Crobat
                       && pkmnID != 0x27 // Graveler
                       && pkmnID != 0x31 // Golem
                       && pkmnID != 0x61 // Sandslash
                       && pkmnID != 0x2e // Parasect
                       && pkmnID != 0x8e // Clefable
                       && pkmnID != 0xa6 // Raticate
                       && pkmnID != 0x96 // Pidgeotto
                       && pkmnID != 0x97 // Pidgeot
                       && pkmnID != 0x2d // Arbok
                       && pkmnID != 0x75 // Primeape
                       && pkmnID != 0xde // Annihilape
                       && pkmnID != 0x52 // Vulpix
                       && pkmnID != 0x53 // Ninetales
                       && pkmnID != 0x65 // Wigglytuff
                       && pkmnID != 0x16 // Gyarados
                       && pkmnID != 0x6e // Poliwhirl
                       && pkmnID != 0x6f // Poliwrath
                       && pkmnID != 0xd4 // Politoed
                       && pkmnID != 0x9d // Goldeen
                       && pkmnID != 0x9e // Seaking
                       && pkmnID != 0x7f // Weirduck
                       && pkmnID != 0x80 // Golduck
                       )

    achievement(title="Local Expert - Moon Guardian",
                description = "Defeat Misty using a full party of Pokémon only found on Route 4 and Mt. Moon or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && MapID == 0x44
                       && TrainerID == 0x22
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && MistyPoolCheck(PkmnID1)
                       && MistyPoolCheck(PkmnID2)
                       && MistyPoolCheck(PkmnID3)
                       && MistyPoolCheck(PkmnID4)
                       && MistyPoolCheck(PkmnID5)
                       && MistyPoolCheck(PkmnID6)
)

function SurgePoolCheck(pkmnID) => unless(pkmnID != 0x6c // Ekans
                       && pkmnID != 0x05 // Spearow
                       && pkmnID != 0x30 // Drowzee
                       && pkmnID != 0xad // Magnemite
                       && pkmnID != 0x60 // Sandshrew
                       && pkmnID != 0xbf // Wiglett
                       && pkmnID != 0x4e // Krabby
                       && pkmnID != 0x18 // Tentacool
                       && pkmnID != 0x4f // Cheep
                       && pkmnID != 0x3b // Diglett
                       && pkmnID != 0x22 // Onix
                       && pkmnID != 0x2d // Arbok
                       && pkmnID != 0x23 // Fearow
                       && pkmnID != 0x81 // Hypno
                       && pkmnID != 0x8c // Magnetite
                       && pkmnID != 0x36 // Magneton
                       && pkmnID != 0xdc // Magnezone
                       && pkmnID != 0x61 // Sandslash
                       && pkmnID != 0xc0 // Wugtrio
                       && pkmnID != 0x8a // Kingler
                       && pkmnID != 0x9b // Tentacruel
                       && pkmnID != 0x50 // Jabetta
                       && pkmnID != 0x76 // Dugtrio
                       && pkmnID != 0xcc // Steelix
                       )

    achievement(title="Local Expert - Side Trip",
                description = "Defeat Lt. Surge using a full party of Pokémon only found on Route 11 and Diglett Cave or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && MapID == 0x5f
                       && TrainerID == 0x23
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && SurgePoolCheck(PkmnID1)
                       && SurgePoolCheck(PkmnID2)
                       && SurgePoolCheck(PkmnID3)
                       && SurgePoolCheck(PkmnID4)
                       && SurgePoolCheck(PkmnID5)
                       && SurgePoolCheck(PkmnID6)
)

function ErikaPoolCheck(pkmnID) => unless(pkmnID != 0x04 // Clefairy
                       && pkmnID != 0x94 // Abra
                       && pkmnID != 0x3a // Seel
                       && pkmnID != 0x1a // Scyther
                       && pkmnID != 0x1d // Pinsir
                       && pkmnID != 0x43 // Cactormus
                       && pkmnID != 0xaa // Porygon
                       && pkmnID != 0xae // Squeamata
                       && pkmnID != 0x58 // Dratini
                       && pkmnID != 0x8e // Clefable
                       && pkmnID != 0x26 // Kadabra
                       && pkmnID != 0x95 // Alakazam
                       && pkmnID != 0x78 // Dewgong
                       && pkmnID != 0xc1 // Scizor
                       && pkmnID != 0xca // Kleavor
                       && pkmnID != 0x79 // Tricules
                       && pkmnID != 0xd2 // Porygon2
                       && pkmnID != 0xdd // Porygon-Z
                       && pkmnID != 0x5e // Ministare
                       && pkmnID != 0x5f // Iguanarch
                       && pkmnID != 0x59 // Dragonair
                       && pkmnID != 0x42 // Dragonite
                       )

    achievement(title="Local Expert - Let's Go Gambling",
                description = "Defeat Erika using a full party of Pokémon only found in the Game Corner or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && MapID == 0x89
                       && TrainerID == 0x24
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && ErikaPoolCheck(PkmnID1)
                       && ErikaPoolCheck(PkmnID2)
                       && ErikaPoolCheck(PkmnID3)
                       && ErikaPoolCheck(PkmnID4)
                       && ErikaPoolCheck(PkmnID5)
                       && ErikaPoolCheck(PkmnID6)
)

function KogaPoolCheck(pkmnID) => unless(pkmnID != 0x0c // Exeggcute
                       && pkmnID != 0x12 // Rhyhorn
                       && pkmnID != 0x41 // Venonat
                       && pkmnID != 0x1e // Tangela
                       && pkmnID != 0x11 // Cubone
                       && pkmnID != 0x46 // Doduo
                       && pkmnID != 0x0b // Lickitung
                       && pkmnID != 0xfb // Gorillaimo
                       && pkmnID != 0x28 // Chansey
                       && pkmnID != 0x3d // Trampel
                       && pkmnID != 0x3c // Tauros
                       && pkmnID != 0x1d // Pinsir
                       && pkmnID != 0x02 // Kangaskhan
                       && pkmnID != 0x1a // Scyther
                       && pkmnID != 0x58 // Dratini
                       && pkmnID != 0x25 // Slowpoke
                       && pkmnID != 0x4e // Krabby
                       && pkmnID != 0x7f // Weirduck
                       && pkmnID != 0x0a // Exeggutor
                       && pkmnID != 0x01 // Rhydon
                       && pkmnID != 0xc2 // Rhyperior
                       && pkmnID != 0x77 // Venomoth
                       && pkmnID != 0xc9 // Tangrowth
                       && pkmnID != 0x91 // Marowak
                       && pkmnID != 0x92 // Guardia
                       && pkmnID != 0x74 // Dodrio
                       && pkmnID != 0xc8 // Lickilicky
                       && pkmnID != 0xcd // Blissey
                       && pkmnID != 0x79 // Tricules
                       && pkmnID != 0xc1 // Scizor
                       && pkmnID != 0xca // Kleavor
                       && pkmnID != 0x59 // Dragonair
                       && pkmnID != 0x42 // Dragonite
                       && pkmnID != 0x08 // Slowbro
                       && pkmnID != 0xd5 // Slowking
                       && pkmnID != 0x8a // Kingler
                       && pkmnID != 0x80 // Golduck
                       )

    achievement(title="Local Expert - Next Level Hunter",
                description = "Defeat Koga using a full party of Pokémon only found in the Safari Zone or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && MapID == 0xa0
                       && TrainerID == 0x25
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && KogaPoolCheck(PkmnID1)
                       && KogaPoolCheck(PkmnID2)
                       && KogaPoolCheck(PkmnID3)
                       && KogaPoolCheck(PkmnID4)
                       && KogaPoolCheck(PkmnID5)
                       && KogaPoolCheck(PkmnID6)
)

function SabrinaPoolCheck(pkmnID) => unless(pkmnID != 0xa5 // Rattata
                       && pkmnID != 0x24 // Pidgey
                       && pkmnID != 0x4d // Meowth
                       && pkmnID != 0x21 // Growlithe
                       && pkmnID != 0x64 // Jigglypuff
                       && pkmnID != 0x2f // Psyduck
                       && pkmnID != 0x25 // Slowpoke
                       && pkmnID != 0x9d // Goldeen
                       && pkmnID != 0x85 // Magikarp
                       && pkmnID != 0x47 // Poliwag
                       && pkmnID != 0x9c // Orfry
                       && pkmnID != 0x60 // Sandshrew
                       && pkmnID != 0xa2 // Kolta
                       && pkmnID != 0x52 // Vulpix
                       && pkmnID != 0xa6 // Raticate
                       && pkmnID != 0x96 // Pidgeotto
                       && pkmnID != 0x97 // Pidgeot
                       && pkmnID != 0x90 // Persian
                       && pkmnID != 0x14 // Arcanine
                       && pkmnID != 0x7f // Weirduck
                       && pkmnID != 0x80 // Golduck
                       && pkmnID != 0x9e // Seaking
                       && pkmnID != 0x65 // Wigglytuff
                       && pkmnID != 0x08 // Slowbro
                       && pkmnID != 0xd5 // Slowking
                       && pkmnID != 0x16 // Gyarados
                       && pkmnID != 0x6e // Poliwhirl
                       && pkmnID != 0x6f // Poliwrath
                       && pkmnID != 0xd4 // Politoed
                       && pkmnID != 0x61 // Sandslash
                       && pkmnID != 0xa3 // Ponyta
                       && pkmnID != 0xa4 // Rapidash
                       && pkmnID != 0x53 // Ninetales
                       )

    achievement(title="Local Expert - Psychic Attack",
                description = "Defeat Sabrina using a full party of Pokémon only found on Route 6 and Route 7 or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && MapID == 0xb4
                       && TrainerID == 0x27
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && SabrinaPoolCheck(PkmnID1)
                       && SabrinaPoolCheck(PkmnID2)
                       && SabrinaPoolCheck(PkmnID3)
                       && SabrinaPoolCheck(PkmnID4)
                       && SabrinaPoolCheck(PkmnID5)
                       && SabrinaPoolCheck(PkmnID6)
)

function BlainePoolCheck(pkmnID) => unless(pkmnID != 0x0d // Grimer
                       && pkmnID != 0x37 // Koffing
                       && pkmnID != 0x19 // Gastly
                       && pkmnID != 0x30 // Drowzee
                       && pkmnID != 0x4c // Ditto
                       && pkmnID != 0x62 // Omanyte
                       && pkmnID != 0x5a // Kabuto
                       && pkmnID != 0xab // Aerodactyl
                       && pkmnID != 0x89 // Decilla
                       && pkmnID != 0x88 // Muk
                       && pkmnID != 0x8f // Weezing
                       && pkmnID != 0x93 // Haunter
                       && pkmnID != 0x0e // Gengar
                       && pkmnID != 0x81 // Hypno
                       && pkmnID != 0xd0 // Mimmeo
                       && pkmnID != 0x63 // Omastar
                       && pkmnID != 0x5b // Kabutops
                       && pkmnID != 0x1f // Gawarhed
                       )

    achievement(title="Local Expert - Living Off the Land",
                description = "Defeat Blaine using a full party of Pokémon only found in the Pokémon Mansion and from the Cinnabar Lab or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && MapID == 0xa9
                       && TrainerID == 0x26
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && BlainePoolCheck(PkmnID1)
                       && BlainePoolCheck(PkmnID2)
                       && BlainePoolCheck(PkmnID3)
                       && BlainePoolCheck(PkmnID4)
                       && BlainePoolCheck(PkmnID5)
                       && BlainePoolCheck(PkmnID6)
)

function E4PoolCheck(pkmnID) => unless(pkmnID != 0x82 // Golbat
                       && pkmnID != 0x29 // Machoke
                       && pkmnID != 0x22 // Onix
                       && pkmnID != 0x27 // Graveler
                       && pkmnID != 0x61 // Sandslash
                       && pkmnID != 0x3e // Gavillain
                       && pkmnID != 0x12 // Rhyhorn
                       && pkmnID != 0x91 // Marowak
                       && pkmnID != 0xce // Hitmontop
                       && pkmnID != 0x77 // Venomoth
                       && pkmnID != 0x2b // Hitmonlee
                       && pkmnID != 0x28 // Chansey
                       && pkmnID != 0x2e // Parasect
                       && pkmnID != 0x2c // Hitmonchan
                       && pkmnID != 0xcf // Crobat
                       && pkmnID != 0x7e // Machamp
                       && pkmnID != 0xcc // Steelix
                       && pkmnID != 0x31 // Golem
                       && pkmnID != 0x01 // Rhydon
                       && pkmnID != 0xc2 // Rhyperior
                       && pkmnID != 0x92 // Guardia
                       && pkmnID != 0xcd // Blissey
                       )

    achievement(title="Local Expert - Elite Cave Dweller",
                description = "Defeat the Elite Four using a full party of Pokémon only found in Victory Road or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && (MapID == 0x7b || MapID == 0xf3 || MapID == 0xf4 || MapID == 0xf5 || MapID == 0x74)
                       && trigger_when(bit1(0xd887) == 1 && prev(bit1(0xd887)) == 0)
                       && PartySize == 6
                       && E4PoolCheck(PkmnID1)
                       && E4PoolCheck(PkmnID2)
                       && E4PoolCheck(PkmnID3)
                       && E4PoolCheck(PkmnID4)
                       && E4PoolCheck(PkmnID5)
                       && E4PoolCheck(PkmnID6)
)

function CitrinePoolCheck(pkmnID) => unless(pkmnID != 0xe1 // Toedscool
                       && pkmnID != 0xe2 // Toedscruel
                       && pkmnID != 0x74 // Dodrio
                       && pkmnID != 0xa4 // Rapidash
                       && pkmnID != 0x43 // Cactormus
                       && pkmnID != 0x3c // Tauros
                       && pkmnID != 0x1b // Staryu
                       && pkmnID != 0x5d // Seadra
                       && pkmnID != 0x98 // Starmie
                       && pkmnID != 0x80 // Golduck
                       && pkmnID != 0x6f // Poliwrath
                       && pkmnID != 0x72 // Beedrill
                       && pkmnID != 0x7d // Butterfree
                       && pkmnID != 0x2e // Parasect
                       && pkmnID != 0xdb // Carapthor
                       && pkmnID != 0xae // Squeamata
                       && pkmnID != 0x1a // Scyther
                       && pkmnID != 0x1d // Pinsir
                       && pkmnID != 0xfb // Gorillaimo
                       && pkmnID != 0x5e // Ministare
                       && pkmnID != 0xd3 // Kingdra
                       && pkmnID != 0x5f // Iguanarch
                       && pkmnID != 0xc1 // Scizor
                       && pkmnID != 0xca // Kleavor
                       && pkmnID != 0x79 // Tricules
                       )



    achievement(title="Local Expert - True Islander",
                description = "Defeat Jessie & James in Citrine using a full party of Pokémon only found in Brunswick Trail and Brunswick Glade or their evolutions",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x51
                       && TrainerID == 0x34
                       && PartySize == 6
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && CitrinePoolCheck(PkmnID1)
                       && CitrinePoolCheck(PkmnID2)
                       && CitrinePoolCheck(PkmnID3)
                       && CitrinePoolCheck(PkmnID4)
                       && CitrinePoolCheck(PkmnID5)
                       && CitrinePoolCheck(PkmnID6)
)

/// /// /// Post-game and Rematch /// /// ///
    achievement(title="The Strongest in History VS the Strongest of Today",
                description = "Defeat Prof. Oak",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x0d
                       && TrainerID == 0x19
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="No Freak Like Gamefreak",
                description = "Defeat Game Freak Morimoto",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x85
                       && TrainerID == 0x1e 
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Back to Basics",
                description = "Defeat Yujirou in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x48
                       && TrainerID == 0x2f
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Rock and a Hard Place",
                description = "Defeat Brock in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x39
                       && TrainerID == 0x21
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Riptide",
                description = "Defeat Misty in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x44
                       && TrainerID == 0x22
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Overloaded",
                description = "Defeat Lt. Surge in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x5f
                       && TrainerID == 0x23
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Mowed Down",
                description = "Defeat Erika in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x89
                       && TrainerID == 0x24
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Lethal Dose",
                description = "Defeat Koga in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0xa0
                       && TrainerID == 0x25
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Third Strike is What Counts",
                description = "Defeat the Karate Master in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0xb3
                       && TrainerID == 0x32
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Head Empty",
                description = "Defeat Sabrina in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0xb4
                       && TrainerID == 0x27
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Dying Embers",
                description = "Defeat Blaine in a postgame rematch",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0xa9
                       && TrainerID == 0x26
                       && FightWonFlag == 1
                       && prev(FightWonFlag) == 0

)

    achievement(title="Undisputed Ruler of Kanto",
                description = "Defeat the Elite Four again proving that you are the very best like no one ever will be",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd887))
                       && PostGameFlag == 1
)

    achievement(title="The Grind Never Stop",
                description = "Defeat the Silph Co. Chief at the end of the Gauntlet",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd88a))
                       && PostGameFlag == 1
)

    achievement(title="Unshackled Brawl",
                description = "Defeat the powered-up Silph Co. Chief at the end of the Gauntlet",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd88a))
                       && bit1(0xd88a) == 1
                       && PostGameFlag == 1
)

    achievement(title="Covermon",
                description = "Defeat powered-up Elite Four with only your trusted ScreamTail",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd887))
                       && PostGameFlag == 1
                       && PartySize == 1
                       && PkmnID1 == 0xDF
)
/// /// /// Pro Player Rematch /// /// ///
function LevelCapCheck(maxLevel) => PkmnLV1 <= maxLevel
                                 && PkmnLV2 <= maxLevel
                                 && PkmnLV3 <= maxLevel
                                 && PkmnLV4 <= maxLevel
                                 && PkmnLV5 <= maxLevel
                                 && PkmnLV6 <= maxLevel


    achievement(title="Playing by the Rules",
                description = "Defeat Yujirou in a postgame rematch on Set Mode without using any Pokémon above level 64",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x48
                       && TrainerID == 0x2f
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(64) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1

)

    achievement(title="Stone Cold Even",
                description = "Defeat Brock in a postgame rematch on Set Mode without using any Pokémon above level 70",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x39
                       && TrainerID == 0x21
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(70) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1

)

    achievement(title="Still Waters",
                description = "Defeat Misty in a postgame rematch on Set Mode without using any Pokémon above level 70",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x44
                       && TrainerID == 0x22
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(70) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1

)

    achievement(title="Flat Line",
                description = "Defeat Lt. Surge in a postgame rematch on Set Mode without using any Pokémon above level 70",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x5f
                       && TrainerID == 0x23
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(70) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1

)

    achievement(title="Touching Grass",
                description = "Defeat Erika in a postgame rematch on Set Mode without using any Pokémon above level 70",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x89
                       && TrainerID == 0x24
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(70) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1

)

    achievement(title="Measured Dose",
                description = "Defeat Koga in a postgame rematch on Set Mode without using any Pokémon above level 70",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0xa0
                       && TrainerID == 0x25
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(70) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1

)

    achievement(title="Level Headed",
                description = "Defeat Sabrina in a postgame rematch on Set Mode without using any Pokémon above level 70",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0xb4
                       && TrainerID == 0x27
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(70) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1

)

    achievement(title="Controlled Burn",
                description = "Defeat Blaine in a postgame rematch on Set Mode without using any Pokémon above level 70",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0xa9
                       && TrainerID == 0x26
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(70) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1

)

    achievement(title="No Comedic Relief",
                description = "Defeat Jessie & James in Citrine City on Set Mode without using any Pokémon above level 72",
                points = 10,
                trigger = LoadCheckRematch()
                       && PostGameFlag == 1
                       && MapID == 0x51
                       && TrainerID == 0x34
                       && trigger_when(FightWonFlag == 1)
                       && prev(FightWonFlag) == 0
                       && once(LevelCapCheck(72) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1
)

    achievement(title="Rival Send-Off",
                description = "Defeat the Elite Four in the postgame on Set Mode without using any Pokémon above level 85. Level is checked at the start of the Elite Four gauntlet.",
                points = 10,
                trigger = LoadCheck()
                       && trigger_when(bit1(0xd887) == 1)
                       && prev(bit1(0xd887)) == 0
                       && PostGameFlag == 1
                       && once(LevelCapCheck(85) && MapID == 0xf3 && prev(MapID) == 0xb0)
                       && never(MapID < 0x74) // Cover all the E4 maps, wipeout brings you back to 0x0b
                       && SetModeFlag == 1
)

    achievement(title="Final Bout",
                description = "Defeat the powered-up Silph Co. Chief at the end of the Gauntlet on Set Mode without using any Pokémon above level 87",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd88a))
                       && bit1(0xd88a) == 1
                       && PostGameFlag == 1
                       && MapID == 0x73
                       && once(LevelCapCheck(87) && LoadedFlag == 0xff && prev(LoadedFlag) == 1)
                       && never(MapID != prev(MapID))
                       && SetModeFlag == 1
)
/// /// /// Pokedex /// /// ///

    achievement(title="A New Breed of Pseudo Legendary",
                description = "Register Iguanarch in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit5(0xd323))
)

    achievement(title="Tourist Allegations",
                description = "Register all the regional forms in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && (bit3(0xd307) + bit0(0xd309) + bit7(0xd309) + bit0(0xd30a) + bit5(0xd30d) + bit6(0xd30e) + bit4(0xd30f) + bit7(0xd313) + bit2(0xd314) + bit3(0xd315) + bit2(0xd316) + bit2(0xd318) + bit4(0xd318) + bit1(0xd319) + bit7(0xd319) + bit6(0xd31a) + bit1(0xd31b) + bit7(0xd31d) + bit3(0xd31f) + bit4(0xd31f) + bit5(0xd31f) + bit3(0xd320) == 22)
                       && prev(bit3(0xd307) + bit0(0xd309) + bit7(0xd309) + bit0(0xd30a) + bit5(0xd30d) + bit6(0xd30e) + bit4(0xd30f) + bit7(0xd313) + bit2(0xd314) + bit3(0xd315) + bit2(0xd316) + bit2(0xd318) + bit4(0xd318) + bit1(0xd319) + bit7(0xd319) + bit6(0xd31a) + bit1(0xd31b) + bit7(0xd31d) + bit3(0xd31f) + bit4(0xd31f) + bit5(0xd31f) + bit3(0xd320)) == 21
)

    achievement(title="Archeologist",
                description = "Register all the fossils evo lines in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && (bitcount(0xd322) - bit7(0xd322)) == 7
                       && prev(bitcount(0xd322) - bit7(0xd322)) == 6
)

    achievement(title="Primordial Past",
                description = "Register all the Paradoxes in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && (bit1(0xd323) + bit2(0xd323) ) == 2
                       && prev(bit1(0xd323) + bit2(0xd323)) == 1
)

    achievement(title="Garden of Eden",
                description = "Register all the Starters in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && (bit0(0xd306) + bit3(0xd306) + bit6(0xd306) + bit1(0xd307) + bit5(0xd307)) == 5
                       && prev(bit0(0xd306) + bit3(0xd306) + bit6(0xd306) + bit1(0xd307) + bit5(0xd307)) == 4
)

    achievement(title="Omnilution",
                description = "Register all the Eevee in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && (bit5(0xd307) + bit6(0xd307) + bit7(0xd307) + bitcount(0xd308) - bit6(0xd308) - bit7(0xd308)) == 9
                       && prev(bit5(0xd307) + bit6(0xd307) + bit7(0xd307) + bitcount(0xd308) - bit6(0xd308) - bit7(0xd308)) == 8
)

    achievement(title="Artificial Renewal",
                description = "Register Omegadge in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit7(0xd322))
)

    achievement(title="Pokemon Go Play Better Games",
                description = "Register Meltan in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit1(0xd325))
)

    achievement(title="Gacha Grinding",
                description = "Register Melmetal in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit2(0xd325))
)

    achievement(title="Spanish Trio",
                description = "Register the legendary Bird Trio in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && (bit1(0xd324) + bit3(0xd324) + bit5(0xd324) ) == 3
                       && prev(bit1(0xd324) + bit3(0xd324) + bit5(0xd324)) == 2
)

    achievement(title="Exotic Birdwatching",
                description = "Register the Galarian Bird Trio in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && (bit2(0xd324) + bit4(0xd324) + bit6(0xd324) ) == 3
                       && prev(bit2(0xd324) + bit4(0xd324) + bit6(0xd324)) == 2
)

    achievement(title="Primeval Genetic",
                description = "Register Mew in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit0(0xd325))
)

    achievement(title="Ultimate Life Form",
                description = "Register Mewtwo in the Pokedex",
                points = 10,
                trigger = LoadCheck()
                       && BitCheck(bit7(0xd324))
)

function PokedexCount() => sum_of(range(0xd306, 0xd325), addr => bitcount(addr))

function PokedexCheck(target) => PokedexCount() == target
                              && prev(PokedexCount()) == target - 1

    achievement(title="As Arceus Intended",
                description = "Register 151 Pokemons in the Pokedex. What do you mean that's not all of them?",
                points = 10,
                trigger = LoadCheck()
                       && PokedexCheck(151)
)

    achievement(title="The Last Frontier",
                description = "Complete the Pokedex by registering all 251 Pokemons. That's All Folks!",
                points = 10,
                trigger = LoadCheck()
                       && PokedexCheck(251)
)


/// /// /// RP Script /// /// ///

PlayerNames = {
    0: "Red",
    1: "Green",
    2: "Pink"
}

PokemonNames = {
    0x00: "MissingNo.",
    0x01: "Rhydon",
    0x02: "Kangaskhan",
    0x03: "Nidoran(M)",
    0x04: "Clefairy",
    0x05: "Spearow",
    0x06: "Voltorb",
    0x07: "Nidoking",
    0x08: "Slowbro",
    0x09: "Ivysaur",
    0x0A: "Exeggutor",
    0x0B: "Lickitung",
    0x0C: "Exeggcute",
    0x0D: "Grimer",
    0x0E: "Gengar",
    0x0F: "Nidoran(F)",
    0x10: "Nidoqueen",
    0x11: "Cubone",
    0x12: "Rhyhorn",
    0x13: "Lapras",
    0x14: "Arcanine",
    0x15: "Mew",
    0x16: "Gyarados",
    0x17: "Shellder",
    0x18: "Tentacool",
    0x19: "Gastly",
    0x1A: "Scyther",
    0x1B: "Staryu",
    0x1C: "Blastoise",
    0x1D: "Pinsir",
    0x1E: "Tangela",
    0x1F: "Gawarhed",
    0x20: "Nidoreign",
    0x21: "Growlithe",
    0x22: "Onix",
    0x23: "Fearow",
    0x24: "Pidgey",
    0x25: "Slowpoke",
    0x26: "Kadabra",
    0x27: "Graveler",
    0x28: "Chansey",
    0x29: "Machoke",
    0x2A: "Mr. Mime",
    0x2B: "Hitmonlee",
    0x2C: "Hitmonchan",
    0x2D: "Arbok",
    0x2E: "Parasect",
    0x2F: "Psyduck",
    0x30: "Drowzee",
    0x31: "Golem",
    0x32: "Balumba",
    0x33: "Magmar",
    0x34: "Buu",
    0x35: "Electabuzz",
    0x36: "Magneton",
    0x37: "Koffing",
    0x38: "Ramoose",
    0x39: "Mankey",
    0x3A: "Seel",
    0x3B: "Diglett",
    0x3C: "Tauros",
    0x3D: "Trampel",
    0x3E: "Gavillain",
    0x3F: "Blottle",
    0x40: "Farfetch'd",
    0x41: "Venonat",
    0x42: "Dragonite",
    0x43: "Cactormus",
    0x44: "Sharpoon",
    0x45: "Bittybat",
    0x46: "Doduo",
    0x47: "Poliwag",
    0x48: "Jynx",
    0x49: "Moltres",
    0x4A: "Articuno",
    0x4B: "Zapdos",
    0x4C: "Ditto",
    0x4D: "Meowth",
    0x4E: "Krabby",
    0x4F: "Cheep",
    0x50: "Jabetta",
    0x51: "Vulpiii",
    0x52: "Vulpix",
    0x53: "Ninetales",
    0x54: "Pikachu",
    0x55: "Raichu",
    0x56: "Ribbito",
    0x57: "Croakozuna",
    0x58: "Dratini",
    0x59: "Dragonair",
    0x5A: "Kabuto",
    0x5B: "Kabutops",
    0x5C: "Horsea",
    0x5D: "Seadra",
    0x5E: "Ministare",
    0x5F: "Iguanarch",
    0x60: "Sandshrew",
    0x61: "Sandslash",
    0x62: "Omanyte",
    0x63: "Omastar",
    0x64: "Jigglypuff",
    0x65: "Wigglytuff",
    0x66: "Eevee",
    0x67: "Flareon",
    0x68: "Jolteon",
    0x69: "Vaporeon",
    0x6A: "Machop",
    0x6B: "Zubat",
    0x6C: "Ekans",
    0x6D: "Paras",
    0x6E: "Poliwhirl",
    0x6F: "Poliwrath",
    0x70: "Weedle",
    0x71: "Kakuna",
    0x72: "Beedrill",
    0x73: "Luxwan",
    0x74: "Dodrio",
    0x75: "Primeape",
    0x76: "Dugtrio",
    0x77: "Venomoth",
    0x78: "Dewgong",
    0x79: "Tricules",
    0x7A: "Pendraken",
    0x7B: "Caterpie",
    0x7C: "Metapod",
    0x7D: "Butterfree",
    0x7E: "Machamp",
    0x7F: "Weirduck",
    0x80: "Golduck",
    0x81: "Hypno",
    0x82: "Golbat",
    0x83: "Mewtwo",
    0x84: "Snorlax",
    0x85: "Magikarp",
    0x86: "Coinpur",
    0x87: "Omegadge",
    0x88: "Muk",
    0x89: "Decilla",
    0x8A: "Kingler",
    0x8B: "Cloyster",
    0x8C: "Magnetite",
    0x8D: "Electrode",
    0x8E: "Clefable",
    0x8F: "Weezing",
    0x90: "Persian",
    0x91: "Marowak",
    0x92: "Guardia",
    0x93: "Haunter",
    0x94: "Abra",
    0x95: "Alakazam",
    0x96: "Pidgeotto",
    0x97: "Pidgeot",
    0x98: "Starmie",
    0x99: "Bulbasaur",
    0x9A: "Venusaur",
    0x9B: "Tentacruel",
    0x9C: "Orfry",
    0x9D: "Goldeen",
    0x9E: "Seaking",
    0x9F: "Kotora",
    0xA0: "Gaotora",
    0xA1: "Gorotora",
    0xA2: "Kolta",
    0xA3: "Ponyta",
    0xA4: "Rapidash",
    0xA5: "Rattata",
    0xA6: "Raticate",
    0xA7: "Nidorino",
    0xA8: "Nidorina",
    0xA9: "Geodude",
    0xAA: "Porygon",
    0xAB: "Aerodactyl",
    0xAC: "Blastyke",
    0xAD: "Magnemite",
    0xAE: "Squeamata",
    0xAF: "Gorochu",
    0xB0: "Charmander",
    0xB1: "Squirtle",
    0xB2: "Charmeleon",
    0xB3: "Wartortle",
    0xB4: "Charizard",
    0xB5: "Totartle",
    0xB6: "Galarian Articuno",
    0xB7: "Galarian Zapdos",
    0xB8: "Galarian Moltres",
    0xB9: "Oddish",
    0xBA: "Gloom",
    0xBB: "Vileplume",
    0xBC: "Bellsprout",
    0xBD: "Weepinbell",
    0xBE: "Victreebel",
    0xBF: "Wiglett",
    0xC0: "Wugtrio",
    0xC1: "Scizor",
    0xC2: "Rhyperior",
    0xC3: "Espeon",
    0xC4: "Umbreon",
    0xC5: "Leafeon",
    0xC6: "Glaceon",
    0xC7: "Sylveon",
    0xC8: "Lickilicky",
    0xC9: "Tangrowth",
    0xCA: "Kleavor",
    0xCB: "Bellignan",
    0xCC: "Steelix",
    0xCD: "Blissey",
    0xCE: "Hitmontop",
    0xCF: "Crobat",
    0xD0: "Mimmeo",
    0xD1: "Bellossom",
    0xD2: "Porygon2",
    0xD3: "Kingdra",
    0xD4: "Politoed",
    0xD5: "Slowking",
    0xD6: "Electivire",
    0xD7: "Magmortar",
    0xD8: "Disturban",
    0xD9: "Gentlarva",
    0xDA: "Pupal",
    0xDB: "Carapthor",
    0xDC: "Magnezone",
    0xDD: "Porygon-Z",
    0xDE: "Annihilape",
    0xDF: "Screamtail",
    0xE0: "Sandy Shox",
    0xE1: "Toedscool",
    0xE2: "Toedscruel",
    0xE3: "Perrserker",
    0xE4: "Sirfetch'd",
    0xE5: "Mr. Rime",
    0xE6: "Meltan",
    0xE7: "Melmetal",
    0xE8: "Hisuian Arcanine",
    0xE9: "Hisuian Electrode",
    0xEA: "Alolan Raticate",
    0xEB: "Alolan Raichu",
    0xEC: "Alolan Sandslash",
    0xED: "Alolan Ninetales",
    0xEE: "Alolan Dugtrio",
    0xEF: "Alolan Persian",
    0xF0: "Alolan Golem",
    0xF1: "Galarian Rapidash",
    0xF2: "Galarian Slowbro",
    0xF3: "Galarian Slowking",
    0xF4: "Alolan Muk",
    0xF5: "Alolan Exeggutor",
    0xF6: "Alolan Marowak",
    0xF7: "Galarian Weezing",
    0xF8: "Paldean Combat Tauros",
    0xF9: "Paldean Aqua Tauros",
    0xFA: "Paldean Blaze Tauros",
    0xFB: "Gorillaimo",
    0xFC: "Missingno.",
    0xFD: "Missingno.",
    0xFE: "Missingno.",
    0xFF: "-----"
}

rich_presence_conditional_display(byte(0xd172) == 1,
    "• {0} LOVES Kanto • {1} Badges • Pokédex: {2}/251 • {3} Lv {4} •",
    rich_presence_lookup("Player", byte(0xd609), PlayerNames),
    rich_presence_value("Badges", bitcount(0xd371)),
    rich_presence_value("Dex", sum_of(range(0xd306, 0xd325), addr => bitcount(addr))),
    rich_presence_lookup("Pkmn", byte(0xd173), PokemonNames, "?"),
    rich_presence_value("Lv1", byte(0xd19b))
)

rich_presence_conditional_display(byte(0xd172) == 2,
    "• {0} LOVES Kanto • {1} Badges • Pokédex: {2}/251 • {3} Lv {4} - {5} Lv {6} •",
    rich_presence_lookup("Player", byte(0xd609), PlayerNames),
    rich_presence_value("Badges", bitcount(0xd371)),
    rich_presence_value("Dex", sum_of(range(0xd306, 0xd325), addr => bitcount(addr))),
    rich_presence_lookup("Pkmn", byte(0xd173), PokemonNames, "?"),
    rich_presence_value("Lv1", byte(0xd19b)),
    rich_presence_lookup("Pkmn", byte(0xd174), PokemonNames, "?"),
    rich_presence_value("Lv2", byte(0xd1c7))
)

rich_presence_conditional_display(byte(0xd172) == 3,
    "• {0} LOVES Kanto • {1} Badges • Pokédex: {2}/251 • {3} Lv {4} - {5} Lv {6} - {7} Lv {8} •",
    rich_presence_lookup("Player", byte(0xd609), PlayerNames),
    rich_presence_value("Badges", bitcount(0xd371)),
    rich_presence_value("Dex", sum_of(range(0xd306, 0xd325), addr => bitcount(addr))),
    rich_presence_lookup("Pkmn", byte(0xd173), PokemonNames, "?"),
    rich_presence_value("Lv1", byte(0xd19b)),
    rich_presence_lookup("Pkmn", byte(0xd174), PokemonNames, "?"),
    rich_presence_value("Lv2", byte(0xd1c7)),
    rich_presence_lookup("Pkmn", byte(0xd175), PokemonNames, "?"),
    rich_presence_value("Lv3", byte(0xd1f3))
)

rich_presence_conditional_display(byte(0xd172) == 4,
    "• {0} LOVES Kanto • {1} Badges • Pokédex: {2}/251 • {3} Lv {4} - {5} Lv {6} - {7} Lv {8} - {9} Lv {10} •",
    rich_presence_lookup("Player", byte(0xd609), PlayerNames),
    rich_presence_value("Badges", bitcount(0xd371)),
    rich_presence_value("Dex", sum_of(range(0xd306, 0xd325), addr => bitcount(addr))),
    rich_presence_lookup("Pkmn", byte(0xd173), PokemonNames, "?"),
    rich_presence_value("Lv1", byte(0xd19b)),
    rich_presence_lookup("Pkmn", byte(0xd174), PokemonNames, "?"),
    rich_presence_value("Lv2", byte(0xd1c7)),
    rich_presence_lookup("Pkmn", byte(0xd175), PokemonNames, "?"),
    rich_presence_value("Lv3", byte(0xd1f3)),
    rich_presence_lookup("Pkmn", byte(0xd176), PokemonNames, "?"),
    rich_presence_value("Lv4", byte(0xd21f))
)

rich_presence_conditional_display(byte(0xd172) == 5,
    "• {0} LOVES Kanto • {1} Badges • Pokédex: {2}/251 • {3} Lv {4} - {5} Lv {6} - {7} Lv {8} - {9} Lv {10} - {11} Lv {12} •",
    rich_presence_lookup("Player", byte(0xd609), PlayerNames),
    rich_presence_value("Badges", bitcount(0xd371)),
    rich_presence_value("Dex", sum_of(range(0xd306, 0xd325), addr => bitcount(addr))),
    rich_presence_lookup("Pkmn", byte(0xd173), PokemonNames, "?"),
    rich_presence_value("Lv1", byte(0xd19b)),
    rich_presence_lookup("Pkmn", byte(0xd174), PokemonNames, "?"),
    rich_presence_value("Lv2", byte(0xd1c7)),
    rich_presence_lookup("Pkmn", byte(0xd175), PokemonNames, "?"),
    rich_presence_value("Lv3", byte(0xd1f3)),
    rich_presence_lookup("Pkmn", byte(0xd176), PokemonNames, "?"),
    rich_presence_value("Lv4", byte(0xd21f)),
    rich_presence_lookup("Pkmn", byte(0xd177), PokemonNames, "?"),
    rich_presence_value("Lv5", byte(0xd24b))
)

rich_presence_conditional_display(byte(0xd172) == 6,
    "• {0} LOVES Kanto • {1} Badges • Pokédex: {2}/251 • {3} Lv {4} - {5} Lv {6} - {7} Lv {8} - {9} Lv {10} - {11} Lv {12} - {13} Lv {14} •",
    rich_presence_lookup("Player", byte(0xd609), PlayerNames),
    rich_presence_value("Badges", bitcount(0xd371)),
    rich_presence_value("Dex", sum_of(range(0xd306, 0xd325), addr => bitcount(addr))),
    rich_presence_lookup("Pkmn", byte(0xd173), PokemonNames, "?"),
    rich_presence_value("Lv1", byte(0xd19b)),
    rich_presence_lookup("Pkmn", byte(0xd174), PokemonNames, "?"),
    rich_presence_value("Lv2", byte(0xd1c7)),
    rich_presence_lookup("Pkmn", byte(0xd175), PokemonNames, "?"),
    rich_presence_value("Lv3", byte(0xd1f3)),
    rich_presence_lookup("Pkmn", byte(0xd176), PokemonNames, "?"),
    rich_presence_value("Lv4", byte(0xd21f)),
    rich_presence_lookup("Pkmn", byte(0xd177), PokemonNames, "?"),
    rich_presence_value("Lv5", byte(0xd24b)),
    rich_presence_lookup("Pkmn", byte(0xd178), PokemonNames, "?"),
    rich_presence_value("Lv6", byte(0xd277))
)

rich_presence_display("• {0} LOVES Kanto •",
    rich_presence_lookup("Player", byte(0xd609), PlayerNames)
)
