// Zone of the Enders: The Fist of Mars
// #ID = 2518
// 20221114 Version - Sines

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



// $000E72: [16 Bit] Timer value in IAS
//          1 Sec on screen = 60 in Hexa (3C)
// $000F30: [16 Bit] Event Caller ID
//          Important Values:
//          9012 > Battle Windows in IAS mode
//          901c > Enemy Battle Windows in IAS mode
//          898e > Intermission Screen
// $0017A4: [32 Bit] Timer 1
//          Initialize to 0 at boot
//          Pause when actions are performed
//          Increment once per frame
//          Needed to activate IAS, dont work for enemies if value frozen
// $0017A8: [32 Bit] Timer 2
//          Initialize to 0 at boot
//          Never pause
//          Increment once per frame
// $0017C0: [Memory Bloc] Nerokerubina Stats Bloc, ends at 0x0017d2
//          Global Note:Stats Bloc can be used instead by enemies when the playable character is not there. However, if the character is available he will always use this bloc.
// $0017D4: [16 Bit] Cage Battle
// $0017D6: [16 Bit] Cage Shoot
// $0017D8: [16 Bit] Cage Avoid
// $0017DA: [16 Bit] Cage Hit
// $0017DC: [16 Bit] Cage Reflex
// $0017E0: [16 Bit] Cage Max HP
// $0017E2: [16 Bit] Cage Max En
// $0017E4: [16 Bit] Cage Shell
// $0017E6: [8 Bit] Cage Move
// $0017E7: [8 Bit] Cage Mystery Stat
//          Max out at HEX BF (DEC 191)
//          Starts at HEX 14 (DEC 20)
// $0017E8: [Memory Bloc] Vjaya Stats Bloc, ends at 0x0017fa
// $0017FC: [Memory Bloc] Enemy 3 Stats Bloc, ends at 0x00180e
// $001824: [Memory Bloc] Razma Stats Bloc
//          Ends at 0x001836
// $001838: [Memory Bloc] Edge Stats Bloc, ends at 0x00184a
// $001860: [Memory Bloc] Durandal II Stats Bloc, ends at 0x001872
// $001874: [Memory Bloc] Yukito Stats Bloc
//          Ends at 0x001886
// $001888: [Memory Bloc] Semyl Stats Bloc, ends at 0x00189a
// $00189C: [Memory Bloc] Phil Stats Bloc, ends at 0x0018ae
// $001CD0: [16 Bit] Cash Value
// $001CD1: cash value
// $001CEC: bit0= server in scene7?
// $001D34: [8 Bit - Bitflag] OF Skill Server Update Flags
//          Bit 0 | Testament SSA2
//          Bit 1 | Testament EnergyEndure
//          Bit 2 | Vjaya DoubleAction
//          Bit 3 | Vjaya EnergyEndure
//          Bit 4 | Orcrist SSA1
//          Bit 5 | Orcrist RepairSystem
//          Bit 6 | Durandal II BulletEndure
//          Bit 7 | Vjaya Replenish
// $001D35: [8 Bit - Bitflag] OF Skill Server Update Flags Part 2
//          Bit 0 | Vjaya SSA1
//          Bit 1 | Testament Double Action
//          Bit 2 | Durandal II SSA1
// $001D45: [8 Bit - Bitflag] OF Weapons Server Update Flags
//          Bit 0 | Testament Nail Laser
//          Bit 1 | Testament Shock Hi-Low
//          Bit 2 | Testament Halberd
//          Bit 3 | Testament Comet
//          Bit 4 | Vjaya Tri-Laser
//          Bit 5 | Vjaya Geyser
//          Bit 6 | Orcrist Chevalier Lance
//          Bit 7 | Orcrist Bounder
// $001D46: [8 Bit - Bitflag] Durandal II Weapons Server Update Flags
//          Bit 0 | Slashboom
//          Bit 1 | Gauntlet
// $001D56: [8 Bit] Langage Selection
//          0x0=English
//          0x1=French
//          0x3=German
// $001D5A: [8 Bit] Battle Settings
//          Bit 0 | IAS
//          Bit 1 | Battle Animation
// $001D5E: [8 Bit] Event Flag
//          Bit 2 | End of Chapter 1 trigger
// $001D63: 80 = end of level within? level6
// $001D73: bit 0 and 1 = server on level 7?
// $001D74: keep watch these values. possibly story codes
// $001D75: [8 Bit] Event Flag
//          Bit 2 | End of Chapter 2 trigger
// $001D94: bit1=value for level 5 end
// $001DD4: [Memory Block] Start of 8-Bits block of Ammunition Indicator
//          Shift all value 8-bit to the left on kill
// $001FD4: opponent mechs on screen
// $001FDC: [16 Bit] Total number of Turns
// $001FDF: no of turns
// $002050: [8 Bit] Turn Phase
//          Bit 1 |  0 Ally Phase, 1 Enemy Phase
// $002054: [8 Bit] Nuber of attacks from Cage - IAS ON
//          Reset if attacking with IAS Off
// $002055: [8 Bit] Number of attacks from enemy toward Cage - IAS ON
//          Reset if attacking with IAS Off
// $00212E: level code/scene
// $002138: [16 Bit] Enemy 1 HP Value
// $00213A: [16 Bit] Enemy 1 Energy
// $00213F: [8 Bit] Enemy 1 Spirit
// $002154: [Memory Bloc] Testament Battle Status
//          Ends 0x002174
//          Global Note: Battle Status Bloc can be used instead by enemies when the playable character is not there. However, if the character is available he will always use this bloc.
//          Memory reserved for stats is linked to the Mech and not the Character: during story, when a new character take control of an existing mech (ex: Vjaya with Ares/Deckson) the stats block will still be in the previous place.
// $002155: cage level
// $002158: [8 Bit] Testament Horizontal Coordinate
// $002159: [8 Bit] Testament Vertical Coordinate
// $00215A: [16 Bit] Testament Exp
// $00215C: [16 Bit] Testament HP
// $00215D: cage hp
// $00215E: [16 Bit] Testament Energy
// $002163: [8 Bit] Testament Spirit
//          Starts at Hex 32 (Dec 50) because it can go to negative value on screen.
// $00216D: [8 Bit] Testament Balancer Config
//          Bits 7-4 | Atk Balancer
//          Bits 3-0 | Esc Balancer
//          Yellow Zone = 0
//          Blue Zone = Increment by 1 from 1 to 5
//          Red Zone = Decrement by 1 from f to b
// $00216E: [8 Bit]  Testament OF Level
//          OF have a Level Stat independant from the Pilot Level Stat.
//          Start at 0 and max out at DEC 99 (HEX 63)
//          Provide +5 Power to all weapons per level
// $002172: [8 Bit] Bit 2 | Testament Turn end
// $002178: [Memory Bloc] Vjaya Battle Status
//          Ends 0x002198
// $002196: [8 Bit] Bit 2 | Vjaya Turn End
// $00219C: [Memory Block] Orcrist Stats Bloc
//          Ends 0x0021bc
// $0021BA: [8 Bit] Bit 2 | Orcrist Turn End
// $0021E4: [Memory Bloc] Dreizehn Battle Status
//          Ends 0x002204
// $0021FA: [8Bit] Dreizhen Inventory Slot 1
//          FF > Empty
//          00 > Repair Kit
//          01 > Supply Pack
//          02 > Booster
//          Inventory is only useable by LEV mechs
// $0021FB: [8Bit] Dreizhen Inventory Slot 2
//          FF > Empty
//          00 > Repair Kit
//          01 > Supply Pack
//          02 > Booster
// $0021FC: [8Bit] Dreizhen Inventory Slot 3
//          FF > Empty
//          00 > Repair Kit
//          01 > Supply Pack
//          02 > Booster
// $0021FE: 66=max hp shell-dreizehn
// $0021FF: 66= laser blade long rifle-Dreizehn
// $002200: 66= grenade calamity kiss for dreizehn
// $002202: [8 Bit] Bit 2 | Dreizehn Turn End
// $002208: [Memory Bloc] Edge Battle Status
//          Ends 0x002227
// $002222: 66=edge hp shell
// $002223: 60=155mm cannon- edge
// $002226: [8 Bit] Bit 2 | Edge Turn End
// $00222C: [Memory Bloc] Nerokerubina Battle Status
//          Ends 0x00224b
// $00224A: [8 Bit] Bit 2 | Nerokerubina Turn End
// $002250: [Memory Bloc] Durandal II Battle Status
//          Ends 0x002270
// $00226E: [8 Bit] Bit 2 | Durandal II Turn End
// $002274: [Memory Bloc] Justeen Battle Status
//          Ends 0x002274
// $002275: [8 Bit] Yukito's Level
// $00228E: 66= justeen HP and Shell
// $00228F: 66=lasersword burnstormer for justeen
// $002290: 66=Handgun ZZ Grenade for Justeen
// $002292: [8 Bit] Bit 2 | Justeen Turn End
// $002298: [Memory Bloc] Caliburnus Battle Status
//          Ends 0x0022b4
// $0022B2: 66= hp and shell for caliburnus
// $0022B3: 66= max Laser Blade  W Beam Cannon for Caliburnus
// $0022B4: 66= max missle and star carnival for Caliburnus
// $0022B6: [8 Bit] Bit 2 | Caliburnus Turn End
// $0022BC: [Memory Bloc] Blade Battle Status
//          Ends 0x0022dc
// $0022BD: blade level
// $0022D6: 66= max hp and shell for Blade
// $0022D7: blade mech, 60 = max level beam cannon
// $0022DA: [8 Bit] Bit 2 | Blade Turn End
// $0022E8: [16 Bit] Chp 7 Civilian 1 HP
// $00230C: [16 Bit] Chp 7 Civilian 2 HP
// $002330: [16 Bit] Chp 7 Civilian 3 HP
// $002354: [16 Bit] Chp 7 Civilian 4 HP
// $002378: [16 Bit] Chp 7 Civilian 5 HP
// $003FD0: [8 Bit - Bitflag] Battle Results Flags
//          Bit 0 | 0 = Avoid, 1 = Hit
//          Bit 1 | 1= Unit Selected die
//          Bit 2 | Critical Hit flag
//          Dice is rolled on target select, dmg is calculated before validation. If flags are manually changed after target select (like removing/adding Crit Flag) the dmg will be the same as before change.
// $003FD8: [16 Bit] Dmg value of the last attack
// $004062: laser blade level?
// $02D800: [Memory Bloc] Textbox Data

///Core
//Constant
//Part of original plan, went unused
//SceneA = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25] // Scene 12 and 14 have 2 Ending EventID depending on Route A or B and so will require manual creation
//SceneB = [26, 27, 28, 29, 30, 31, 32, 33, 34, 35]

// Used for quick progression achievements creation
SceneName = {
    1: "Scene 01 - On the Battle God’s Palm",
    2: "Scene 02 - Perpetual Motion",
    3: "Scene 03 - A Hopeless Hope",
    4: "Scene 04 - Double-Edged Sword",
    5: "Scene 05 - A Voice From Far Far Away",
    6: "Scene 06 - One Wing’s Promise",
    7: "Scene 07 - Opposing Tracks",
    8: "Scene 08 - Darkness Dyed by Darkness",
    9: "Scene 09 - Sincerity",
    10: "Scene 10 - A Pure Heart…And The Price It Pays",
    11: "Scene 11 - Double Deal",
    12: "Scene 12 - Between Good And Evil",
    13: "Scene 13 - The Gift",
    14: "Scene 14 - The Card Turned Down",
    15: "Scene 15 - The Darkness That Came From Light",
    16: "Scene 16 - Uncertain Future",
    17: "Scene 17 - Rebirth",
    18: "Scene 18 - Dark Half",
    19: "Scene 19 - Clawing the Red Earth",
    20: "Scene 20 - Missing Line",
    21: "Scene 21 - A Faint Light From the Depths",
    22: "Scene 22 - Heaven-Bound Wings",
    23: "Scene 23 - Fulfilment of a Promise",
    24: "Scene 24 - Pharsti",
    25: "Scene 25 - Reunion",
    26: "Scene 15 - Cracks",
    27: "Scene 16 - Paradise Lost",
    28: "Scene 17 - A Bow Drawn",
    29: "Scene 18 - Hearts In Harmony Hearts In Strife",
    30: "Scene 19 - Waves",
    31: "Scene 20 - Island of Destiny",
    32: "Scene 21 - Nosferatu",
    33: "Scene 22 - Violated Wishes",
    34: "Scene 23 - God Save Us!",
    35: "Scene 24 - Promised Reunion"
}

// Arbitrary post Scene dialogue to fortifiy completion detection
SceneEndTrigger = {
    1: 0x33bc,
    2: 0x41fb,
    3: 0x4d5a,
    4: 0x5e4f,
    5: 0x75ef,
    6: 0x8cee,
    7: 0xa4d9,
    8: 0xb589,
    9: 0xc1b9,
    10: 0xe0c7,
    11: 0xe90b,
    12: 0xffff, // Scene 12 has 2 variant achievements depending on route A or B path
    13: 0x0b65,
    14: 0xffff, // Scene 14 has 2 Endtrigger variant depending on route A or B path: 2a08 OR 248b
    15: 0x394c,
    16: 0x4eae,
    17: 0x6160,
    18: 0x735f,
    19: 0x8225,
    20: 0x94e5,
    21: 0xa817,
    22: 0xbd26,
    23: 0xd909,
    24: 0xed9f,
    25: 0x034d,
    26: 0x2311,
    27: 0x35c7,
    28: 0x49ba,
    29: 0x6426,
    30: 0x73b2,
    31: 0x91d8,
    32: 0xa7bc,
    33: 0xbe76,
    34: 0xd7c0,
    35: 0xf0f6
}

// Needed to have a start point for the SMW challenges
SceneStartTrigger = {
    25: 0xeef6,
    26: 0x1568,
    27: 0x2660,
    28: 0x376d,
    29: 0x4b14,
    30: 0x66fe,
    31: 0x7806,
    32: 0x95dd,
    33: 0xabf5,
    34: 0xc122,
    35: 0xde11
}

// Triva time for those that bother to read my rants
CheevoName = {
    1: "Fall of the Second Empire", // Bonaparte III is the name of the ship, who was also the Emperor of the 2nd French empire. Not to be confused with the more famous Bonaparte.
    2: "Frazer Danger", // From RA user Archer, Stranger Danger
    3: "Hello Nurse", // Animaniacs
    4: "Say Hello to My Orbital Frame", // Say hello to my little friend Scarface
    5: "Came to Laugh at You", // Cool "mature" mecha pilot with stylish sunglasses ? Captain Warren, he is a CHAR.
    6: "Pharsti Team", // From RA user Archer, Varsity team ? Probably a US thing but roll out the tongue
    7: "Bolozof Send-Off", // Same as above
    8: "War Has Changed", // Infiltration mission on a game tangentially related to Kojima ? You bet your ass this is a MGS reference
    9: "I'm Already Traced", // From the hit song I'm Already Tracer
    10: "Do You Have Any Better Hostages?", // From RA user Archer, Futurama reference
    11: "Hack the Planet", // l337 skillz display
    12: "Asuka > Rei", // Scene 12 will have 2 manual progression achievements to represent the A & B route
    13: "Son's Rebellion", // Story relevant 
    14: "Father's Pride", // Same
    15: "Snapping Point", // Same
    16: "Demoted to Support", // True and sad
    17: "Human Plus", // Armored Core experiments gone wrong
    18: "Everyone Hate Phil", // Also true
    19: "Freedom to Mars", // Nice message
    20: "The Protector", // Dual naming convention with a challenge cheevo
    21: "Phil Harmony", // Really proud of this one, philarmony
    22: "Cap'n Robin", // Story plot
    23: "Rest in Pieces", // He won't be back for the sequel
    24: "One Last Push for Love", // Save the waifu, save the world
    25: "The Proof of Our Friendship", // I cri everytim
    26: "I Am Thou, Thou Art I", // Thou hast acquired a new vow...
    27: "I Must (Not) Run Away", // Get in the fucking robot Cage
    28: "Get in the Robot Cage", // Same part 2
    29: "Wrath of Mars", // Something something who whould have thought Ares was a "bad" guy
    30: "Forced Binding", // Not my best work
    31: "Red Testament", // True + Xenosaga ref
    32: "Scorched Earth", // True
    33: "Berserk Button", // And real
    34: "Blow’in in the Wind", // Zephyr, wind, blowing shit up. Also specifically a ref to the Thracia 776 song of the same name because it has been stuck in my head for the past 15 years
    35: "Song of a Promise" // I cri everytim part 2
}

//Quick points distribution
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

//----------------
//Variable
EventID = word(0xF30)
SceneID = byte(0x212E)
NadiaRecruited = bit4(0x1cf4) // 0 = Twede / 1 = Nadia
//----------------
//Function
// To be investigated because turns out it seems to change in some scenario ?? Really a last minute discovery, but based on personal test it's at least true during the relevant Scene for the damageless achievement.
function EnemyTurn () => bit0(0x2050) ==  1
function AllyTurn () => bit0(0x2050) ==  0

//Check the No IAS requirement for B route achievements
function IAS_Off() => bit0(0x001d5a) == 0 || bit0(0x001d5a) == 1 && never((EventID == 0x9012 || EventID == 0x901c)) // IAS Off OR IAS On as long as no battle are engaged (to allow input error without validation)


//For damageless achievements. Check that the known Ally Mechas HP values don't change during enemy turn. Allow HP change through lv UP. 
// Potential Stats bloc switch during earlier Scene doesn't matter as only enemy can inflict dmg during enemy turn
// For the used purpose here could be optimized to only keep the EnemyTurn() part without any Alt group, but kept that way in case I find fringe dmg cases for AllyTurn()
function DamagelessCheck() => AllyTurn() // Always true during Ally Turn as you can't get damaged by enemies
|| (EnemyTurn()
    &&  (never
            (      (prev(word(0x215c)) > word(0x215c)) // Testament HP Check -> IF Previous HP > Current HP reset
                || (prev(word(0x2234)) > word(0x2234)) // Nerokerubina HP Check
                || (prev(word(0x22a0)) > word(0x22a0)) // Caliburnus HP Check
                || (NadiaRecruited == 1 && (prev(word(0x21a4)) > word(0x21a4)) ) // Orcist HP Check when Nadia is recruited
                || (NadiaRecruited == 0 && (prev(word(0x2138)) > word(0x2138)) ) // Orcist HP Check when Nadia is NOT recruited
                || (prev(word(0x21ec)) > word(0x21ec)) // Dreizehn HP Check
                || (prev(word(0x2258)) > word(0x2258)) // Durandal II HP Check
                || (prev(word(0x21c8)) > word(0x21c8)) // Calibur HP Check
                || (prev(word(0x227c)) > word(0x227c)) // Justeen HP Check
                || (NadiaRecruited == 1 && (prev(word(0x2180)) > word(0x2180)) )// Vjaya HP Check when Nadia is recruited
                || (NadiaRecruited == 0 && (prev(word(0x21a4)) > word(0x21a4)) )// Vjaya HP Check when Nadia is NOT recruited
            )
        )
    )

//Regular progression achievements
function CheevoProg(Scene, points)
{
    achievement(title = CheevoName[Scene],
                description = "Complete " + SceneName[Scene] ,
                points = points,
                trigger = 
                SceneID == Scene 
                && once(EventID == SceneEndTrigger[Scene]) // Scene check + Arbitrary post-map dialogue event check to block retreat / save switch / gameover false positive trigger
                && EventID == 0x898e //Intermission screen. Honestly not that usefull, EventID is NOT textbox data but real unique event call regardless of language but now I have > 2 triggers for level end check
                && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
                )
}

// Progression Achievements for Super Martian Warrior Route B Challenge
function CheevoProgSMW(Scene, points)
{
    achievement(title = CheevoName[Scene] + " [m]",
                description = "Complete " + SceneName[Scene] + " as a Super Martian Warrior (See Forum for details)",
                points = points,
                trigger = 
                IAS_Off()
                && once(EventID == SceneStartTrigger[Scene]) // Start on first dialogue after "Next Stage" is selected from Intermission
                && never(EventID == 0x8edc) // Game Over Screen
                && never(EventID == 0x80ec && prev(EventID) == 0x80d9) // Confirm action + Delta "Retreat ?" screen
                && SceneID == (Scene+6)  // +6 to allign with ingame values
                && trigger_when(once(EventID == SceneEndTrigger[Scene]) && EventID == 0x898e) //Intermission screen
                && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
                )
}
//----------------

///Achievement Code
// Progression
// Server check
// Chatterbox
// Misc Challenge

//Progression
//Common Route + Route A
for i in range(1,11)
    CheevoProg(i, Easy)
    
// Important to indicate which Route the player will be taking post Scene 14
// Winning = Route A    
achievement(title = "Battling Angels",
            description = "Complete " + SceneName[12] + " and win against the Mars Angels",
            points = Easy,
            trigger = SceneID == 12 && once(EventID == 0xf8db)
            && EventID == 0x898e //Intermission screen
            && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
            )
            
// Losing = Route B
achievement(title = "Cat's Eyes",
            description = "Complete " + SceneName[12] + " but lose the contest against the Mars Angels",
            points = Easy,
            trigger = SceneID == 12 && once(EventID == 0xf7e4)
            && EventID == 0x898e //Intermission screen
            && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
            )
            
CheevoProg(13,Easy)

// Dual end trigger require manual cheevo writing
achievement(title = CheevoName[14],
            description = "Complete " + SceneName[14],
            points = Medium,
            trigger = SceneID == 14 && once((EventID == 0x248b || EventID == 0x2a08)) // To account for either Route A or Route B end trigger
            && EventID == 0x898e //Intermission screen
            && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
            )

for i in range(15,24)
    CheevoProg(i, Medium)
    
CheevoProg(25,Hard)

achievement (title = "Good-bye, Mr President",
             description = "Witness one last conversation of ill omens",
             points = 1,
             trigger = (SceneID == 25 || SceneID == 41) // Route A = 25, Route B == 41 > Post Credit scene is the same for both route
             && once(EventID == 0x8ef8) // Credit Roll
             && EventID == 0x0c23 // Last Event call for ominous Kojima-esque plot-twist, hence the reference to MGS
            )
            
//----------------
//Route B

for i in range (26,31)
    CheevoProgSMW(i,Medium)
    
for i in range (32,34)
    CheevoProgSMW(i,Hard)    

CheevoProgSMW(35,Challenge)    
//----------------
//Server Check
//Technically all 3 achievements could be shorten to only check for 1 hit per chapter as they are all-or-nothing unlocks
// Add Mesure to it ? Bit wonky since it's not 1-to-1, something like X/10 Upgrades unlocked ?
//Common Route servers: Scene 07 (Testament Nail Laser, Durandal Gauntlet); 10 (Testament Halberd, Orcrist Bounder), 
//11 (Vjaya Geyser, Durandal Bullet Endure), 12 (Orcrist SSA1, Vjaya Replenish), 13 (Testament Comet, Durandal Slashboom)

achievement (title = "Superb Data Scientist [m]",
             description = "Grab every new technologies for your OF by checking every servers of the Shared Route",
             points = Hard,
             trigger = SceneID == 13 
             && once(EventID == 0x0b65)
             && EventID == 0x896a
             && measured(
                          bit0(0x1d45) +
                          bit1(0x1d46) + 
                          bit2(0x1d45) + 
                          bit7(0x1d45) +
                          bit5(0x1d45) +
                          bit6(0x1d34) +
                          bit4(0x1d34) +
                          bit7(0x1d34) +
                          bit3(0x1d45) +
                          bit0(0x1d46) 
                          == 10
                        )
             && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
             )
//Route A servers: Scene 15 (Vjaya Tri-Laser), 20 (Testament Shock Hi-Low, Orcrist RepairSystem), 
//22 (Orcrist Chevalier Lance, Vjaya EnergyEndure, Durandal SSA1), 23 (Testament SSA2, Testament Double Action, Vjaya DoubleAction)
achievement (title = "Ace Data Scientist [m]",
             description = "Grab every new technologies for your OF by checking every servers of the Route A",
             points = Hard,
             trigger = SceneID == 23 
             && once(EventID == 0xd909)
             && EventID == 0x896a
             && measured(
                         bit4(0x1d45) +
                         bit1(0x1d45) +
                         bit5(0x1d34) +
                         bit6(0x1d45) +
                         bit3(0x1d34) +
                         bit2(0x1d35) +
                         bit0(0x1d34) +
                         bit1(0x1d35) +
                         bit2(0x1d34)
                         == 9
                        )
             && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
            )
 
//Route B servers: Scene 15 (Vjaya Tri-Laser), Scene 19 (Testament Shock Hi-Low, Orcrist RepairSystem), 
//20 (Orcrist Chevalier Lance, Vjaya EnergyEndure, Durandal SSA1), 21 (Testament SSA2, Testament Double Action, Vjaya DoubleAction)
achievement (title = "Brillant Data Scientist [m]",
             description = "Grab every new technologies for your OF by checking every servers of the Route B",
             points = Hard,
             trigger = SceneID == 38 
             && once(EventID == 0x95dd)
             && EventID == 0x896a
             && measured(
                         bit4(0x1d45) +
                         bit1(0x1d45) +
                         bit5(0x1d34) +
                         bit6(0x1d45) +
                         bit3(0x1d34) +
                         bit2(0x1d35) +
                         bit0(0x1d34) +
                         bit1(0x1d35) +
                         bit2(0x1d34)
                         == 9
                        )
              && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
            )
//----------------
//Chatterbox
achievement(
    title = "Chatterbox I [m]", description = "Unlock the talk option with Pharsti in " + SceneName[2] + " by destroying a frame after a couple of turns have passed", points = 2,
    trigger = 
    SceneID == 2
    &&  once(EventID == 0x429d)
    && byte(0x1fdf) >= 4 // Turncount 4+
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox II [m]", description = "Unlock the talk option with Pharsti in " + SceneName[3] + " by getting into critical health", points = 2,
    trigger = 
    SceneID == 3
    &&  once(EventID == 0x4f68)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox III [m]", description = "Unlock the talk option with Pharsti in " + SceneName[5] + " by having Ares show what a badass he is", points = 3,
    trigger = 
    SceneID == 5
    &&  once(EventID == 0x76d9)
    && bit2(0x21ba) == 1 //Vjaya turn end > Talk need Vjaya to kill an enemy to unlock
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox IV [m]", description = "Unlock the talk option with Pharsti in " + SceneName[6] + " by destroying multiple frames", points = 3,
    trigger = 
    SceneID == 6
    &&  once(EventID == 0x8f95)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox V [m]", description = "Unlock the talk option with Pharsti in " + SceneName[7] + " by getting hit too many times", points = 3,
    trigger = 
    SceneID == 7
    &&  once(EventID == 0xa693)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox VI [m]", description = "Unlock the talk option with Pharsti in " + SceneName[8] + " by being not so stealthy and still managing to not get caught", points = 3,
    trigger = 
    SceneID == 8
    &&  once(EventID == 0xb634)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox VII [m]", description = "Unlock the two talk options with Pharsti in " + SceneName[9] + " by getting hit a lot and staying around long enough for your mech to comment on it", points = Easy,
    trigger = 
    SceneID == 9
    &&  once(EventID == 0xc384) // Event 1 HP drop
    && (once(EventID == 0xc3f2) && byte(0x1fdf) >= 14) // Event 2 turn 14 reached
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox VIII [m]", description = "Unlock the talk option with Pharsti in " + SceneName[12] +" by dispatching the enemies efficiently", points = 3,
    trigger = 
    SceneID == 12
    &&  once(EventID == 0xfeba)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox IX [m]", description = "Unlock the talk option with Pharsti in " + SceneName[15] + " by lazying around", points = 3,
    trigger = 
    SceneID == 15
    && byte(0x1fdf) >= 1
    &&  once(EventID == 0x3b09)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox X [m]", description = "Unlock the talk option with Pharsti in " + SceneName[18] + " by encountering a raptor for the first time", points = 3,
    trigger = 
    SceneID == 18
    &&  once(EventID == 0x789a)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox XI [m]", description = "Unlock the talk option with Pharsti in " + SceneName[19] + " by getting hit too much", points = 3,
    trigger = 
    SceneID == 19
    &&  once(EventID == 0x848d)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox XII [m]", description = "Unlock the talk option with Pharsti in " + SceneName[20] + " by having witnessed the previous talk and still getting hit too much", points = 3,
    trigger = 
    SceneID == 20
    &&  once(EventID == 0x9656)
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)

achievement(
    title = "Chatterbox XIII [m]", description = "Unlock the two talk options with Pharsti in " + SceneName[21] + " by getting once again hit too much and also wasting time", points = Easy,
    trigger = 
    SceneID == 21
    &&  once(EventID == 0xa9af)
    && (once(EventID == 0xa9f6) && byte(0x1fdf) >= 15) // Event 2 turn 15 reached
    && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
)
//----------------
//Misc Challenge
achievement(
    title = "Beginner's Luck [m]", description = "\"Win\" your first duel against Iblis", points = 3,
    trigger = word(0x000F30) == 12574 && byte(0x00212E) == 1 && byte(0x002050) == 28
)

achievement(title = "Try Spinning, That’s a Good Trick [m]",
            description = "Complete " + SceneName[25] + " in a single session without taking any damage. IAS is authorized, retry is on Intermission Screen.",
            points = Challenge,
            trigger = 
                   once(EventID == SceneStartTrigger[25]) // Start on first dialogue after "Next Stage" is selected from Intermission
                && never(EventID == 0x8edc) // Game Over Screen
                && never(EventID == 0x80ec && prev(EventID) == 0x80d9) // Confirm action + Delta "Retreat ?" screen 
                && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
                && SceneID == (25) 
                && DamagelessCheck()
                && trigger_when(EventID == SceneEndTrigger[25]) 
                
            )
            
achievement(title = "Union Protectection [m]",
            description = "Complete " + SceneName[7] + " in a single session and save all the civilians",
            points = Medium,
            trigger = 
                   never(EventID == 0x8edc) // Game Over Screen
                && never(EventID == 0x80ec && prev(EventID) == 0x80d9) // Confirm action + Delta "Retreat ?" screen 
                && SceneID == (7) 
                && once(EventID == 0x9e14) // Civ1 escape event
                && once(EventID == 0x9e24) // Civ2 escape event
                && once(EventID == 0x9e34) // Civ3 escape event
                && once(EventID == 0x9e44) // Civ4 escape event
                && once(EventID == 0x9e54) // Civ5 escape event
                && once(EventID == SceneEndTrigger[7])
                && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
            )
            
achievement(title = "Code Name Big Boss [m]",
            description = "Infiltrate the base in " + SceneName[8] + " without being detected, killing no one, in 7 turns or less and under 2 minutes",
            points = Medium,
            trigger = 
                   once(EventID == 0xa742 ) // Early hit before pause to make sure the resets block the achievement
                && disable_when(EventID == 0xa828, until = (EventID == 0xb220 && prior(EventID) == 0xb21d)) // Pause after once() hit but before chapter transition and unpause when control is given to the player for the first time
                && never(EventID == 0x8edc) // Game Over Screen
                && never(EventID == 0x80ec && prev(EventID) == 0x80d9) // Confirm action + Delta "Retreat ?" screen 
                && never(repeated(7200, SceneID == (8))) // Hit Count as Timer > 2min = 180s * 60fps = 7200 Hits for SceneID == 8. Reset when timer exceed value
                && never(EventID == 0xb36c) // Getting detected
                && never((byte(0x1fdf) > 7) && SceneID == 8) // Turn count > 7 while in Scene 08 (turn count carry over previous chapter until new scene transition)
                && trigger_when(once(EventID == 0xb286)) // "That's it, Phil" > Event for reaching correct tile + Trigger flag
                && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
            )            

achievement(title = "The Secret of Blue Hair [m]",
            description = "Recruit Nadia in any route. Unlock when you get control of her",
            points = Easy,
            trigger = 
            (
                (   SceneID == 16       // Route A
                && EventID == 0x4ce6
                )
            ||  (   SceneID == 38       // Route B
                && EventID == 0x9a80
                )
            )    
            )
            
achievement(title = "The Protected [m]",
            description = "Dont let Deckson get hit during " + SceneName[11],
            points = Medium,
            trigger = 
                   once(EventID == 0xe316) // Mission Start hit for the resets
                && never(EventID == 0x8edc) // Game Over Screen
                && never(EventID == 0x80ec && prev(EventID) == 0x80d9) // Confirm action + Delta "Retreat ?" screen
                && never(EventID == 0x7d47) // Reset on Main menu screen for cleaning the memory, cheevo still trigger
                && SceneID == (11) 
                && never((prev(word(0x1844)) > word(0x1844))) // Edge HP Check)
                && once(EventID == SceneEndTrigger[11])
            )
//----------------

// RP Lookups
RouteLookup = {
    1: "Shared Route",
    2: "Shared Route",
    3: "Shared Route",
    4: "Shared Route",
    5: "Shared Route",
    6: "Shared Route",
    7: "Shared Route",
    8: "Shared Route",
    9: "Shared Route",
    10: "Shared Route",
    11: "Shared Route",
    12: "Shared Route",
    13: "Shared Route",
    14: "Shared Route",
    15: "Route A",
    16: "Route A",
    17: "Route A",
    18: "Route A",
    19: "Route A",
    20: "Route A",
    21: "Route A",
    22: "Route A",
    23: "Route A",
    24: "Route A",
    25: "Route A",
    32: "Route B",
    33: "Route B",
    34: "Route B",
    35: "Route B",
    36: "Route B",
    37: "Route B",
    38: "Route B",
    39: "Route B",
    40: "Route B",
    41: "Route B",
}

SceneLookup = {
    0x01: "Scene 01 - On the Battle God’s Palm",
    0x02: "Scene 02 - Perpetual Motion",
    0x03: "Scene 03 - A Hopeless Hope",
    0x04: "Scene 04 - Double-Edged Sword",
    0x05: "Scene 05 - A Voice From Far, Far Away",
    0x06: "Scene 06 - One Wing’s Promise",
    0x07: "Scene 07 - Opposing Tracks",
    0x08: "Scene 08 - Darkness Dyed by Darkness",
    0x09: "Scene 09 - Sincerity",
    0x0a: "Scene 10 - A Pure Heart…And The Price It Pays",
    0x0b: "Scene 11 - Double Deal",
    0x0c: "Scene 12 - Between Good And Evil",
    0x0d: "Scene 13 - The Gift",
    0x0e: "Scene 14 - The Card Turned Down",
    0x0f: "Scene 15 - The Darkness That Came From Light",
    0x10: "Scene 16 - Uncertain Future",
    0x11: "Scene 17 - Rebirth",
    0x12: "Scene 18 - Dark Half",
    0x13: "Scene 19 - Clawing the Red Earth",
    0x14: "Scene 20 - Missing Line",
    0x15: "Scene 21 - A Faint Light From the Depths",
    0x16: "Scene 22 - Heaven-Bound Wings",
    0x17: "Scene 23 - Fulfilment of a Promise",
    0x18: "Scene 24 - Pharsti",
    0x19: "Scene 25 - Reunion",
    0x20: "Scene 15 - Cracks",
    0x21: "Scene 16 - Paradise Lost",
    0x22: "Scene 17 - A Bow Drawn",
    0x23: "Scene 18 - Hearts In Harmony, Hearts In Strife",
    0x24: "Scene 19 - Waves",
    0x25: "Scene 20 - Island of Destiny",
    0x26: "Scene 21 - Nosferatu",
    0x27: "Scene 22 - Violated Wishes",
    0x28: "Scene 23 - God Save Us!",
    0x29: "Scene 24 - Promised Reunion",
}
//----------------

///Rich Presence Data
//RP Main Menu
rich_presence_conditional_display(word(0x000F30) == 32071, "|| Main Menu || ")
//----------------
//RP Intermission > Technically only work on the main Intermission Screen, need to be updated to cover all options
rich_presence_conditional_display(word(0x000F30) == 35214, "|| Relaxing Intermission || Planning during {0} ||",
    rich_presence_lookup("Route", byte(0x00212E), RouteLookup)
)
//----------------
//RP Main Game
rich_presence_display("|| Currently in {0} || {1} || Cage is currently level {2} ||",
    rich_presence_lookup("Route", byte(0x00212E), RouteLookup),
    rich_presence_lookup("Scene", byte(0x00212E), SceneLookup),
    rich_presence_value("CageLvl", byte(0x002155))
)
//----------------


///Leaderboards Data
//Trigger on Credit roll, last level value doesnt change
leaderboard(
    id = 47065, title = "Low Turn Count Route A",
    description = "Complete the 25 Scenes (Route A) variant of the game under the lowest amount of turns possible",
    start  = byte(0x00212E) == 25 && word(0x000F30) == 35214,
    cancel = byte(0x00212E) != 25,
    submit = byte(0x00212E) == 25 && word(0x000F30) == 36600,
    value = word(0x001FDC),
    format = "VALUE", lower_is_better = true
)

leaderboard(
    id = 47066, title = "Low Turn Count Route B",
    description = "Complete the 24 Scenes (Route B) variant of the game under the lowest amount of turns possible",
    start  = byte(0x00212E) == 41 && word(0x000F30) == 35214,
    cancel = byte(0x00212E) != 41,
    submit = byte(0x00212E) == 41 && word(0x000F30) == 36600,
    value = word(0x001FDC),
    format = "VALUE", lower_is_better = true
)

//----------------

