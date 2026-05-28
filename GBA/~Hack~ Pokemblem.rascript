// ~Hack~ Pokemblem
// #ID = 17723
// 20260526 Version - Sines

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
RPMapID = {
    0x00: "Oak's Lab",
    0x01: "Pallet Town",
    0x02: "Route 1",
    0x03: "Viridian City",
    0x04: "Route 2",
    0x05: "Viridian Forest",
    0x06: "Viridian Forest",
    0x07: "Route 2",
    0x08: "Pewter City",
    0x09: "Pewter Gym",
    0x0a: "Route 3",
    0x0b: "Route 4",
    0x0c: "Mt Moon B1",
    0x0d: "Mt Moon B2",
    0x0e: "Mt Moon B3",
    0x0f: "Route 4",
    0x10: "Cerulean City",
    0x11: "Cerulean Gym",
    0x12: "Route 24",
    0x13: "Route 25",
    0x14: "Route 5",
    0x15: "Route 6",
    0x16: "Vermilion City",
    0x17: "Vermilion Gym",
    0x18: "SS Anne",
    0x19: "Diglett's Cave",
    0x1a: "Route 11",
    0x1b: "Route 9",
    0x1c: "Route 9",
    0x1d: "Route 10",
    0x1e: "Rock Tunnel",
    0x1f: "Rock Tunnel",
    0x20: "Lavender Town",
    0x21: "Route 8",
    0x22: "Pkmn Tower",
    0x23: "Pkmn Tower",
    0x24: "Pkmn Tower",
    0x25: "Pkmn Tower",
    0x26: "Pkmn Tower",
    0x27: "Route 12",
    0x28: "Route 12",
    0x29: "Route 13",
    0x2a: "Route 14",
    0x2b: "Route 15",
    0x2c: "Fuchsia City",
    0x2d: "Safari Zone",
    0x2e: "Safari Zone",
    0x2f: "Safari Zone",
    0x30: "Safari Zone",
    0x31: "Fuchsia Gym",
    0x32: "Route 18",
    0x33: "Route 17",
    0x34: "Route 17",
    0x35: "Route 16",
    0x36: "Celadon City",
    0x37: "Celadon Gym",
    0x38: "Route 7",
    0x39: "Saffron City",
    0x3a: "Saffron Dojo",
    0x3b: "Saffron Gym",
    0x3c: "Route 19",
    0x3d: "Route 20",
    0x3e: "Route 20",
    0x3f: "Cinnabar Island",
    0x40: "Cinnabar Gym",
    0x41: "Route 21",
    0x42: "Viridian Gym",
    0x43: "Route 22",
    0x44: "Route 23",
    0x45: "Route 23",
    0x46: "Route 23",
    0x47: "PC Box",
    0x48: "PC Box",
    0x49: "Silph Co",
    0x4a: "Silph Co",
    0x4b: "Silph Co",
    0x4c: "Silph Co",
    0x4d: "Silph Co",
    0x4e: "Seafoam Cave",
    0x4f: "Seafoam Cave",
    0x50: "Seafoam Cave",
    0x51: "Seafoam Cave",
    0x52: "Seafoam Cave",
    0x53: "Pkmn Mansion",
    0x54: "Pkmn Mansion",
    0x55: "Pkmn Mansion",
    0x56: "Pkmn Mansion",
    0x57: "Power Plant",
    0x58: "Cerulean Cave",
    0x59: "Cerulean Cave",
    0x5a: "Cerulean Cave",
    0x5b: "Victory Road",
    0x5c: "Victory Road",
    0x5d: "Victory Road",
    0x5e: "Indigo Plateau",
    0x5f: "VS Lorelei",
    0x60: "VS Bruno",
    0x61: "VS Agatha",
    0x62: "VS Lance",
    0x63: "VS Gary",
    0x64: "PC Box",
    0x65: "Hall of Fame",
    0x66: "PC Box",
    0x67: "PC Box",
    0x68: "Viridian Gym",
    0x69: "Docks",
    0x6a: "Debug Room",
    0x6b: "Debug Room"
}


LastItemObtained = byte(0x05f4)
MapID = byte(0x33cfe)
CurrentUnit = word(0x424ec)
DebuggerFlag = bit3(0x5261)
MusicID = byte(0x2ce60) // 0x008 > Evolution
ASCIIStart = 0x326ac
CharName1 = dword(0x33d10) // to check special modes
CharName2 = dword(0x033d14)
RNGSeed = dword(0x477c4)

CheatFlagSave1 = byte(0x48054)
CheatFlagSave2 = byte(0x48058)
CheatFlagSave3 = byte(0x4805c)

/// Run Start Options
FemaleChar = bit1(0x5260)
LunaticDifficulty = bit6(0x33d04)
HardDifficulty = bit5(0x33d32)
WildPkmnRando = bit0(0x5259)
CantCapture = bit3(0x5260)
CantEvolve = bit0(0x5265)
SkillRando = bit1(0x5265)
StatRando = bit2(0x5265)
ItemRando = bit3(0x5265)
GrowthRando = bit4(0x5265)
BossRando = bit5(0x5265)
TrainerRando = bit6(0x5265)
MoveRando = bit7(0x5265)

/// Prog Flags
BoulderBadgeFlag = bit7(0x5254)
CascadeBadgeFlag = bit1(0x5255)
ThunderBadgeFlag = bit7(0x5255)
RainbowBadgeFlag = bit3(0x5257)
SoulBadgeFlag = bit0(0x5257)
MarshBadgeFlag = bit7(0x5259)
VolcanoBadgeFlag = bit5(0x525c)
EarthBadgeFlag =  bit3(0x525d)

LoreleiFlag = bit1(0x525e)
BrunoFlag = bit2(0x525e)
AgathaFlag = bit3(0x525e)
LanceFlag = bit4(0x525e)
GaryCheatFlag = bit6(0x525e) // WinCon

SSAnneTicketFlag = bit5(0x5255)
PkmnTowerClearFlag = bit4(0x5256)

/// Rival Fight Flags
RivalRoute2 = bit7(0x4760d)
RivalCerulean = bit7(0x47625)
RivalSSAnne = bit7(0x47635)
RivalPkmnTower = bit7(0x47649)
RivalSilphCo = bit7(0x47697)
RivalRoute22 = bit7(0x4768b)

/// Misc Event Flags
BrockJellyDonut = bit5(0x5261)
MagikarpSellerFlag = bit0(0x5255)
RockSmashLearnedFlag = bit1(0x5257)
FlyLearnedFlag = bit2(0x5257)
MomGift = bit4(0x47768)
VeslyPreE4 = bit5(0x47691)

MoltresFlag = bit5(0x525d)
ArticunoFlag = bit6(0x525d)
ZapdosFlag = bit7(0x525d)
MewTruck = bit0(0x525e)

function LoadCheck() => MapID == prev(MapID) && MusicID != 0
function DebugProtect() => DebuggerFlag == 1 && CheatFlagSave1 != 1 && CheatFlagSave2 != 1 && CheatFlagSave3 != 1 
function NoRandoNoChallengeRun() => WildPkmnRando == 0 && CantCapture == 0 && CantEvolve == 0 && SkillRando == 0 && StatRando == 0 && ItemRando == 0 && GrowthRando == 0 && BossRando == 0 && TrainerRando == 0 && MoveRando == 0 && CharName1 != 0x006b614f && (CharName1 != 0x6c736556 && CharName2 != 0x00000079)
function PokedexCount() => bitcount(0x47708) - bit0(0x47708) + bitcount(0x47709) + bit0(0x4770a) + bit1(0x4770a) + bit2(0x4770a) + bit7(0x4770a) + bitcount(0x4770b) + bitcount(0x4770c) + bitcount(0x4770d) + bitcount(0x4770e) - bit4(0x4770e) + bitcount(0x4770f) + bitcount(0x47710) + bitcount(0x47711) + bitcount(0x47712) - bit1(0x47712) + bitcount(0x47713) - bit7(0x47713) + bitcount(0x47718) + bitcount(0x47719) + bitcount(0x4771a) + bitcount(0x4771b) + bitcount(0x4771c) + bitcount(0x4771d) + bitcount(0x4771e) + bitcount(0x4771f) - bit7(0x4771f)

function PokedexCheck(target) => PokedexCount() == target
                              && prev(PokedexCount()) == target - 1

    achievement(title="Tainted Run",
                description = "Usage of the Debug Mode will block achievements from triggering so keep it for messing around once you've mastered the set! On top of that Randomizer options and challenge runs will not work for the main set, see the subset for those.",
                points = 0,
                trigger = LoadCheck()
                       && DebuggerFlag == 1
                       && prev(DebuggerFlag) == 0
)  

    achievement(title="Field Ambush",
                description = "Defeat your rival in Route 2 and start your adventure proper!",
                points = 2,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RivalRoute2 == 1
                       && prev(RivalRoute2) == 0
)  

    achievement(title="Mostly Rocks",
                description = "Defeat Brock and obtain the Boulder Badge",
                points = 3,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && BoulderBadgeFlag == 1
                       && prev(BoulderBadgeFlag) == 0
)  

    achievement(title="Fallen Boulder",
                description = "Defeat Brock and obtain the Boulder Badge in Lunatic difficulty",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && BoulderBadgeFlag == 1
                       && prev(BoulderBadgeFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="Bridge Toll",
                description = "Defeat your rival in Cerulean City",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RivalCerulean == 1
                       && prev(RivalCerulean) == 0
)  

    achievement(title="Bikeless Splash",
                description = "Defeat Misty and obtain the Cascade Badge",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && CascadeBadgeFlag == 1
                       && prev(CascadeBadgeFlag) == 0
)  

    achievement(title="Swift Swim",
                description = "Defeat Misty and obtain the Cascade Badge in Lunatic difficulty",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && CascadeBadgeFlag == 1
                       && prev(CascadeBadgeFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="I'm On a Boat",
                description = "Defeat your rival in the SS Anne",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RivalSSAnne == 1
                       && prev(RivalSSAnne) == 0
)  

    achievement(title="Army Trooper",
                description = "Defeat Surge and obtain the Thunder Badge",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ThunderBadgeFlag == 1
                       && prev(ThunderBadgeFlag) == 0
)  

    achievement(title="Zapped",
                description = "Defeat Surge and obtain the Thunder Badge in Lunatic difficulty",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ThunderBadgeFlag == 1
                       && prev(ThunderBadgeFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="No Respect",
                description = "Defeat your rival in the Pokemon Tower",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RivalPkmnTower == 1
                       && prev(RivalPkmnTower) == 0
)  

    achievement(title="Muscial Whimsy",
                description = "Clear the Pokemon Tower and obtain your reward",
                points = 2,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && PkmnTowerClearFlag == 1
                       && prev(PkmnTowerClearFlag) == 0
)  

    achievement(title="Poison Ninpo",
                description = "Defeat Koga and obtain the Soul Badge",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && SoulBadgeFlag == 1
                       && prev(SoulBadgeFlag) == 0
)  

    achievement(title="Iron Gut",
                description = "Defeat Koga and obtain the Soul Badge in Lunatic difficulty",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && SoulBadgeFlag == 1
                       && prev(SoulBadgeFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="Green Energy",
                description = "Defeat Erika and obtain the Rainbow Badge",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RainbowBadgeFlag == 1
                       && prev(RainbowBadgeFlag) == 0
)  

    achievement(title="Grass Knot",
                description = "Defeat Erika and obtain the Rainbow Badge in Lunatic difficulty",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RainbowBadgeFlag == 1
                       && prev(RainbowBadgeFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="Corporate Shill",
                description = "Defeat your rival in the Silph Co. Building",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RivalSilphCo == 1
                       && prev(RivalSilphCo) == 0
)  

    achievement(title="Crime Syndicate",
                description = "Defeat Giovanni in the Silph Co. Building",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && bit7(0x4769f) == 1
                       && prev(bit7(0x4769f)) == 0
)  

    achievement(title="Spooky Mind Magic",
                description = "Defeat Sabrina and obtain the Marsh Badge",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && MarshBadgeFlag == 1
                       && prev(MarshBadgeFlag) == 0
)  

    achievement(title="Matter over Mind",
                description = "Defeat Sabrina and obtain the Marsh Badge in Lunatic difficulty",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && MarshBadgeFlag == 1
                       && prev(MarshBadgeFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="Blaine Kicking",
                description = "Defeat Blaine and obtain the Volcano Badge",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && VolcanoBadgeFlag == 1
                       && prev(VolcanoBadgeFlag) == 0
)  

    achievement(title="Blazing Inferno",
                description = "Defeat Blaine and obtain the Volcano Badge in Lunatic difficulty",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && VolcanoBadgeFlag == 1
                       && prev(VolcanoBadgeFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="Path to Redemption",
                description = "Defeat Giovanni and obtain the Earth Badge",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && EarthBadgeFlag == 1
                       && prev(EarthBadgeFlag) == 0
)  

    achievement(title="Last Hurrah",
                description = "Defeat Giovanni and obtain the Earth Badge in Lunatic difficulty",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && EarthBadgeFlag == 1
                       && prev(EarthBadgeFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="Meeting Fancy",
                description = "Defeat your rival on route 22. Last stretch before the end!",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RivalRoute22 == 1
                       && prev(RivalRoute22) == 0
)  

    achievement(title="Word from God",
                description = "Defeat the Creator before entering the Elite Four",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && VeslyPreE4 == 1
                       && prev(VeslyPreE4) == 0
)  

    achievement(title="Cold For Teacher",
                description = "Defeat Lorelei of the Elite Four",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && LoreleiFlag == 1
                       && prev(LoreleiFlag) == 0
)  

    achievement(title="Burning Muscles",
                description = "Defeat Bruno of the Elite Four",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && BrunoFlag == 1
                       && prev(BrunoFlag) == 0
)  

    achievement(title="Old (Gol)Bat",
                description = "Defeat Agatha of the Elite Four",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && AgathaFlag == 1
                       && prev(AgathaFlag) == 0
)  

    achievement(title="Weapon Triangle",
                description = "Defeat Lance of the Elite Four",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && LanceFlag == 1
                       && prev(LanceFlag) == 0
)  

    achievement(title="Cheaters Never Win",
                description = "Defeat your Rival and become Champion",
                points = 25,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && GaryCheatFlag == 1
                       && prev(GaryCheatFlag) == 0
)  

    achievement(title="Winners Never Cheat",
                description = "Defeat your Rival and become Champion in Lunatic difficulty",
                points = 50,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && GaryCheatFlag == 1
                       && prev(GaryCheatFlag) == 0
                       && LunaticDifficulty == 1
)  

    achievement(title="Smooth Sand",
                description = "Defeat Brock in a rematch",
                points = 10,
                trigger = MapID == 0x09
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b6, "Every town")
                       && byte(0x0326b6) != prev(byte(0x0326b6))
                       
)     

    achievement(title="Love Pond",
                description = "Defeat Misty in a rematch",
                points = 10,
                trigger = MapID == 0x11
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b5, "Hey, did you hear")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
)     

    achievement(title="War's Spark",
                description = "Defeat Surge in a rematch",
                points = 10,
                trigger = MapID == 0x17
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b5, "Where'd you train")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
)     

    achievement(title="Dawn Rise",
                description = "Defeat Koga in a rematch",
                points = 10,
                trigger = MapID == 0x31
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b5, "The shadows")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
)     

    achievement(title="Locust",
                description = "Defeat Erika in a rematch",
                points = 10,
                trigger = MapID == 0x37
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b6, "Nobody")
                       && byte(0x0326b6) != prev(byte(0x0326b6))
                       
)     

    achievement(title="Headache",
                description = "Defeat Sabrina in a rematch",
                points = 10,
                trigger = MapID == 0x3b
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b5, "I envy you")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
)   

    achievement(title="Cooler Heads",
                description = "Defeat Blaine in a rematch",
                points = 10,
                trigger = MapID == 0x40
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b5, "I've put")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
)   

    achievement(title="Untracked Champion",
                description = "Defeat your rival in a rematch",
                points = 10,
                trigger = MapID == 0x42
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b5, "Tcch")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
)   

    achievement(title="This Achievement Is Brought to You by 4KIDS",
                description = "Obtain a Jelly Donut from Brock",
                points = 1,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && BrockJellyDonut == 1
                       && prev(BrockJellyDonut) == 0
                       && MapID == 0x03
)  

    achievement(title="Power of Money",
                description = "Buy a Magikarp from a trusted source",
                points = 3,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && MagikarpSellerFlag == 1
                       && prev(MagikarpSellerFlag) == 0
)  

    achievement(title="Parc of the Free",
                description = "Learn Rock Smash from the most American Parc Ranger",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && RockSmashLearnedFlag == 1
                       && prev(RockSmashLearnedFlag) == 0
)  

    achievement(title="Mind Boggling Effects",
                description = "Learn Fly. You can now roam in 3D!",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && FlyLearnedFlag == 1
                       && prev(FlyLearnedFlag) == 0
)  

    achievement(title="Unofficial Challenger",
                description = "Defeat the Karate Master",
                points = 5,
                trigger = MapID == 0x3a
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b5, "Hwa")
                       && byte(0x0326b5) != prev(byte(0x0326b5))
                       
)   

    achievement(title="Mother's Love",
                description = "Get a gift from your Mom",
                points = 3,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && MomGift == 1
                       && prev(MomGift) == 0
)  

    achievement(title="Fiery Clash",
                description = "Defeat Moltres in its lair",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && MoltresFlag == 1
                       && prev(MoltresFlag) == 0
)  

    achievement(title="Cold War",
                description = "Defeat Articuno in its lair",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ArticunoFlag == 1
                       && prev(ArticunoFlag) == 0
)  

    achievement(title="Rising Tension",
                description = "Defeat Zapdos in its lair",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ZapdosFlag == 1
                       && prev(ZapdosFlag) == 0
)  

    achievement(title="My Uncle Works at Retroachievement",
                description = "Push the truck!",
                points = 2,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && MewTruck == 1
                       && prev(MewTruck) == 0
)  

    achievement(title="Ultimate Life Form",
                description = "Defeat Mewtwo and obtain the ultimate reward",
                points = 10,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && bit5(0x0475be) == 1
                       && prev(bit5(0x0475be)) == 0
)  

    achievement(title="Woodland Cleaner",
                description = "Defeat every trainers in Viridian Forest",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && measured(bit0(0x4760e) + bit0(0x47610) + bit1(0x47610) + bit3(0x47610) + bit4(0x47610) == 5)
                       && prev(bit0(0x4760e) + bit0(0x47610) + bit1(0x47610) + bit3(0x47610) + bit4(0x47610)) == 4
)

    achievement(title="Moon Dweller",
                description = "Defeat every trainers in Mt Moon",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && measured(bitcount(0x4761c) - bit6(0x4761c) - bit7(0x4761c) + bit0(0x4761e) + bit1(0x4761e) + bitcount(0x47620) - bit1(0x47620) - bit2(0x47620) - bit7(0x47620) == 13)
                       && prev(bitcount(0x4761c) - bit6(0x4761c) - bit7(0x4761c) + bit0(0x4761e) + bit1(0x4761e) + bitcount(0x47620) - bit1(0x47620) - bit2(0x47620) - bit7(0x47620)) == 12
)

    achievement(title="Master of Land",
                description = "Defeat every trainers in the Rock Tunnel",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && measured(bit0(0x47640) + bit1(0x47640) + bit2(0x47640) + bit3(0x47640) + bit1(0x47642) + bit2(0x47642) + bit3(0x47642) == 7)
                       && prev(bit0(0x47640) + bit1(0x47640) + bit2(0x47640) + bit3(0x47640) + bit1(0x47642) + bit2(0x47642) + bit3(0x47642)) == 6
)

    achievement(title="Heaven On High",
                description = "Defeat every trainers in the Pokemon Tower",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && measured(bit0(0x4764a) + bit0(0x4764c) + bit0(0x4764e) +bit0(0x47650) + bit1(0x47650) == 5)
                       && prev(bit0(0x4764a) + bit0(0x4764c) + bit0(0x4764e) +bit0(0x47650) + bit1(0x47650)) == 4
)

    achievement(title="Hostile Takeover",
                description = "Defeat every trainers in Silph Co",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && measured(bitcount(0x47698) - bit0(0x47698) - bit6(0x47698) - bit7(0x47698) + bitcount(0x4769a) - bit5(0x4769a) - bit6(0x4769a) - bit7(0x4769a) + bit0(0x4769c) + bit1(0x4769c) + bit2(0x4769c) == 13)
                       && prev(bitcount(0x47698) - bit0(0x47698) - bit6(0x47698) - bit7(0x47698) + bitcount(0x4769a) - bit5(0x4769a) - bit6(0x4769a) - bit7(0x4769a) + bit0(0x4769c) + bit1(0x4769c) + bit2(0x4769c)) == 12
)

    achievement(title="Training Montage",
                description = "Defeat every trainers in Victory Road",
                points = 5,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && measured(bit0(0x476ba) + bit1(0x476ba) + bit0(0x476bc) + bit1(0x476bc) + bit2(0x476bc) + bit3(0x476bc) + bit1(0x476be) + bit3(0x476be) + bit4(0x476be) == 9)
                       && prev(bit0(0x476ba) + bit1(0x476ba) + bit0(0x476bc) + bit1(0x476bc) + bit2(0x476bc) + bit3(0x476bc) + bit1(0x476be) + bit3(0x476be) + bit4(0x476be)) == 8
)

    achievement(title="Together We Ride",
                description = "Complete the Pokedex by registering all 151 Pokemons. Time to check with Oak for some secret!",
                points = 50,
                trigger = LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && PokedexCheck(151)
)

    achievement(title="Out of Scope",
                description = "Catch a mysterious unidentifiable Pokemon in Cinnabar Island",
                points = 10,
                trigger = MapID == 0x3f
                       && LoadCheck()
                       && DebugProtect()
                       && NoRandoNoChallengeRun()
                       && ascii_string_equals(0x0326b2, "Pok")
                       && byte(0x0326b2) != prev(byte(0x0326b2))
                       
)   
/// SUBSET
function ChallengeAsh() => CharName1 == 0x00687341  && CharName2 == 0x00
function ChallengeGary() => CharName1 == 0x79726147  && CharName2 == 0x00
function ChallengeOak() => CharName1 == 0x006b614f  && CharName2 == 0x00
function ChallengeBill() => CharName1 == 0x6c6c6942  && CharName2 == 0x00
function ChallengeBrock() => CharName1 == 0x636f7242  && CharName2 == 0x0000006b
function ChallengeMisty() => CharName1 == 0x7473694d  && CharName2 == 0x00000079
function ChallengeSurge() => CharName1 == 0x202e744c  && CharName2 == 0x67727553
function ChallengeErika() => CharName1 == 0x6b697245  && CharName2 == 0x00000061
function ChallengeKoga() => CharName1 == 0x61676f4b  && CharName2 == 0x00
function ChallengeSabrina() => CharName1 == 0x72626153  && CharName2 == 0x00616e69
function ChallengeBlaine() => CharName1 == 0x69616c42  && CharName2 == 0x0000656e
function ChallengeGiovanni() => CharName1 == 0x766f6947  && CharName2 == 0x696e6e61
function ChallengeLorelei() => CharName1 == 0x65726f4c  && CharName2 == 0x0069656c
function ChallengeBruno() => CharName1 == 0x6e757242  && CharName2 == 0x0000006f
function ChallengeAgatha() => CharName1 == 0x74616741  && CharName2 == 0x00006168
function ChallengeLance() => CharName1 == 0x636e614c  && CharName2 == 0x00000065
function ChallengeVesly() => CharName1 == 0x6c736556  && CharName2 == 0x00000079 && CantEvolve == 1 && CantCapture == 1
function ChallengeLittleCup() => CantEvolve == 1 && CantCapture == 0
function ChallengeFullChaos() => WildPkmnRando == 1 && SkillRando == 1 && StatRando == 1 && ItemRando == 1 && GrowthRando == 1 && BossRando == 1 && TrainerRando == 1 && MoveRando == 1


// ---- Rich Presence Display ----
rich_presence_conditional_display(NoRandoNoChallengeRun() && DebugProtect() && FemaleChar == 0 && LunaticDifficulty == 1,
    "• Red is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • Lunatic •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(NoRandoNoChallengeRun() && DebugProtect() && FemaleChar == 1 && LunaticDifficulty == 1,
    "• Leaf is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • Lunatic •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)


rich_presence_conditional_display(NoRandoNoChallengeRun() && DebugProtect() && FemaleChar == 0,
    "• Red is in {0} • Pokédex: {1}/151 • RNG Seed: {2} •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(NoRandoNoChallengeRun() && DebugProtect() && FemaleChar == 1,
    "• Leaf is in {0} • Pokédex: {1}/151 • RNG Seed: {2} •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)


rich_presence_conditional_display(DebugProtect() && ChallengeAsh(),
    "• Challenger Ash is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeGary(),
    "• Challenger Gary is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeOak(),
    "• Challenger Oak is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeBill(),
    "• Challenger Bill is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeBrock(),
    "• Challenger Brock is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeMisty(),
    "• Challenger Misty is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeSurge(),
    "• Challenger Surge is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeErika(),
    "• Challenger Erika is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeKoga(),
    "• Challenger Koga is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeSabrina(),
    "• Challenger Sabrina is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeBlaine(),
    "• Challenger Blaine is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeGiovanni(),
    "• Challenger Giovanni is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeLorelei(),
    "• Challenger Lorelei is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeBruno(),
    "• Challenger Bruno is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeAgatha(),
    "• Challenger Agatha is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeLance(),
    "• Challenger Lance is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeVesly() && LunaticDifficulty == 1,
    "• Almighty Challenger Vesly is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! • Lunatic •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeVesly(),
    "• Challenger Vesly is in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeLittleCup(),
    "• Little Cup Challenge in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)

rich_presence_conditional_display(DebugProtect() && ChallengeFullChaos(),
    "• Full Chaos Challenge in {0} • Pokédex: {1}/151 • RNG Seed: {2} • !! SUBSET ACHIEVEMENTS ONLY !! •",
    rich_presence_lookup("MapID", MapID, RPMapID),
    rich_presence_value("Dex", PokedexCount()),
    rich_presence_value("Seed", RNGSeed)
)


rich_presence_conditional_display((DebuggerFlag == 0 && MapID != 0) || CheatFlagSave1 == 1 || CheatFlagSave2 == 1 || CheatFlagSave3 == 1 ,
    "•  !! TAINT DETECTED !! •"
)

rich_presence_display(
    "• It's not Pokemon but it's not quite Fire Emblem either • "

)  