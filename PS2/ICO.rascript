// ICO
// #ID = 1319

// 20231222 Version - Sines

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


// $000000: --- --- ---
//          Debug Mode Options Explanation
//          --- --- ---
//          Access > Input the value in Part 1 and Part 2 then press Select in game
//          Circle to confirm, Cross to Cancel
//          --- ---
//          Debug Mode
//          --- ---
//          Framestep > Single for Max FPS (50 PAL, 60 NTSC)
//          DebugFont 1~3 > Various display options for Debug Mode Menu
//          
//          WallCheck > Display of Collision Data from HornedBoy movement
//          WallHitColDisp > Highlight which part of the environement is currently in Collision mode
//          FieldCollision > Full Collision mesh
//          
//          Skelton > HornedBoy Skeletton wiremesh
//          ClothInfo > HornedBoy Clothes mesh
//          MotionActNode > Floor Node for last HornedBoy floor position
//          MotionDebugMenu > Full debug mode and logic routine for animations chain
//          MotionDebugTgt > Target for previous menu
//          
//          Brain Stuff > Enemy AI toggle ? TBC
//          
//          Particule Stuff > Various effect toggles and configuration
//          
//          Stick Input > Movement input as a float. 0 on no movement, 1.0 on full speed
//          
//          Game Clear Count > Manual input of value, can be used to unlock NG+ options
//          Girl Pad Control > 2P control on ? TBC
//          No Breast Hang > Ayo??
//          
//          --- ---
//          Free Camera
//          --- ---
//          Activated by P1 Controller
//          Camera movement by P2 Controller
//          Keep R2 Pressed for Up/Down Movement
//          
//          --- ---
//          Stage Select
//          --- ---
//          Teleport to the corresponding Map
//          Allow access to some debug / demo maps
//          Map name can be found and identified in ASCII search
//          
//          --- ---
//          Target Object
//          --- ---
//          Does what it says on the box
//          Give the memory address for the object > Can adjacent elements be modified from there ?
//          
//          --- ---
//          Light Setting
//          --- ---
//          
//          Light Tool: Update the light parameters such as color, intensity and angle
//          Shadow Tool: Similar but for Shadows. You can now have a funky Green shadow !
//          Fog Tool: Intensity, Color etc. Great for ambiance !
//          Film Noise 1~4: Various settings for strenght, grain etc
//          Other Settings
//          ----
//          Triangle put the value back on default
//          Highlight Colors: Color filter on the screen
//          Zoom Offset: Zoom in-out the default camera. Great for taking screenshots
//          Post Effect : Filters used for custcenes
//          AntiLevel10/11: Add noise to the picture
//          
//          
//          --- ---
//          Way Test
//          --- ---
//          Clearly some waypoint / AI test settings but could not make them work
//          
//          
//          --- ---
//          Camera Editor
//          --- ---
//          Put the camera in Free Mode (P2 Controller needed)
//          Square seems to break everything ?
//          Circle brings up a new menu but no change seems possible (revert to 0)
//          
//          --- ---
//          Motion Viewer
//          --- ---
//          View individual animation for each objects
//          Square to put it in "Depend" mode, will take account of the surroundings
//          Left/Right D-Pad for the speed of the playback
//          Camera is on semi-free mode, fixed on the object but can be moved with P2 Controller
//          
//          --- --- ---
//          From a RA standpoint the others options don't seem very interesting. MemoryCard Save/Load could fonction as save state replacement but were crash prone on my end
// $101F94: [32 Bit] Debug Mode Part 1
//          Put value at 0c06c966
//          Credit to Gollawiz for both part
// $1AF850: [32 Bit] Debug Mode Part 2
//          Put value at 0806bd28
//          Credit to Gollawiz for both part
// $28F4C0: [32 Bit] NTSC / PAL Mode
//          0 > NTSC
//          1 > PAL
// $28F4C4: [32 Bit] Framestep
//          1 > Single (60FPS)
//          2 > Double(30FPS)
//          TBC if game wide or just debug mode
// $28F4D4: [32 Bit] Game Paused flag
// $28F8F0: [8 Bit] Inputs Flags
//          Bit 0 | L2
//          Bit 1 | R2
//          Bit 2 | L1
//          Bit 3 | R1
//          Bit 4 | Triangle
//          Bit 5 | Circle
//          Bit 6 | Cross
//          Bit 7 | Square
// $28F8F1: [8 Bit] Inputs Flags 2
//          Bit 0 | Select
//          Bit 4 | D-Pad UP
//          Bit 5 | D-Pad Right
//          Bit 6 | D-Pad Down
//          Bit 7 | D-Pad Left
// $28FE74: [32 Bit] Map ID
//          Consistent with Debug Mode listing
//          Can be Frozen on transition to force specific map loading
//          --- --- ---
//          Used In-Game
//          --- --- ---
//          01> Logo
//          02> Title
//          03> Sacrifice
//          04> Cage
//          05> Warehouse
//          06> Bridge
//          07> Proto
//          08> Truck
//          09> Chandelier
//          0a> Drawbridge
//          0b> 1st Gate
//          0c> 2nd Gate
//          0d> Grave
//          0e> Shadows
//          0f> Windmill
//          10> Plaza
//          11> Stone
//          12> Symmetry (Left)
//          13> Crest (Left 1)
//          14> Crest (Left 2)
//          15> Crest (Left 3)
//          16> Waterfall
//          17> Sluice
//          18> Underground
//          19> Gondola
//          1a> Watertower
//          1b> Symmetry (Right)
//          1c> Crest (Right 1)
//          1d> Crest (Right 2)
//          1e> Crest (Right 3)
//          1f> Cliff
//          20> Undergrounds 2
//          21> Pipe
//          22> Elevator
//          23> Jetty
//          24> Jetty 2
//          25> Queen
//          26> Sea
//          27> Beach
//          3f> End Screen
//          
//          ---
//          28 > Unused Map, tech demo of some sort. Crash on movement
//          29 > Start of game Cutscene exclusive map ?
//          2a > Start of game Cutscene exclusive map ?
//          2b > Start of game Cutscene exclusive map ?
//          2c > Elevator down EndGame Cutscene (Leads to map 0x24 cutscene > Shadow Yorda put HornedBoy in the boat, Castle crumbles)
//          2d > Start of game Cutscene exclusive map ? Can move after cutscene, crash on movement...
//          2f > Yorda Stone > Shadow transition Cutscene, lead to map 0x36
//          30 > Castle Interior Crumbling Cutscene, lead to map 0x35
//          31 > Endgame Cutscene Castle interior crumbling
//          32 > Crash
//          33 > Crash
//          34 > More endgame crumbling castle stuff
//          35 > Tower bridge crumbling cutscene, leads to map 0x34
//          36 > Shadow Yorda picks up HornedBoy Endgame Cutscene, lead to map 0x30
//          37 > Endgame Cutscene, wide view of Castle crumbling
//          38 > Endgame Cutscene, wide view of Castle crumbling
//          39 > Intro movie from when you boot the game > NTSC Version
//          3a > Intro movie from when you boot the game > PAL Version
//          3b > Intro movie from when you boot the game > PAL576 Version ? Probably some interlacing thing
//          3c > Sepia Tone Credit Roll
//          3d > Sepia Tone Credit Roll
//          3e > Sepia Tone Credit Roll
//          3f - 57 > Test value that do not work even in debug mode
//          58 > Test boss room
//          59 - 5a > Test value that do not work even in debug mode
//          5b > Long load time, bunch of broken / floating assets
//          5c - 5d > Test value that do not work even in debug mode
//          5e > Crash
//          All the E3 Demo values > Crash
// $28FFC0: [32 Bit] Movement related value 1
//          non-modifiable
//          duplicated in 0x0028ffe8
// $28FFC8: [32 Bit] Movement related value 2
//          non-modifiable
//          duplicated in 0x0028ffe0
// $2A50C0: [384 Bit] Start of Flags Array
// $2A50C1: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50C2: [8 Bit] Story Bitflags
//          Bit 1 | First Lever / Door in the game
//          Bit 2 | Cage - Yorda Cutscene
//          Bit 3 |
//          Bit 4 | Cage - Lever for the Cage
//          Bit 5 | Yora Freed - Simultaneous Bit 6
//          Bit 6 | Yora Freed - Simultaneous Bit 5
// $2A50C3: [8 Bit] Story Bitflags
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 | Cage - Yora Wall Unlock
// $2A50C4: [8 Bit] Story Bitflags
//          Bit 0 | Bridge - Yorda Wall Unlock
//          Bit 1 | Bridge - Bridge Destroyed
//          Bit 2 | Bridge - Discovery Cutscene
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 | Proto - Block Push
//          Bit 7 | Proto - Door Close
// $2A50C5: [8 Bit] Story Bitflags
//          Bit 0 | Proto - Fight Trigger
//          Bit 1 | Proto - Block Push
//          Bit 2 | Proto - Fight Trigger
//          Bit 3 | Drawbridge - Yorda Wall Unlock
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50C6: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 | Drawbridge - Grave Bomb Entrance
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 | Grave - Entrance Cutscene
// $2A50C7: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 | Grave - Door Open (With 2 blocks)
//          Bit 3 | Grave - Opening Door 1st Cutscene
//          Bit 4 | Grave - Door Open Flag (On / Off)
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50C8: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 | Shadow - Yorda Wall Unlock
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 | Shadow - Chain Pull (Raising Floor)
//          Bit 7 | Truck - Lever Activated (Door Opened)
// $2A50C9: [8 Bit] Story Bitflags
//          Bit 0 | Truck - Shadow Fight Spawn
//          Bit 1 | Truck - Exterior Bird Shadow Fight Spawn
//          Bit 2 | Truck - Shadow Fight Spawn
//          Bit 3 | Truck - Exterior Bird Shadow Fight Spawn
//          Bit 4 |
//          Bit 5 | Truck - Cage Lifted
//          Bit 6 |
//          Bit 7 | Truck - Drawbridge raised
// $2A50CA: [8 Bit] Story Bitflags
//          Bit 0 | Truck - Cage Lifted On / Off
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 | Windmill Yorda Wall Unlock
//          Bit 5 |
//          Bit 6 | Windmill Lever Pull (Bridge)
//          Bit 7 |
// $2A50CB: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 | Plaza - Internal Sewer Door Open
//          Bit 2 | Plaza - External Sewer Door Open
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 | Plaza - Yorda Wall Unlock
// $2A50CC: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50CD: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50CE: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50CF: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 | Chandelier - Chandelier Destroyed (Stair hit)
//          Bit 7 | Chandelier - Chandelier Destroyed
// $2A50D0: [8 Bit] Story Bitflags
//          Bit 0 | Chandelier - Exploding Bomb
//          Bit 1 |
//          Bit 2 | Chandelier - Post Bomb Yorda Wall Unlock
//          Bit 3 | Chandelier - Post Bomb Shadow Fight Spawn
//          Bit 4 | Chandelier - Post Bomb Shadow Fight Spawn
//          Bit 5 | Chandelier - Fallen Stairs
//          Bit 6 |
//          Bit 7 |
// $2A50D1: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 | 1st Gate - Escape False Hope
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50D2: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 | 1st Gate - 1st Left Pillar Moved
//          Bit 2 | 1st Gate - 2nd Left Pillar Moved
//          Bit 3 | 1st Gate - 3rd Left Pillar Moved
//          Bit 4 | 1st Gate - 4th Left Pillar Moved
//          Bit 5 | 1st Gate - 1st Right Pillar Moved
//          Bit 6 | 1st Gate - 2nd Right Pillar Moved
//          Bit 7 | 1st Gate - 3rd Right Pillar Moved
// $2A50D3: [8 Bit] Story Bitflags
//          Bit 0 | 1st Gate - 4th Right Pillar Moved
//          Bit 1 | 1st Gate - All Pillar Moved
//          Bit 2 |
//          Bit 3 | 1st Gate - Post Failed Escape
//          Bit 4 | 1st Gate - Post Failed Escape (few second after previous bit)
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50D4: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50D5: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50D6: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50D7: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50D8: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50D9: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50DA: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50DB: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50DC: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50DD: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50DE: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50DF: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E0: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E1: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E2: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E3: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 | Stone - Big Lever Pulled (Chain Down)
// $2A50E4: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 | Stone - Lift Activated Flag (On / Off)
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E5: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E6: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E7: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E8: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50E9: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50EA: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50EB: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50EC: [8 Bit] Story Bitflags
//          Bit 1 |
//          Bit 2 | Beach - Ending Watermelon
//          Bit 3 | Beach - Ending Regular
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
// $2A50ED: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50EE: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $2A50EF: [8 Bit] Story Bitflags
//          Bit 0 |
//          Bit 1 |
//          Bit 2 |
//          Bit 3 |
//          Bit 4 |
//          Bit 5 |
//          Bit 6 |
//          Bit 7 |
// $4DA984: [32 Bit] Map ID 2
//          HornedBoy Coordinate / Camera position related ?
// $534014: [8 Bit] Language Select
//          1a > English
//          1b > Français
//          1c > Deutsch
//          1d > Italiano
//          1e > Español
// $53404C: [8 Bit] Display Refresh Rate
//          0x21 > 50Hz
//          0x22 > 60Hz
// $639D10: Map ID 3
// $639ED4: Map ID 4
// $63A5C8: [32 Bit] Another action increment flag
//          Goes up to 0xffffffff then goes back to 1
//          Does not reset on map change
// $63AA00: [8 Bit] Game Clear count
//          Unlocks Film effect + 2 player mode at > 0
//          Seemingly max at 9 (from Debug Mode)
// $63AA08: [8bit] controls active (flips during cutscenes)
// $63ABB4: pin tower
// $63AE6C: [8bit] debug menu stage select
// $63B11C: [32 Bit] Camera position values 1
// $63B120: [32 Bit] Camera position values 2
// $63B124: [32 Bit] Camera position values 3
// $63B180: [32 Bit] Debug Mode Option BrainOnOff
//          Need Debug Mode to be set in memory to take effect
//          Seemingly disable ALL AI, including Yora
//          Require Screen Transition to take effect
// $63BC60: Map ID 5
// $63C3F4: pin tower 2
// $63C57C: Pin story flags
// $643350: [32 Bit] Hand Holding Pointer
//          +0x274 Hand Holding Target
//          +0x290 Hand Holding Flag
// $810288: [32 Bit] Action counter
//          Max at 0x20 on repeat action, seems like it change the next two 32 bit addresses to be (consistent) item flags when used.
//          Still increment if reusing on the same item, up to 0x00810388
//          Reset on screen transition, "flags" values stays but get overwritten after reset
//          
//          Behavior is mimicked in several data blocks up to 0x008113f8
// $812DC8: [32 Bit] Target Select Boy from Debug Menu
// $882840: [32 Bit] Map ID 6
//          Load parts of memory, do not use for MapID
// $888BC8: Weapon object 1
// $888BCA: [32 Bit] Weapon Attribute
//          Seems to be indicating to which limb / model anchor point the weapon visual is attached



///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

MapDisplay = { 
                    1:"Logo", 
                    2:"Title Screen", 
                    3:"Altar", 
                    4:"Spiral Stairs", 
                    5:"Warehouse", 
                    6:"Old Bridge", 
                    7:"Stairs",
                    8:"Crane",
                    9:"Chandelier",
                    10:"Drawbridge",
                    11:"1st Gate",
                    12:"2nd Gate",
                    13:"Graveyard",
                    14:"Dark Room",
                    15:"Windmill",
                    16:"Sunbeams",
                    17:"Stone Pillar",
                    18:"East Crag",
                    19:"East Arena",
                    20:"East Idol Stairs",
                    21:"East Reflector",
                    22:"Waterfall",
                    23:"Sluice",
                    24:"Cogwheel",
                    25:"Gondola",
                    26:"Water Tower",
                    27:"West Crag",
                    28:"West Arena",
                    29:"West Idol Stairs",
                    30:"West Reflector",
                    31:"Cage",
                    32:"Cogwheel 2",
                    33:"Pipe",
                    34:"Elevator",
                    35:"Wharf",
                    36:"Wharf 2",
                    37:"Queen's Room",
                    38:"Sea",
                    39:"Sandy Beach",
                    63:"The End",
                    }  

//----------------
//Variable
/// Game Data
mapID = dword(0x28fe74)
LanguageSelected = dword(0x639d70) //For RP shenanigans
DisplayRefreshRate = dword(0x28f4c0) //0x01 50hz > 0x00 60hz
GameTimer = dword(0x29b9d8) //Frame counter
GameClearCounter = byte(0x63aa00)

//Function
function EventCheck(EventID) => EventID == 1 && prev(EventID) == 0
function LoadProtection() => prev(mapID) != 0x01

//----------------
///Achievement Code

// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
    achievement(title = "Moonlit Girl",
                description = "Free the strange pale girl from her cage",
                points = 2,
                trigger = mapID == 0x04
                       && EventCheck(bit3(0x2a50c3))
                       && LoadProtection()

                )

    achievement(title = "Fly Away",
                description = "Breath in the fresh air, don't mind the birds",
                points = 3,
                trigger = mapID == 0x08
                       && EventCheck(bit3(0x2a50c9))
                       && LoadProtection()

                )

    achievement(title = "Shortcut, got it",
                description = "Lower the drawbridge after your exciting cage ride",
                points = 5,
                trigger = mapID == 0x08
                       && EventCheck(bit7(0x2a50c9))
                       && LoadProtection()

                )      

    achievement(title = "Property Damage",
                description = "Destroy the stairs in the Chandelier room",
                points = 5,
                trigger = mapID == 0x09
                       && EventCheck(bit5(0x2a50d0))
                       && LoadProtection()

                )    

    achievement(title = "End of all Hope",
                description = "Attempt to escape from the Castle",
                points = 3,
                trigger = mapID == 0x0b
                       && EventCheck(bit1(0x2a50d1))
                       && LoadProtection()

                )      

    achievement(title = "Explosive Entrance",
                description = "Open the way to the Graveyard",
                points = 2,
                trigger = mapID == 0x0a
                       && EventCheck(bit2(0x2a50c6))
                       && LoadProtection()

                )    

    achievement(title = "Back to Life",
                description = "Escape the Shadows, onward to the Mill",
                points = 5,
                trigger = mapID == 0x0e
                       && EventCheck(bit1(0x2a50c8))
                       && LoadProtection()

                )   

    achievement(title = "It Looked Different on the Cover !",
                description = "Clear the path out of the Windmill",
                points = 2,
                trigger = mapID == 0x0f
                       && EventCheck(bit4(0x2a50ca))
                       && LoadProtection()

                )   

    achievement(title = "Twisting Turns",
                description = "Get out of the Plaza. You shouldn't bring girls into the sewer young man...",
                points = 2,
                trigger = mapID == 0x10
                       && EventCheck(bit7(0x2a50cb))
                       && LoadProtection()

                )    

    achievement(title = "Just Don't Look Down !",
                description = "Activate the switch to lower the chain in Stone Pillar",
                points = 3,
                trigger = mapID == 0x11
                       && EventCheck(bit7(0x2a50e3))
                       && LoadProtection()

                )    

    achievement(title = "Empty Ramparts",
                description = "Enjoy walking along the left side ramparts",
                points = 3,
                trigger = mapID == 0x12
                       && EventCheck(bit7(0x2a50d3))
                       && LoadProtection()

                )    

    achievement(title = "Riddle of Steel",
                description = "Obtain your first proper weapon",
                points = 10,
                trigger = mapID == 0x13
                       && EventCheck(bit0(0x2a50d9))
                       && LoadProtection()

                )    

    achievement(title = "Light in the Dark",
                description = "Activate the Eastern Reflector",
                points = 10,
                trigger = mapID == 0x32
                       && EventCheck(bit2(0x2a50d1))
                       && LoadProtection()

                ) 

    achievement(title = "Familiar Venue",
                description = "After your eastern adventures, proceed toward the Waterfall from the Drawbridge map",
                points = 3,
                trigger = mapID == 0x0a
                       && EventCheck(bit4(0x2a50c5))
                       && LoadProtection()

                )    

    achievement(title = "Big Door, Big Lever",
                description = "Open the Sluice door. Hope you enjoyed that Piston Jump !",
                points = 3,
                trigger = mapID == 0x17
                       && EventCheck(bit3(0x2a50cd))
                       && LoadProtection()

                )      

    achievement(title = "Mace-ive Advantage",
                description = "Obtain the secret Mace weapon [New Game Only]",
                points = 5,
                trigger = mapID == 0x17
                       && EventCheck(bit2(0x2a50ce))
                       && LoadProtection()
                       && GameClearCounter == 0

                )   

    achievement(title = "Powered by Love",
                description = "Obtain the secret Light Saber weapon [New Game Plus Only]",
                points = 10,
                trigger = mapID == 0x17
                       && EventCheck(bit2(0x2a50ce))
                       && LoadProtection()
                       && GameClearCounter > 0

                )      


    achievement(title = "Belly of the Beast",
                description = "Enter the underground passage",
                points = 2,
                trigger = mapID == 0x16
                       && EventCheck(bit3(0x2a50cf))
                       && LoadProtection()

                )                  


    achievement(title = "Platforming Bump",
                description = "Lower the Water Tower bridge thanks to the law of physics",
                points = 5,
                trigger = mapID == 0x1a
                       && EventCheck(bit4(0x2a50e5))
                       && LoadProtection()

                )                  

    achievement(title = "Rampart Flight",
                description = "Exit the Water Tower and make your way toward the western ramparts",
                points = 2,
                trigger = mapID == 0x1a
                       && EventCheck(bit1(0x2a50e6))
                       && LoadProtection()

                )   

    achievement(title = "First Gate",
                description = "Open the first gate of the West Idol Stairs",
                points = 2,
                trigger = mapID == 0x1d
                       && EventCheck(bit4(0x2a50de))
                       && LoadProtection()

                )      

    achievement(title = "Now Where Did I Put My Sword ?",
                description = "Open the second gate of the West Idol Stairs",
                points = 3,
                trigger = mapID == 0x1d
                       && EventCheck(bit5(0x2a50de))
                       && LoadProtection()

                )      

    achievement(title = "Bombs Away",
                description = "Use a bomb to open up the passage",
                points = 2,
                trigger = mapID == 0x1d
                       && EventCheck(bit1(0x2a50e1))
                       && LoadProtection()

                )   

    achievement(title = "The Path is Open",
                description = "Activate the Western Reflector",
                points = 10,
                trigger = mapID == 0x33
                       && EventCheck(bit3(0x2a50d1))
                       && LoadProtection()

                )       

    achievement(title = "Full Loop",
                description = "Active the last Drawbridge lever, giving you access to all the castle shortcuts",
                points = 3,
                trigger = mapID == 0x0a
                       && EventCheck(bit0(0x2a50c6))
                       && LoadProtection()

                )     

    achievement(title = "Road to Freedom",
                description = "Open the way and get your freedom",
                points = 5,
                trigger = mapID == 0x0c
                       && EventCheck(bit4(0x2a50d1))
                       && LoadProtection()

                )     

    achievement(title = "The Blade Key",
                description = "Obtain the Queen Sword. You're not leaving this castle alone !",
                points = 10,
                trigger = mapID == 0x23
                       && EventCheck(bit1(0x2a50e9))
                       && LoadProtection()

                )  

    achievement(title = "Only One Horned Boy Remains",
                description = "Defeat all the Horned Shadows and make your way to the Queen",
                points = 10,
                trigger = mapID == 0x2e
                       && EventCheck(bit2(0x2a50c1))
                       && LoadProtection()

                )    

    achievement(title = "Long Live the Queen",
                description = "The Queen is Dead",
                points = 10,
                trigger = mapID == 0x25
                       && EventCheck(bit2(0x2a50ea))
                       && LoadProtection()

                )   

    achievement(title = "You Were There",
                description = "The End",
                points = 25,
                trigger = mapID == 0x27
                       && EventCheck(bit3(0x2a50ec))
                       && LoadProtection()

                )       

    achievement(title = "Watermelon Sharing",
                description = "Eating watermelons with a friend [New Game Plus Only]",
                points = 25,
                trigger = mapID == 0x27
                       && EventCheck(bit2(0x2a50ec))
                       && LoadProtection()

                )       

    achievement(title = "Master of the Castle",
                description = "Complete the game in 2h or less (in-game time)",
                points = 50,
                trigger = mapID == 0x27
                       && EventCheck(bit3(0x2a50ec))
                       && LoadProtection()
                       && (DisplayRefreshRate == 0 && GameTimer < 432000 //60Hz
                       || DisplayRefreshRate == 1 && GameTimer < 360000 ) //50Hz

                )                                                                                                                                                                                       
// Leaderboard


// Rich Presence

rich_presence_conditional_display(
    LanguageSelected == 0x02 && mapID > 0 && (mapID <= 39 || mapID == 63),
    "• A lost boy exploring a scary castle • {0} •",
    rich_presence_lookup("MapID", mapID, MapDisplay)
    )

rich_presence_conditional_display(
    LanguageSelected == 0x03 && mapID > 0 && (mapID <= 39 || mapID == 63),
    "• Un garçon perdu explorant un effrayant chateau • {0} •",
    rich_presence_lookup("MapID", mapID, MapDisplay)
    )   

rich_presence_conditional_display(
    LanguageSelected == 0x04 && mapID > 0 && (mapID <= 39 || mapID == 63),
    "• Der verlorene Junge erkundet das angsteinflößende Schloss • {0} •",
    rich_presence_lookup("MapID", mapID, MapDisplay)
    )   

rich_presence_conditional_display(
    LanguageSelected == 0x05 && mapID > 0 && (mapID <= 39 || mapID == 63),
    "• Un ragazzo sperduto che esplora un castello spaventoso • {0} •",
    rich_presence_lookup("MapID", mapID, MapDisplay)
    )  

rich_presence_conditional_display(
    LanguageSelected == 0x06 && mapID > 0 && (mapID <= 39 || mapID == 63),
    "• Un chico explorando un castillo aterrador • {0} •",
    rich_presence_lookup("MapID", mapID, MapDisplay)
    )      
   
rich_presence_display(
    "• ICO •"
)