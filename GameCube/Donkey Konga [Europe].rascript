// Donkey Konga [Europe]
// #ID = 28604
// 20240222 Version - Sines

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


// $127670: Main Menu Mode Selected [32-bit BE]
//          0x0 - Street Performance / Title
//          0x1 - Challenge
//          0x2 - Battle
//          0x3 - Jam Session
//          0x4 - Ape Arcade
//          0x5 - DK Town
// $127678: Menu - Street Performance - Mode Selected [32-bit BE]
//          0x0 - Monkey
//          0x1 - Chimp
//          0x2 - Gorilla
//          0x3 - Monkey - Jam
//          0x4 - Chimp - Jam
//          0x5 - Gorilla - Jam
// $127680: Street Performance - Song Selected [32-bit BE]
//          0x0 - Alright
//          0x1 - Canned Heat
//          0x2 - Don't Stop Me Now
//          0x3 - The Loco-Motion
//          0x4 - Dancing In The Street
//          0x5 - Para Los Rumberos
//          0x6 - Sing,Sing,Sing (With A Swing)
//          0x7 - Tubthumping
//          0x8 - You Can't Hurry Love
//          0x9 - All the Small Things
//          0xa - Oye Como Va
//          0xb - Louie Louie
//          0xc - 99 Red Balloons
//          0xd - The Impression That I Get
//          0xe - Busy Child
//          0xf - I Want You Back
//          0x10 - Cosmic Girl
//          0x11 - Richard III
//          0x12 - Lady Marmalade
//          0x13 - Wild Thing
//          0x14 - September
//          0x15 - Back For Good
//          0x16 - Hungarian Dance No.5 in G Minor
//          0x17 - Turkish March
//          0x18 - Super Mario Bros. Theme
//          0x19 - Donkey Kong Country Theme
//          0x1a - The Legend of Zelda Theme
//          0x1b - Rainbow Cruise
//          0x1c - Super Smash Bros. Melee Opening
//          0x1d - Donkey Konga Theme
//          0x1e - DK Rap
// $1276C0: Menu - Challenge - Mode Selected [32-bit BE]
//          0x0 - Solo
//          0x1 - Duo
// $1276C8: Menu - Challenge - Difficulty Selected [32-bit BE]
//          0x0 - Monkey
//          0x1 - Chimp
//          0x2 - Gorilla
// $1277E0: Menu - Current Song Difficulty Selected [32-bit BE]
//          0x0 - Monkey
//          0x1 - Chimp
//          0x2 - Gorilla
// $396A84: Current Coins [32-bit BE]
// $397CF8: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Sing, Sing, Sing (With A Swing)
// $397CF9: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Alright
// $397CFA: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Don't Stop Me Now
// $397CFB: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Lady Marmalade
// $397CFC: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          99 Red Ballons
// $397CFD: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          I Want You Back
// $397CFE: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Tubthumping
// $397CFF: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Back For Good
// $397D00: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          The Loco-Motion
// $397D01: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          September
// $397D02: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Wild Thing
// $397D03: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Hungarian Dance No.5 in G Minor
// $397D04: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Richard III
// $397D05: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Busy Child
// $397D06: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Louie Louie
// $397D07: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Oye Como Va
// $397D08: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Dancing In The Street
// $397D09: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          You Can't Hurry Love
// $397D0A: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Canned Heat
// $397D0B: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Cosmic Girl
// $397D0C: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Super Smash Bros. Melee Opening
// $397D0D: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Donkey Kong Country Theme
// $397D0E: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Rainbow Cruise
// $397D0F: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Para Los Rumberos
// $397D10: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          That Impression That I Get
// $397D11: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Donkey Konga Theme
// $397D12: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          DK Rap
// $397D13: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Super Mario Bros. Theme
// $397D14: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          The Legend of Zelda Theme
// $397D15: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Turkish March
// $397D16: Street Performance Monkey Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          All The Small Things
// $397D17: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Sing, Sing, Sing (With A Swing)
// $397D18: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Alright
// $397D19: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Don't Stop Me Now
// $397D1A: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Lady Marmalade
// $397D1B: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          99 Red Ballons
// $397D1C: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          I Want You Back
// $397D1D: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Tubthumping
// $397D1E: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Back For Good
// $397D1F: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          The Loco-Motion
// $397D20: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          September
// $397D21: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Wild Thing
// $397D22: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Hungarian Dance No.5 in G Minor
// $397D23: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Richard III
// $397D24: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Busy Child
// $397D25: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Louie Louie
// $397D26: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Oye Como Va
// $397D27: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Dancing In The Street
// $397D28: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          You Can't Hurry Love
// $397D29: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Canned Heat
// $397D2A: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Cosmic Girl
// $397D2B: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Super Smash Bros. Melee Opening
// $397D2C: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Donkey Kong Country Theme
// $397D2D: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Rainbow Cruise
// $397D2E: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Para Los Rumberos
// $397D2F: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          That Impression That I Get
// $397D30: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Donkey Konga Theme
// $397D31: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          DK Rap
// $397D32: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Super Mario Bros. Theme
// $397D33: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          The Legend of Zelda Theme
// $397D34: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Turkish March
// $397D35: Street Performance Chimp Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          All The Small Things
// $397D36: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Sing, Sing, Sing (With A Swing)
// $397D37: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Alright
// $397D38: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Don't Stop Me Now
// $397D39: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Lady Marmalade
// $397D3A: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          99 Red Ballons
// $397D3B: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          I Want You Back
// $397D3C: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Tubthumping
// $397D3D: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Back For Good
// $397D3E: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          The Loco-Motion
// $397D3F: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          September
// $397D40: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Wild Thing
// $397D41: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Hungarian Dance No.5 in G Minor
// $397D42: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Richard III
// $397D43: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Busy Child
// $397D44: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Louie Louie
// $397D45: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Oye Como Va
// $397D46: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Dancing In The Street
// $397D47: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          You Can't Hurry Love
// $397D48: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Canned Heat
// $397D49: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Cosmic Girl
// $397D4A: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Super Smash Bros. Melee Opening
// $397D4B: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Donkey Kong Country Theme
// $397D4C: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Rainbow Cruise
// $397D4D: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Para Los Rumberos
// $397D4E: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          That Impression That I Get
// $397D4F: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Donkey Konga Theme
// $397D50: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          DK Rap
// $397D51: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Super Mario Bros. Theme
// $397D52: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          The Legend of Zelda Theme
// $397D53: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          Turkish March
// $397D54: Street Performance Gorilla Medal [8-bit]
//          0x0 - None; 0x1 - Silver; 0x2 - Gold
//          All The Small Things
// $397D55: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Sing, Sing, Sing (With A Swing)
// $397D56: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Alright
// $397D57: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Don't Stop Me Now
// $397D58: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Lady Marmalade
// $397D59: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          99 Red Ballons
// $397D5A: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          I Want You Back
// $397D5B: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Tubthumping
// $397D5C: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Back For Good
// $397D5D: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          The Loco-Motion
// $397D5E: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          September
// $397D5F: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Wild Thing
// $397D60: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Hungarian Dance No.5 in G Minor
// $397D61: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Richard III
// $397D62: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Busy Child
// $397D63: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Louie Louie
// $397D64: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Oye Como Va
// $397D65: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Dancing In The Street
// $397D66: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          You Can't Hurry Love
// $397D67: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Canned Heat
// $397D68: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Cosmic Girl
// $397D69: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Super Smash Bros. Melee Opening
// $397D6A: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Donkey Kong Country Theme
// $397D6B: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Rainbow Cruise
// $397D6C: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Para Los Rumberos
// $397D6D: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          That Impression That I Get
// $397D6E: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Donkey Konga Theme
// $397D6F: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          DK Rap
// $397D70: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Super Mario Bros. Theme
// $397D71: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          The Legend of Zelda Theme
// $397D72: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          Turkish March
// $397D73: Jungle Jams Bought - Gorilla [8-bit]
//          0x00 - None; 0x01 "NEW!"; 0x02 - Unlocked, played once or more
//          All The Small Things

//Thanks to Searo for the US Script


// Helper Functions
function game_mode() => dword_be(0x127670)
street = 0
challenge = 1
battle = 2
jam = 3
arcade = 4
town = 5

function street_mode() => dword_be(0x127678)
monkey = 0
chimp = 1
gorilla = 2
monkey_jam = 3
chimp_jam = 4
gorilla_jam = 5

function arcade_mode() => dword_be(0x1276e0)
bash = 0
juggle = 1
climb = 3

arcadeMode = dword_be(0x1276e0)
// Song dictionary
// key: current song value
// [0]: gorrilla gold medal address
// [1]: gold points
// [2]: FC points
// [3]: song title
song_dict = { // 31 Songs total
     0x0: [0x397d37, 5, 10, "Alright"], // 7 barrels
     0x1: [0x397d48, 5, 10, "Canned Heat"], // 7 barrels
     0x2: [0x397d38, 5, 10, "Don't Stop Me Now"], // 5 barrels
     0x3: [0x397d3e, 5, 10, "The Loco-Motion"], // 4 barrels
     0x4: [0x397d46, 5, 10, "Dancing In The Street"], // 5 barrels
     0x5: [0x397d4d, 5, 10, "Para Los Rumberos"], // 6 barrels
     0x6: [0x397d36, 5, 10, "Sing,Sing,Sing (With A Swing)"], // 6 barrels
     0x7: [0x397d3c, 5, 10, "Tubthumping"], // 5 barrels
     0x8: [0x397d47, 5, 10, "You Can't Hurry Love"], // 4 barrels
     0x9: [0x397d54, 5, 10, "All the Small Things"], // 3 barrels
     0xa: [0x397d45, 5, 10, "Oye Como Va"], // 8 barrels
     0xb: [0x397d44, 5, 10, "Louie Louie"], // 4 barrels
     0xc: [0x397d3a, 5, 10, "99 Red Balloons"], // 3 barrels
     0xd: [0x397d4e, 5, 10, "The Impression That I Get"], // 3 barrels
     0xe: [0x397d43, 5, 10, "Busy Child"], // 5 barrels
     0xf: [0x397d3b, 5, 10, "I Want You Back"], // 3 barrels
    0x10: [0x397d49, 5, 10, "Cosmic Girl"], // 2 barrels
    0x11: [0x397d42, 5, 10, "Richard III"], // 7 barrels
    0x12: [0x397d39, 5, 10, "Lady Marmalade"], // 5 barrels
    0x13: [0x397d40, 5, 10, "Wild Thing"], // 6 barrels
    0x14: [0x397d3f, 5, 10, "September"], // 3 barrels
    0x15: [0x397d3d, 5, 10, "Back For Good"], // 2 barrels
    0x16: [0x397d41, 5, 10, "Hungarian Dance No.5 in G Minor"], // 3 barrels
    0x17: [0x397d53, 5, 10, "Turkish March"], // 2 barrels
    0x18: [0x397d51, 5, 10, "Super Mario Bros. Theme"], // 5 barrels
    0x19: [0x397d4b, 5, 10, "Donkey Kong Country Theme"], // 6 barrels
    0x1a: [0x397d52, 5, 10, "The Legend of Zelda Theme"], // 6 barrels
    0x1b: [0x397d4c, 5, 10, "Rainbow Cruise"], // 8 barrels
    0x1c: [0x397d4a, 5, 10, "Super Smash Bros. Melee Opening"], // 8 barrels
    0x1d: [0x397d4f, 5, 10, "Donkey Konga Theme"], // 4 barrels
    0x1e: [0x397d50, 5, 10, "DK Rap"] // 1 barrel
}

songId = {
    0x0:"Alright",
    0x1:"Canned Heat",
    0x2:"Don't Stop Me Now",
    0x3:"The Loco-Motion",
    0x4:"Dancing In The Street",
    0x5:"Para Los Rumberos",
    0x6:"Sing,Sing,Sing (With A Swing)",
    0x7:"Tubthumping",
    0x8:"You Can't Hurry Love",
    0x9:"All the Small Things",
    0xa:"Oye Como Va",
    0xb:"Louie Louie",
    0xc:"99 Red Balloons",
    0xd:"The Impression That I Get",
    0xe:"Busy Child",
    0xf:"I Want You Back",
    0x10:"Cosmic Girl",
    0x11:"Richard III",
    0x12:"Lady Marmalade",
    0x13:"Wild Thing",
    0x14:"September",
    0x15:"Back For Good",
    0x16:"Hungarian Dance No.5 in G Minor",
    0x17:"Turkish March",
    0x18:"Super Mario Bros. Theme",
    0x19:"Donkey Kong Country Theme",
    0x1a:"The Legend of Zelda Theme",
    0x1b:"Rainbow Cruise",
    0x1c:"Super Smash Bros. Melee Opening",
    0x1d:"Donkey Konga Theme",
    0x1e:"DK Rap"
}

difficulty_dict = {
    0x0: "Monkey",
    0x1: "Chimp",
    0x2: "Gorilla"
}

flags_dict = {
    0: [0x397d55,0x397d73], //songs
    1: [0x397d76,0x397d87], //bongos
    2: [0x397d88,0x397d8a]  //minigames
}
_jams = 0
_bongos = 1
_shines = 2

regular_clear_dict = {
    0: [0x397cf8,0x397d16], //Monkey difficulty
    1: [0x397d17,0x397d35] // Chimp difficulty
}
_monkey = 0
_chimp = 1

arcade_dict = {
    0x0: "Bash K.Rool",
    0x1: "Banana Juggle",
    0x2: "VS. Banana Juggle",
    0x3: "100m Vine Climb",
    0x4: "VS. 100m Vine Climb"
}

// #region Memory Symbols -----------------------------------------------------------------------------------------------------------------
// #endregion

// #region Memory -------------------------------------------------------------------------------------------------------------------------
// #endregion

// #region Constants ----------------------------------------------------------------------------------------------------------------------
songCurrent = dword_be(0x127680)
songScore = dword_be(0x4f075c)
songEnd = dword_be(0x4f0404)
songDifficulty = dword_be(0x127678)
songBadCount = word_be(0x4f074c)
songMissCount = word_be(0x4f074e)
songCoin = dword_be(0x4f0758)
songTimer = dword_be(0x004f0408)
// Minigames
miniGameBashScore = dword_be(0x4fb4b4)
miniGameBashTime = dword_be(0x4fb4b8)
miniGameJuggleTime = dword_be(0x4f04e8)
miniGameJuggleEndScore = dword_be(0x4f1664)
miniGameClimbHeigh = dword_be(0x4f043c)
miniGameClimbPoints = dword_be(0x4f0ae4)

// #endregion

// #region Utils --------------------------------------------------------------------------------------------------------------------------
// #endregion

// #region Rich Presence ------------------------------------------------------------------------------------------------------------------
// #endregion

// #region Achievement Functions ----------------------------------------------------------------------------------------------------------
// #endregion

// #region Achievements -------------------------------------------------------------------------------------------------------------------
// Regular Unlocks
    achievement(title = "I'm Blue",
                description = "Get a surge of coins by clearing a blue note",
                points = 2,
                trigger = 
                            game_mode() == street
                         && songEnd == 0
                         && prev(songTimer) > 0
                         && (songCoin == prev(songCoin) +100 || songCoin == prev(songCoin) +200)
)  

function medalClearCheck(diffClear){
	startAddress = diffClear[0]
	endAddress = diffClear[1]

	result = 0
	totalClears = 0
	
    for address in range(startAddress, endAddress){				
        result = result + bitcount(address)
        totalClears = totalClears + 1
    }

	return measured(result == totalClears)
}

function prevMedalClearCheck(diffClear){
	startAddress = diffClear[0]
	endAddress = diffClear[1]

	result = 0
	totalClears = 0
	
    for address in range(startAddress, endAddress){				
        result = result + prev(bitcount(address))
        totalClears = totalClears + 1
    }

	return result == totalClears - 1
}

function allClears(diffIndex, title, description, points){
	
	clears = regular_clear_dict[diffIndex]
	
	trigger = game_mode() == street
            &&medalClearCheck(clears) 
			&& prevMedalClearCheck(clears)
	
	achievement(title = title, points = points, description = description, trigger = trigger)
}

allClears(_monkey, "Monkey Business", "Get a Medal for every song on Monkey difficulty", 5)
allClears(_chimp, "Tropical Fever", "Get a Medal for every song on Chimp difficulty", 10)



// Gold Medal Gorilla Songs

function goldGorillaAchievement(song){
	
    title = "[Golden Gorilla] " + song_dict[song][3]
	
	points = song_dict[song][1]
	
	description = format("Earn a Gold Medal in \"{0}\" on Gorilla difficulty", song_dict[song][3])
	
	trigger = game_mode() == street
			&& street_mode() == gorilla
			&& songCurrent == song
			&& songEnd == 1
            && prev(bit1(song_dict[song][0])) == 0
            && bit1(song_dict[song][0]) == 1
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

// Perfect Gorilla Songs

function perfectGorillaAchievement(song){
	
    title = "[Perfect Gorilla] " + song_dict[song][3]
	
	points = song_dict[song][2]
	
	description = format("Earn a Full Combo in \"{0}\" on Gorilla difficulty", song_dict[song][3])
	
	trigger = game_mode() == street
			&& street_mode() == gorilla
			&& songCurrent == song
            && prev(songEnd) == 7 
            && songEnd == 8 
            && songBadCount == 0
            && songMissCount == 0
    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for song in song_dict {
        goldGorillaAchievement(song)
        perfectGorillaAchievement(song)
}
	



// Shop Achievements

function flagCounter(flags) {
	startAddress = flags[0]
	endAddress = flags[1]
	result = 0	

    for address in range(startAddress, endAddress){				
        result = result + bit0(address)
    }
	
	return result
}

function unlockedBitflags(flags){
	startAddress = flags[0]
	endAddress = flags[1]

	result = 0
	totalFlags = 0
	
    for address in range(startAddress, endAddress){				
        result = result + bit0(address)
        totalFlags = totalFlags + 1
    }

	return measured(result == totalFlags)
}

function unlockedBitflagsV2(flags){
	startAddress = flags[0]
	endAddress = flags[1]

	result = 0
	totalFlags = 0
	
    for address in range(startAddress, endAddress){				
        result = result + bitcount(address)
        totalFlags = totalFlags + 1
    }

	return measured(result == totalFlags)
}

function prevUnlockedBitflags(flags){
	startAddress = flags[0]
	endAddress = flags[1]

	result = 0
	totalFlags = 0
	
    for address in range(startAddress, endAddress){				
        result = result + prev(bit0(address))
        totalFlags = totalFlags + 1
    }

	return result == totalFlags - 1
}

function prevUnlockedBitflagsV2(flags){
	startAddress = flags[0]
	endAddress = flags[1]

	result = 0
	totalFlags = 0
	
    for address in range(startAddress, endAddress){				
        result = result + prev(bitcount(address))
        totalFlags = totalFlags + 1
    }

	return result == totalFlags - 1
}

function allFlagsAchievement(flagIndex, title, description, points){
	
	flags = flags_dict[flagIndex]
	
	trigger = game_mode() == town
            &&unlockedBitflags(flags) 
			&& prevUnlockedBitflags(flags)
	
	achievement(title = title, points = points, description = description, trigger = trigger)
}

function allFlagsAchievementV2(flagIndex, title, description, points){
	
	flags = flags_dict[flagIndex]
	
	trigger = game_mode() == town
            &&unlockedBitflagsV2(flags) 
			&& prevUnlockedBitflagsV2(flags)
	
	achievement(title = title, points = points, description = description, trigger = trigger)
}

allFlagsAchievementV2(_jams, "Dancing Monkeys", "Unlock all songs", 25)
allFlagsAchievementV2(_bongos, "Jungle Beats", "Unlock all bongo sets", 25)
allFlagsAchievementV2(_shines, "Monkeying Around", "Unlock all minigames", 5)

// Minigames
    achievement(title = "King K. Drool",
                description = "Clear Bash K.Rool with a score of 20 or above",
                points = 5,
                trigger = 
                            game_mode() == arcade
                         && arcade_mode() == bash
                         && miniGameBashTime == 0
                         && prev(miniGameBashTime) == 1
                         && miniGameBashScore >= 20

)  

    achievement(title = "Ambidextrous",
                description = "Clear Banana Juggle with a score of 50 or above",
                points = 5,
                trigger = 
                            game_mode() == arcade
                         && arcade_mode() == juggle
                         && miniGameJuggleEndScore >= 50
                         && miniGameJuggleEndScore < 0xffffffff
                         && prev(miniGameJuggleEndScore) == 0xffffffff
                         && miniGameJuggleTime == 0
)  

    achievement(title = "Donkey Konga Country",
                description = "Clear 100m Vine Climb with a score of 25 or above",
                points = 5,
                trigger = 
                            game_mode() == arcade
                         && arcade_mode() == climb
                         && miniGameClimbHeigh == 0x65
                         && prev(miniGameClimbHeigh) < 0x65
                         && miniGameClimbPoints >= 25
)  
// #endregion

// #region Leaderboards -------------------------------------------------------------------------------------------------------------------

function songLeaderboard(song, diff){

	title = format("{0} ({1})", song_dict[song][3], difficulty_dict[diff])
    description = format("Finish {0} on {1} with the highest score", song_dict[song][3], difficulty_dict[diff])
		
    start = game_mode() == street 
        && street_mode() == diff 
        && prev(songEnd) == 7 
        && songEnd == 8 
        && songCurrent == song	
    cancel = always_false()
	submit = start	
    value = songScore
	
    leaderboard(title, description, start, cancel, submit, value, "SCORE")    
}

for song in song_dict {
	for diff in difficulty_dict {
		songLeaderboard(song, diff)
	}
}

    leaderboard(
    title = "Bash K.Rool",
    description = "Minigame Highscore",
    start  = game_mode() == arcade && arcade_mode() == bash && miniGameBashTime == 0 && prev(miniGameBashTime) == 1,
    cancel = always_false(),
    submit = always_true(),
    value = miniGameBashScore,
    format = "VALUE",
    lower_is_better=true
)   

    leaderboard(
    title = "Banana Juggle",
    description = "Minigame Highscore",
    start  = game_mode() == arcade && arcade_mode() == juggle && miniGameJuggleEndScore != prev(miniGameJuggleEndScore) && prev(miniGameJuggleEndScore) == 0xffffffff && miniGameJuggleTime == 0,
    cancel = always_false(),
    submit = always_true(),
    value = miniGameJuggleEndScore,
    format = "VALUE",
    lower_is_better=true
)   

    leaderboard(
    title = "100m Vine Climb",
    description = "Minigame Highscore",
    start  = game_mode() == arcade && arcade_mode() == climb && miniGameClimbHeigh == 0x65 && prev(miniGameClimbHeigh) < 0x65,
    cancel = always_false(),
    submit = always_true(),
    value = miniGameClimbPoints,
    format = "VALUE",
    lower_is_better=true
)   

// Rich Presence

// Rich Presence
/// Main Mode
rich_presence_conditional_display(
    game_mode() == street,
    "• Street Mode • {0} Difficulty• {1}  • ",
    rich_presence_lookup("Difficulty", songDifficulty, difficulty_dict),
    rich_presence_lookup("Song", songCurrent, songId)) 
/// Minigame
rich_presence_conditional_display(
    game_mode() == arcade,
    "• Arcade Mode • {0}  • ",
    rich_presence_lookup("Game", arcadeMode, arcade_dict)
) 

///Default 
rich_presence_display(
    "• Feeling the Call of the Bongos •"

)