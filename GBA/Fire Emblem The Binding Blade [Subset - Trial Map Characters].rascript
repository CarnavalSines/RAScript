// Fire Emblem: The Binding Blade [Subset - Trial Map Characters]
// #ID = 31454
// 20241110 Version - Sines

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


ChapterID = byte(0x32a56)
NarcianUnlock = byte(0x48010)
GaleUnlock = byte(0x48011)
HectorUnlock = byte(0x48012)
BrunnyaUnlock = byte(0x48013)
EliwoodUnlock = byte(0x48014)
MurdochUnlock = byte(0x48015)
ZephielUnlock = byte(0x48016)
GuinivereUnlock = byte(0x48018)

    achievement(title="Blue Blood Sneer",
                description = "Beat the game once and unlock Narcian",
                points = 10,
                trigger = (ChapterID == 0x16
                       || ChapterID == 0x19)
                       && NarcianUnlock > prev(NarcianUnlock)
)  

    achievement(title="Noble Wings",
                description = "Beat the game twice and unlock Gale",
                points = 10,
                trigger = (ChapterID == 0x16
                       || ChapterID == 0x19)
                       && GaleUnlock > prev(GaleUnlock)
)  

    achievement(title="Wisdom of Age",
                description = "Beat the game thrice and unlock Hector",
                points = 10,
                trigger = (ChapterID == 0x16
                       || ChapterID == 0x19)
                       && HectorUnlock > prev(HectorUnlock)
)  

    achievement(title="Magical Loyalty",
                description = "Beat the game four times and unlock Brunnya",
                points = 10,
                trigger = (ChapterID == 0x16
                       || ChapterID == 0x19)
                       && BrunnyaUnlock > prev(BrunnyaUnlock)
)  

    achievement(title="The Old Dragonslayer",
                description = "Beat the game five times and unlock Eliwood",
                points = 10,
                trigger = (ChapterID == 0x16
                       || ChapterID == 0x19)
                       && EliwoodUnlock > prev(EliwoodUnlock)
)  

    achievement(title="Lifelong Bodyguard",
                description = "Beat the game six times and unlock Murdoch",
                points = 10,
                trigger = (ChapterID == 0x16
                       || ChapterID == 0x19)
                       && MurdochUnlock > prev(MurdochUnlock)
)  

    achievement(title="King of Fury",
                description = "Beat the game seven times and unlock Zephiel",
                points = 10,
                trigger = (ChapterID == 0x16
                       || ChapterID == 0x19)
                       && ZephielUnlock > prev(ZephielUnlock)
)  

    achievement(title="Lady of Peace",
                description = "Beat the game nine times and unlock Zephiel",
                points = 25,
                trigger = (ChapterID == 0x16
                       || ChapterID == 0x19)
                       && GuinivereUnlock > prev(GuinivereUnlock)
)  