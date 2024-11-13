// Digital Devil Story: Megami Tensei
// #ID = 13985
// 20241113 Version - Sines

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

CutsceneFlag = byte(0x01e9)
EndGameGameOverFlag = byte(0x0001fa)
YumikoSaved = byte(0x042a)
RoadOpen = byte(0x042b)

InformationLevel = byte(0x041d)
WorldSephiroth = byte(0x0422)
FloorID = byte(0x0423)
MaxHealth = word(0x0431)
CurrentHealth = word(0x04ac)

ChronosQuantity = byte(0x043a)
BellQuantity = byte(0x0440)
LampQuantity = byte(0x0444)
PurseQuantity = byte(0x0448)
OpoponacsQuantity = byte(0x044c)
ReirryCurvedJewels = byte(0x0459)
SolomonDirks = byte(0x045a)
CerberusUnlock = byte(0x0461)
MercurySulfideUnlock = byte(0x0462)
AmuletUnlock = byte(0x0463)
CatsEyesUnlock = byte(0x0464)
RemolaStaff = byte(0x0465)
Salamender = byte(0x0466)
Computer = byte(0x0467)
LapisGemstone = byte(0x0468)
SpikerUnlock = byte(0x046c)
HorusKey = byte(0x046d)
MapUnlock = byte(0x046e)
EnochianTablets = byte(0x0473)
SilverTalisman = byte(0x0474)

AgrippaKill = byte(0x047c)
SoberdquKill = byte(0x047e)
CaratycaKill = byte(0x047f)
GalapagosKill = byte(0x0480)
ClardnyquaKill = byte(0x0486)
ValgusKill = byte(0x048a)

SethKill = byte(0x0476)
LokiKill = byte(0x0478)
OharaKill = byte(0x0479)
ArbertusKill = byte(0x047a)
GuaitaKill = byte(0x047b)
ReikoKill = byte(0x047d)
DevilSquashKill = byte(0x0482)
PompadoulKill = byte(0x0488)
ZariKill = byte(0x048c)

function LoadCheck() => EndGameGameOverFlag != 0 && prev(EndGameGameOverFlag)!= 0


    achievement(title="Devil Summoning Program",
                description = "Find your Computer in Malkuth",
                points = 1,
                trigger = WorldSephiroth == 1
                       && Computer == 0x14
                       && prev(Computer) == 0
                       && LoadCheck()
)  

    achievement(title="Faithful Companion",
                description = "Find Cerberus",
                points = 3,
                trigger = WorldSephiroth == 3
                       && CerberusUnlock == 0x4e
                       && prev(CerberusUnlock) == 0x40
                       && LoadCheck()
)  

    achievement(title="Terror from the Deep",
                description = "Defeat Clardnyqua in the Light Yesod Sephirot",
                points = 5,
                trigger = WorldSephiroth == 2
                       && ClardnyquaKill == 1
                       && prev(ClardnyquaKill) == 0
                       && LoadCheck()
)  

    achievement(title="Water Fiend",
                description = "Defeat Galapagos in the Light Hod Sephirot. He has a tough shell, you might need a powerful weapon to damage him",
                points = 5,
                trigger = WorldSephiroth == 3
                       && GalapagosKill == 1
                       && prev(GalapagosKill) == 0
                       && LoadCheck()
)  

    achievement(title="Greedy Downfall",
                description = "Defeat Carateka in the Light Netzach Sephirot. Rumor says he is obsessed with money",
                points = 5,
                trigger = WorldSephiroth == 4
                       && CaratycaKill == 1
                       && prev(CaratycaKill) == 0
                       && LoadCheck()
) 

    achievement(title="Tentacle Hell",
                description = "Defeat Soberdgu in the Light Geburah Sephirot",
                points = 5,
                trigger = WorldSephiroth == 6
                       && SoberdquKill == 1
                       && prev(SoberdquKill) == 0
                       && LoadCheck()
) 

    achievement(title="The Good Count",
                description = "Defeat Agrippa in the Light Chesed Sephirot",
                points = 5,
                trigger = WorldSephiroth == 7
                       && AgrippaKill == 1
                       && prev(AgrippaKill) == 0
                       && LoadCheck()
) 

    achievement(title="Ice Age",
                description = "Defeat Valgus in the Light Binah Sephirot",
                points = 5,
                trigger = WorldSephiroth == 8
                       && ValgusKill == 1
                       && prev(ValgusKill) == 0
                       && LoadCheck()
) 

    achievement(title="Pointy Bits",
                description = "Find your first stash of Solomon Dirks for better range",
                points = 3,
                trigger = SolomonDirks == 0x47
                       && prev(SolomonDirks) == 0x40
                       && LoadCheck()
) 

    achievement(title="Magatama Fire Power",
                description = "Find your first stash of Curved Jewels for more power",
                points = 3,
                trigger = ReirryCurvedJewels == 0x46
                       && prev(ReirryCurvedJewels) == 0x40
                       && LoadCheck()
) 

    achievement(title="Stone Rod",
                description = "Get hold of the Remola Staff, a powerful weapon that allows you to change your attack properties!",
                points = 5,
                trigger = RemolaStaff == 0x92
                       && prev(RemolaStaff) == 0x80
                       && LoadCheck()
) 

    achievement(title="Inner Dragon",
                description = "Get hold of the Salamender and infuse your weapons with fire powers!",
                points = 5,
                trigger = Salamender == 0x93
                       && prev(Salamender) == 0x80
                       && LoadCheck()
) 

    achievement(title="Corpse Run",
                description = "Visit your first Izanami Shrine",
                points = 2,
                trigger = InformationLevel == 1
                       && prev(InformationLevel) == 0
                       && LoadCheck()
) 

    achievement(title="Human Form",
                description = "Reach Information Level 4 by continuing to visit new Izanami Shrines",
                points = 3,
                trigger = InformationLevel == 4
                       && prev(InformationLevel) == 3
                       && LoadCheck()
) 

    achievement(title="Goddess Reincarnation",
                description = "Reach Information Level 8 by visiting all the Izanami Shrines",
                points = 5,
                trigger = InformationLevel == 8
                       && prev(InformationLevel) == 7
                       && LoadCheck()
) 
    achievement(title="Racket Partner",
                description = "Defeat Devil Squash in the Dark Hod Sephirot",
                points = 10,
                trigger = WorldSephiroth == 0x0d
                       && DevilSquashKill == 1
                       && prev(DevilSquashKill) == 0
                       && LoadCheck()
)  

    achievement(title="Featuring Reiko from the Valis Series",
                description = "Defeat Reiko in the Dark Netzach Sephirot",
                points = 10,
                trigger = WorldSephiroth == 0x0e
                       && ReikoKill == 1
                       && prev(ReikoKill) == 0
                       && LoadCheck()
)  

    achievement(title="Japanese Education",
                description = "Defeat Professor Ohara in the Dark Tiphereth Sephirot",
                points = 10,
                trigger = WorldSephiroth == 0x0f
                       && OharaKill == 1
                       && prev(OharaKill) == 0
                       && LoadCheck()
)  

    achievement(title="Giant Enemy Crab",
                description = "Defeat Zari in the Dark Geburah Sephirot",
                points = 10,
                trigger = WorldSephiroth == 0x10
                       && ZariKill == 1
                       && prev(ZariKill) == 0
                       && LoadCheck()
)  

    achievement(title="Dandy Monster",
                description = "Defeat Guaita in the Dark Chesed Sephirot",
                points = 10,
                trigger = WorldSephiroth == 0x11
                       && GuaitaKill == 1
                       && prev(GuaitaKill) == 0
                       && LoadCheck()
)  

    achievement(title="Pom Pom Pompadour",
                description = "Defeat Pompadour in the Dark Binah Sephirot",
                points = 10,
                trigger = WorldSephiroth == 0x12
                       && PompadoulKill == 1
                       && prev(PompadoulKill) == 0
                       && LoadCheck()
)  

    achievement(title="Wiseman",
                description = "Defeat Albertus in the Dark Chokmah Sephirot",
                points = 10,
                trigger = WorldSephiroth == 0x13
                       && ArbertusKill == 1
                       && prev(ArbertusKill) == 0
                       && LoadCheck()
)  

    achievement(title="Tricky God",
                description = "Defeat Loki in the Dark Yesod Sephirot and obtain his Horus Key",
                points = 10,
                trigger = WorldSephiroth == 0x0c
                       && LokiKill == 1
                       && prev(LokiKill) == 0
                       && LoadCheck()
)  

    achievement(title="Egyptian Wrath",
                description = "Defeat Seth in the Dark Kethe Sephirot",
                points = 25,
                trigger = WorldSephiroth == 0x14
                       && SethKill == 1
                       && prev(SethKill) == 0
                       && LoadCheck()
)  

    achievement(title="Real Doll",
                description = "Rescue Yumiko. Time to run away, I've heard the exit is all the way to other Kethe!",
                points = 2,
                trigger = WorldSephiroth == 0x14
                       && YumikoSaved == 1
                       && prev(YumikoSaved) == 0
                       && LoadCheck()
)  

    achievement(title="Speak Friend",
                description = "Open the way to the Ligh Kethe Sephirot",
                points = 3,
                trigger = WorldSephiroth == 0x14
                       && RoadOpen == 1
                       && prev(RoadOpen) == 0
                       && LoadCheck()
)  

    achievement(title="Now That's a TRUE Megaten Game!",
                description = "Escape with Yumiko, beating the game",
                points = 10,
                trigger = WorldSephiroth == 0x0a
                       && YumikoSaved == 1
                       && CutsceneFlag == 1
                       && prev(CutsceneFlag) == 0
                       && bit7(0x027e) == 0
                       && CurrentHealth > 0
                       && LoadCheck()
)  

    achievement(title="Power of the Godess and Anime at Your Side",
                description = "Escape with Yumiko while having visited every shrine and beaten all the bosses in the game",
                points = 25,
                trigger = WorldSephiroth == 0x0a
                       && YumikoSaved == 1
                       && CutsceneFlag == 1
                       && prev(CutsceneFlag) == 0
                       && bit7(0x027e) == 0
                       && CurrentHealth > 0
                       && InformationLevel == 8
                       && AgrippaKill == 1
                       && SoberdquKill == 1
                       && CaratycaKill == 1
                       && GalapagosKill == 1
                       && ClardnyquaKill == 1
                       && ValgusKill == 1
                       && SethKill == 1
                       && LokiKill == 1
                       && OharaKill == 1
                       && ArbertusKill == 1
                       && GuaitaKill == 1
                       && ReikoKill == 1
                       && DevilSquashKill == 1
                       && PompadoulKill == 1
                       && ZariKill == 1
                       && LoadCheck()
)  

    achievement(title="Time Warp",
                description = "Acquire your first Chronos. It is said that this item can be used to advance the moon phase!",
                points = 2,
                trigger = ChronosQuantity == 1
                       && prev(ChronosQuantity) == 0
                       && LoadCheck()
)  

    achievement(title="For Whom Does This Toll?",
                description = "Acquire your first Bell. No one really knows what is it used for, maybe you'll be the first to find out!",
                points = 2,
                trigger = BellQuantity == 1
                       && prev(BellQuantity) == 0
                       && LoadCheck()
)  

    achievement(title="In Darkest Night",
                description = "Acquire your first Lamp. No one really knows what is it used for, maybe you'll be the first to find out!",
                points = 2,
                trigger = LampQuantity == 1
                       && prev(LampQuantity) == 0
                       && LoadCheck()
)  

    achievement(title="Pocket Change",
                description = "Acquire your first Purse. It is rumored that a certain boss is obsessed with money and can't be killed without this item",
                points = 2,
                trigger = PurseQuantity == 1
                       && prev(PurseQuantity) == 0
                       && LoadCheck()
)  

    achievement(title="Calming Draught",
                description = "Acquire your first Opoponacs. This item has calming properties that is rumored to calm down an otherwise agressive monster in Kethe",
                points = 5,
                trigger = OpoponacsQuantity == 1
                       && prev(OpoponacsQuantity) == 0
                       && LoadCheck()
)  

    achievement(title="Evil Wards",
                description = "Acquire the Mercury Sulfide. It is rumored that this item can be used to bring back to their senses a posessed human. It is also rumored that doing so could cause the emulation to break and result in a black screen. Who knows really?",
                points = 3,
                trigger = MercurySulfideUnlock == 0x4f
                       && prev(MercurySulfideUnlock) == 0x40
                       && LoadCheck()
)  

    achievement(title="Good Fortune",
                description = "Acquire the Amulet. No one really knows what is it used for, maybe you'll be the first to find out!",
                points = 2,
                trigger = AmuletUnlock == 0x10
                       && prev(AmuletUnlock) == 0
                       && LoadCheck()
)  

    achievement(title="See the Invisible",
                description = "Acquire your first Cat's Eyes. A powerful charm that will allow you to see the invisible, touch the untouchable. Row row, fight the power.",
                points = 2,
                trigger = CatsEyesUnlock == 0x11
                       && prev(CatsEyesUnlock) == 0
                       && LoadCheck()
) 

    achievement(title="Jewel of Open",
                description = "Find a Lapis Gem. At least one is needed to open the way to the end",
                points = 2,
                trigger = LapisGemstone == 0x55
                       && prev(LapisGemstone) == 0x40
                       && LoadCheck()
)  

    achievement(title="Snow Shoes",
                description = "Find a pair of Spikers. If you ever seem to be stucked for no reason due to a boss attack, it might be time to switch to those in order to be able to move!",
                points = 3,
                trigger = SpikerUnlock == 0x59
                       && prev(SpikerUnlock) == 0x40
                       && LoadCheck()
)  

    achievement(title="The One You Need to Know",
                description = "Find a Map. It can be used while on the computer to have a sneak peak of the next Sephirot layout",
                points = 2,
                trigger = MapUnlock == 0x1b
                       && prev(MapUnlock) == 0x00
                       && LoadCheck()
)  

RPSephirot = { 
                    0x01:"Malkuth",
                    0x02:"Light Yesod",
                    0x03:"Light Hod",
                    0x04:"Light Netzach",
                    0x05:"Light Tiphereth",
                    0x06:"Light Geburah",
                    0x07:"Light Chesed",
                    0x08:"Light Binah",
                    0x09:"Light Chokmah",
                    0x0a:"Light Kethe",
                    0x0c:"Dark Yesod",
                    0x0d:"Dark Hod",
                    0x0e:"Dark Netzach",
                    0x0f:"Dark Tiphereth",
                    0x10:"Dark Geburah",
                    0x11:"Dark Chesed",
                    0x12:"Dark Binah",
                    0x13:"Dark Chokmah",
                    0x14:"Dark Kethe"

                    }    

rich_presence_conditional_display(
    EndGameGameOverFlag == 1,
    "• Currently in {0} Sephirot - Floor {1} • {2}/{3} ❤️ - Information Level {4} •",
    rich_presence_lookup("RPSephirot", WorldSephiroth, RPSephirot),
    rich_presence_value("Floor", FloorID+1),
    rich_presence_value("CurrentHealth", CurrentHealth),
    rich_presence_value("MaxHealth", MaxHealth),
    rich_presence_value("InfoLevel", InformationLevel)) 

rich_presence_display(
    "• Demon Summoning Program Loading • "

)  