// ~Hack~ Golden Sun: Dawn of Djinn
// #ID = 21686


// 20230213 Version - Sines

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


// $0000: ------
//        Code Notes: As this is a hack for that works by mostly modifying existing asset, most if not all memory address will be the same as in the regular game. I'm focusing on noting those that are relevant to the sets but the credit for discovery goes to the original GS code notes.
//        ------
// $1C9C: [32-Bit] In-Game Time (Frames)
// $8040: [8 Bit] Bitflags Party Member
//        Bit 0 | Isaac
//        Bit 1 | Garet
//        Bit 2 | Ivan
//        Bit 3 | Mia
// $8046: [8 Bit] Venus Djinn Event Flag
//        Bit 0 | Flint
//        Bit 1 | Chasm
//        Bit 2 | Mineral
//        Bit 3 | Vine
//        Bit 4 | Curare
//        Bit 5 | Java
//        Bit 6 | Putrid
// $8048: [8 Bit] Mercury Djinn Event Flag
//        Bit 4 | Spa
//        Bit 5 | Shiver
//        Bit 6 | Angler
//        Bit 7 | Rapid
// $8049: [8 Bit] Mercury Djinn Event Flag 2
//        Bit 0 | Flurry
//        Bit 1 | Wade
//        Bit 2 | Dew - Grand Djinn
// $804B: [8 Bit] Mars Djinn Event Flag
//        Bit 0 | Smith
//        Bit 1 | Blanket
//        Bit 2 | Mica
//        Bit 3 | Fatigue
//        Bit 4 | Glint
//        Bit 5 | Mirage - Grand Djinn
//        Bit 6 | Arid
// $804D: [8 Bit] Jupiter Djinn Event Flag
//        Bit 4 | Seep
//        Bit 5 | Jolt
//        Bit 6 | Breeze
//        Bit 7 | Swill
// $804E: [8 Bit] Jupiter Djinn Event Flag 2
//        Bit 0 | Draft
//        Bit 1 | Boom
//        Bit 2 | Filter - Grand Djinn
// $8080: [8 Bit] Bit Flag
//        Bit 1 | Vision Mode
// $8101: [8 Bit] Event Flag
//        Bit 4 | Support Dirge defeated > Kraken Fight
// $8103: [8 Bit] Event Flag
//        Bit 5 | Bandit Trio defeated
// $8109: [8 Bit] Bit Flag
//        Bit 6 | Sealer Ape (Mogall Forest Boss) Defeated
// $810B: [8 Bit] Bit Flag
//        Bit 1 | Manticore King Defeated
// $810D: [8 Bit] Bit Flag
//        Bit 1 | Desert Cerberus Defeated
// $810E: [8 Bit] Bit Flag
//        Bit 0 | Lord of Djinn Defeated > Crossbone Isle
// $810F: [8 Bit] Bit Flag
//        Bit 1 | Kraken Defeated
//        Bit 2 | Heartbreak Defeated > Crossbone Isle
//        Bit 3 | Saturos Defeated > Mercury Lighthouse
//        Bit 4 | Saturos Defeated > Venus Lighthouse
//        Bit 5 | Menardi? Defeated > Mercury Lighthouse
//        Bit 6 | Menardi Defeated > Venus Lighthouse
// $8110: [8 Bit] Bit Flag
//        Bit 3 | Hydros Statue Defeated
// $8111: [8 Bit] Bit Flag
//        Bit 0 | Navampa Defeated > Colosso
//        Bit 5 | Toadonpa Defeated > Lunpa
// $8112: [8 Bit] Bit Flag
//        Bit 3 | Tret Defeated
//        Bit 4 | Fusion Dragon Defeated
//        Bit 5 | Deadbeard Defeated
// $8113: [8 Bit] Bit Flag
//        Bit 1 | Mercury Mimic Defeated > Vault Cave
//        Bit 2 | Mars Mimic Defeated > Altimer Cave
//        Bit 3 | Jupiter Mimic Defeated > Crossbone Isle
//        Bit 4 | Venus Mimic Defeated > Suhala Desert
// $8114: [8 Bit] Bit Flag
//        Bit 0 | Venus Grand Djinni Defeated > Crossbone Isle
//        Bit 4 | Mercury Grand Djinni Defeated > Suhalla Gate
//        Bit 7 | Mars Grand Djinni Defeated > Suhalla Desert
// $8115: [8 Bit] Bit Flag
//        Bit 3 | Jupiter Grand Djinni Defeated > Babi Lighthouse
// $8140: TBC Event Flags Start
// $8148: [8 Bit] Event Flag
//        Bit 3 | Psy Bubble event
// $8218: [8 Bit] Treasure Flag
//        Bit 7 | Sauna Charm > Crossbone Isle
// $8219: [8 Bit] Treasure Flag
//        Bit 3 | Magnet Charm > Crossbone Isle
// $821A: [8 Bit] Treasure Flag
//        Bit  | Cascade Charm > Crossbone Isle
// $8220: TBC Treasure Flags Start
// $8223: [8 Bit] Treasure Flag
//        Bit 2 | Garland Charm > Mogall Forest
// $8224: [8 Bit] Treasure Flag
//        Bit 6 | Empty Bottle > Imil
// $822B: [8 Bit] Treasure Flag
//        Bit 3 | Glare Charm > Tret Tree
//        Bit 5 | Blether Charm > Bilibin Cave
// $8230: [8 Bit] Treasure Flag
//        Bit 6 | Kite Charm > Kalay Manor
// $8239: [8 Bit] Treasure Flag
//        Bit 7 | Lucky Boot > Overworld
// $8250: [32 Bit] Coins counter
// $8400: [32 Bit] Map Location ID and Encounter ID
//        Note: For Map ID, the lower 4 digits refer to the area, and the upper four digits indicate what entrance you used to reach that area.
// $8402: [8 Bit] Entrance ID
// $8438: [8 Bit] Character 1 ID
//        0 > Isaac
//        1 > Garet
//        2 > Ivan
//        3 > Mia
// $8439: [8 Bit] Character 2 ID
//        0 > Isaac
//        1 > Garet
//        2 > Ivan
//        3 > Mia
// $843A: [8 Bit] Character 3 ID
//        0 > Isaac
//        1 > Garet
//        2 > Ivan
//        3 > Mia
// $843B: [8 Bit] Character 4 ID
//        0 > Isaac
//        1 > Garet
//        2 > Ivan
//        3 > Mia
// $8478: [16 Bit] Step Counter sub increment
//        Raise 0x8479 by 1 when hitting FFFF
// $847A: [8 Bit] Random Battles Step Counter
//        Trigger a fight when value == 0x10
// $8486: [8 Bit] Avoid QoL On/Off
//        0 > Avoid Off, random encouter
//        1 > Avoid On, no random encounter
// $8500: [8 Bit] Isaac Name First Char
// $8501: [8 Bit] Isaac Name Second Char
// $8502: [8 Bit] Isaac Name Third Char
// $8503: [8 Bit] Isaac Name Fourth Char
// $8504: [8 Bit] Isaac Name Fiffh Char
// $850F: [8 Bit] Isaac Level
// $8534: [8 Bit] Isaac Max HP
// $8536: [8 Bit] Isaac Max PP
// $8538: [8 Bit] Isaac Current HP
// $853A: [8 Bit] Isaac Current PP
// $853C: [16 Bit] Isaac Current Attack
// $853E: [16 Bit] Isaac Current Defense
// $8540: [16 Bit] Isaac Current Speed
// $8542: [8 Bit] Isaac Current Luck
// $8548: [16 Bit] Isaac Venus Power
// $854A: [16 Bit] Isaac Venus Resist
// $854C: [16 Bit] Isaac Mercury Power
// $854E: [16 Bit] Isaac Mercury Resist
// $8550: [16 Bit] Isaac Mars Power
// $8552: [16 Bit] Isaac Mars Resist
// $8554: [16 Bit] Isaac Jupiter Power
// $8556: [16 Bit] Isaac Jupiter Resist
// $85D7: ------
//        Code Notes: For Item check purpose, here's a list of relevant items for the set
//        
//        First 8 Bit Address is Item ID
//        Second 8 Bit Address is Item Status
//        00 Item Quantity = 1
//        02 Equipped
//        03 Cursed
//        04 Broken
//        08 Item Quantity = 2
//        After that quantity increment by 1 every + 0x08 (Quant 3 = 0x10, Quant 4 = 0x18 etc)
//        Max Quantity = 30 DEC / 0xe8 HEX
//        ---
//        09 = Gaia Blade
//        53 = Sol Blade
//        5a = Casual Key
//        67 = Brutal Key
//        ---
//        Djinns Charms ID
//        16 = Blether Charm
//        18 = Sauna Charm
//        5d = Garland Charm
//        5f = Kite Charm
//        62 = Cascade Charm
//        a4 = Brand Charm
//        ca = Foam Charm
//        d1 = Hail Charm
//        d2 = Scorch Charm
//        d3 = Clover Charm
//        d4 = Luff Charm
//        d8 = Geyser Charm
//        db = Simoom Charm
// $85D8: [8 Bit] Isaac - Item ID 1
// $85D9: [8 Bit] Isaac - Item Status 1
// $85DA: [8 Bit] Isaac - Item ID 2
// $85DB: [8 Bit] Isaac - Item Status 2
// $85DC: [8 Bit] Isaac - Item ID 3
// $85DD: [8 Bit] Isaac - Item Status 3
// $85DE: [8 Bit] Isaac - Item ID 4
// $85DF: [8 Bit] Isaac - Item Status 4
// $85E0: [8 Bit] Isaac - Item ID 5
// $85E1: [8 Bit] Isaac - Item Status 5
// $85E2: [8 Bit] Isaac - Item ID 6
// $85E3: [8 Bit] Isaac - Item Status 6
// $85E4: [8 Bit] Isaac - Item ID 7
// $85E5: [8 Bit] Isaac - Item Status 7
// $85E6: [8 Bit] Isaac - Item ID 8
// $85E7: [8 Bit] Isaac - Item Status 8
// $85E8: [8 Bit] Isaac - Item ID 9
// $85E9: [8 Bit] Isaac - Item Status 9
// $85EA: [8 Bit] Isaac - Item ID 10
// $85EB: [8 Bit] Isaac - Item Status 10
// $85EC: [8 Bit] Isaac - Item ID 11
// $85ED: [8 Bit] Isaac - Item Status 11
// $85EE: [8 Bit] Isaac - Item ID 12
// $85EF: [8 Bit] Isaac - Item Status 12
// $85F0: [8 Bit] Isaac - Item ID 13
// $85F1: [8 Bit] Isaac - Item Status 13
// $85F2: [8 Bit] Isaac - Item ID 14
// $85F3: [8 Bit] Isaac - Item Status 14
// $85F4: [8 Bit] Isaac - Item ID 15
// $85F5: [8 Bit] Isaac - Item Status 15


///Core
//Constant

//Quick points distribution
Free = 1
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CasualKey = 0x5a
BrutalKey = 0x67
HeroicCharm = 0xd0

NotEquipped = 0x0
Equipped = 0x2

//----------------
//Variable
MapID = dword(0x8400)
IsaacLevel = byte(0x850f)
GaretLevel = byte(0x865b)
IvanLevel = byte(0x87a7)
MiaLevel = byte(0x88f3)
MiaRecruited = bit3(0x8040) == 1

//----------------
//Function
function SaveProtection() => prev(MapID) != 0x00010001 // Check for the previous MapID not being the Continue Menu. Safety Measure against code mistakes.



//function IsaacInventoryCheck(ItemID)  // WTF is this bullshit. Definitely want to go back on this later, going for the dumb method in the meantime
//{       IsaacInventoryArray = [] 
//        for i in range (0,14)
//           {IsaacItemID == byte(0x85d8 +i*2)
//            if (IsaacItemID == ItemID)
//                array_push(IsaacIventoryArray)
//            }
//        return any_of(IsaacInventoryArray)
//}
function LevelCheck(LevelLimit)
{ 
    
   return IsaacLevel <= LevelLimit 
   && GaretLevel <= LevelLimit 
   && IvanLevel <= LevelLimit 
   && MiaLevel <= LevelLimit

 }
 
function LevelCheckNoMia(LevelLimit)
{ 
    
   return IsaacLevel <= LevelLimit 
   && GaretLevel <= LevelLimit 
   && IvanLevel <= LevelLimit 

 }
 
 
function IsaacInventoryCheck(ItemID)
{       
      return 
      tally(1,byte(0x85d8) == ItemID
      || byte(0x85da) == ItemID  
      || byte(0x85dc) == ItemID  
      || byte(0x85de) == ItemID
      || byte(0x85e0) == ItemID
      || byte(0x85e2) == ItemID
      || byte(0x85e4) == ItemID
      || byte(0x85e6) == ItemID
      || byte(0x85e8) == ItemID
      || byte(0x85ea) == ItemID
      || byte(0x85ec) == ItemID
      || byte(0x85ee) == ItemID
      || byte(0x85f0) == ItemID
      || byte(0x85f2) == ItemID
      || byte(0x85f4) == ItemID )
 }
 
function IsaacEquippedCheck(ItemID)
{       
      return 
      tally(1,(byte(0x85d8) == ItemID && byte(0x85d9) == 2),
       (byte(0x85da) == ItemID  && byte(0x85db) == 2),
       (byte(0x85dc) == ItemID  && byte(0x85dd) == 2),
       (byte(0x85de) == ItemID  && byte(0x85df) == 2),
       (byte(0x85e0) == ItemID  && byte(0x85e1) == 2),
       (byte(0x85e2) == ItemID  && byte(0x85e3) == 2),
       (byte(0x85e4) == ItemID  && byte(0x85e5) == 2),
       (byte(0x85e6) == ItemID  && byte(0x85e7) == 2),
       (byte(0x85e8) == ItemID  && byte(0x85e9) == 2),
       (byte(0x85ea) == ItemID  && byte(0x85eb) == 2),
       (byte(0x85ec) == ItemID  && byte(0x85ed) == 2),
       (byte(0x85ee) == ItemID  && byte(0x85ef) == 2),
       (byte(0x85f0) == ItemID  && byte(0x85f1) == 2),
       (byte(0x85f2) == ItemID  && byte(0x85f3) == 2),
       (byte(0x85f4) == ItemID  && byte(0x85f5) == 2) )
 } 
 
 
function GaretInventoryCheck(ItemID)
{       
      return 
      tally(1,byte(0x8724) == ItemID
      || byte(0x8726) == ItemID  
      || byte(0x8728) == ItemID  
      || byte(0x872a) == ItemID
      || byte(0x872c) == ItemID
      || byte(0x872e) == ItemID
      || byte(0x8730) == ItemID
      || byte(0x8732) == ItemID
      || byte(0x8734) == ItemID
      || byte(0x8736) == ItemID
      || byte(0x8738) == ItemID
      || byte(0x873a) == ItemID
      || byte(0x873c) == ItemID
      || byte(0x873e) == ItemID
      || byte(0x8740) == ItemID )
 } 
 
 function GaretEquippedCheck(ItemID)
{       
      return 
      tally(1,(byte(0x8724) == ItemID && byte(0x8725) == 2),
       (byte(0x8726) == ItemID && byte(0x8727) == 2),
       (byte(0x8728) == ItemID && byte(0x8729) == 2),
       (byte(0x872a) == ItemID && byte(0x872b) == 2),
       (byte(0x872c) == ItemID && byte(0x872d) == 2),
       (byte(0x872e) == ItemID && byte(0x872f) == 2),
       (byte(0x8730) == ItemID && byte(0x8731) == 2),
       (byte(0x8732) == ItemID && byte(0x8733) == 2),
       (byte(0x8734) == ItemID && byte(0x8735) == 2),
       (byte(0x8736) == ItemID && byte(0x8737) == 2),
       (byte(0x8738) == ItemID && byte(0x8739) == 2),
       (byte(0x873a) == ItemID && byte(0x873b) == 2),
       (byte(0x873c) == ItemID && byte(0x873d) == 2),
       (byte(0x873e) == ItemID && byte(0x873f) == 2),
       (byte(0x8740) == ItemID && byte(0x8741) == 2) )
 } 
 
 function IvanInventoryCheck(ItemID)
{       
      return 
      tally(1,byte(0x8870) == ItemID
      || byte(0x8872) == ItemID  
      || byte(0x8874) == ItemID  
      || byte(0x8876) == ItemID
      || byte(0x8878) == ItemID
      || byte(0x887a) == ItemID
      || byte(0x887c) == ItemID
      || byte(0x887e) == ItemID
      || byte(0x8880) == ItemID
      || byte(0x8882) == ItemID
      || byte(0x8884) == ItemID
      || byte(0x8886) == ItemID
      || byte(0x8888) == ItemID
      || byte(0x888a) == ItemID
      || byte(0x888c) == ItemID )
 } 
 
  function IvanEquippedCheck(ItemID)
{       
      return 
      tally(1,(byte(0x8870) == ItemID && byte(0x8871) == 2),
       (byte(0x8872) == ItemID && byte(0x8873) == 2),
       (byte(0x8874) == ItemID && byte(0x8875) == 2),
       (byte(0x8876) == ItemID && byte(0x8877) == 2),
       (byte(0x8878) == ItemID && byte(0x8879) == 2),
       (byte(0x887a) == ItemID && byte(0x887b) == 2),
       (byte(0x887c) == ItemID && byte(0x887d) == 2),
       (byte(0x887e) == ItemID && byte(0x887f) == 2),
       (byte(0x8880) == ItemID && byte(0x8881) == 2),
       (byte(0x8882) == ItemID && byte(0x8883) == 2),
       (byte(0x8884) == ItemID && byte(0x8885) == 2),
       (byte(0x8886) == ItemID && byte(0x8887) == 2),
       (byte(0x8888) == ItemID && byte(0x8889) == 2),
       (byte(0x888a) == ItemID && byte(0x888b) == 2),
       (byte(0x888c) == ItemID && byte(0x888d) == 2) )
 } 
 
  function MiaInventoryCheck(ItemID)
{       
      return 
      tally(1,byte(0x89bc) == ItemID
      || byte(0x89be) == ItemID  
      || byte(0x89c0) == ItemID  
      || byte(0x89c2) == ItemID
      || byte(0x89c4) == ItemID
      || byte(0x89c6) == ItemID
      || byte(0x89c8) == ItemID
      || byte(0x89ca) == ItemID
      || byte(0x89cc) == ItemID
      || byte(0x89ce) == ItemID
      || byte(0x89d0) == ItemID
      || byte(0x89d2) == ItemID
      || byte(0x89d4) == ItemID
      || byte(0x89d6) == ItemID
      || byte(0x89d8) == ItemID )
 } 
 
 
   function MiaEquippedCheck(ItemID)
{       
      return 
      tally(1,(byte(0x89bc) == ItemID && byte(0x89bd) == 2),
       (byte(0x89be) == ItemID && byte(0x89bf) == 2),
       (byte(0x89c0) == ItemID && byte(0x89c1) == 2),
       (byte(0x89c2) == ItemID && byte(0x89c3) == 2),
       (byte(0x89c4) == ItemID && byte(0x89c5) == 2),
       (byte(0x89c6) == ItemID && byte(0x89c7) == 2),
       (byte(0x89c8) == ItemID && byte(0x89c9) == 2),
       (byte(0x89ca) == ItemID && byte(0x89cb) == 2),
       (byte(0x89cc) == ItemID && byte(0x89cd) == 2),
       (byte(0x89ce) == ItemID && byte(0x89cf) == 2),
       (byte(0x89d0) == ItemID && byte(0x89d1) == 2),
       (byte(0x89d2) == ItemID && byte(0x89d3) == 2),
       (byte(0x89d4) == ItemID && byte(0x89d5) == 2),
       (byte(0x89d6) == ItemID && byte(0x89d7) == 2),
       (byte(0x89d8) == ItemID && byte(0x89d9) == 2) )
 } 
 
 
 function AllInventoryCheck(ItemID)
 { 
        return
        IsaacInventoryCheck(ItemID)
     && GaretInventoryCheck(ItemID)
     && IvanInventoryCheck(ItemID)
     && MiaInventoryCheck(ItemID)
  }
  
 function AllEquippedCheck(ItemID)
 { 
        return
        IsaacEquippedCheck(ItemID)
     && GaretEquippedCheck(ItemID)
     && IvanEquippedCheck(ItemID)
     && MiaEquippedCheck(ItemID)
  }  
  
 function AllEquippedCheckNoMia(ItemID)
 { 
        return
        IsaacEquippedCheck(ItemID)
     && GaretEquippedCheck(ItemID)
     && IvanEquippedCheck(ItemID)

  }   
//----------------

///Achievement Code

// Progression
 achievement(title = "Off to a Good Start",
                description = "Defeat the Trio Bandits of Vault",
                points = Easy,
                trigger = // Having a minion capable of calling reinforcements make the trigger more delicate than a simple bitflag flip.
                (   SaveProtection()
                   && once(MapID == 0x001d01fe // Fight ID
                   && prev(MapID) == 0x000f0015) // Map ID just before the fight
                   && MapID == 0x00110015 // ID after fight
                   && prev(bit5(0x814a)) == 0 // Bitflag for Bandits captured
                   && bit5(0x814a) == 1
                   && never(MapID == 0x00100015) // Fight lost cinematic, only used for this specific fight
                   && never(MapID == 0x00010001) // Also reset on main menu
                   


                )
              )

 achievement(title = "A Great Tree-umph",
                description = "Defeat Tret",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x006a01fe // FightID
                   && prev(bit3(0x8112)) == 0 // Bitflag for Tret defeated
                   && bit3(0x8112) == 1

                   


                )
              )
              
 achievement(title = "Bad Surprise",
                description = "Complete the Mercury Lighthouse",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x006c01fe // ID during fight
                   && bitcount(0x00810f) == 2 // Bitflags for various boss, at this point of the game can only be Saturos and Menardi? at Mercury Lighthouse so can use a lazy bitcount instead of tally
                   && prev(bitcount(0x00810f)) < 2 // Delta flags

  
                )
              )
              
 achievement(title = "Monkeying in the Forest",
                description = "Defeat the beast of Mogall Forest",
                points = Medium,
                trigger = // Having a minion capable of calling reinforcements make the trigger more delicate than a simple bitflag flip.
                (   SaveProtection()
                   && MapID == 0x000f0046 // ID after fight
                   && prev(bit6(0x8153)) == 0 // Bitflag for Sealer Ape event done
                   && bit6(0x8153) == 1 
  
                )
              )
              
 achievement(title = "Exploring Damp Caves",
                description = "Save Altin from the floods",
                points = Medium,
                trigger = 
                (   SaveProtection()
               	   && once(MapID == 0x009e01fe // Fight ID
                   && prev(MapID) == 0x00010056) // Map ID just before the fight
                   && MapID == 0x00630056 // ID after fight
                   && prev(bit1(0x8161)) == 0 // Bitflag for Hydros fight completed
                   && bit1(0x8161) == 1
                   && never(MapID == 0x00010001) // reset on main menu
                )
              )
              
 achievement(title = "Scorching Heat",
                description = "Defeat the Manticore",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00aa01fe // FightID
                   && prev(bit1(0x810b)) == 0 // Bitflag for Tret defeated
                   && bit1(0x810b) == 1

                )
              )
              
 achievement(title = "Rough Seas",
                description = "Slay the Kraken",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00d501fe // ID during fight
                   && tally(1,bit4(0x008101) == 1 && bit1(0x00810f) == 1 )// Checking for both flags to be On
                   && never(MapID == 0x00010001) // reset on main menu
                )
              )
              
 achievement(title = "Gladiatorial Showdown [m]",
                description = "Win the Colosso Finals",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00f201fe // ID during fight
                   && bit0(0x008111) == 1  // Bitflag check
                   && prev(bit0(0x008111)) == 0

                )
              )
              
 achievement(title = "Toad-ally Ribbiting",
                description = "Rescue Lord Hammet",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x010a01fe // ID during fight
                   && tally(1,bit1(0x008109) == 1 && bit5(0x008111) == 1 )// Checking for both flags to be On
                   && never(MapID == 0x00010001) // reset on main menu


                )
              )
              
 achievement(title = "Roaming Anubis",
                description = "Defeat the Desert Cerberus",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x012001fe // FightID
                   && bit1(0x00810d) == 1 // Bitflag check
                   && prev(bit1(0x00810d)) == 1
                )
              )
              
              
 achievement(title = "Stormy Little Wizard",
                description = "Defeat the Storm Wizard",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x012101fe // FightID
                   && bit1(0x008112) == 1 // Bitflag check
                   && prev(bit1(0x008112)) == 1
                )
              )
              
 achievement(title = "Plunder Fit for a King",
                description = "Defeat Deadbeard and obtain his treasure",
                points = Hard,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x012e01fe // FightID
                   && bit5(0x008112) == 1 // Bitflag check
                   && prev(bit5(0x008112)) == 0

                )
              )
              
 achievement(title = "The Lord of Elementals",
                description = "Defeat the Lord of Djinn and get the ultimate reward",
                points = Hard,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x016501fe // FightID
                   && tally(1,bit0(0x00810e) == 1 && bit2(0x00810f) == 1 ) // Bitflag check
                                  

                )
              )
              
 achievement(title = "Beat up the Rising Sun",
                description = "Defeat the final boss",
                points = Hard,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x015b01fe // FightID
                   && bit4(0x008112) == 1// Bitflag check
                   && prev(bit4(0x008112)) == 0
                                  

                )
              ) 
              
 achievement(title = "Onward to New Adventures !",
                description = "Beat the game and watch the credits roll",
                points = 2,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00090000 // Credit roll
                   && prior(MapID) == 0x000100bc // On the boat
                )
            )
//----------------
//Brutal Challenge         

 achievement(title = "Off to a Brutal Start [m]",
                description = "Defeat the Trio Bandits of Vault [Brutal Key on everyone, No Casual Key, Max Level 5]",
                points = Easy,
                trigger = // Having a minion capable of calling reinforcements make the trigger more delicate than a simple bitflag flip.
                (   SaveProtection()
                   && once(LevelCheckNoMia(5) 
                   && MapID == 0x001d01fe )// Fight ID
                   && AllEquippedCheckNoMia(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when(MapID == 0x00110015 // ID after fight
                   && prev(bit5(0x814a)) == 0 // Bitflag for Bandits captured
                   && bit5(0x814a) == 1 )
                   && never(MapID == 0x00100015) // Fight lost cinematic, only used for this specific fight
                   && never(MapID == 0x00010001) // Also reset on main menu
                   && never(AllEquippedCheckNoMia(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x000f0015) // Map ID just before the fight, wonky use of reset to help with checking Brutal Key being equipped at the right time
                   


                )
              )
              
 achievement(title = "A Brutal Tree-umph [m]",
                description = "Defeat Tret [Brutal Key on everyone, No Casual Key, Max Level 7]",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && once(LevelCheckNoMia(7) 
                   && MapID == 0x006a01fe ) // FightID
                   && AllEquippedCheckNoMia(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when(MapID == 0x006a01fe 
                   && prev(bit3(0x8112)) == 0 // Bitflag for Tret defeated
                   && bit3(0x8112) == 1 )
                   && never(AllEquippedCheckNoMia(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x00010001) // Also reset on main menu
                   && never(MapID == 0x000a002d) // MapID just before the fight
                   


                )
              )
              
 achievement(title = "Brutally Out of Order [m]",
                description = "Defeat the beast of Mogall Forest before clearing the Mercury Lighthouse [Brutal Key on everyone, No Casual Key, Max Level 8]",
                points = Hard,
                trigger = // Having a minion capable of calling reinforcements make the trigger more delicate than a simple bitflag flip.
                (   SaveProtection()
                   && once(LevelCheckNoMia(8) 
                   && MapID == 0x008b01fe )// Fight ID
                   && AllEquippedCheckNoMia(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when(MapID == 0x000f0046 // ID after fight
                   && prev(bit6(0x8153)) == 0 // Bitflag for Sealer Ape event done
                   && bit6(0x8153) == 1 )
                   && never(MapID == 0x00010001) // Also reset on main menu
                   && never(AllEquippedCheckNoMia(CasualKey)) // No Casual key allowed
                   && never(prev(MapID) == 0x000c0046) // Map ID just before the fight, wonky use of reset to help with checking Brutal Key being equipped at the right time
                   && never(MiaRecruited) // 3 char only, good luck !
                   


                )
              )
              
 achievement(title = "Brutal Surprise [m]",
                description = "Complete the Mercury Lighthouse [Brutal Key on everyone, No Casual Key, Max Level 10]",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && once(LevelCheck(10) 
                   && MapID == 0x006c01fe ) // FightID
                   && AllEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when(bitcount(0x00810f) == 2 // Bitflags for various boss, at this point of the game can only be Saturos and Menardi? at Mercury Lighthouse so can use a lazy bitcount instead of tally
                   && prev(bitcount(0x00810f)) < 2 ) // Delta flags
                   && never(AllEquippedCheck(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x00010001) // Also reset on main menu
                   && never(MapID == 0x0001003a) // MapID just before the fight

  
                )
              )
              
 achievement(title = "Exploring Brutal Caves [m]",
                description = "Save Altin from the floods [Brutal Key on everyone, No Casual Key, Max Level 14]",
                points = Medium,
                trigger = // Having a minion capable of calling reinforcements make the trigger more delicate than a simple bitflag flip.
                (   SaveProtection()
                   && once(LevelCheck(14) 
                   && MapID == 0x009e01fe )// Fight ID
                   && AllEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when(MapID == 0x00630056 // ID after fight
                   && prev(bit1(0x8161)) == 0 // Bitflag for Bandits captured
                   && bit1(0x8161) == 1 )
                   && never(MapID == 0x00010001) // reset on main menu
                   && never(AllEquippedCheck(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x0010056) // Map ID just before the fight, wonky use of reset to help with checking Brutal Key being equipped at the right time
                   


                )
              )
              
 achievement(title = "Brutal Heat [m]",
                description = "Defeat the Manticore [Brutal Key on everyone, No Casual Key, Max Level 16]",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && once(LevelCheck(16) 
                   && MapID == 0x00aa01fe ) // FightID
                   && AllEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when(MapID == 0x00aa01fe 
                   && prev(bit1(0x810b)) == 0 // Bitflag for Tret defeated
                   && bit1(0x810b) == 1 )
                   && never(AllEquippedCheck(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x00010001) // Also reset on main menu
                   && never(MapID == 0x0003005b) // MapID just before the fight
                   


                )
              )
              
 achievement(title = "Brutal Seas [m]",
                description = "Slay the Kraken [Brutal Key on everyone, No Casual Key, Max Level 18]",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && once(LevelCheck(18) 
                   && MapID == 0x00d501fe ) // FightID
                   && AllEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when(tally(1,bit4(0x008101) == 1 && bit1(0x00810f) == 1 ))// Checking for both flags to be on
                   && never(AllEquippedCheck(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x00010001) // Also reset on main menu
                   && never(MapID == 0x000f006d) // MapID just before the fight

  
                )
              )
              
 achievement(title = "Brutal Showdown [m]",
                description = "Win the Colosso Finals [Brutal Key on Isaac, No Casual Key, Max Level 20]",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && once(IsaacLevel <= 20
                   && MapID == 0x00f201fe)	
                   && IsaacEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when(bit0(0x008111) == 1  // Bitflag check
                   && prev(bit0(0x008111)) == 0 )
                   && never(IsaacEquippedCheck(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x00010001) // Also reset on main menu
                   && never(MapID == 0x00010091) // MapID just before the fight


                )
              )
              
 achievement(title = "Brutally Ribbiting [m]",
                description = "Rescue Lord Hammet [Brutal Key on everyone, No Casual Key, Max Level 21]",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && once(LevelCheck(21) 
                   && MapID == 0x010a01fe ) // FightID
                   && AllEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when( tally(1,bit1(0x008109) == 1 && bit5(0x008111) == 1 ) )// Checking for both flags to be On
                   && never(MapID == 0x00010001) // reset on main menu
                   && never(AllEquippedCheck(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x000300a3) // MapID just before the fight


                )
              )
              
 achievement(title = "Brutal Anubis [m]",
                description = "Defeat the Desert Cerberus [Brutal Key on everyone, No Casual Key, Max Level 23]",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && once(LevelCheck(23) 
                   && MapID == 0x012001fe ) // FightID
                   && AllEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when( bit1(0x00810d) == 1 // Bitflag check
                   && prev(bit1(0x00810d)) == 0 )// 
                   && never(MapID == 0x00010001) // reset on main menu
                   && never(AllEquippedCheck(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x000400a5) // MapID just before the fight
                   && never(MapID == 0x000100a5) // alt MapID just before the fight

                )
              )
              
 achievement(title = "Brutal Little Wizard [m]",
                description = "Defeat the Storm Wizard [Brutal Key on everyone, No Casual Key, Max Level 23] [First fight only, no refight later !]",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && once(LevelCheck(23) 
                   && MapID == 0x012101fe ) // FightID
                   && AllEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when( bit1(0x008112) == 1 // Bitflag check
                   && prev(bit1(0x008112)) == 0 )// 
                   && never(MapID == 0x00010001) // reset on main menu
                   && never(AllEquippedCheck(CasualKey)) // No Casual key allowed
                   && never(MapID == 0x000300a5) // MapID just before the fight

                )
              )
              
 achievement(title = "Beat up the Brutal Sun",
                description = "Defeat the final boss [Brutal Key on everyone, No Casual Key, Max Level 27][Level is checked on Fusion Dragon]",
                points = Challenge,
                trigger = 
                (   SaveProtection()
                   && once(LevelCheck(27) 
                   && MapID == 0x015b01fe ) // FightID
                   && AllEquippedCheck(BrutalKey)// Brutal key for a brutal challenge
                   && trigger_when( bit4(0x008112) == 1 // Bitflag check
                   && prev(bit4(0x008112)) == 0 )// 
                   && never(MapID == 0x00010001) // reset on main menu
                   && never(AllEquippedCheck(CasualKey)) // No Casual key allowed
//                   && never(AllEquippedCheck(HeroicCharm)) // No Heroic Charm allowed
                   && never(MapID == 0x000100bb) // MapID in last map you can move before the final fight
                                  

                )
              )
//----------------
//Optional

 achievement(title = "Luckiest Boots",
                description = "Find the only item hidden on the overworld",
                points = Baby,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x50002 // Overworld
                   && bit7(0x8239) == 1 // Simple treasure bitflag flip
                   && prev(bit7(0x8239)) == 0
                )
              )

 achievement(title = "Still Incompetent [m]",
                description = "Pick an imbalanced rowing team and explore the uncharted island",
                points = Easy,
                trigger = 
                (   SaveProtection() 
                   && once(MapID == 0x001006d) // Boat map id
                   && MapID == 0x00010071  // Island ID
                   && prev(MapID) == 0x004a0002 // Overworld Island ID
                   && never(MapID == 0x00010001) // Also reset on main menu
  
                )
              )
//----------------
//Djinn Charms
//Venus
//--- ---

 achievement(title = "Garland Charm",
                description = "Obtain the Garland Charm",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00070046 // MapID
                   && prev(bit2(0x008223)) == 0 // Flags check
                   && bit2(0x008223) == 1
                )
            )        

 achievement(title = "Clover Charm",
                description = "Defeat the Venus Mimic and obtain the Clover Charm",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x016401fe // MapID
                   && prev(bit4(0x008113)) == 0 // Flags check
                   && bit4(0x008113) == 1
                )
            )
            
 achievement(title = "Magnet Charm",
                description = "Obtain the Magnet Charm",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x00010075 // MapID
                   || MapID == 0x00020075 ) // Alt MapID
                   && prev(bit3(0x008219)) == 0 // Flags check
                   && bit3(0x008219) == 1
                )
            )
            
 achievement(title = "Venus Lord",
                description = "Defeat the Venus Grand Djinni and obtain the Bane Charm",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x012901fe // MapID
                   && prev(bit0(0x008114)) == 0 // Flags check
                   && bit0(0x008114) == 1
                )
            )            
            
//Mercury
//--- ---            
            
 achievement(title = "Foam Charm",
                description = "Obtain the Foam Charm",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x0063004d // MapID
                   && prior(MapID) == 0x009d01fe
                   && prev(bit5(0x00815f)) == 0 // Flags check
                   && bit5(0x00815f) == 1
                )
            )            
 achievement(title = "Hail Charm",
                description = "Defeat the Mercury Mimic and obtain the Hail Charm",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x016101fe // MapID
                   && prev(bit1(0x008113)) == 0 // Flags check
                   && bit1(0x008113) == 1
                )
            )            
            
 achievement(title = "Cascade Charm",
                description = "Obtain the Cascade Charm",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x00010077 // MapID
                   || MapID == 0x00020077 ) // Alt MapID
                   && prev(bit5(0x00821a)) == 0 // Flags check
                   && bit5(0x00821a) == 1
                )
            )            
            
 achievement(title = "Geyser & Simoom Charms",
                description = "Defeat the Djinn Kahuna and obtain the Geyser & Simoom Charms",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00050086 // MapID
                   && prior(MapID) == 0x012d01fe
                   && prev(bit0(0x00815a)) == 0 // Flags check
                   && bit0(0x00815a) == 1
                )
            )            
            
            
//Mars
//--- ---             
 achievement(title = "Glare Charm",
                description = "Obtain the Glare Charm",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x0005002d // MapID
                   || MapID == 0x0004002d  // Alt MapID
                   || MapID == 0x000e002d  // Alt MapID
                   || MapID == 0x000d002d ) // Alt MapID
                   && prev(bit3(0x00822b)) == 0 // Flags check
                   && bit3(0x00822b) == 1
                )
            )
            
            
 achievement(title = "Scorch Charm",
                description = "Defeat the Mars Mimic and obtain the Scorch Charm",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x016301fe // MapID
                   && prev(bit2(0x008113)) == 0 // Flags check
                   && bit2(0x008113) == 1
                )
            )
            
 achievement(title = "Brand Charm [m]",
                description = "Obtain the Brand Charm as a reward for being the Colosso Champion",
                points = 2,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x0021008a // MapID
                   && (IsaacInventoryCheck(0xa4) //Brand Charm inventory check
                   || GaretInventoryCheck(0xa4) //Brand Charm inventory check
                   || IvanInventoryCheck(0xa4) //Brand Charm inventory check
                   || MiaInventoryCheck(0xa4) ) //Brand Charm inventory check
                )
            )  
            
 achievement(title = "Sauna Charm",
                description = "Obtain the Sauna Charm",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x00010074 // MapID
                   || MapID == 0x00020074 )// Alt MapID
                   && prev(bit7(0x008218)) == 0 // Flags check
                   && bit7(0x008218) == 1
                )
            )
            
            
//Jupiter
//--- ---               
 achievement(title = "Blether Charm",
                description = "Obtain the Blether Charm",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00020030 // MapID
                   && prev(bit5(0x00822b)) == 0 // Flags check
                   && bit5(0x00822b) == 1
                )
            )
            
 achievement(title = "Kite Charm",
                description = "Obtain the Kite Charm",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00060067 // MapID
                   && prev(bit6(0x008230)) == 0 // Flags check
                   && bit6(0x008230) == 1
                )
            )
            
 achievement(title = "Luff Charm",
                description = "Defeat the Jupiter Mimic and obtain the Kite Charm",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x016201fe // MapID
                   && prev(bit3(0x008113)) == 0 // Flags check
                   && bit3(0x008113) == 1
                )
            )
//----------------
// Djinn Collection

//Venus
//--- ---
 achievement(title = "Flint",
                description = "Find the Flint Djinn",
                points = 1,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00010002 // MapID
                   && prev(bit0(0x008046)) == 0 // Flags check
                   && bit0(0x008046) == 1
                )
            )
            
 achievement(title = "Chasm",
                description = "Find the Chasm Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00080024 // MapID
                   && prev(bit1(0x008046)) == 0 // Flags check
                   && bit1(0x008046) == 1
                )
            )            
            
 achievement(title = "Mineral",
                description = "Find the Mineral Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x000a0045 // MapID
                   || MapID == 0x000b0045
                   || MapID == 0x000c0045 )
                   && prev(bit2(0x008046)) == 0 // Flags check
                   && bit2(0x008046) == 1
                )
            )
            
 achievement(title = "Vine",
                description = "Find the Vine Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00350002 // MapID
                   && prev(bit3(0x008046)) == 0 // Flags check
                   && bit3(0x008046) == 1
                )
            )            

 achievement(title = "Curare",
                description = "Find the Curare Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x000e0017 // MapID
                   && prev(bit4(0x008046)) == 0 // Flags check
                   && bit4(0x008046) == 1
                )
            )
            
 achievement(title = "Java",
                description = "Find the Java Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x0004006b // MapID
                   && prev(bit5(0x008046)) == 0 // Flags check
                   && bit5(0x008046) == 1
                )
            )
            
            
 achievement(title = "Putrid",
                description = "Find the Putrid Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x00010078 // MapID
                   || MapID == 0x00020078 )
                   && prev(bit6(0x008046)) == 0 // Flags check
                   && bit6(0x008046) == 1
                )
            )            
//Mercury
//--- ---     

 achievement(title = "Shiver",
                description = "Find the Shiver Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x000a0037 // MapID
                   && prev(bit5(0x008048)) == 0 // Flags check
                   && bit5(0x008048) == 1
                )
            )

 achievement(title = "Angler",
                description = "Find the Angler Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x00010048 // MapID
                   || MapID == 0x00080048
                   || MapID == 0x00050048
                   || MapID == 0x000b0048
                   || MapID == 0x00090048
                   || MapID == 0x00070048
                   || MapID == 0x00060048
                   || MapID == 0x000a0048 ) //Alt MapID
                   && prev(bit6(0x008048)) == 0 // Flags check
                   && bit6(0x008048) == 1
                )
            )
            
 achievement(title = "Rapid",
                description = "Find the Rapid Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x00010053 // MapID
                   || MapID == 0x00020053 ) //Alt MapID
                   && prev(bit7(0x008048)) == 0 // Flags check
                   && bit7(0x008048) == 1
                )
            )            
            
 achievement(title = "Flurry",
                description = "Find the Flurry Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00180002
                   && prev(bit0(0x008049)) == 0 // Flags check
                   && bit0(0x008049) == 1
                )
            )            

 achievement(title = "Wade",
                description = "Find the Wade Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x001700a1
                   && prev(bit1(0x008049)) == 0 // Flags check
                   && bit1(0x008049) == 1
                )
            )      
            
 achievement(title = "Mercury Lord",
                description = "Defeat the Mercury Grand Djinni and find the Dew Djinn",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x017001fe
                   && prev(bit4(0x008114)) == 0 // Flags check
                   && bit4(0x008114) == 1
                )
            )            
            
            
//Mars
//--- ---   
 achievement(title = "Smith",
                description = "Find the Smith Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x0003001b
                   || MapID == 0x0002001b )
                   && prev(bit0(0x00804b)) == 0 // Flags check
                   && bit0(0x00804b) == 1
                )
            )

 achievement(title = "Blanket",
                description = "Find the Blanket Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00010034
                   && prev(bit1(0x00804b)) == 0 // Flags check
                   && bit1(0x00804b) == 1
                )
            )
 achievement(title = "Mica",
                description = "Find the Mica Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x000e0002
                   && prev(bit2(0x00804b)) == 0 // Flags check
                   && bit2(0x00804b) == 1
                )
            )
            
 achievement(title = "Fatigue",
                description = "Find the Fatigue Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x0003009c
                   || MapID == 0x0004009c )
                   && prev(bit3(0x00804b)) == 0 // Flags check
                   && bit3(0x00804b) == 1
                )
            )            

 achievement(title = "Glint",
                description = "Find the Glint Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x00010087
                   || MapID == 0x00140087 
                   || MapID == 0x00080087
                   || MapID == 0x00090087 
                   || MapID == 0x000a0087 
                   || MapID == 0x00020087 
                   || MapID == 0x00030087 
                   || MapID == 0x00040087 
                   || MapID == 0x00050087 
                   || MapID == 0x000d0087 
                   || MapID == 0x00060087 
                   || MapID == 0x00070087 
                   || MapID == 0x000b0087 
                   || MapID == 0x000c0087 )
                   && prev(bit4(0x00804b)) == 0 // Flags check
                   && bit4(0x00804b) == 1
                )
            )

 achievement(title = "Mars Lord",
                description = "Defeat the Mars Grand Djinni and find the Mirage Djinn",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x017501fe
                   && prev(bit7(0x008114)) == 0 // Flags check
                   && bit7(0x008114) == 1
                )
            )
            
            
 achievement(title = "Arid",
                description = "Find the Arid Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x000b00b2
                   && prev(bit6(0x00804b)) == 0 // Flags check
                   && bit6(0x00804b) == 1
                )
            )
//Jupiter
//--- ---     
 achievement(title = "Seep",
                description = "Find the Seep Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x00030020
                   && prev(bit4(0x00804d)) == 0 // Flags check
                   && bit4(0x00804d) == 1
                )
            )


 achievement(title = "Jolt",
                description = "Find the Jolt Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x0005002e
                   || MapID == 0x0008002e )
                   && prev(bit5(0x00804d)) == 0 // Flags check
                   && bit5(0x00804d) == 1
                )
            )

 achievement(title = "Breeze",
                description = "Find the Breeze Djinn",
                points = Easy,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x0002003f
                   || MapID == 0x0001003f )
                   && prev(bit6(0x00804d)) == 0 // Flags check
                   && bit6(0x00804d) == 1
                )
            )
            
            
 achievement(title = "Swill",
                description = "Find the Swill Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x0001005a
                   || MapID == 0x0002005a )
                   && prev(bit7(0x00804d)) == 0 // Flags check
                   && bit7(0x00804d) == 1
                )
            )

 achievement(title = "Draft",
                description = "Find the Draft Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x0005005e
                   || MapID == 0x0007005e )
                   && prev(bit0(0x00804e)) == 0 // Flags check
                   && bit0(0x00804e) == 1
                )
            )

 achievement(title = "Boom",
                description = "Find the Boom Djinn",
                points = 3,
                trigger = 
                (   SaveProtection()
                   && (MapID == 0x001e0095
                   || MapID == 0x001f0095 )
                   && prev(bit1(0x00804e)) == 0 // Flags check
                   && bit1(0x00804e) == 1
                )
            )

 achievement(title = "Jupiter Lord",
                description = "Defeat the Jupiter Grand Djinni and find the Filter Djinn",
                points = Medium,
                trigger = 
                (   SaveProtection()
                   && MapID == 0x017b01fe
                   && prev(bit3(0x008115)) == 0 // Flags check
                   && bit3(0x008115) == 1
                )
            )




















