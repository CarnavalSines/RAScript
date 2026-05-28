// ~Hack~ Pokemblem [Subset - Challenge Runs]
// #ID = 38619
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


badges = [
    ["Boulder Badge", BoulderBadgeFlag, "Defeat Brock and obtain the Boulder Badge",   2],
    ["Cascade Badge", CascadeBadgeFlag, "Defeat Misty and obtain the Cascade Badge",   3],
    ["Thunder Badge", ThunderBadgeFlag, "Defeat Surge and obtain the Thunder Badge",   5],
    ["Soul Badge",    SoulBadgeFlag,    "Defeat Koga and obtain the Soul Badge",       5],
    ["Rainbow Badge", RainbowBadgeFlag, "Defeat Erika and obtain the Rainbow Badge",   5],
    ["Marsh Badge",   MarshBadgeFlag,   "Defeat Sabrina and obtain the Marsh Badge",  10],
    ["Volcano Badge", VolcanoBadgeFlag, "Defeat Blaine and obtain the Volcano Badge", 10],
    ["Earth Badge",   EarthBadgeFlag,   "Defeat Giovanni and obtain the Earth Badge", 10],
]

challengers = [
    ["Ash",       ChallengeAsh()],
    ["Gary",      ChallengeGary()],
    ["Oak",       ChallengeOak()],
    ["Bill",      ChallengeBill()],
    ["Brock",     ChallengeBrock()],
    ["Misty",     ChallengeMisty()],
    ["Surge",     ChallengeSurge()],
    ["Erika",     ChallengeErika()],
    ["Koga",      ChallengeKoga()],
    ["Sabrina",   ChallengeSabrina()],
    ["Blaine",    ChallengeBlaine()],
    ["Giovanni",  ChallengeGiovanni()],
    ["Lorelei",   ChallengeLorelei()],
    ["Bruno",     ChallengeBruno()],
    ["Agatha",    ChallengeAgatha()],
    ["Lance",     ChallengeLance()],
    ["Vesly",     ChallengeVesly()],
    ["LittleCup", ChallengeLittleCup()],
    ["FullChaos", ChallengeFullChaos()],
]

for challenger in challengers {
    for badge in badges {
        achievement(
            title       = "Challenger " + challenger[0] + " " + badge[0],
            description = badge[2] + " as Challenger " + challenger[0],
            points      = badge[3],
            trigger     = LoadCheck()
                       && DebugProtect()
                       && challenger[1]
                       && badge[1] == 1
                       && prev(badge[1]) == 0
        )
    }

    achievement(
        title       = "Challenger " + challenger[0] + " at the Top of the World",
        description = "Defeat your Rival and become Champion as Challenger " + challenger[0],
        points      = 25,
        trigger     = LoadCheck()
                   && DebugProtect()
                   && challenger[1]
                   && GaryCheatFlag == 1
                   && prev(GaryCheatFlag) == 0
    )
}