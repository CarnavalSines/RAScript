// Zone of the Enders: The 2nd Runner
// #ID = 19078

// 20231106 Version - Sines

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


// $1C4F50: Extra Mission Timer Pointer
//          +0xF0=Timer [50 FPS] (Counts Up)
// $20D0B4: Extra Mission Timer Pointer
//          +0xA8=Timer [50 FPS] (Counts Up)
// $20E1A8: Area ID? (ASCII Text)
//          ntitle = title screen
//          ca01 = Callisto
// $2176B0: Player Pointer
//          +0xA64=Player 1 Health
// $2176B4: Versus Mode Opponent Pointer
//          +0xA64=Versus Mode Opponent Health
// $10A436B: Ada Lines - Destroying Wrong Container (Dynamic?)
// $10A450F: Containers Destroyed Count (Dynamic?)
// $1FE1958: Game Clears?
// $1FE1970: Bit 0 - Demo Caption
//           Bit 1 - Vibration Off
//           Bit 3 - Monaural
//           Bit 4 - Game Caption Off
//           Bit 5 - Score Display On
// $1FE197C: Difficulty (Clone)
//           0x01=Easy
//           0x02=Easy (Only On Title Screen?)
//           0x03=Normal
//           0x04=Hard
//           0x05=Very Hard
//           0x06=Extreme
// $1FE1988: Language
//           0x01=English
//           0x02=French
//           0x03=German
//           0x04=Italian
//           0x05=Spanish
// $1FE1994: X Screen Adjustment
// $1FE19A0: Y Screen Adjustment
// $1FE19AC: Story Progress
// $1FE19D0: Area ID (ASCII Text)
//           ntitle = Title Screen
//           result = Results Screen
// $1FE1A30: Total Continues Used
// $1FE1A3C: Total Saves
// $1FE1A48: Elapsed Time - Full Game [32-Bit]
// $1FE1A54: Elapsed Time - Current Area
// $1FE7A60: Player Level
// $1FE7A6C: NRG (Health) (Static Clone) [32-Bit]
// $1FE7A78: Max NRG (Health) [32-Bit]
// $1FE7A84: Sub. Energy (Static Clone) [32-Bit]
// $1FE7A90: Max Sub Energy (Static Clone) [32-Bit]
// $1FE7AE4: Jehuty ID
//           0x00=Jehuty
//           0x01=Jehuty Ver. 2
//           0x02=Damaged Jehuty
//           0x03=?
//           0x04=Naked Jehuty
// $1FE7B08: Grab Obtained (01)
// $1FE7B0C: Geyser Obtained (01)
// $1FE7B10: Comet Obtained (01)
// $1FE7B14: Gauntlet Obtained (01)
// $1FE7B18: Decoy Obtained (01)
// $1FE7B1C: Vector Cannon Obtained (01)
// $1FE7B20: Homing Missile Obtained (01)
// $1FE7B24: Wisp Obtained (01)
// $1FE7B28: Floating Mine Obtained (01)
// $1FE7B2C: Zero Shift Obtained (01)
// $1FE7B30: Phalanx Obtained (01)
// $1FE7B34: Halberd Obtained (01)
// $1FE7B38: Mummy Obtained (01)
// $1FE7C40: Enemies Destroyed at Long Range? [32-Bit]
//           Add together with 0x01fe7c40
// $1FE7C4C: Enemies Destroyed at Close Range? [32-Bit]
//           Add together with 0x01fe7c40
// $1FE7E5C: Max Consecutive Attacks
// $1FE7E8C: Experience Points [32-Bit]
// $1FE7E98: Experience to Next Level [32-Bit]
// $1FE7EEC: Score [32-Bit]
// $1FE81F8: VR Training Tutorials Done
//           Bit 0 - Move
//           Bit 1 - Normal Attack
//           Bit 2 - Dash Attack
//           Bit 3 - Burst Attack
//           Bit 4 - Guard
//           Bit 5 - Lock-on
//           Bit 6 - Ring Radar
//           Bit 7 - Combo Smash
// $1FE81F9: VR Training Tutorials Done
//           Bit 0 - Camera
//           Bit 1 - Grab Object
//           Bit 2 - Grab Enemy
//           Bit 3 -
//           Bit 4 -
//           Bit 5 -
//           Bit 6 -
//           Bit 7 -
// $1FE821C: Jehuty Versus Character Unlocked (01)
// $1FE8220: Jehuty Ver. 2 Versus Character Unlocked (01)
// $1FE8224: Damaged Jehuty Versus Character Unlocked (01)
// $1FE8228: Naked Jehuty Versus Character Unlocked (01)
// $1FE822C: Vic Viper Versus Character Unlocked (01)
// $1FE8230: Ardjet Versus Character Unlocked (01)
// $1FE8234: Nephtis Versus Character Unlocked (01)
// $1FE8238: Inhert Versus Character Unlocked (01)
// $1FE823C: Aumaan Anubis Versus Character Unlocked (01)
// $1FE8240: Anubis Versus Character Unlocked (01)
// $1FE82C4: Extra Missions Status:
//           Jehuty > Battle > Normal > Stage 01
//           0x01=New
//           0x02=Played
//           0x03=Clear!
//           0x04=High
//           0x05=Locked
// $1FE82C8: Extra Missions Status:
//           Jehuty > Battle > Normal > Stage 02
// $1FE82CC: Extra Missions Status:
//           Jehuty > Battle > Normal > Stage 03
// $1FE82D0: Extra Missions Status:
//           Jehuty > Battle > Normal > Stage 04
// $1FE82D4: Extra Missions Status:
//           Jehuty > Battle > Normal > Stage 05
// $1FE82D8: Extra Missions Status:
//           Jehuty > Battle > Normal > Stage 06
// $1FE82EC: Extra Missions Status:
//           Jehuty > Battle > Close Combat > Stage 01
// $1FE82F0: Extra Missions Status:
//           Jehuty > Battle > Close Combat > Stage 02
// $1FE82F4: Extra Missions Status:
//           Jehuty > Battle > Close Combat > Stage 03
// $1FE82F8: Extra Missions Status:
//           Jehuty > Battle > Close Combat > Stage 04
// $1FE82FC: Extra Missions Status:
//           Jehuty > Battle > Close Combat > Stage 05
// $1FE8300: Extra Missions Status:
//           Jehuty > Battle > Grab > Stage 01
// $1FE8304: Extra Missions Status:
//           Jehuty > Battle > Grab > Stage 02
// $1FE8308: Extra Missions Status:
//           Jehuty > Battle > Grab > Stage 03
// $1FE830C: Extra Missions Status:
//           Jehuty > Battle > Grab > Stage 04
// $1FE8310: Extra Missions Status:
//           Jehuty > Battle > Grab > Stage 05
// $1FE8314: Extra Missions Status:
//           Jehuty > Battle > Subweapon > Stage 01
// $1FE8318: Extra Missions Status:
//           Jehuty > Battle > Subweapon > Stage 02
// $1FE831C: Extra Missions Status:
//           Jehuty > Battle > Subweapon > Stage 03
// $1FE8320: Extra Missions Status:
//           Jehuty > Battle > Subweapon > Stage 04
// $1FE8324: Extra Missions Status:
//           Jehuty > Battle > Subweapon > Stage 05
// $1FE8328: Extra Missions Status:
//           Jehuty > Battle > No Lock-On > Stage 01
// $1FE832C: Extra Missions Status:
//           Jehuty > Battle > No Lock-On > Stage 02
// $1FE8330: Extra Missions Status:
//           Jehuty > Battle > No Lock-On > Stage 03
// $1FE8334: Extra Missions Status:
//           Jehuty > Battle > No Lock-On > Stage 04
// $1FE8338: Extra Missions Status:
//           Jehuty > Battle > No Lock-On > Stage 05
// $1FE8364: Extra Missions Status:
//           Jehuty > Original Event > Stage 01
// $1FE8368: Extra Missions Status:
//           Jehuty > Original Event > Stage 02
// $1FE836C: Extra Missions Status:
//           Jehuty > Original Event > Stage 03
// $1FE8370: Extra Missions Status:
//           Jehuty > Survival > Stage 01
// $1FE8374: Extra Missions Status:
//           Jehuty > Survival > Stage 02
// $1FE8378: Extra Missions Status:
//           Jehuty > Survival > Stage 03
// $1FE837C: Extra Missions Status:
//           Jehuty > Survival > Stage 04
// $1FE8380: Extra Missions Status:
//           Jehuty > Survival > Stage 05
// $1FE8384: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 01
// $1FE8388: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 02
// $1FE838C: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 03
// $1FE8390: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 04
// $1FE8394: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 05
// $1FE8398: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 06
// $1FE839C: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 07
// $1FE83A0: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 08
// $1FE83A4: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 09
// $1FE83A8: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 10
// $1FE83AC: Extra Missions Status:
//           Jehuty > Boss Battle > Stage 11
// $1FE83B0: Extra Missions Status:
//           Jehuty > Boss Sequence > Stage 01
// $1FE83B4: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Normal > Stage 01
// $1FE83B8: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Normal > Stage 02
// $1FE83BC: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Normal > Stage 03
// $1FE83C0: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Normal > Stage 04
// $1FE83C4: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Normal > Stage 05
// $1FE83C8: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Normal > Stage 06
// $1FE83DC: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Close Combat > Stage 01
// $1FE83E0: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Close Combat > Stage 02
// $1FE83E4: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Close Combat > Stage 03
// $1FE83E8: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Close Combat > Stage 04
// $1FE83EC: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Close Combat > Stage 05
// $1FE83F0: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Grab > Stage 01
// $1FE83F4: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Grab > Stage 02
// $1FE83F8: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Grab > Stage 03
// $1FE83FC: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Grab > Stage 04
// $1FE8400: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Grab > Stage 05
// $1FE8404: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 01
// $1FE8408: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 02
// $1FE840C: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 03
// $1FE8410: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 04
// $1FE8414: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 05
// $1FE8418: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > No Lock-On > Stage 01
// $1FE841C: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 02
// $1FE8420: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 03
// $1FE8424: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 04
// $1FE8428: Extra Missions Status:
//           Jehuty Ver. 2 > Battle > Subweapon > Stage 05
// $1FE8454: Extra Missions Status:
//           Jehuty Ver. 2 > Original Evant > Stage 01
// $1FE8458: Extra Missions Status:
//           Jehuty Ver. 2 > Original Evant > Stage 02
// $1FE845C: Extra Missions Status:
//           Jehuty Ver. 2 > Original Evant > Stage 03
// $1FE8460: Extra Missions Status:
//           Jehuty Ver. 2 > Survival > Stage 01
// $1FE8464: Extra Missions Status:
//           Jehuty Ver. 2 > Survival > Stage 02
// $1FE8468: Extra Missions Status:
//           Jehuty Ver. 2 > Survival > Stage 03
// $1FE846C: Extra Missions Status:
//           Jehuty Ver. 2 > Survival > Stage 04
// $1FE8470: Extra Missions Status:
//           Jehuty Ver. 2 > Survival > Stage 05
// $1FE8474: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 01
// $1FE8478: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 02
// $1FE847C: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 03
// $1FE8480: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 04
// $1FE8484: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 05
// $1FE8488: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 06
// $1FE848C: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 07
// $1FE8490: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 08
// $1FE8494: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 09
// $1FE8498: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 10
// $1FE849C: Extra Missions Status:
//           Jehuty Ver. 2 > Boss Battle > Stage 11
// $1FE84A0: Extra Missions Status:
//           Damaged Jehuty > Battle > Normal > Stage 01
// $1FE84A4: Extra Missions Status:
//           Damaged Jehuty > Battle > Normal > Stage 02
// $1FE84A8: Extra Missions Status:
//           Damaged Jehuty > Battle > Normal > Stage 03
// $1FE84AC: Extra Missions Status:
//           Damaged Jehuty > Battle > Normal > Stage 04
// $1FE84B0: Extra Missions Status:
//           Damaged Jehuty > Battle > Normal > Stage 05
// $1FE84B4: Extra Missions Status:
//           Damaged Jehuty > Battle > Normal > Stage 06
// $1FE84C8: Extra Missions Status:
//           Damaged Jehuty > Battle > Close Combat > Stage 01
// $1FE84CC: Extra Missions Status:
//           Damaged Jehuty > Battle > Close Combat > Stage 02
// $1FE84D0: Extra Missions Status:
//           Damaged Jehuty > Battle > Close Combat > Stage 03
// $1FE84D4: Extra Missions Status:
//           Damaged Jehuty > Battle > Close Combat > Stage 04
// $1FE84D8: Extra Missions Status:
//           Damaged Jehuty > Battle > Close Combat > Stage 05
// $1FE84DC: Extra Missions Status:
//           Damaged Jehuty > Battle > Grab > Stage 01
// $1FE84E0: Extra Missions Status:
//           Damaged Jehuty > Battle > Grab > Stage 02
// $1FE84E4: Extra Missions Status:
//           Damaged Jehuty > Battle > Grab > Stage 03
// $1FE84E8: Extra Missions Status:
//           Damaged Jehuty > Battle > Grab > Stage 04
// $1FE84EC: Extra Missions Status:
//           Damaged Jehuty > Battle > Grab > Stage 05
// $1FE84F0: Extra Missions Status:
//           Damaged Jehuty > Battle > Subweapon > Stage 01
// $1FE84F4: Extra Missions Status:
//           Damaged Jehuty > Battle > Subweapon > Stage 02
// $1FE84F8: Extra Missions Status:
//           Damaged Jehuty > Battle > Subweapon > Stage 03
// $1FE84FC: Extra Missions Status:
//           Damaged Jehuty > Battle > Subweapon > Stage 04
// $1FE8500: Extra Missions Status:
//           Damaged Jehuty > Battle > Subweapon > Stage 05
// $1FE8540: Extra Missions Status:
//           Damaged Jehuty > Original Event > Stage 01
// $1FE8544: Extra Missions Status:
//           Damaged Jehuty > Original Event > Stage 02
// $1FE8548: Extra Missions Status:
//           Damaged Jehuty > Original Event > Stage 03
// $1FE854C: Extra Missions Status:
//           Damaged Jehuty > Survival > Stage 01
// $1FE8550: Extra Missions Status:
//           Damaged Jehuty > Survival > Stage 02
// $1FE8554: Extra Missions Status:
//           Damaged Jehuty > Survival > Stage 03
// $1FE8558: Extra Missions Status:
//           Damaged Jehuty > Survival > Stage 04
// $1FE855C: Extra Missions Status:
//           Damaged Jehuty > Survival > Stage 05
// $1FE8560: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 01
// $1FE8564: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 02
// $1FE8568: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 03
// $1FE856C: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 04
// $1FE8570: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 05
// $1FE8574: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 06
// $1FE8578: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 07
// $1FE857C: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 08
// $1FE8580: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 09
// $1FE8584: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 10
// $1FE8588: Extra Missions Status:
//           Damaged Jehuty > Boss Battle > Stage 11
// $1FE858C: Extra Missions Status:
//           Naked Jehuty > Battle > Normal > Stage 01
// $1FE8590: Extra Missions Status:
//           Naked Jehuty > Battle > Normal > Stage 02
// $1FE8594: Extra Missions Status:
//           Naked Jehuty > Battle > Normal > Stage 03
// $1FE8598: Extra Missions Status:
//           Naked Jehuty > Battle > Normal > Stage 04
// $1FE859C: Extra Missions Status:
//           Naked Jehuty > Battle > Normal > Stage 05
// $1FE85A0: Extra Missions Status:
//           Naked Jehuty > Battle > Normal > Stage 06
// $1FE85B4: Extra Missions Status:
//           Naked Jehuty > Battle > Close Combat > Stage 01
// $1FE85B8: Extra Missions Status:
//           Naked Jehuty > Battle > Close Combat > Stage 02
// $1FE85BC: Extra Missions Status:
//           Naked Jehuty > Battle > Close Combat > Stage 03
// $1FE85C0: Extra Missions Status:
//           Naked Jehuty > Battle > Close Combat > Stage 04
// $1FE85C4: Extra Missions Status:
//           Naked Jehuty > Battle > Close Combat > Stage 05
// $1FE85C8: Extra Missions Status:
//           Naked Jehuty > Battle > Grab > Stage 01
// $1FE85CC: Extra Missions Status:
//           Naked Jehuty > Battle > Grab > Stage 02
// $1FE85D0: Extra Missions Status:
//           Naked Jehuty > Battle > Grab > Stage 03
// $1FE85D4: Extra Missions Status:
//           Naked Jehuty > Battle > Grab > Stage 04
// $1FE85D8: Extra Missions Status:
//           Naked Jehuty > Battle > Grab > Stage 05
// $1FE85DC: Extra Missions Status:
//           Naked Jehuty > Battle > Subweapon > Stage 01
// $1FE85E0: Extra Missions Status:
//           Naked Jehuty > Battle > Subweapon > Stage 02
// $1FE85E4: Extra Missions Status:
//           Naked Jehuty > Battle > Subweapon > Stage 03
// $1FE85E8: Extra Missions Status:
//           Naked Jehuty > Battle > Subweapon > Stage 04
// $1FE85EC: Extra Missions Status:
//           Naked Jehuty > Battle > Subweapon > Stage 05
// $1FE85F0: Extra Missions Status:
//           Naked Jehuty > Battle > No Lock-On > Stage 01
// $1FE85F4: Extra Missions Status:
//           Naked Jehuty > Battle > No Lock-On > Stage 02
// $1FE85F8: Extra Missions Status:
//           Naked Jehuty > Battle > No Lock-On > Stage 03
// $1FE85FC: Extra Missions Status:
//           Naked Jehuty > Battle > No Lock-On > Stage 04
// $1FE8600: Extra Missions Status:
//           Naked Jehuty > Battle > No Lock-On > Stage 05
// $1FE8638: Extra Missions Status:
//           Naked Jehuty > Survival > Stage 01
// $1FE863C: Extra Missions Status:
//           Naked Jehuty > Survival > Stage 02
// $1FE8640: Extra Missions Status:
//           Naked Jehuty > Survival > Stage 03
// $1FE8644: Extra Missions Status:
//           Naked Jehuty > Survival > Stage 04
// $1FE8648: Extra Missions Status:
//           Naked Jehuty > Survival > Stage 05
// $1FE864C: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 01
// $1FE8650: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 02
// $1FE8654: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 03
// $1FE8658: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 04
// $1FE865C: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 05
// $1FE8660: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 06
// $1FE8664: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 07
// $1FE8668: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 08
// $1FE866C: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 09
// $1FE8670: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 10
// $1FE8674: Extra Missions Status:
//           Naked Jehuty > Boss Battle > Stage 11
// $1FE8678: Extra Missions Status:
//           Vic Viper > Zoradius > Stage 01
// $1FE9914: Extra Missions: High Score
//           Jehuty > Battle > Normal > Stage 1 > 1st Place (300 FPS)
// $1FEDC0C: Versus Player 1 ID? [32-Bit]
//           0xAF23CBCC=Jehuty
//           0x6D137B07=Jehuty Ver. 2
//           0xBD1052DA=Damaged Jehuty
//           0x13604383=Naked Jehuty
//           0xFC179E91=Vic Viper
//           0x7B0EDFB4=Ardjet
//           0xB966B14E=Nephtis
//           0x91ACE28D=Inhert
//           0x0D7B4239=Aumaan Anubis
//           0x9490AEA4=Anubis
// $1FEDC10: Versus Player 2 ID? [32-Bit]
// $1FEDC18: Versus: Player 1 Level
// $1FEDC1C: Versus: Player 2 Level
// $1FEDC20: Versus Time Limit
// $1FEDC24: Versus Matches
//           Total Matches Played
// $1FEDC28: Versus Matches
//           1P Wins
// $1FEDC2C: Versus Matches
//           Draws
// $1FEDC30: Versus Stage ID
//           0x00=Callisto
//           0x01= Margaritifer
//           0x02=Vascilia City
//           0x03=
//           0x04=The Way to Phobos
//           0x05=Aumaan
//           0x06=The Core of Aumaan
//           0x07=Wind Tunnel
//           0x08=Battle Arena
//           0x09=Antillia
// $1FEDC38: Aumann Crevasse - Destroyed LEVs
//           0=SS Rank
//           1-8=S Rank
//           9-20=A Rank
//           21-32=B Rank
//           33-40=C Rank
// $1FEDC44: Viscillia Event Rank
//           0x00=SS
//           0x01=S
//           0x02=A
//           0x03=B
//           0x04=C
// $1FEDC80: Ken Removed Her Top (01)
// $1FEDE20: EX Mission Files Found Bit String
//           Bit 0 - BAHRAM Battleship, Pt 1, Clear Enemies from Third Room, Backtrack to Second Room
//           Bit 1 - Margaritifer, After Vic Viper Battle
//           Bit 2 - Fortress Interior, Bottom of First Pillar Room
//           Bit 3 - Cargo Route, Pt 1, Underneath Structure
//           Bit 4 - Phobos Surface, Red Metal Area
//           Bit 5 - Margaritifer, After Vic Viper Battle, Timed Enemy Combat Reward
//           Bit 6 - Fortress Interior, Bottom of First Pillar Room
//           Bit 7 - Cargo Route, Pt 1, Hidden in Black Pillar
// $1FEDE21: EX Mission Files Found Bit String
//           Bit 0 - Phobos Surface, In the Sky
//           Bit 1 - Margaratifer, After Vic Viper Battle
//           Bit 2 - Fortress Interior, Bottom of Third Pillar Room
//           Bit 3 - Cargo Route, Pt 2, Atop Pillar
//           Bit 4 - Phobos Surface, Destroy Nephtises
//           Bit 5 - Margaritifer, After Vic Viper Battle
//           Bit 6 - Fortress Basement, Bottom of Inhert Battle Arena
//           Bit 7 - Cargo Route, Pt 2, Underneath Exit
// $1FEDE22: EX Mission Files Found Bit String
//           Bit 0 - Phobos Surface, Destroy Nephtises
//           Bit 1 - Results Screen, Complete the Game Twice
//           Bit 2 - Capri Canyon, Near West Lock
//           Bit 3 - Margaritifer, During Vic Viper Battle
//           Bit 4-7 - Unused
// $1FEF19C: Difficulty
//           0x01=Easy
//           0x02=Easy (Only On Title Screen?)
//           0x03=Normal
//           0x04=Hard
//           0x05=Very Hard
//           0x06=Extreme


///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

TitleScreen = 0x7469746e
VSTitleScreen = 0x69747376
VSModeMechID = {
                    "Jehuty":0xAF23CBCC,
                    "JehutyV2":0x6D137B07,
                    "JehutyDamaged":0xBD1052DA,
                    "JehutyNaked":0x13604383,
                    "VicViper":0xFC179E91,
                    "Ardjet":0x7B0EDFB4,
                    "Nephtis":0xB966B14E,
                    "Inhert":0x91ACE28D,
                    "AnubisAumaan":0x0D7B4239,
                    "Anubis":0x9490AEA4
                }



///Extra Missions
////Regular Jehuty
JehutyExtraMissionBattleNormalStart = 0x1fe82c4
JehutyExtraMissionBattleCloseStart = 0x1fe82ec
JehutyExtraMissionBattleGrabStart = 0x1fe8300
JehutyExtraMissionBattleSubStart = 0x1fe8314
JehutyExtraMissionBattleBlindStart = 0x1fe8328
JehutyExtraMissionOGStart = 0x1fe8364
JehutyExtraMissionSurvivalStart = 0x1fe8370
JehutyExtraMissionBossBattleStart = 0x1fe8384
JehutyExtraMissionBossRush = 0x1fe83b0

JehutyExtraMissionBattleNormalEnd = 0x1fe82d8
JehutyExtraMissionBattleCloseEnd = 0x1fe82fc
JehutyExtraMissionBattleGrabEnd = 0x1fe8310
JehutyExtraMissionBattleSubEnd = 0x1fe8324
JehutyExtraMissionBattleBlindEnd = 0x1fe8338
JehutyExtraMissionOGEnd = 0x1fe836c
JehutyExtraMissionSurvivalEnd = 0x1fe8380
JehutyExtraMissionBossBattleEnd = 0x1fe83ac

////JehutyV2
JehutyV2ExtraMissionBattleNormalStart = 0x1fe83b4
JehutyV2ExtraMissionBattleCloseStart = 0x1fe83dc
JehutyV2ExtraMissionBattleGrabStart = 0x1fe83f0
JehutyV2ExtraMissionBattleSubStart = 0x1fe8404
JehutyV2ExtraMissionBattleBlindStart = 0x1fe8418
JehutyV2ExtraMissionOGStart = 0x1fe8454
JehutyV2ExtraMissionSurvivalStart = 0x1fe8460
JehutyV2ExtraMissionBossBattleStart = 0x1fe8474

JehutyV2ExtraMissionBattleNormalEnd = 0x1fe83c8
JehutyV2ExtraMissionBattleCloseEnd = 0x1fe83ec
JehutyV2ExtraMissionBattleGrabEnd = 0x1fe8400
JehutyV2ExtraMissionBattleSubEnd = 0x1fe8414
JehutyV2ExtraMissionBattleBlindEnd = 0x1fe8428
JehutyV2ExtraMissionOGEnd = 0x1fe845c
JehutyV2ExtraMissionSurvivalEnd = 0x1fe8470
JehutyV2ExtraMissionBossBattleEnd = 0x1fe849c

////Damaged Jehuty
JehutyDamagedExtraMissionBattleNormalStart = 0x1fe84a0
JehutyDamagedExtraMissionBattleCloseStart = 0x1fe84c8
JehutyDamagedExtraMissionBattleGrabStart = 0x1fe84dc
JehutyDamagedExtraMissionBattleSubStart = 0x1fe84f0
JehutyDamagedExtraMissionOGStart = 0x1fe8540
JehutyDamagedExtraMissionSurvivalStart = 0x1fe854c
JehutyDamagedExtraMissionBossBattleStart = 0x1fe8560

JehutyDamagedExtraMissionBattleNormalEnd = 0x1fe84b4
JehutyDamagedExtraMissionBattleCloseEnd = 0x1fe84d8
JehutyDamagedExtraMissionBattleGrabEnd = 0x1fe84ec
JehutyDamagedExtraMissionBattleSubEnd = 0x1fe8500
JehutyDamagedExtraMissionOGEnd = 0x1fe8548
JehutyDamagedExtraMissionSurvivalEnd = 0x1fe855c
JehutyDamagedExtraMissionBossBattleEnd = 0x1fe8588

////Naked Jehuty
JehutyNakedExtraMissionBattleNormalStart = 0x1fe858c
JehutyNakedExtraMissionBattleCloseStart = 0x1fe85b4
JehutyNakedExtraMissionBattleGrabStart = 0x1fe85c8
JehutyNakedExtraMissionBattleSubStart = 0x1fe85dc
JehutyNakedExtraMissionBattleBlindStart = 0x1fe85f0
JehutyNakedExtraMissionOGStart = 0x1fe8364
JehutyNakedExtraMissionSurvivalStart = 0x1fe8638
JehutyNakedExtraMissionBossBattleStart = 0x1fe864c

JehutyNakedExtraMissionBattleNormalEnd = 0x1fe85a0
JehutyNakedExtraMissionBattleCloseEnd = 0x1fe85c4
JehutyNakedExtraMissionBattleGrabEnd = 0x1fe85d8
JehutyNakedExtraMissionBattleSubEnd = 0x1fe85ec
JehutyNakedExtraMissionBattleBlindEnd = 0x1fe8600
JehutyNakedExtraMissionOGEnd = 0x1fe836c
JehutyNakedExtraMissionSurvivalEnd = 0x1fe8648
JehutyNakedExtraMissionBossBattleEnd = 0x1fe8674

////
ZoradiusFlag = 0x1fe8678





//----------------
//Variable
/// Game Data
StoryProgress = word(0x1fe19ac)
Difficulty = byte(0x1fe197c)
AreaID = dword(0x1fe19d0)
Language = byte(0x1fe1988) // tbf if it impact memory, especially for Area ASCII

TotalContinues = byte(0x1fe1a30)
TotalSaves = byte(0x1fe1a3c)
TotalTime = dword(0x1fe1a48)
CurrentAreaTime = dword(0x1fe1a54)
LongRangeKills = dword(0x1fe7c40)
CloseRangeKills = dword(0x1fe7c4c)
TotalKills = (LongRangeKills + CloseRangeKills)
ConsecutiveHits = dword(0x1fe7e5c)
GameScore = dword(0x1fe7eec)

Score = dword(0x1fe7eec)
TutorialFlags1 = byte(0x1fe81f8) // Bit 0 - 7
TutorialFlags2 = byte(0x1fe81f9) // Bit 0 - 2

/// Player Data
PlayerHealthPointer = dword(0x2176b0)
PlayerHealthOffset = 0xA64
PlayerHealth = dword(PlayerHealthPointer + PlayerHealthOffset)
PlayerHealthClone = dword(0x01fe7a6c)
PlayerLevel = byte(0x1fe7a60)
JehutyID = byte(0x1fe7ae4)

GrabFlag = byte(0x1fe7b08)
GeyserFlag = byte(0x1fe7b0c)
CometFlag = byte(0x1fe7b10)
GauntletFlag = byte(0x1fe7b14)
DecoyFlag = byte(0x1fe7b18)
VectorFlag = byte(0x1fe7b1c)
HomingFlag = byte(0x1fe7b20)
WispFlag = byte(0x1fe7b24)
MineFlag = byte(0x1fe7b28)
ZeroShiftFlag = byte(0x1fe7b2c)
PhalanxFlag = byte(0x1fe7b30)
HalberdFlag = byte(0x1fe7b34)
MummyFlag = byte(0x1fe7b38)

AumannEventRank = byte(0x1fedc38) // 0 == SS Rank
ViscilliaEvent = byte(0x1fedc44) // 0 == SS Rank

TankTopKen = byte(0x1fedc80)


/// Versus Mode Data
VSModeP1ID = dword(0x1fedc0c)
VSModeP2ID = dword(0x1fedc10)

VSModeP1Level = byte(0x1fedc18)
VSModeP2Level = byte(0x1fedc1c)

VSModeP1Win = dword(0x1fedc28)
VSModeStageID = byte(0x1fedc30)
VSModeVSComFlag = byte(0x00217648)

//Function
function Damageless() => PlayerHealthClone < prev(PlayerHealthClone)
function SaveLoad() => prev(AreaID) == TitleScreen

///Mission Clear
function ExtraMissionCompleteSum(StartRange,EndRange) =>
    all_of(range(StartRange,EndRange,step=4), addr => dword(addr) > 2)

function PrevExtraMissionComplete(StartRange,EndRange) =>
    any_of(range(StartRange,EndRange,step=4), addr => prev(dword(addr)) < 3)

function ExtraMissionComplete(StartRange,EndRange) =>
         ExtraMissionCompleteSum(StartRange,EndRange)
      && PrevExtraMissionComplete(StartRange,EndRange)


///Mission Mastered
function ExtraMissionMastered(StartRange,EndRange) =>
    all_of(range(StartRange,EndRange,step=4), addr => dword(addr) == 4)

function PrevExtraMissionMastered(StartRange,EndRange) =>
    any_of(range(StartRange,EndRange,step=4), addr => prev(dword(addr)) < 4)

function CheevoEXMissionMastered(Title,Description,Start,End)
{
    achievement(title = Title,
                description = Description,
                points = 10,
                trigger = 
                           ExtraMissionMastered(Start,End)
                        && PrevExtraMissionMastered(Start,End)
                        && AreaID != 0xcdcdcdcd  // Boot Protection
                        && AreaID != 0x69747865  // Savefile Protection
                )
}

//----------------
///Achievement Code

// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---

achievement(title = "Dashing Through the Snow",
            description = "Find the source of the Metatron signature",
            points = 1,
            trigger = JehutyID == 0
                   && StoryProgress == 5
                   && prev(StoryProgress) == 4
                   && AreaID == 0x31306163
            )

achievement(title = "Mining Man",
            description = "Defeat Ardjet",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0x23
                   && prev(StoryProgress) == 0x22
                   && AreaID == 0x32306163
            )

achievement(title = "Getting the Hang of It",
            description = "Defeat Ardjet without taking damage",
            points = 10,
            trigger = trigger_when(
                      JehutyID == 0
                   && StoryProgress == 0x23
                   && prev(StoryProgress) == 0x22
                   && AreaID == 0x32306163
                   )
                   && (once(SaveLoad() && AreaID == 0x32306163) || once(StoryProgress == 0x22 && prev(StoryProgress) == 0x1e))
                   && never(AreaID == TitleScreen)
                   && never(Damageless())
                   )       

achievement(title = "Wrong Target",
            description = "Defeat Nephtis",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0x36
                   && prev(StoryProgress) == 0x33
                   && AreaID == 0x32306162
            )

  



achievement(title = "Get Your Ass to Mars",
            description = "Get Taper to the shooter and escape the station",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0x56
                   && prev(StoryProgress) == 0x55
                   && AreaID == 0x32307364
            )

achievement(title = "Be Careful Who You Call Ugly in High School",
            description = "Defeat Vic Viper",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0x63
                   && prev(StoryProgress) == 0x62
                   && AreaID == 0x31306e77
            )

achievement(title = "What is This, Gradius?",
            description = "Defeat Vic Viper without taking damage",
            points = 10,
            trigger = trigger_when(
                      JehutyID == 0
                   && StoryProgress == 0x63
                   && prev(StoryProgress) == 0x62
                   && AreaID == 0x31306e77
                   )
                   && (once(SaveLoad() && AreaID == 0x31306e77) || once(StoryProgress == 0x62 && prev(StoryProgress) == 0x61))
                   && never(AreaID == TitleScreen)
                   && never(Damageless())
                   )    

achievement(title = "Hardheaded",
            description = "Defeat Nephtis again",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0x7c
                   && prev(StoryProgress) == 0x79
                   && AreaID == 0x31306376
            )

achievement(title = "Mechanized Mithras",
            description = "Defeat Nephtis again without taking damage [Both Phases, restart on Phase 1]",
            points = 10,
            trigger = trigger_when(
                      JehutyID == 0
                   && StoryProgress == 0x63
                   && prev(StoryProgress) == 0x62
                   && AreaID == 0x31306376
                   )
                   && (once(SaveLoad() && AreaID == 0x32307963) || once(StoryProgress == 0x72 && prev(StoryProgress) == 0x71))
                   && never(AreaID == TitleScreen)
                   && never(repeated(2,Damageless()) && (AreaID == 0x32307963 || AreaID == 0x31306376))
                   
                   )    

achievement(title = "Rescue Operation",
            description = "Rescue the people and the LEVs in Viscillia",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0x81
                   && prev(StoryProgress) == 0x80
                   && AreaID == 0x32306376
            )

achievement(title = "Genius-Runner",
            description = "Rescue the people and the LEVs in Viscillia with an SS rank",
            points = 10,
            trigger = JehutyID == 0
                   && StoryProgress == 0x81
                   && prev(StoryProgress) == 0x80
                   && AreaID == 0x32306376
                   && ViscilliaEvent == 0
            )

achievement(title = "You Have Derailed",
            description = "Destroy the train",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0x8c
                   && prev(StoryProgress) == 0x8b
                   && AreaID == 0x31307274
            )

achievement(title = "I'm Trained For This",
            description = "Destroy the train in under 4 minutes",
            points = 10,
            trigger = trigger_when(JehutyID == 0
                   && StoryProgress == 0x8c
                   && prev(StoryProgress) == 0x8b
                   && AreaID == 0x31307274
                   )
                   && once(CurrentAreaTime == 0 && AreaID == 0x31307274 && StoryProgress == 0x8b)
                   && never(CurrentAreaTime > 12000) // 12000 frames x 50 fps == 4 minutes
            )            

achievement(title = "Real Men Don't Ask Directions",
            description = "Follow Ken's directions to reach Lloyd's laboroatory without taking damage",
            points = 5,
            trigger = trigger_when(
                      JehutyID == 0
                   && StoryProgress == 0xa6
                   && prev(StoryProgress) == 0xa5
                   && AreaID == 0x31306568
                   )
                   && (once(SaveLoad() && AreaID == 0x31306568 && StoryProgress == 0xa5) || once(StoryProgress == 0xa5 && prev(StoryProgress) == 0xa4))
                   && never(AreaID == TitleScreen)
                   && never(Damageless())
                   )  

achievement(title = "Imhotep... Imhotep...",
            description = "Collect the Mummy subweapon",
            points = 3,
            trigger = JehutyID == 0
                   && StoryProgress == 0xa9
                   && AreaID == 0x31306366
                   && MummyFlag == 1
                   && prev(MummyFlag) == 0
            )


achievement(title = "Oh, Goodie! My Illudium Q-36 Space Modulator!",
            description = "Defeat Inhert and escape the laboratory",
            points = 10,
            trigger = JehutyID == 0
                   && StoryProgress == 0xb5
                   && prev(StoryProgress) == 0xb4
                   && AreaID == 0x32307266
            )

achievement(title = "Rendered Completely Inhert",
            description = "Defeat Inhert without taking damage [Both Phases, restart on Phase 1]",
            points = 10,
            trigger = trigger_when(
                      JehutyID == 0
                   && StoryProgress == 0xb5
                   && prev(StoryProgress) == 0xb4
                   && AreaID == 0x32307266
                   )
                   && (once(SaveLoad() && AreaID == 0x32307266 && StoryProgress == 0xb1) || once(StoryProgress == 0xb1 && prev(StoryProgress) == 0xb0))
                   && never(AreaID == TitleScreen)
                   && never(Damageless())
                   )  

achievement(title = "Nohwaiman!",
            description = "Escape from Anubis without taking any damage",
            points = 10,
            trigger = trigger_when(
                      JehutyID == 0
                   && StoryProgress == 0xbb
                   && prev(StoryProgress) == 0xba
                   && AreaID == 0x34307266
                   )
                   && (once(SaveLoad() && AreaID == 0x34307266 && StoryProgress == 0xba) || once(StoryProgress == 0xba && prev(StoryProgress) == 0xb9))
                   && never(AreaID == TitleScreen)
                   && never(Damageless())
                   )  


achievement(title = "One Mech Army",
            description = "Destroy the enemy armada",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0xc1
                   && prev(StoryProgress) == 0xc0
                   && AreaID == 0x31306661
            )

achievement(title = "White Devil",
            description = "Destroy the enemy armada in under 5 minutes",
            points = 10,
            trigger = trigger_when(JehutyID == 0
                   && StoryProgress == 0xc1
                   && prev(StoryProgress) == 0xc0
                   && AreaID == 0x31306661
                   )
                   && once(CurrentAreaTime == 0 && AreaID == 0x31306661 && StoryProgress == 0xc0)
                   && never(CurrentAreaTime > 15000) // 15000 frames x 50 fps == 5 minutes
            )   

achievement(title = "Damn! This Must Finish!",
            description = "Defeat Zakat",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0xc4
                   && prev(StoryProgress) == 0xc3
                   && AreaID == 0x32306661
            )

achievement(title = "Son, You've Got a Way To Fall",
            description = "Defeat Zakat without taking damage?",
            points = 10,
            trigger = trigger_when(
                      JehutyID == 0
                   && StoryProgress == 0xc4
                   && prev(StoryProgress) == 0xc3
                   && AreaID == 0x32306661
                   )
                   && (once(SaveLoad() && AreaID == 0x32306661 && StoryProgress == 0xc3) || once(StoryProgress == 0xc3 && prev(StoryProgress) == 0xc1))
                   && never(AreaID == TitleScreen)
                   && never(Damageless())
                   )  

achievement(title = "ReLEVant Issues",
            description = "Cross the Aumann Crevasse successfully",
            points = 5,
            trigger = JehutyID == 0
                   && StoryProgress == 0xd4
                   && prev(StoryProgress) == 0xd3
                   && AreaID == 0x31306663
            )

achievement(title = "MaLEVolant Intent",
            description = "Destroy all 40 LEVs",
            points = 10,
            trigger = JehutyID == 0
                   && StoryProgress == 0xd3
                   && AreaID == 0x31306663
                   && AumannEventRank == 40
                   && prev(AumannEventRank) == 0
            )


achievement(title = "AlLEViating Your Worries",
            description = "Cross the Aumann Crevasse successfully with an SS rank",
            points = 10,
            trigger = JehutyID == 0
                   && StoryProgress == 0xd4
                   && prev(StoryProgress) == 0xd3
                   && AreaID == 0x31306663
                   && AumannEventRank == 0
            )

achievement(title = "Maybe the Dingo Ate Your Baby",
            description = "Fight off Anubis...?",
            points = 5,
            trigger = JehutyID == 1
                   && StoryProgress == 0xe9
                   && prev(StoryProgress) == 0xe8
                   && AreaID == 0x31306166
            )

achievement(title = "Honey I Compressed the Orbital Frames",
            description = "Defeat Anubis in compressed space",
            points = 5,
            trigger = JehutyID == 3
                   && StoryProgress == 0xf1
                   && prev(StoryProgress) == 0xf0
                   && AreaID == 0x31307363
            )

achievement(title = "Heavy Pressure",
            description = "Defeat Anubis in compressed space without taking damage",
            points = 10,
            trigger = trigger_when(
                      JehutyID == 3
                   && StoryProgress == 0xf1
                   && prev(StoryProgress) == 0xf0
                   && AreaID == 0x31307363
                   )
                   && (once(SaveLoad() && AreaID == 0x31307363 && StoryProgress == 0xf0) || once(StoryProgress == 0xf0 && prev(StoryProgress) == 0xec))
                   && never(AreaID == TitleScreen)
                   && never(Damageless())
                   )  

achievement(title = "Use Power For the Right Things",
            description = "Defeat Aumaan Anubis and destroy Aumaan!",
            points = 10,
            trigger = JehutyID == 4
                   && StoryProgress == 0xfe
                   && prev(StoryProgress) == 0xfd
                   && AreaID == 0x32306d61
            )

achievement(title = "Give My Regards to King Tut, Asshole!",
            description = "Defeat Aumaan Anubis for the last time without taking damage",
            points = 25,
            trigger = trigger_when(
                      JehutyID == 4
                   && StoryProgress == 0xfe
                   && prev(StoryProgress) == 0xfd
                   && AreaID == 0x32306d61
                   )
                   && (once(SaveLoad() && AreaID == 0x32306d61 && StoryProgress == 0xfd) || once(StoryProgress == 0xfd && prev(StoryProgress) == 0xfb))
                   && never(AreaID == TitleScreen)
                   && never(Damageless())
                   )  

achievement(title = "Bloodhound",
            description = "Find all 19 EX Mission Files",
            points = 10,
            trigger = measured((bitcount(0x1fede20) + bitcount(0x1fede21) + bit0(0x1fede22) + bit1(0x1fede22) + bit2(0x1fede22) + bit3(0x1fede22)) == 19)
                   && prev((bitcount(0x1fede20) + bitcount(0x1fede21) + bit0(0x1fede22) + bit2(0x1fede22) + bit3(0x1fede22))) == 18

            )
/// Ending Cheevos
achievement(title = "ADAversity",
            description = "Complete the game on Easy or higher difficulty",
            points = 2,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && Difficulty >= 1

            )

achievement(title = "ADAptive",
            description = "Complete the game on Normal or higher difficulty",
            points = 5,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && Difficulty >= 3

            )            

achievement(title = "ADAventerous",
            description = "Complete the game on Hard or higher difficulty",
            points = 10,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && Difficulty >= 4

            )

achievement(title = "ADAvancement",
            description = "Complete the game on Very Hard or higher difficulty",
            points = 25,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && Difficulty >= 5

            )   

achievement(title = "ADAmiration",
            description = "Complete the game on Extreme difficulty",
            points = 25,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && Difficulty == 6

            )    

achievement(title = "Zone of the Speeders",
            description = "Complete the game in under 3 hours",
            points = 10,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && TotalTime < 0x83d60 // 540 000 frames at 50fps == 3h

            )    

achievement(title = "Zone of the Survivors",
            description = "Complete the game with 0 continues",
            points = 10,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && TotalContinues == 0

            )     

achievement(title = "Zone of the Somewhat Reckless",
            description = "Complete the game with 15 saves or less",
            points = 10,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && TotalSaves <= 15

            )                                  

achievement(title = "Zone of the Blenders",
            description = "Complete the game having destroyed 3000 enemies or more",
            points = 10,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && TotalKills >= 3000

            )    

achievement(title = "Zone of the Martial Artists",
            description = "Complete the game with a max consecutive attacks chain of 500 or more",
            points = 25,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && ConsecutiveHits >= 500

            )   

achievement(title = "Zone of the Promiscuous",
            description = "Complete the game with a score of 500,000 points or more",
            points = 25,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && GameScore >= 500000

            )   

achievement(title = "Zone of the Rescuers",
            description = "Complete the game with an SS rank in both Vascilia and Melee events",
            points = 25,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && AumannEventRank == 0
                   && ViscilliaEvent == 0

            )    

achievement(title = "Zone of the SS's",
            description = "Complete the game with an overall SS rank - Due to technical limitation looking for the following: 5k+ Kills, 100+ Consecutive Attacks, SS Rank in both Events, 0 Continues, <50 Saves",
            points = 25,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && AumannEventRank == 0
                   && ViscilliaEvent == 0
                   && TotalKills >= 5000
                   && ConsecutiveHits >= 100
                   && TotalContinues == 0
                   && TotalSaves < 50

            )    

 achievement(title = "The Greatest Runner of the 22nd Century",
            description = "Complete the game with an overall SS rank on Extreme difficulty - Due to technical limitation looking for the following: 5k+ Kills, 100+ Consecutive Attacks, SS Rank in both Events, 0 Continues, <50 Saves",
            points = 50,
            trigger = StoryProgress == 0
                   && AreaID == 0x75736572 //Result Screen
                   && prev(AreaID) == 0x32646d61 // Credit rolls
                   && AumannEventRank == 0
                   && ViscilliaEvent == 0
                   && TotalKills >= 5000
                   && ConsecutiveHits >= 100
                   && TotalContinues == 0
                   && TotalSaves < 50
                   && Difficulty == 6

            )                                                
/// VS Mode Cheevos
achievement(title = "Dog Spotter",
            description = "Locate the hidden Aumaan Anubis Vs Mech",
            points = 5,
            trigger = 
                      byte(0x1fe823c) == 1
                   && prev(byte(0x1fe823c)) == 0   
                   && VSModeP2Level == 5
                   && AreaID != 0xcdcdcdcd  // Boot Protection
                   && AreaID != 0x69747865  // Savefile Protection
            )

achievement(title = "Chibi Robo",
            description = "Locate the hidden Inhert Vs Mech",
            points = 5,
            trigger = 
                      byte(0x1fe8238) == 1
                   && prev(byte(0x1fe8238)) == 0   
                   && VSModeP2Level == 5
                   && AreaID != 0xcdcdcdcd  // Boot Protection
                   && AreaID != 0x69747865  // Savefile Protection
            )

achievement(title = "Bird Watcher",
            description = "Locate the hidden Naked Jehuty Vs Mech",
            points = 5,
            trigger = 
                      byte(0x1fe8228) == 1
                   && prev(byte(0x1fe8228)) == 0   
                   && VSModeP2Level == 5
                   && AreaID != 0xcdcdcdcd  // Boot Protection
                   && AreaID != 0x69747865  // Savefile Protection
            )                        

achievement(title = "Old Reliable",
            description = "In Versus mode defeat the AI Jehuty [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["Jehuty"]
                   && VSModeVSComFlag == 1
            )

achievement(title = "New Jehuty Isn't For Show!",
            description = "In Versus mode defeat the AI Jehuty ver.2 [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["JehutyV2"]
                   && VSModeVSComFlag == 1
            )

achievement(title = "No Mercy",
            description = "In Versus mode defeat the AI Damaged Jehuty [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["JehutyDamaged"]
                   && VSModeVSComFlag == 1
            )

achievement(title = "Cover Yourself, Creep!",
            description = "In Versus mode defeat the AI Naked Jehuty [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["JehutyNaked"]
                   && VSModeVSComFlag == 1
            )

achievement(title = "Get In the Robot Leo",
            description = "In Versus mode defeat the AI Vic Viper [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["VicViper"]
                   && VSModeVSComFlag == 1
            )

achievement(title = "But Where Is Eliza ?",
            description = "In Versus mode defeat the AI Ardjet [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["Ardjet"]
                   && VSModeVSComFlag == 1
            )

achievement(title = "That Is Not Dead Which Can Eternal Lie",
            description = "In Versus mode defeat the AI Nephtis [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["Nephtis"]
                   && VSModeVSComFlag == 1
            )            

achievement(title = "Featuring Inhert From the SMT Series",
            description = "In Versus mode defeat the AI Inhert [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["Inhert"]
                   && VSModeVSComFlag == 1
            )       

achievement(title = "How Many Times Must I Do This Old Man!",
            description = "In Versus mode defeat the AI Aumaan Anubis [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["AnubisAumaan"]
                   && VSModeVSComFlag == 1
            )   

achievement(title = "Let the Sleeping Dogs Lie",
            description = "In Versus mode defeat the AI Anubis [P1 LV3 or lower, P2 LV 5]",
            points = 3,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP2ID == VSModeMechID["Anubis"]
                   && VSModeVSComFlag == 1
            )   


achievement(title = "Catharsis",
            description = "In Versus mode playing as Vic Viper defeat Anubis in the Antilia Map [P1 LV3 or lower, P2 LV 5]",
            points = 5,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP1ID == VSModeMechID["VicViper"]
                   && VSModeP2ID == VSModeMechID["Anubis"]
                   && VSModeStageID == 9
                   && VSModeVSComFlag == 1
            )   

achievement(title = "The Purpose of Dying",
            description = "In Versus mode playing as Nephtis defeat Vic Viper in the Antilia Map [P1 LV3 or lower, P2 LV 5]",
            points = 5,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP1ID == VSModeMechID["Nephtis"]
                   && VSModeP2ID == VSModeMechID["VicViper"]
                   && VSModeStageID == 9
                   && VSModeVSComFlag == 1
            )   

achievement(title = "Feeble of Body But Not of Mind",
            description = "In Versus mode playing as Damaged Jehuty defeat Aumaan Anubis in the Way to Phobos Map [P1 LV3 or lower, P2 LV 5]",
            points = 5,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP1ID == VSModeMechID["JehutyDamaged"]
                   && VSModeP2ID == VSModeMechID["AnubisAumaan"]
                   && VSModeStageID == 4
                   && VSModeVSComFlag == 1
            )   

achievement(title = "BEGONE THOTH",
            description = "In Versus mode playing as Ardjet defeat Jehuty [P1 LV3 or lower, P2 LV 5]",
            points = 5,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP1ID == VSModeMechID["Ardjet"]
                   && VSModeP2ID == VSModeMechID["Jehuty"]
                   && VSModeVSComFlag == 1
            )   

achievement(title = "Alternate Possibility",
            description = "In Versus mode playing as Aumaan Anubis defeat Naked Jehuty in the Core of Aumaan Map [P1 LV3 or lower, P2 LV 5]",
            points = 5,
            trigger = 
                      VSModeP1Level <= 3
                   && VSModeP2Level == 5
                   && VSModeP1Win > prev(VSModeP1Win)
                   && VSModeP1ID == VSModeMechID["AnubisAumaan"]
                   && VSModeP2ID == VSModeMechID["JehutyNaked"]
                   && VSModeStageID == 6
                   && VSModeVSComFlag == 1
            )   

///EX Missions

achievement(title = "Blue Bird Flies Away",
            description = "Complete all of Jehuty's extra missions",
            points = 25,
            trigger =  
                        ExtraMissionCompleteSum(JehutyExtraMissionBattleNormalStart,JehutyExtraMissionBattleNormalEnd)
                     && ExtraMissionCompleteSum(JehutyExtraMissionBattleCloseStart,JehutyExtraMissionBattleCloseEnd) 
                     && ExtraMissionCompleteSum(JehutyExtraMissionBattleGrabStart,JehutyExtraMissionBattleGrabEnd) 
                     && ExtraMissionCompleteSum(JehutyExtraMissionBattleSubStart,JehutyExtraMissionBattleSubEnd) 
                     && ExtraMissionCompleteSum(JehutyExtraMissionBattleBlindStart,JehutyExtraMissionBattleBlindEnd) 
                     && ExtraMissionCompleteSum(JehutyExtraMissionOGStart,JehutyExtraMissionOGEnd) 
                     && ExtraMissionCompleteSum(JehutyExtraMissionSurvivalStart,JehutyExtraMissionSurvivalEnd) 
                     && ExtraMissionCompleteSum(JehutyExtraMissionBossBattleStart,JehutyExtraMissionBossBattleEnd) 
                     && dword(JehutyExtraMissionBossRush) > 2
                     && (PrevExtraMissionComplete(JehutyExtraMissionBattleNormalStart,JehutyExtraMissionBattleNormalEnd)
                     || PrevExtraMissionComplete(JehutyExtraMissionBattleCloseStart,JehutyExtraMissionBattleCloseEnd)
                     || PrevExtraMissionComplete(JehutyExtraMissionBattleGrabStart,JehutyExtraMissionBattleGrabEnd)
                     || PrevExtraMissionComplete(JehutyExtraMissionBattleSubStart,JehutyExtraMissionBattleSubEnd)
                     || PrevExtraMissionComplete(JehutyExtraMissionBattleBlindStart,JehutyExtraMissionBattleBlindEnd)
                     || PrevExtraMissionComplete(JehutyExtraMissionOGStart,JehutyExtraMissionOGEnd)
                     || PrevExtraMissionComplete(JehutyExtraMissionSurvivalStart,JehutyExtraMissionSurvivalEnd)
                     || PrevExtraMissionComplete(JehutyExtraMissionBossBattleStart,JehutyExtraMissionBossBattleEnd)
                     || prev(dword(JehutyExtraMissionBossRush)) < 3
                     )
                     && AreaID != 0xcdcdcdcd  // Boot Protection
                     && AreaID != 0x69747865  // Savefile Protection
            )   

achievement(title = "Even Further Beyond",
            description = "Complete all of Jehuty Ver. 2's extra missions",
            points = 25,
            trigger =  
                        ExtraMissionCompleteSum(JehutyV2ExtraMissionBattleNormalStart,JehutyV2ExtraMissionBattleNormalEnd)
                     && ExtraMissionCompleteSum(JehutyV2ExtraMissionBattleCloseStart,JehutyV2ExtraMissionBattleCloseEnd) 
                     && ExtraMissionCompleteSum(JehutyV2ExtraMissionBattleGrabStart,JehutyV2ExtraMissionBattleGrabEnd) 
                     && ExtraMissionCompleteSum(JehutyV2ExtraMissionBattleSubStart,JehutyV2ExtraMissionBattleSubEnd) 
                     && ExtraMissionCompleteSum(JehutyV2ExtraMissionBattleBlindStart,JehutyV2ExtraMissionBattleBlindEnd) 
                     && ExtraMissionCompleteSum(JehutyV2ExtraMissionOGStart,JehutyV2ExtraMissionOGEnd) 
                     && ExtraMissionCompleteSum(JehutyV2ExtraMissionSurvivalStart,JehutyV2ExtraMissionSurvivalEnd) 
                     && ExtraMissionCompleteSum(JehutyV2ExtraMissionBossBattleStart,JehutyV2ExtraMissionBossBattleEnd) 
                     && (PrevExtraMissionComplete(JehutyV2ExtraMissionBattleNormalStart,JehutyV2ExtraMissionBattleNormalEnd)
                     || PrevExtraMissionComplete(JehutyV2ExtraMissionBattleCloseStart,JehutyV2ExtraMissionBattleCloseEnd)
                     || PrevExtraMissionComplete(JehutyV2ExtraMissionBattleGrabStart,JehutyV2ExtraMissionBattleGrabEnd)
                     || PrevExtraMissionComplete(JehutyV2ExtraMissionBattleSubStart,JehutyV2ExtraMissionBattleSubEnd)
                     || PrevExtraMissionComplete(JehutyV2ExtraMissionBattleBlindStart,JehutyV2ExtraMissionBattleBlindEnd)
                     || PrevExtraMissionComplete(JehutyV2ExtraMissionOGStart,JehutyV2ExtraMissionOGEnd)
                     || PrevExtraMissionComplete(JehutyV2ExtraMissionSurvivalStart,JehutyV2ExtraMissionSurvivalEnd)
                     || PrevExtraMissionComplete(JehutyV2ExtraMissionBossBattleStart,JehutyV2ExtraMissionBossBattleEnd)
                     )
                     && AreaID != 0xcdcdcdcd  // Boot Protection
                     && AreaID != 0x69747865  // Savefile Protection
            )    

achievement(title = "I Can Do This All Day",
            description = "Complete all of Damaged Jehuty's extra missions",
            points = 25,
            trigger =  
                        ExtraMissionCompleteSum(JehutyDamagedExtraMissionBattleNormalStart,JehutyDamagedExtraMissionBattleNormalEnd)
                     && ExtraMissionCompleteSum(JehutyDamagedExtraMissionBattleCloseStart,JehutyDamagedExtraMissionBattleCloseEnd) 
                     && ExtraMissionCompleteSum(JehutyDamagedExtraMissionBattleGrabStart,JehutyDamagedExtraMissionBattleGrabEnd) 
                     && ExtraMissionCompleteSum(JehutyDamagedExtraMissionBattleSubStart,JehutyDamagedExtraMissionBattleSubEnd) 
                     && ExtraMissionCompleteSum(JehutyDamagedExtraMissionOGStart,JehutyDamagedExtraMissionOGEnd) 
                     && ExtraMissionCompleteSum(JehutyDamagedExtraMissionSurvivalStart,JehutyDamagedExtraMissionSurvivalEnd) 
                     && ExtraMissionCompleteSum(JehutyDamagedExtraMissionBossBattleStart,JehutyDamagedExtraMissionBossBattleEnd) 
                     && (PrevExtraMissionComplete(JehutyDamagedExtraMissionBattleNormalStart,JehutyDamagedExtraMissionBattleNormalEnd)
                     || PrevExtraMissionComplete(JehutyDamagedExtraMissionBattleCloseStart,JehutyDamagedExtraMissionBattleCloseEnd)
                     || PrevExtraMissionComplete(JehutyDamagedExtraMissionBattleGrabStart,JehutyDamagedExtraMissionBattleGrabEnd)
                     || PrevExtraMissionComplete(JehutyDamagedExtraMissionBattleSubStart,JehutyDamagedExtraMissionBattleSubEnd)
                     || PrevExtraMissionComplete(JehutyDamagedExtraMissionOGStart,JehutyDamagedExtraMissionOGEnd)
                     || PrevExtraMissionComplete(JehutyDamagedExtraMissionSurvivalStart,JehutyDamagedExtraMissionSurvivalEnd)
                     || PrevExtraMissionComplete(JehutyDamagedExtraMissionBossBattleStart,JehutyDamagedExtraMissionBossBattleEnd)
                     )
                     && AreaID != 0xcdcdcdcd  // Boot Protection
                     && AreaID != 0x69747865  // Savefile Protection
            )   

achievement(title = "Clothing Optional",
            description = "Complete all of Naked Jehuty's extra missions",
            points = 25,
            trigger =  
                        ExtraMissionCompleteSum(JehutyNakedExtraMissionBattleNormalStart,JehutyNakedExtraMissionBattleNormalEnd)
                     && ExtraMissionCompleteSum(JehutyNakedExtraMissionBattleCloseStart,JehutyNakedExtraMissionBattleCloseEnd) 
                     && ExtraMissionCompleteSum(JehutyNakedExtraMissionBattleGrabStart,JehutyNakedExtraMissionBattleGrabEnd) 
                     && ExtraMissionCompleteSum(JehutyNakedExtraMissionBattleSubStart,JehutyNakedExtraMissionBattleSubEnd) 
                     && ExtraMissionCompleteSum(JehutyNakedExtraMissionBattleBlindStart,JehutyNakedExtraMissionBattleBlindEnd) 
                     && ExtraMissionCompleteSum(JehutyNakedExtraMissionOGStart,JehutyNakedExtraMissionOGEnd) 
                     && ExtraMissionCompleteSum(JehutyNakedExtraMissionSurvivalStart,JehutyNakedExtraMissionSurvivalEnd) 
                     && ExtraMissionCompleteSum(JehutyNakedExtraMissionBossBattleStart,JehutyNakedExtraMissionBossBattleEnd) 
                     && (PrevExtraMissionComplete(JehutyNakedExtraMissionBattleNormalStart,JehutyNakedExtraMissionBattleNormalEnd)
                     || PrevExtraMissionComplete(JehutyNakedExtraMissionBattleCloseStart,JehutyNakedExtraMissionBattleCloseEnd)
                     || PrevExtraMissionComplete(JehutyNakedExtraMissionBattleGrabStart,JehutyNakedExtraMissionBattleGrabEnd)
                     || PrevExtraMissionComplete(JehutyNakedExtraMissionBattleSubStart,JehutyNakedExtraMissionBattleSubEnd)
                     || PrevExtraMissionComplete(JehutyNakedExtraMissionBattleBlindStart,JehutyNakedExtraMissionBattleBlindEnd)
                     || PrevExtraMissionComplete(JehutyNakedExtraMissionOGStart,JehutyNakedExtraMissionOGEnd)
                     || PrevExtraMissionComplete(JehutyNakedExtraMissionSurvivalStart,JehutyNakedExtraMissionSurvivalEnd)
                     || PrevExtraMissionComplete(JehutyNakedExtraMissionBossBattleStart,JehutyNakedExtraMissionBossBattleEnd)
                     )
                     && AreaID != 0xcdcdcdcd  // Boot Protection
                     && AreaID != 0x69747865  // Savefile Protection
            )    


//// Jehuty
CheevoEXMissionMastered("Jehuty Pro Fighter","Earn 1st place in all Jehuty | Battle | Normal extra missions",JehutyExtraMissionBattleNormalStart,JehutyExtraMissionBattleNormalEnd)

CheevoEXMissionMastered("Jehuty CQC Master","Earn 1st place in all of Jehuty | Battle | Close Combat extra missions",JehutyExtraMissionBattleCloseStart,JehutyExtraMissionBattleCloseEnd)

CheevoEXMissionMastered("Jehuty Grappling Expert","Earn 1st place in all Jehuty | Battle | Grab extra missions",JehutyExtraMissionBattleGrabStart,JehutyExtraMissionBattleGrabEnd)

CheevoEXMissionMastered("Jehuty Arsenal Gear","Earn 1st place in all Jehuty | Battle | Subweapon extra missions",JehutyExtraMissionBattleSubStart,JehutyExtraMissionBattleSubEnd)

CheevoEXMissionMastered("Jehuty Blind Fighting","Earn 1st place in all Jehuty | Battle | No Lock-On extra missions",JehutyExtraMissionBattleBlindStart,JehutyExtraMissionBattleBlindEnd)

CheevoEXMissionMastered("Jehuty of All Trades","Earn 1st place in all Jehuty | Original Event extra missions",JehutyExtraMissionOGStart,JehutyExtraMissionOGEnd)

CheevoEXMissionMastered("Jehuty Survivalist","Earn 1st place in all Jehuty | Survival extra missions",JehutyExtraMissionSurvivalStart,JehutyExtraMissionSurvivalEnd)

CheevoEXMissionMastered("Jehuty Duelist Savant","Earn 1st place in all Jehuty | Boss Battle extra missions",JehutyExtraMissionBossBattleStart,JehutyExtraMissionBossBattleEnd)

achievement(title = "Jehuty Boss Rush Expert",
            description = "Earn 1st place in the Jehuty | Boss Sequence extra mission",
            points = 25,
            trigger =  
                       dword(JehutyExtraMissionBossRush) == 4
                    && prev(dword(JehutyExtraMissionBossRush)) < 4
                    && AreaID != 0xcdcdcdcd  // Boot Protection
                    && AreaID != 0x69747865  // Savefile Protection
                    
                    
            )  

//// Jehuty V2
CheevoEXMissionMastered("Jehuty V2 Pro Fighter","Earn 1st place in all Jehuty V2 | Battle | Normal extra missions",JehutyV2ExtraMissionBattleNormalStart,JehutyV2ExtraMissionBattleNormalEnd)

CheevoEXMissionMastered("Jehuty V2 CQC Master","Earn 1st place in all of Jehuty V2 | Battle | Close Combat extra missions",JehutyV2ExtraMissionBattleCloseStart,JehutyV2ExtraMissionBattleCloseEnd)

CheevoEXMissionMastered("Jehuty V2 Grappling Expert","Earn 1st place in all Jehuty V2 | Battle | Grab extra missions",JehutyV2ExtraMissionBattleGrabStart,JehutyV2ExtraMissionBattleGrabEnd)

CheevoEXMissionMastered("Jehuty V2 Arsenal Gear","Earn 1st place in all Jehuty V2 | Battle | Subweapon extra missions",JehutyV2ExtraMissionBattleSubStart,JehutyV2ExtraMissionBattleSubEnd)

CheevoEXMissionMastered("Jehuty V2 Blind Fighting","Earn 1st place in all Jehuty V2 | Battle | No Lock-On extra missions",JehutyV2ExtraMissionBattleBlindStart,JehutyV2ExtraMissionBattleBlindEnd)

CheevoEXMissionMastered("Jehuty V2 of All Trades","Earn 1st place in all Jehuty V2 | Original Event extra missions",JehutyV2ExtraMissionOGStart,JehutyV2ExtraMissionOGEnd)

CheevoEXMissionMastered("Jehuty V2 Survivalist","Earn 1st place in all Jehuty V2 | Survival extra missions",JehutyV2ExtraMissionSurvivalStart,JehutyV2ExtraMissionSurvivalEnd)

CheevoEXMissionMastered("Jehuty V2 Duelist Savant","Earn 1st place in all Jehuty V2 | Boss Battle extra missions",JehutyV2ExtraMissionBossBattleStart,JehutyV2ExtraMissionBossBattleEnd)

//// Damaged Jehuty
CheevoEXMissionMastered("Damaged Pro Fighter","Earn 1st place in all Damaged Jehuty | Battle | Normal extra missions",JehutyDamagedExtraMissionBattleNormalStart,JehutyDamagedExtraMissionBattleNormalEnd)

CheevoEXMissionMastered("Damaged CQC Master","Earn 1st place in all of Damaged Jehuty | Battle | Close Combat extra missions",JehutyDamagedExtraMissionBattleCloseStart,JehutyDamagedExtraMissionBattleCloseEnd)

CheevoEXMissionMastered("Damaged Grappling Expert","Earn 1st place in all Damaged Jehuty | Battle | Grab extra missions",JehutyDamagedExtraMissionBattleGrabStart,JehutyDamagedExtraMissionBattleGrabEnd)

CheevoEXMissionMastered("Damaged Arsenal Gear","Earn 1st place in all Damaged Jehuty | Battle | Subweapon extra missions",JehutyDamagedExtraMissionBattleSubStart,JehutyDamagedExtraMissionBattleSubEnd)

CheevoEXMissionMastered("Damaged of All Trades","Earn 1st place in all Damaged Jehuty | Original Event extra missions",JehutyDamagedExtraMissionOGStart,JehutyDamagedExtraMissionOGEnd)

CheevoEXMissionMastered("Damaged Survivalist","Earn 1st place in all Damaged Jehuty | Survival extra missions",JehutyDamagedExtraMissionSurvivalStart,JehutyDamagedExtraMissionSurvivalEnd)

CheevoEXMissionMastered("Damaged Duelist Savant","Earn 1st place in all Damaged Jehuty | Boss Battle extra missions",JehutyDamagedExtraMissionBossBattleStart,JehutyDamagedExtraMissionBossBattleEnd)

//// Naked Jehuty
CheevoEXMissionMastered("Fight in the Nude","Earn 1st place in all Naked Jehuty | Battle | Normal extra missions",JehutyNakedExtraMissionBattleNormalStart,JehutyNakedExtraMissionBattleNormalEnd)

CheevoEXMissionMastered("Skin Contact","Earn 1st place in all of Naked Jehuty | Battle | Close Combat extra missions",JehutyNakedExtraMissionBattleCloseStart,JehutyNakedExtraMissionBattleCloseEnd)

CheevoEXMissionMastered("Watch Where You Grab","Earn 1st place in all Naked Jehuty | Battle | Grab extra missions",JehutyNakedExtraMissionBattleGrabStart,JehutyNakedExtraMissionBattleGrabEnd)

CheevoEXMissionMastered("Bits and Pieces","Earn 1st place in all Naked Jehuty | Battle | Subweapon extra missions",JehutyNakedExtraMissionBattleSubStart,JehutyNakedExtraMissionBattleSubEnd)

CheevoEXMissionMastered("Ultra Instinct","Earn 1st place in all Naked Jehuty | Battle | No Lock-On extra missions",JehutyNakedExtraMissionBattleBlindStart,JehutyNakedExtraMissionBattleBlindEnd)

CheevoEXMissionMastered("Going Commando","Earn 1st place in all Naked Jehuty | Original Event extra missions",JehutyNakedExtraMissionOGStart,JehutyNakedExtraMissionOGEnd)

CheevoEXMissionMastered("Expert Calibrations","Earn 1st place in all Naked Jehuty | Survival extra missions",JehutyNakedExtraMissionSurvivalStart,JehutyNakedExtraMissionSurvivalEnd)

CheevoEXMissionMastered("Ultimate Jehuty","Earn 1st place in all Naked Jehuty | Boss Battle extra missions",JehutyNakedExtraMissionBossBattleStart,JehutyNakedExtraMissionBossBattleEnd)

/// Zoradius
achievement(title = "Shoot the Core!",
            description = "Complete Zoradius",
            points = 5,
            trigger =  
                        dword(ZoradiusFlag) > 2 
                     && prev(dword(ZoradiusFlag)) < 3
                     && AreaID != 0xcdcdcdcd  // Boot Protection
                     && AreaID != 0x69747865  // Savefile Protection
            )   

achievement(title = "There Was Supposed to Be An Earth-Shattering Kaboom!",
            description = "Complete Zoradius with a first place score",
            points = 25,
            trigger =  
                        dword(ZoradiusFlag) == 4 
                     && prev(dword(ZoradiusFlag)) < 4
                     && AreaID != 0xcdcdcdcd  // Boot Protection
                     && AreaID != 0x69747865  // Savefile Protection
            )               

