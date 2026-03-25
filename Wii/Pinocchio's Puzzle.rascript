// Pinocchio's Puzzle
// #ID = 38162
// 20260319 Version - Sines

PuzzleID = byte(0x28feeb)
PuzzleProgFile1 = byte(0x27b100)
PuzzleProgFile2 = byte(0x27b1a2)
PuzzleProgFile3 = byte(0x27b244)
function LoadCheck() =>
       PuzzleID == prev(PuzzleID)

    achievement(title="Mankind Creation",
                description = "Complete Puzzle 1",
                points = 1,
                trigger = PuzzleID == 1
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 2
                       && prev(PuzzleProgFile1) == 1)
                       || (PuzzleProgFile2 == 2
                       && prev(PuzzleProgFile2) == 1)
                       || (PuzzleProgFile3 == 2
                       && prev(PuzzleProgFile3) == 1))
)   

achievement(title="New Life",
                description = "Complete Puzzle 2",
                points = 2,
                trigger = PuzzleID == 2
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 3
                       && prev(PuzzleProgFile1) == 2)
                       || (PuzzleProgFile2 == 3
                       && prev(PuzzleProgFile2) == 2)
                       || (PuzzleProgFile3 == 3
                       && prev(PuzzleProgFile3) == 2))
)   

    achievement(title="Song and Dance",
                description = "Complete Puzzle 3",
                points = 2,
                trigger = PuzzleID == 3
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 4
                       && prev(PuzzleProgFile1) == 3)
                       || (PuzzleProgFile2 == 4
                       && prev(PuzzleProgFile2) == 3)
                       || (PuzzleProgFile3 == 4
                       && prev(PuzzleProgFile3) == 3))
)   

    achievement(title="Peer Pressure",
                description = "Complete Puzzle 4",
                points = 2,
                trigger = PuzzleID == 4
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 5
                       && prev(PuzzleProgFile1) == 4)
                       || (PuzzleProgFile2 == 5
                       && prev(PuzzleProgFile2) == 4)
                       || (PuzzleProgFile3 == 5
                       && prev(PuzzleProgFile3) == 4))
)   

    achievement(title="Puppet Show",
                description = "Complete Puzzle 5",
                points = 2,
                trigger = PuzzleID == 5
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 6
                       && prev(PuzzleProgFile1) == 5)
                       || (PuzzleProgFile2 == 6
                       && prev(PuzzleProgFile2) == 5)
                       || (PuzzleProgFile3 == 6
                       && prev(PuzzleProgFile3) == 5))
)   

    achievement(title="Caged",
                description = "Complete Puzzle 6",
                points = 2,
                trigger = PuzzleID == 6
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 7
                       && prev(PuzzleProgFile1) == 6)
                       || (PuzzleProgFile2 == 7
                       && prev(PuzzleProgFile2) == 6)
                       || (PuzzleProgFile3 == 7
                       && prev(PuzzleProgFile3) == 6))
)   

    achievement(title="Classic Tale",
                description = "Complete Puzzle 7",
                points = 2,
                trigger = PuzzleID == 7
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 8
                       && prev(PuzzleProgFile1) == 7)
                       || (PuzzleProgFile2 == 8
                       && prev(PuzzleProgFile2) == 7)
                       || (PuzzleProgFile3 == 8
                       && prev(PuzzleProgFile3) == 7))
)   


    achievement(title="Skipping School",
                description = "Complete Puzzle 8",
                points = 3,
                trigger = PuzzleID == 8
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 9
                       && prev(PuzzleProgFile1) == 8)
                       || (PuzzleProgFile2 == 9
                       && prev(PuzzleProgFile2) == 8)
                       || (PuzzleProgFile3 == 9
                       && prev(PuzzleProgFile3) == 8))
)   

    achievement(title="You Donkey",
                description = "Complete Puzzle 9",
                points = 3,
                trigger = PuzzleID == 9
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 10
                       && prev(PuzzleProgFile1) == 9)
                       || (PuzzleProgFile2 == 10
                       && prev(PuzzleProgFile2) == 9)
                       || (PuzzleProgFile3 == 10
                       && prev(PuzzleProgFile3) == 9))
)   

    achievement(title="Sea Monstro",
                description = "Complete Puzzle 10",
                points = 3,
                trigger = PuzzleID == 10
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 11
                       && prev(PuzzleProgFile1) == 10)
                       || (PuzzleProgFile2 == 11
                       && prev(PuzzleProgFile2) == 10)
                       || (PuzzleProgFile3 == 11
                       && prev(PuzzleProgFile3) == 10))
)   

    achievement(title="Firebringer",
                description = "Complete Puzzle 11",
                points = 3,
                trigger = PuzzleID == 11
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 12
                       && prev(PuzzleProgFile1) == 11)
                       || (PuzzleProgFile2 == 12
                       && prev(PuzzleProgFile2) == 11)
                       || (PuzzleProgFile3 == 12
                       && prev(PuzzleProgFile3) == 11))
)   

    achievement(title="Monstro Sneeze",
                description = "Complete Puzzle 12",
                points = 5,
                trigger = PuzzleID == 12
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 13
                       && prev(PuzzleProgFile1) == 12)
                       || (PuzzleProgFile2 == 13
                       && prev(PuzzleProgFile2) == 12)
                       || (PuzzleProgFile3 == 13
                       && prev(PuzzleProgFile3) == 12))
)   

    achievement(title="Real Boy",
                description = "Complete Puzzle 13",
                points = 10,
                trigger = PuzzleID == 13
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 14
                       && prev(PuzzleProgFile1) == 13)
                       || (PuzzleProgFile2 == 14
                       && prev(PuzzleProgFile2) == 13)
                       || (PuzzleProgFile3 == 14
                       && prev(PuzzleProgFile3) == 13))
)   

    achievement(title="Celebrations",
                description = "Complete Puzzle 14",
                points = 10,
                trigger = PuzzleID == 14
                       && LoadCheck()
                       && ((PuzzleProgFile1 == 15
                       && prev(PuzzleProgFile1) == 14)
                       || (PuzzleProgFile2 == 15
                       && prev(PuzzleProgFile2) == 14)
                       || (PuzzleProgFile3 == 15
                       && prev(PuzzleProgFile3) == 14))
)


/// RP Script

rich_presence_conditional_display(PuzzleID !=0,
    "• Experiencing a classic tale in Puzzle {0} •",
    rich_presence_value("PuzzleID", PuzzleID)
)

rich_presence_display("• One day, I'm going to be a real boy! •"
)