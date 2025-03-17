// Ougon Kishi Garo
// #ID = 27656
// 20250317 Version - Sines

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

Stage_Dict = { // {0}: StageName - {1}: ASCII Check  
                    0x01: ["Stage 1", ascii_string_equals(0x43822c, "st0")], // Also default string so true until it changes - Parking Lot, no boss
                    0x02: ["Stage 2", ascii_string_equals(0x43822c, "st1")], // Ishutarb
                    0x03: ["Stage 3", ascii_string_equals(0x43822c, "st2")], // Lunarken
                    0x04: ["Stage 4", ascii_string_equals(0x43822c, "st7")], // Zero / Garo (skyscrapper fight)
                    0x05: ["Stage 5", ascii_string_equals(0x43822c, "st3")], // Moloch
                    0x06: ["Stage 6", ascii_string_equals(0x43822c, "st8")], // Humpty
                    0x07: ["Stage 7", ascii_string_equals(0x43822c, "st9")], // Dantaryan
                    0x08: ["Stage 8", ascii_string_equals(0x43822c, "st4")], // Gargoyle
                    0x09: ["Stage 9", ascii_string_equals(0x43822c, "st6")], // Kodama
                    0x0a: ["the Final Stage", ascii_string_equals(0x43822c, "st5")], // Barago / Garo (Garo only in Dark Knight Mode)
                    0x0b: ["Dark Knight Prep Screen", ascii_string_equals(0x43822c, "skl")], // Use to check against skill unlock cheese
                    0x0c: ["500 Years of Woe Screen", ascii_string_equals(0x43822c, "sta")] // Use to check against skill unlock cheese
                    }  


GameStatePointer = dword(0x42fedc)
InPlay = bit3(GameStatePointer + 0x28)
YouWin = bit1(GameStatePointer + 0x28)

P1CharID = dword(0x437e58)
P2CharID = dword(0x437ec4)

Difficulty = byte(0x438228)
ArmorGauge = float(0x438248) // Max 6000.0

WoeScore = dword(0x438270)
ModeID = byte(0x43abbc)

VSModeUnlockStart = byte(0x14d6600)
VSModeUnlockEnd = byte(0x14d660b)
VSModeExtra1 = byte(0x14d660d)
VSModeExtra2 = byte(0x14d660e)

DarkKnightZeroSkillsStart = (0x14d6644)
DarkKnightZeroSkillsEnd = (0x14d664b)
DarkKnightGaroSkillsStart = (0x14d6656)
DarkKnightGaroSkillsEnd = (0x14d665d)
DarkKnightIshutarbSkillsStart = (0x14d665f)
DarkKnightIshutarbSkillsEnd = (0x14d6666)
DarkKnightMolochSkillsStart = (0x14d6668)
DarkKnightMolochSkillsEnd = (0x14d666f)
DarkKnightHumptySkillsStart = (0x14d6671)
DarkKnightHumptySkillsEnd = (0x14d6678)
DarkKnightDantarianSkillsStart = (0x14d667a)
DarkKnightDantarianSkillsEnd = (0x14d6681)
DarkKnightLunarkenSkillsStart = (0x14d6683)
DarkKnightLunarkenSkillsEnd = (0x14d668a)
DarkKnightGargoyleSkillsStart = (0x14d668c)
DarkKnightGargoyleSkillsEnd = (0x14d6693)
DarkKnightKodamaSkillsStart = (0x14d6695)
DarkKnightKodamaSkillsEnd = (0x14d669c)

GalleryUnlockStart = (0x14d69cd)
GalleryUnlockEnd = (0x14d6a71)

function ExtraMissionCompleteSum(StartRange,EndRange) =>
    all_of(range(StartRange,EndRange,step=1), addr => byte(addr) == 1)

function PrevExtraMissionComplete(StartRange,EndRange) =>
    any_of(range(StartRange,EndRange,step=1), addr => prev(byte(addr)) == 0)


    achievement(title="Be Like the Wind, Makai Swordsman",
                description = "Transform into the Golden Knight Garo in " + Stage_Dict[1][0] + " of Story Mode",
                points = 1,
                trigger = Stage_Dict[1][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && ArmorGauge < prev(ArmorGauge)
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Where There Is Light, Shadows Lurk and Fear Reigns",
                description = "Clear " + Stage_Dict[1][0] + " with Kouga in Story Mode",
                points = 2,
                trigger = Stage_Dict[1][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Chains of Despair",
                description = "Clear " + Stage_Dict[2][0] + " with Kouga in Story Mode",
                points = 2,
                trigger = Stage_Dict[2][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Blood Moon",
                description = "Clear " + Stage_Dict[3][0] + " with Kouga in Story Mode",
                points = 3,
                trigger = Stage_Dict[3][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Night of the Knights",
                description = "Clear " + Stage_Dict[4][0] + " with Kouga in Story Mode",
                points = 3,
                trigger = Stage_Dict[4][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Elemental Lineage",
                description = "Clear " + Stage_Dict[5][0] + " with Kouga in Story Mode",
                points = 3,
                trigger = Stage_Dict[5][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Rock Meet Steed",
                description = "Clear " + Stage_Dict[6][0] + " with Kouga in Story Mode",
                points = 3,
                trigger = Stage_Dict[6][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Radioactive Greed",
                description = "Clear " + Stage_Dict[7][0] + " with Kouga in Story Mode",
                points = 5,
                trigger = Stage_Dict[7][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Demonic Muse",
                description = "Clear " + Stage_Dict[8][0] + " with Kouga in Story Mode",
                points = 5,
                trigger = Stage_Dict[8][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Echoes of Duty",
                description = "Clear " + Stage_Dict[9][0] + " with Kouga in Story Mode",
                points = 5,
                trigger = Stage_Dict[9][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Yet by the Blade of Knights, Mankind Was Given Hope",
                description = "Clear " + Stage_Dict[10][0] + " with Kouga in Story Mode",
                points = 10,
                trigger = Stage_Dict[10][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Mark of the Wolf",
                description = "Clear " + Stage_Dict[10][0] + " with Kouga in Story Mode on Hard Difficulty",
                points = 25,
                trigger = Stage_Dict[10][1]
                       && ModeID == 0
                       && P1CharID == 0
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
                       && Difficulty == 2
)  

    achievement(title="Silver in the Night",
                description = "Clear " + Stage_Dict[1][0] + " with Rei in Story Mode",
                points = 3,
                trigger = Stage_Dict[1][1]
                       && ModeID == 0
                       && P1CharID == 1
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Lover of Sweets",
                description = "Clear " + Stage_Dict[5][0] + " with Rei in Story Mode",
                points = 5,
                trigger = Stage_Dict[5][1]
                       && ModeID == 0
                       && P1CharID == 1
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Knightly Revenge",
                description = "Clear " + Stage_Dict[10][0] + " with Rei in Story Mode",
                points = 10,
                trigger = Stage_Dict[10][1]
                       && ModeID == 0
                       && P1CharID == 1
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
)  

    achievement(title="Goodnight Bad Knight",
                description = "Clear " + Stage_Dict[10][0] + " with Rei in Story Mode on Hard Difficulty",
                points = 25,
                trigger = Stage_Dict[10][1]
                       && ModeID == 0
                       && P1CharID == 1
                       && YouWin == 1
                       && prev(YouWin) == 0
                       && InPlay == 1
                       && prev(InPlay) == 1
                       && Difficulty == 2
)  

function ExtraMissionCompleteSum(StartRange,EndRange) =>
    all_of(range(StartRange,EndRange,step=1), addr => byte(addr) == 1)

function PrevExtraMissionComplete(StartRange,EndRange) =>
    any_of(range(StartRange,EndRange,step=1), addr => prev(byte(addr)) == 0)

    achievement(title="Crushing Hope",
                description = "In Dark Knight Mode obtain every Zero Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightZeroSkillsStart,DarkKnightZeroSkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightZeroSkillsStart,DarkKnightZeroSkillsEnd)
)  

    achievement(title="Extinguishing Light",
                description = "In Dark Knight Mode obtain every Garo Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightGaroSkillsStart,DarkKnightGaroSkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightGaroSkillsStart,DarkKnightGaroSkillsEnd)
)  

    achievement(title="Bound by Darkness",
                description = "In Dark Knight Mode obtain every Ishutarb Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightIshutarbSkillsStart,DarkKnightIshutarbSkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightIshutarbSkillsStart,DarkKnightIshutarbSkillsEnd)
)  

    achievement(title="Master of the Void",
                description = "In Dark Knight Mode obtain every Moloch Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightMolochSkillsStart,DarkKnightMolochSkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightMolochSkillsStart,DarkKnightMolochSkillsEnd)
)  

    achievement(title="Fell from the Wall",
                description = "In Dark Knight Mode obtain every Humpty Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightHumptySkillsStart,DarkKnightHumptySkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightHumptySkillsStart,DarkKnightHumptySkillsEnd)
)  

    achievement(title="House Always Win",
                description = "In Dark Knight Mode obtain every Dantarian Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightDantarianSkillsStart,DarkKnightDantarianSkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightDantarianSkillsStart,DarkKnightDantarianSkillsEnd)
)  

    achievement(title="Do Not Seek the Light",
                description = "In Dark Knight Mode obtain every Lunarken Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightLunarkenSkillsStart,DarkKnightLunarkenSkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightLunarkenSkillsStart,DarkKnightLunarkenSkillsEnd)
)  

    achievement(title="Permanently Grounded",
                description = "In Dark Knight Mode obtain every Gargoyle Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightGargoyleSkillsStart,DarkKnightGargoyleSkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightGargoyleSkillsStart,DarkKnightGargoyleSkillsEnd)
)  

    achievement(title="Mute Terror",
                description = "In Dark Knight Mode obtain every Kodama Skills",
                points = 10,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightKodamaSkillsStart,DarkKnightKodamaSkillsEnd)
                       && PrevExtraMissionComplete(DarkKnightKodamaSkillsStart,DarkKnightKodamaSkillsEnd)
)  

    achievement(title="Master of All Form",
                description = "In Dark Knight Mode obtain every Skills possible",
                points = 25,
                trigger = ModeID == 1
                       && prior(P1CharID) == 6
                       && tbyte(0x0043822c) != 0x6c6b73
                       && ExtraMissionCompleteSum(DarkKnightKodamaSkillsStart,DarkKnightKodamaSkillsEnd)
                       && ExtraMissionCompleteSum(DarkKnightGargoyleSkillsStart,DarkKnightGargoyleSkillsEnd)
                       && ExtraMissionCompleteSum(DarkKnightLunarkenSkillsStart,DarkKnightLunarkenSkillsEnd)
                       && ExtraMissionCompleteSum(DarkKnightDantarianSkillsStart,DarkKnightDantarianSkillsEnd)
                       && ExtraMissionCompleteSum(DarkKnightHumptySkillsStart,DarkKnightHumptySkillsEnd)
                       && ExtraMissionCompleteSum(DarkKnightMolochSkillsStart,DarkKnightMolochSkillsEnd)
                       && ExtraMissionCompleteSum(DarkKnightIshutarbSkillsStart,DarkKnightIshutarbSkillsEnd)
                       && ExtraMissionCompleteSum(DarkKnightGaroSkillsStart,DarkKnightGaroSkillsEnd)
                       && ExtraMissionCompleteSum(DarkKnightZeroSkillsStart,DarkKnightZeroSkillsEnd)
                       && (PrevExtraMissionComplete(DarkKnightKodamaSkillsStart,DarkKnightKodamaSkillsEnd)
                       || PrevExtraMissionComplete(DarkKnightGargoyleSkillsStart,DarkKnightGargoyleSkillsEnd)
                       || PrevExtraMissionComplete(DarkKnightLunarkenSkillsStart,DarkKnightLunarkenSkillsEnd)
                       || PrevExtraMissionComplete(DarkKnightDantarianSkillsStart,DarkKnightDantarianSkillsEnd)
                       || PrevExtraMissionComplete(DarkKnightHumptySkillsStart,DarkKnightHumptySkillsEnd)
                       || PrevExtraMissionComplete(DarkKnightMolochSkillsStart,DarkKnightMolochSkillsEnd)
                       || PrevExtraMissionComplete(DarkKnightIshutarbSkillsStart,DarkKnightIshutarbSkillsEnd)
                       || PrevExtraMissionComplete(DarkKnightGaroSkillsStart,DarkKnightGaroSkillsEnd)
                       || PrevExtraMissionComplete(DarkKnightZeroSkillsStart,DarkKnightZeroSkillsEnd)
                       )
)  

    achievement(title="Full Roster",
                description = "Unlock every VS Mode Characters",
                points = 25,
                trigger = (byte(0x14d6600) + byte(0x14d6601) + byte(0x14d6602) + byte(0x14d6603) + byte(0x14d6604) + byte(0x14d6605) + byte(0x14d6606) + byte(0x14d6607) + byte(0x14d6608) + byte(0x14d6609) + byte(0x14d660a) + byte(0x14d660b) + byte(0x14d660d) + byte(0x14d660e)) == 14
                        && prev((byte(0x14d6600) + byte(0x14d6601) + byte(0x14d6602) + byte(0x14d6603) + byte(0x14d6604) + byte(0x14d6605) + byte(0x14d6606) + byte(0x14d6607) + byte(0x14d6608) + byte(0x14d6609) + byte(0x14d660a) + byte(0x14d660b) + byte(0x14d660d) + byte(0x14d660e))) == 13
)  

    achievement(title="World of Darkness",
                description = "Gain at least 1500 Points after running the 500 Years of Woe challenge",
                points = 5,
                trigger = Stage_Dict[12][1]
                       && ModeID == 3
                       && WoeScore >= 1500
                       && WoeScore < 2147483648
                       && prev(WoeScore) == 0
)  

function GalleryCheck(){

	result = 0
	totalClears = 0
	
    for i in range(0,164) {	
        address = GalleryUnlockStart + i		
        result = result + bit0(address)
        totalClears = totalClears + 1
    }

	return measured(result == totalClears)
}

function prevGalleryCheck(){


	result = 0
	totalClears = 0
	
    for i in range(0,164) {	
        address = GalleryUnlockStart + i			
        result = result + prev(bit0(address))
        totalClears = totalClears + 1
    }

	return result == totalClears - 1
}

    achievement(title="Art Shines Through",
                description = "Complete the Gallery by unlocking all 165 items",
                points = 25,
                trigger = ModeID == 4
                       && GalleryCheck()
                       && prevGalleryCheck()
)  

RPDifficulty = { 
                    0x00:"Easy",
                    0x01:"Normal",
                    0x02:"Hard"

                    }    

RPPlayerChar = { 
                    0x00:"Kouga",
                    0x01:"Rei"

                    }   

rich_presence_conditional_display(
    ModeID == 0 && InPlay == 1,
    "• Story Mode - Playing as {0} - {1} Difficulty •",
    rich_presence_lookup("RPPlayerChar", P1CharID, RPPlayerChar),
    rich_presence_lookup("RPDifficulty", Difficulty, RPDifficulty)
)

rich_presence_conditional_display(
    ModeID == 1,
    "• Dark Knight Mode - Looking to absorb enemies & allies •"
)

rich_presence_conditional_display(
    ModeID == 2,
    "• VS Mode - Ready to duke it out! •"
)

rich_presence_conditional_display(
    ModeID == 3,
    "• Running through 500 years of woe in the Makai realm •"
)

rich_presence_conditional_display(
    ModeID == 4,
    "• Lazing around in the Gallery •"
)

rich_presence_conditional_display(
    ModeID == 5,
    "• Tweaking Options •"
)
rich_presence_display(
    "• Hope of Mankind, Golden Knight GARO • "

)  