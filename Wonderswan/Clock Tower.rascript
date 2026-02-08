// Clock Tower
// #ID = 14874
// 20250522 Version - Sines

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


///Core
//Constant
CGID = word(0x262)
MapID = word(0x11ab0)
MainMenu = 0x3754

LotteAliveFlag = word(0x11766)
AnneAliveFlag = word(0x11768)
LauraAliveFlag = word(0x1176a)

EndingH = word(0x119fc)
EndingG = word(0x119fa)
EndingF = word(0x119f8)
EndingE = word(0x119f6)
EndingD = word(0x119f4)
EndingC = word(0x119f2)
EndingB = word(0x119f0)
EndingA = word(0x119ee)
EndingS = word(0x119ec)

function LoadCheck() => CGID != MainMenu && CGID != 0

    achievement(title = "There's a treatment for that",
	points = 2,
	description = "Witness tears of blood from a portrait",
	trigger = word(0x117ca) == 1
           && prev(word(0x117ca)) == 0
           && MapID == 0x0003
           && LoadCheck()
    )

    achievement(title = "More than survive",
	points = 2,
	description = "Break a mirror",
	trigger = word(0x115e6) == 0
           && prev(word(0x115e6)) == 1
           && MapID == 0x0004
           && LoadCheck()
    )

    achievement(title = "Silly Birb",
	points = 2,
	description = "Capture a parrot you yourself released",
	trigger = word(0x117d4) == 2
           && prev(word(0x117d4)) < 2
           && MapID == 0x0004
           && LoadCheck()
    )

    achievement(title = "Only a mother could love",
	points = 2,
	description = "Discover the children's photo",
	trigger = word(0x0262) == 0xbd2a
           && prev(word(0x0262)) == 0x1a38
           && MapID == 0x0004
           && LoadCheck()
    )

    achievement(title = "Bad Sanitation",
	points = 2,
	description = "Wash your hand with something other than water",
	trigger = (word(0x0262) == 0x9e9c
           || word(0x0262) == 0xad44)
           && MapID == 0x0005
           && LoadCheck()
    )

    achievement(title = "Escape Plan",
	points = 2,
	description = "Open up a shortcut in the Collapsed Hall",
	trigger = word(0x1167a) == 0
           && prev(word(0x1167a)) == 1
           && MapID == 0x0014
           && LoadCheck()
    )    

    achievement(title = "Feeding Frenzy",
	points = 3,
	description = "Give food to a prisoner",
	trigger = word(0x11ac2) == 0
           && prev(word(0x11ac2)) == 1
           && MapID == 0x0012
           && LoadCheck()
    ) 

    achievement(title = "No Future",
	points = 3,
	description = "Try to escape in the garage after all your friends have died",
	trigger = MapID == 0x000d
           && prev(MapID) == 0x0036
           && AnneAliveFlag == 0
           && LotteAliveFlag == 0
           && LauraAliveFlag == 0
           && LoadCheck()
    )  

    achievement(title = "Arcane Knowledge",
	points = 5,
	description = "Learn about the secret of the Clock Tower",
	trigger = word(0x118ac) == 1
           && prev(word(0x118ac)) == 0
           && LoadCheck()
    )    

    achievement(title = "Blackest Wings",
	points = 2,
	description = "Save a captured Crow",
	trigger = word(0x11684) == 0
           && prev(word(0x11684)) == 1
           && MapID == 0x0017
           && LoadCheck()
    ) 

    achievement(title = "Of Rats and Women",
	points = 2,
	description = "Save a captured Rat",
	trigger = word(0x11682) == 0
           && prev(word(0x11682)) == 1
           && MapID == 0x0017
           && LoadCheck()
    )      

    achievement(title = "Danger Diver",
	points = 5,
	description = "Find a use for your Rope",
	trigger = word(0x11aca) == 0
           && prev(word(0x11aca)) == 1
           && LoadCheck()
    )   

    achievement(title = "A Father's Fate",
	points = 5,
	description = "Discover the tragic fate of your Father",
	trigger = word(0x0262) == 0xe93a
           && LoadCheck()
    )    

    achievement(title = "Blending In",
	points = 3,
	description = "Sneak past the guard and enter the secret cave",
	trigger = MapID == 0x002a
           && prev(MapID) == 0x0028
           && LoadCheck()
    )               
/// Girly Pop death cheevos

    achievement(title = "From the Top Rope",
	points = 5,
	description = "Witness Anne's aerial death in the Foyer",
	trigger = AnneAliveFlag == 0
           && prev(AnneAliveFlag) == 1
           && MapID == 0x000a
           && LoadCheck()
    )


    achievement(title = "Washed Up",
	points = 5,
	description = "Find Laura's body in the Bathroom",
	trigger = word(0x0262) == 0x0ad8
           && MapID == 0x0005
           && LoadCheck()
    )

    achievement(title = "Little Mermaid",
	points = 5,
	description = "Watch Anne drown in the Courtyard",
	trigger = AnneAliveFlag == 0
           && prev(AnneAliveFlag) == 1
           && MapID == 0x0013
           && LoadCheck()
    )

    achievement(title = "Poor Knight",
	points = 5,
	description = "Find Laura's Body hidden in the Knight Suit",
	trigger = word(0x0262) == 0x7446 
           && MapID == 0x0030
           && LoadCheck()
    )    

    achievement(title = "Back of the Shed",
	points = 5,
	description = "Hear Lotte's Demise in the Shed",
	trigger = LotteAliveFlag == 0
           && prev(LotteAliveFlag) == 1
           && MapID == 0x0012
           && LoadCheck()
    )   

    achievement(title = "Lesson in Momentum",
	points = 5,
	description = "Peep on Anne falling from a window",
	trigger = word(0x0262) == 0x459c
           && LoadCheck()
    )   

    achievement(title = "One Last Goodbye",
	points = 5,
	description = "Hear the dying words of Lotte",
	trigger = LotteAliveFlag == 0
           && prev(LotteAliveFlag) == 1
           && MapID == 0x0028
           && LoadCheck()
    )       
/// Item Collection Cheevos

    achievement(title = "Little Lady",
	points = 3,
	description = "Find a Bottle of Perfume",
	trigger = word(0x11ac0) == 1
           && prev(word(0x11ac0)) == 0
           && LoadCheck()
    )

    achievement(title = "Hunger Checkpoint",
	points = 3,
	description = "Find a Ham",
	trigger = word(0x11ac2) == 1
           && prev(word(0x11ac2)) == 0
           && LoadCheck()
    )

    achievement(title = "Pilot Trainee",
	points = 3,
	description = "Find the Car Key",
	trigger = word(0x11ac4) == 1
           && prev(word(0x11ac4)) == 0
           && LoadCheck()
    )    

    achievement(title = "Exterminator",
	points = 3,
	description = "Find the Pesticide",
	trigger = word(0x11ac6) == 1
           && prev(word(0x11ac6)) == 0
           && LoadCheck()
    )   

    achievement(title = "Fashion Follower",
	points = 3,
	description = "Find the Black Robes",
	trigger = word(0x11ac8) == 1
           && prev(word(0x11ac8)) == 0
           && LoadCheck()
    )          

    achievement(title = "Adventurer's Staple",
	points = 3,
	description = "Find a Rope",
	trigger = word(0x11aca) == 1
           && prev(word(0x11aca)) == 0
           && LoadCheck()
    )  

    
    achievement(title = "Cavewoman",
	points = 3,
	description = "Find a Stone",
	trigger = word(0x11acc) == 1
           && prev(word(0x11acc)) == 0
           && LoadCheck()
    )

    achievement(title = "Tactical Combat",
	points = 3,
	description = "Find the Cage Key",
	trigger = word(0x11ace) == 1
           && prev(word(0x11ace)) == 0
           && LoadCheck()
    )

    achievement(title = "Light in the Dark",
	points = 3,
	description = "Find the Lantern",
	trigger = word(0x11ad2) == 1
           && prev(word(0x11ad2)) == 0
           && LoadCheck()
    )  

    achievement(title = "Prison Breaker",
	points = 3,
	description = "Find the Jail Key",
	trigger = word(0x11ad0) == 1
           && prev(word(0x11ad0)) == 0
           && LoadCheck()
    )  

    achievement(title = "Magician's Apprentice",
	points = 3,
	description = "Find the Ritual Key",
	trigger = word(0x11ad4) == 1
           && prev(word(0x11ad4)) == 0
           && LoadCheck()
    )   

    achievement(title = "Fairy's Bane",
	points = 3,
	description = "Find the Silver Key",
	trigger = word(0x11ad6) == 1
           && prev(word(0x11ad6)) == 0
           && LoadCheck()
    )                     

    achievement(title = "Glimmer in the Eye",
	points = 3,
	description = "Find the Gold Key",
	trigger = word(0x11ad8) == 1
           && prev(word(0x11ad8)) == 0
           && LoadCheck()
    ) 

    achievement(title = "Social Climber",
	points = 3,
	description = "Find the West Building Key",
	trigger = word(0x11adc) == 1
           && prev(word(0x11adc)) == 0
           && LoadCheck()
    )     

    achievement(title = "Weapon Master",
	points = 3,
	description = "Find a Dagger",
	trigger = word(0x11ae0) == 1
           && prev(word(0x11ae0)) == 0
           && LoadCheck()
    )    

    achievement(title = "Master of Ceremony",
	points = 5,
	description = "Find the hidden Cane",
	trigger = word(0x11ada) == 1
           && prev(word(0x11ada)) == 0
           && LoadCheck()
    )     

    achievement(title = "Night Worship",
	points = 5,
	description = "Find the hidden Idol",
	trigger = word(0x11ade) == 1
           && prev(word(0x11ade)) == 0
           && LoadCheck()
    )           
/// Ending Cheevos
    achievement(title = "Let's Be Brave and Run Away",
	points = 5,
	description = "Obtain Ending H",
	trigger = EndingH == 1
           && prev(EndingH) == 0
           && LoadCheck()
    )

    achievement(title = "Jennifer Died on the Way Back to Her Home Planet",
	points = 5,
	description = "Obtain Ending G",
	trigger = EndingG == 1
           && prev(EndingG) == 0
           && LoadCheck()
    )

    achievement(title = "Offscreen'd",
	points = 10,
	description = "Obtain Ending F",
	trigger = EndingF == 1
           && prev(EndingF) == 0
           && LoadCheck()
    )

    achievement(title = "Forgetting the Basics of CQC",
	points = 10,
	description = "Obtain Ending E",
	trigger = EndingE == 1
           && prev(EndingE) == 0
           && LoadCheck()
    )

    achievement(title = "A Mother's Love",
	points = 10,
	description = "Obtain Ending D",
	trigger = EndingD == 1
           && prev(EndingD) == 0
           && LoadCheck()
    )


    achievement(title = "Pride's Fall",
	points = 10,
	description = "Obtain Ending C",
	trigger = EndingC == 1
           && prev(EndingC) == 0
           && LoadCheck()
    )

    achievement(title = "Shocking Twist",
	points = 10,
	description = "Obtain Ending B",
	trigger = EndingB == 1
           && prev(EndingB) == 0
           && LoadCheck()
    )

    achievement(title = "Abnormal Survivor",
	points = 10,
	description = "Obtain Ending A",
	trigger = EndingA == 1
           && prev(EndingA) == 0
           && LoadCheck()
    )

    achievement(title = "Death Will Never Write My Name",
	points = 25,
	description = "Obtain Ending S",
	trigger = EndingS == 1
           && prev(EndingS) == 0
           && LoadCheck()
    )







///RP Script
RP_EndingS= { 
                    0x00:"[]",
                    0x01:"[S]"

                    }   

RP_EndingA = { 
                    0x00:"[]",
                    0x01:"[A]"

                    }   
RP_EndingB = { 
                    0x00:"[]",
                    0x01:"[B]"

                    }   
RP_EndingC = { 
                    0x00:"[]",
                    0x01:"[C]"

                    }   
RP_EndingD = { 
                    0x00:"[]",
                    0x01:"[D]"

                    }   
RP_EndingE = { 
                    0x00:"[]",
                    0x01:"[E]"

                    }   
RP_EndingF = { 
                    0x00:"[]",
                    0x01:"[F]"

                    }   
RP_EndingG = { 
                    0x00:"[]",
                    0x01:"[G]"

                    }   
RP_EndingH = { 
                    0x00:"[]",
                    0x01:"[H]"

                    }   

RP_Anne = { 
                    0x00:"❌",
                    0x01:"✔️"

                    }   
RP_Laura = { 
                    0x00:"❌",
                    0x01:"✔️"

                    }  
RP_Lotte = { 
                    0x00:"❌",
                    0x01:"✔️"

                    }  



rich_presence_display(
    "• Girlypop Status - Anne:{0} - Laura:{1} - Lotte:{2} • Endings Cleared: {3}{4}{5}{6}{7}{8}{9}{10}{11}",
    rich_presence_lookup("RP_Anne", AnneAliveFlag, RP_Anne),
    rich_presence_lookup("RP_Laura", LauraAliveFlag, RP_Laura),
    rich_presence_lookup("RP_Lotte", LotteAliveFlag, RP_Lotte),
    rich_presence_lookup("RP_EndingS", EndingS, RP_EndingS),
    rich_presence_lookup("RP_EndingA", EndingA, RP_EndingA),
    rich_presence_lookup("RP_EndingB", EndingB, RP_EndingB),
    rich_presence_lookup("RP_EndingC", EndingC, RP_EndingC),
    rich_presence_lookup("RP_EndingD", EndingD, RP_EndingD),
    rich_presence_lookup("RP_EndingE", EndingE, RP_EndingE),
    rich_presence_lookup("RP_EndingF", EndingF, RP_EndingF),
    rich_presence_lookup("RP_EndingG", EndingG, RP_EndingG),
    rich_presence_lookup("RP_EndingH", EndingH, RP_EndingH)

)  




































































































































