// Frankenstein: Through the Eyes of the Monster
// #ID = 25893

// 20231008 Version - Sines

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


// $10BFC4: [8 Bit] Screen ID
//          Depend on the zone ?
//          From the start have access to 01 ~ 06
// $10BFC5: [8 Bit] Room ID
// $10BFC7: [8 Bit] Current Turning Point ID
//          00 ~ 04, relative to your room ID
// $10BFE2: [8 Bit] Potential Save switch
// $10BFF0: [8 Bit] Event Flag
//          Room ID 0x30
//          Screen ID 0x02
//          Chain attached to the Water Wheel
// $10C028: [8 Bit] Event Flag
//          Room ID 0x0d
//          Screen ID 0x03
//          If On Bad Ending Flag (Failing to resurrect your daughter)
// $10C034: [8 Bit] Event Flag
//          Room ID 0x01
//          Screen ID 0x01
//          "So, I see you found your way home among the sick animals"
// $10C036: [8 Bit] Event Flag
//          Room ID 0x01
//          Screen ID 0x01
//          "I wouldn't be too quick to point a finger"
// $10C038: [8 Bit] Event Flag
//          Room ID 0x01
//          Screen ID 0x02
//          Tim Curry has now a gun, AGAIN
// $10C044: [8 Bit] Event Flag
//          Room ID 0x01
//          Screen ID 0x01
//          "YOU DESTROYED MY LIFE"
// $10C056: [8 Bit] Event Flag
//          Room ID 0x02
//          Screen ID 0x02
//          Moose Statue fell
// $10C058: [8 Bit] Event Flag
//          Room ID 0x02
//          Screen ID 0x02
//          Rope through the wall gap
// $10C068: [8 Bit] Event Flag
//          Room ID 0x03
//          Screen ID 0x00
//          "A mirror ! I must see if the face I wear is my own !"
// $10C07A: [8 Bit] Event Flag
//          Room ID 0x03
//          Screen ID 0x01
//          Broken Mirror, post "Follow me" at 0x04
// $10C0A0: [8 Bit] Event Flag
//          Room ID 0x06
//          Screen ID 0x02
//          Angry Villager in the garden
// $10C0A2: [8 Bit] Event Flag
//          Room ID 0x06
//          Screen ID 0x02
//          Angry Villager in the garden 2
// $10C0A4: [8 Bit] Event Flag
//          Room ID 0x06
//          Screen ID 0x06
//          Angry Villager in the garden 3
// $10C0A6: [8 Bit] Event Flag
//          Room ID 0x06
//          Screen ID 0x00
//          Put Grappling Hook on Rope in the Garden
// $10C0AA: [8 Bit] Event Flag
//          Room ID 0x06
//          Screen ID 0x00
//          Hooked the tree branch
// $10C0AC: [8 Bit] Event Flag
//          Room ID 0x06
//          Screen ID 0x06
//          "I gave you life and it is mine to take away !"
// $10C0CC: [8 Bit] Event Flag
//          Room ID 0x07
//          Screen ID 0x00
//          Unlocking the bolted door
// $10C0D6: [8 Bit] Event Flag
//          Room ID 0x08
//          Screen ID 0x01
//          "Ah ha ! That fiend must be hiding in here somewhere !"
// $10C0F0: [8 Bit] Event Flag
//          Room ID 0x09
//          Screen ID 0x00
//          Life Crystal in Mixing room Lift
//          True when 0x02
// $10C0F4: [8 Bit] Event Flag
//          Room ID 0x09
//          Screen ID 0x00
//          Crystal State
//          0x05 > 0x04 : Life Crystal Synthetised !
// $10C0FC: [8 Bit] Event Flag
//          Room ID 0x09
//          Screen ID 0x00
//          Purified Crystal in mixer
//          0x0f when mixed with H2O & HNO3
// $10C100: [8 Bit] Event Flag
//          Room ID 0x29
//          Screen ID 0x00
//          Life Crystal sent Up
// $10C106: [8 Bit] Event Flag
//          Room ID 0x0b
//          Screen ID 0x01
//          Prison Cell
//          Freeing Left Hand
// $10C108: [8 Bit] Event Flag
//          Room ID 0x0b
//          Screen ID 0x01
//          Prison Cell
//          Freeing Right Hand
// $10C120: [8 Bit] Event Flag
//          Room ID 0x0b
//          Screen ID 0x00
//          Prison Cell
//          "I Must escape this place now !"
// $10C13C: [8 Bit] Event Flag
//          Anywhere after stealing the notes
//          Doctor's "Patience" counter, pointing gun at you when 0
//          0x0f
//          0x03
//          turning point 0x00 for proper event
// $10C148: [8 Bit] Event Flag
//          Room ID 0x011
//          Screen ID 0x00
//          Current turning point 0x31
//          Open labyrinth secret floor door
// $10C14A: [8 Bit] Event Flag
//          Room ID 0x011
//          Screen ID 0x29
//          Lever pulled
// $10C14C: [8 Bit] Event Flag
//          Room ID 0x011
//          Screen ID 0x00
//          Current turning point 0x31
//          Reverse event flag for cutting vines
// $10C17A: [8 Bit] Event Flag
//          Room ID 0x07
//          Screen ID 0x01
//          "So thick it burns my nostrils !"
// $10C18E: [8 Bit] Event Flag
//          Room ID 0x15
//          Screen ID 0x03
//          Reverse flag > Iced Door Open
//          01 > Ice
//          00 > Open
// $10C1AC: [8 Bit] Event Flag
//          Room ID 0x16
//          Screen ID 0x02
//          "This is the same energy spectrum in Frankenstein's lab"
//          Read scientific paper in the library
// $10C1BC: [8 Bit] Event Flag
//          Room ID 0x16
//          Screen ID 0x02
//          Library Secret Passage
// $10C1C0: [8 Bit] Event Flag
//          Room ID 0x17
//          Screen ID 0x00
//          Smelter conveyor belt
//          0x01 > No rocks
//          0x02 > Rocks (this is good)
// $10C1C6: [8 Bit] Event Flag
//          Room ID 0x17
//          Screen ID 0x02
//          Mine cart door opened
// $10C1C8: [8 Bit] Event Flag
//          Room ID 0x17
//          Screen ID 0x00
//          Main Smelter belt on
// $10C204: [8 Bit] Event Flag
//          Room ID 0x1a
//          Screen ID 0x03
//          Tower confrontation with the doctor
// $10C208: [8 Bit] Event Flag
//          Room ID 0x1a
//          Screen ID 0x0
//          "It would be dangerous for you to leave this room"
// $10C220: [8 Bit] Event Flag
//          Room ID 0x1a
//          Screen ID 0x02
//          End of confrontation with the Doctor, he will surely help us :smug:
// $10C228: [8 Bit] Event Flag
//          Room ID 0x1a
//          Screen ID 0x02
//          Sara goes to see the Doctor
// $10C240: [8 Bit] Event Flag
//          Room ID 0x1a
//          Screen ID 0x00
//          Sara is SUS and VENT
// $10C244: [8 Bit] Event Flag
//          Room ID 0x1b
//          Screen ID 0x02
//          Rock falling
// $10C260: [8 Bit] Event Flag
//          Room ID 0x1b
//          Screen ID 0x01
//          "I have to go, I need an explanation"
// $10C2A6: [8 Bit] Event Flag
//          Room ID 0x01c
//          Screen ID 0x00
//          Planetarium Puzzle actived (Mountain IV)
// $10C2AE: [8 Bit] Event Flag
//          Room ID 0x1d
//          Screen ID 0x06
//          Valve turned in library secret passage
// $10C2B0: [8 Bit] Event Flag
//          Room ID 0x1d
//          Screen ID 0x0b
//          Door Opened Gear 1
// $10C2B2: [8 Bit] Event Flag
//          Room ID 0x1d
//          Screen ID 0x0b
//          Door Opened Gear 2
// $10C2B4: [8 Bit] Event Flag
//          Room ID 0x1d
//          Screen ID 0x0b
//          Door Opened Gear 3
// $10C2C4: [8 Bit] Event Flag
//          Room ID 0x22
//          Screen ID 0x01
//          Read letter from Pantry room
// $10C2C6: [8 Bit] Event Flag
//          Room ID 0x23
//          Screen ID 0x01
//          Smelting Room Passage opened
// $10C2D0: [8 Bit] Event Flag
//          Room ID 0x23
//          Screen ID 0x00
//          Big cuve lever down
// $10C2E0: [8 Bit] Event Flag
//          Room ID 0x25
//          Screen ID 0x00
//          Putting Wood Plank on Stairs
// $10C2F0: [8 Bit] Event Flag
//          Room ID 0x25
//          Screen ID 0x00
//          Electric Charge
//          Needs to be 2 or 3 or Bad Ending
// $10C2FC: [8 Bit] Event Flag
//          Room ID 0x26
//          "The servants have set up a room"
// $10C300: [8 Bit] Event Flag
//          Room ID 0x26
//          Screen ID 0x05
//          Life Crystal put in place (Endgame)
// $10C316: [8 Bit] Event Flag
//          Room ID 0x26
//          Screen ID 0x06
//          Sheet on the Shelf
//          01 > 00 when put on floor
// $10C31C: [8 Bit] Event Flag
//          Room ID 0x26
//          Screen ID 0x06
//          Putting rope on sheet increment until 0x04
//          0x04 > 0x0a
//          "Like a Parachute !"
// $10C31E: [8 Bit] Event Flag
//          Room ID 0x26
//          "Modesty be DAMNED, I'm a GENIUS"
//          00 > 01
//          
//          "Dazed is good"
//          01 > 02
// $10C320: [8 Bit] Event Flag
//          Room ID 0x26
//          Screen ID 0x06
//          00 > 01
//          Taking Life Crystal Warning 1
//          01 > 02
//          Taking Life Crystal Warning 2
// $10C322: [8 Bit] Event Flag
//          Room ID 0x26
//          "Cat's got your tongue"
// $10C336: [8 Bit] Event Flag
//          Room ID 0x26
//          Screen ID 0x06
//          "Sleep Gabrielle", sending her up to get zapped
// $10C33C: [8 Bit] Event Flag
//          Room ID 0x26
//          "I have a Theory, Life is also an energy wave"
// $10C33E: [8 Bit] Event Flag
//          Room ID 0x26
//          "As you see on this board"
// $10C340: [8 Bit] Event Flag
//          Room ID 0x26
//          Periodic Table new element
// $10C342: [8 Bit] Event Flag
//          Room ID 0x26
//          Screen ID 0x06
//          "Ah Yes, this is the reason you and I are having this conversation"
// $10C348: [8 Bit] Event Flag
//          Room ID 0x26
//          Screen ID 0x06
//          Throwing the Life Crystal Parachute
// $10C356: [8 Bit] Event Flag
//          Room ID 0x26
//          Screen ID 0x06
//          Doctor is looking at you when 0x01
// $10C358: [8 Bit] Event Flag
//          Room ID 0x26
//          Hand 2 New game
// $10C35A: [8 Bit] Event Flag
//          Room ID 0x26
//          Hand 1 New game
// $10C37E: [8 Bit] Event Flag
//          Room ID 0x27
//          Screen ID 0x00
//          "Wait, my food !"
//          Ressurect turkey leg
// $10C392: [8 Bit] Event Flag
//          Room ID 0x28
//          Screen ID 0x01
//          Found a bomb
// $10C396: [8 Bit] Event Flag
//          Room ID 0x28
//          Screen ID 0x01
//          "A note !"
// $10C3A4: [8 Bit] Event Flag
//          Room ID 0x28
//          Screen ID 0x01
//          Creeks
//          "There must be something salvageable here"
// $10C3AA: [8 Bit] Event Flag
//          Room ID 0x28
//          Screen ID 0x01
//          "Blood Everywhere"
// $10C3AE: [8 Bit] Event Flag
//          Room ID 0x28
//          Screen ID 0x02
//          Harpoon got
//          0x01 > 0x02
//          Squid killed
// $10C3B0: [8 Bit] Event Flag
//          Room ID 0x28
//          Screen ID 0x02
//          Creeks
//          Diving Suit On
// $10C3B2: [8 Bit] Event Flag
//          Room ID 0x28
//          Screen ID 0x02
//          Diving Suite machine activated
// $10C3B4: [8 Bit] Event Flag
//          Room ID 0x28
//          Screen ID 0x01
//          Picked up children corpse
// $10C3BE: [8 Bit] Event Flag
//          Room ID 0x2f
//          Screen ID 0x01
//          Dived In
//          0x2f
//          0x00
//          turning point 0x59 > Treasure chest (funny bit)
// $10C3E2: [8 Bit] Event Flag
//          Room ID 0x10
//          Screen ID 0x01
//          Sara killed by the beast on the ladder
// $10C3F0: [8 Bit] Event Flag
//          Room ID 0x2e
//          Screen ID 0x01
//          Table put in front of the armor guards
// $10C3F2: [8 Bit] Event Flag
//          Room ID 0x2e
//          Screen ID 0x00
//          Fire extinguished
// $10C3F4: [8 Bit] Event Flag
//          Room ID 0x2e
//          Screen ID 0x01
//          Aquarium Tank moved
// $10C402: [8 Bit] Event Flag
//          Room ID 0x30
//          Screen ID 0x01
//          Water Wheel flag
//          00 > Stopped
//          01 > Activated
// $10C404: [8 Bit] Event Flag
//          Room ID 0x30
//          Screen ID 0x02
//          Water Wheel Lever pulled (green wires)
// $10C40A: [8 Bit] Event Flag
//          Room ID 0x30
//          Screen ID 0x01
//          Chained door opened (water wheel)
//          Goes 0x02 > 0x03 on opening (previous increment are the steps done in order to open)
// $10C40C: [8 Bit] Event Flag
//          Room ID 0x32
//          Screen ID 0x00
//          Secret tunnels converyor belt on
//          0x01 > No rocks
//          0x02 > Rocks (this is good)
// $10C40E: [8 Bit] Event Flag
//          Room ID 0x32
//          Screen ID 0x00
//          Secret tunnels converyor belt 2 on
//          0x01 > No rocks
//          0x02 > Rocks (this is good)
// $10C410: [8 Bit] Event Flag
//          Room ID 0x32
//          Screen ID 0x00
//          Secret tunnels converyor belt 3 on
//          0x01 > No rocks
//          0x02 > Rocks (this is good)
// $10C422: [8 Bit] Event Flag
//          Room ID 0x32
//          Screen ID 0x0b
//          Talking Hand event 2
// $10C450: [8 Bit] Event Flag
//          Room ID 0x32
//          Screen ID 0x02
//          Secret tunnel Talking Hand event "Go right Philip"
// $10C454: [8 Bit] Event Flag
//          Room ID 0x32
//          Screen ID 0x0b
//          Talking Hand event 3 (Goes left)
// $10C456: [8 Bit] Event Flag
//          Room ID 0x34
//          Screen ID 0x01
//          Sara saved from the beast on the ladder
// $10C45A: [8 Bit] Event Flag
//          Room ID 0x35
//          Screen ID 0x00
//          Garden Gargoyle Ball Pushed
// $10C466: [8 Bit] Event Flag
//          Room ID 0x36
//          Screen ID 0x02
//          Drank water
// $10C472: [8 Bit] Event Flag
//          Room ID 0x36
//          Screen ID 0x03
//          "You must be thirsty"
// $10C478: [8 Bit] Event Flag
//          Room ID 0x36
//          Screen ID 0x04
//          "I must show her the truth !"
// $10C4B6: [8 Bit] Event Flag
//          Room ID 0x2e
//          Screen ID 0x01
//          Guard activated and stuck on table
// $10C4C2: [8 Bit] Event Flag
//          Screen ID 0x01
//          Room ID 0x0d
//          Game OVER
//          
//          0x0d
//          0x07 THE END
// $10C4CA: [8 Bit] Item grab flag
// $10C50C: [32 Bit BE] Grabbed Item ID ?
//          0 > Nothing
//          0x6ecc9 > Life Crystal
//          0x64cca > Paper (16 Volt Battery)
//          0x664ca > Paper (Rat Schema)
//          0x6bcc9 > Wood Plank
// $10C5CA: [8 Bit] Event Flag
//          Room ID 0x05
//          Screen ID 0x03
//          Obtained Bag
//          Goes 0x00 > 0x02 on collection
//          Goes 0x02 > 0x01 after voice cutscene
// $10C5E2: [8 Bit] Event Flag
//          "Dead Tissue" Chicken Leg in Bag
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C62A: [8 Bit] Event Flag
//          Crowbar from 0x07
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C642: [8 Bit] Event Flag
//          Note 1 from 0x07
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C65A: [8 Bit] Event Flag
//          Note 2 from 0x07
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C702: [8 Bit] Event Flag
//          Beetle next to Skull in 0x11
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C71A: [8 Bit] Event Flag
//          Bolt Cutter from Plants in 0x11
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C732: [8 Bit] Event Flag
//          Wires from 0x15
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C74A: [8 Bit] Event Flag
//          Batteries (Green box) from 0x15
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C7F2: [8 Bit] Event Flag
//          Lectern's Paper (Library)
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C822: [8 Bit] Event Flag
//          Library Paper 1
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C83A: [8 Bit] Event Flag
//          Library Paper 2
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10C852: [8 Bit] Event Flag
//          Life Crystal in Bag
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10CA62: [8 Bit] Event Flag
//          Notes 1 from 0x26
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10CA7A: [8 Bit] Event Flag
//          Notes 2 from 0x26
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $10CAAA: [8 Bit] Event Flag
//          Grappling Hook from 0x27
//          0x00 > 0x02  on grab
//          0x02 > 0x01 after voice cutscene
// $17F5D2: [8 Bit] In game flag
//          00 > Pause menu
//          01 > In Game
// $17F5D6: [8 Bit] Cutscene flag ?
//          00 > Gameplay
//          01 > Cutscene
// $17F614: [8 Bit] Music Configuration
//          00 ~ 07
// $17F615: [8 Bit] Volume Configuration
//          00 ~ 07



///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50


//----------------
//Variable
ScreenID = byte(0x10bfc4)
RoomID = byte(0x10bfc5)
TurningPointID = byte(0x10bfc7)	
PauseCheck = byte(0x17f5da) // 01 In game > 00 Pause (can pause for a few frames on switching zones)



//----------------
//Function
function EventCheck(Screen,Room,Event) => ScreenID == Screen && RoomID == Room && byte(Event) == 1 && prev(byte(Event)) == 0
function AdvancedEventCheck(Screen,Room,Event,ValueBefore,ValueAfter) => ScreenID == Screen && RoomID == Room && byte(Event) == ValueAfter && prev(byte(Event)) == ValueBefore
function LoadCheck() => prev(PauseCheck) == 0 
function ItemGrab(Event,ValueBefore,ValueAfter) => byte(Event) == ValueAfter && prev(byte(Event)) == ValueBefore



//----------------
///Achievement Code
// Progression


achievement(title = "Modesty Be Damned",
                description = "Talk with the good doctor and hear how he describe himself",
                points = 1,
                trigger = EventCheck(0x04,0x26,0x10c31e)
                       
                )

achievement(title = "Like a Parachute",
                description = "Send the Life Crystal floating away",
                points = 2,
                trigger = AdvancedEventCheck(0x06,0x26,0x10c31c,0x04,0x0a)
                       
                )
                
achievement(title = "Local Repairman",
                description = "Get access to the lower level despite the broken stairs",
                points = 1,
                trigger = EventCheck(0x00,0x25,0x10c2e0)
                       
                )
                
achievement(title = "Power of Gravity",
                description = "Using simple gravity destroy the hanging statue on the outside of the tower and start your escape",
                points = 2,
                trigger = EventCheck(0x02,0x02,0x10c058)
                       
                )
                
                
achievement(title = "Quintessential Point and Click Tool",
                description = "Obtain the Bag",
                points = 3,
                trigger = AdvancedEventCheck(0x03,0x05,0x10c5ca,0x02,0x01)
                       
                )                
                
achievement(title = "Tower Climber",
                description = "Climb the external face of the Tower and grab the Life Crystal",
                points = 2,
                trigger = ItemGrab(0x10c852,0x00,0x02)
                       
                )                
                
                
achievement(title = "Dead Tissue",
                description = "Try to reproduce the Doctor's experiment with the Turkey Leg",
                points = 2,
                trigger = EventCheck(0x00,0x27,0x10c37e)
                       
                )                
                
                
achievement(title = "Expert Throw",
                description = "Using the Grappling Hook found earlier, attach the rope to the tree branch",
                points = 3,
                trigger = EventCheck(0x00,0x06,0x10c0aa)
                       
                )                
                                
                
achievement(title = "Classic Castle Architecture",
                description = "Find the secret passage in the Library",
                points = 3,
                trigger = EventCheck(0x02,0x16,0x10c1bc)
                       
                )                    
                
                
achievement(title = "Secret Garden",
                description = "Find the secret passage in the Garden",
                points = 3,
                trigger = EventCheck(0x00,0x35,0x10c45a)
                       
                )                   
                
                
achievement(title = "Hydrolic Power",
                description = "Open the underground door next to the water wheel",
                points = 5,
                trigger = AdvancedEventCheck(0x01,0x30,0x10c40a,0x02,0x03)
                       
                )                   
                
                
achievement(title = "Talk to the Hand",
                description = "It could come in...handy.",
                points = 2,
                trigger = EventCheck(0x02,0x32,0x10c450)
                       
                )                    
                
                
achievement(title = "Trusty Harpoon",
                description = "If you go diving, don't forget to arm yourself first.",
                points = 3,
                trigger = AdvancedEventCheck(0x02,0x28,0x10c3ae,0x01,0x02)
                       
                )                   
                
achievement(title = "Scientist Weapon",
                description = "Grab a Crowbar",
                points = 2,
                trigger = ItemGrab(0x10c62a,0x00,0x02)
                       
                )                  
                
achievement(title = "No More Nice Doctor",
                description = "The Doctor really wanted you to give back his notes, now he has a gun.",
                points = 3,
                trigger = EventCheck(0x03,0x0f,0x10c02a)
                       
                )                     
                
achievement(title = "Dungeon Escape",
                description = "Free yourself from the dungeon and escape the place",
                points = 2,
                trigger = EventCheck(0x00,0x0b,0x10c120)
                       
                )     
 
achievement(title = "Green Mile",
                description = "Find the way out of the vegetal labyrinth",
                points = 3,
                trigger = AdvancedEventCheck(0x00,0x11,0x10c14c,0x01,0x00)
                       
                )    
 
 
achievement(title = "DIY Project",
                description = "Synthetise your own Life Crystal and send it up to the lab",
                points = 10,
                trigger = EventCheck(0x00,0x29,0x10c100)
                       
                )     
 
achievement(title = "Uncovering the Truth",
                description = "Confront the Doctor about his past crimes",
                points = 5,
                trigger = EventCheck(0x01,0x01,0x10c044)
                       
                )     
 
 
achievement(title = "The True Self",
                description = "Escape from the angry villagers and have a bout of introspection",
                points = 3,
                trigger = EventCheck(0x00,0x03,0x10c068)
                       
                )      
 
 
achievement(title = "Opening Up",
                description = "Enjoy a nice drinking break with your rescuer and decide to trust her with the truth",
                points = 3,
                trigger = EventCheck(0x04,0x36,0x10c478)
                       
                )      
 
 
achievement(title = "Dangerous Beast",
                description = "Save Sara from the Tunnel Beast",
                points = 5,
                trigger = EventCheck(0x01,0x34,0x10c456)
                       
                )     
 
achievement(title = "The Good Doctor",
                description = "Confront Doctor Frankenstein and persuade him to help. Or did you ?",
                points = 5,
                trigger = EventCheck(0x02,0x1a,0x10c220)
                       
                )      
 
 
achievement(title = "Kind of SUS",
                description = "Have Sara VENT in order to free you both",
                points = 2,
                trigger = EventCheck(0x00,0x1a,0x10c240)
                       
                )       
 
achievement(title = "IT'S ALIVE",
                description = "Follow in the footprint of Doctor Frankenstein and reproduce his experiment succesfully",
                points = 25,
                trigger = ScreenID == 0x03 
                && RoomID == 0x0d 
                && byte(0x10c4c2) == 1
                && byte(0x10c2f0) < 4
                       
                )                   