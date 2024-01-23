// My French Coach: Level 1 - Learn to Speak French
// #ID = 14965
// 20240117 Version - Sines

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


// $147158: [8 Bit] Minigame Difficulty
// $147188: pin
// $14718C: [32 Bit] Good Answer Count
// $147190: [32 Bit] Bad Answer Count
// $1471AC: [32 Bit] Question Nb
// $147368: [16 Bit] Lesson Learned
//          Max 0x3d2 > 978
// $147418: [8 Bit] Player Rank
// $147421: [8 Bit] Bitflag Cheat
//          Bit 0 | Cheat On
// $147E38: pin minigame
// $1491EC: [32 Bit] Lesson ID
//          - Only for interactive map

///Core
//Constant

//Quick points distribution
Baby = 3
Easy = 5
Medium = 10
Hard = 25
Challenge = 50

CheevoNames = {
    70: "Le Voyage Commence",
    90: "L'Etranger",
    110: "Voyage Au Bout de la Nuit",
    130: "Le Petit Prince",
    150: "Les Fleurs du Mal",
    170: "Les Misérables",
    190: "Liasons Dangereuses",
    210: "Le Comte de Monte-Cristo",
    230: "La Horde du Contrevent",
    250: "L'Ecume des Jours",
    270: "A la Recherche du Temps Perdu",
    290: "Madame Bovary",
    310: "La Promesse de L'Aube",
    330: "Le Horla",
    350: "La Nuit des Temps",
    370: "Notre-Dame de Paris",
    390: "Candide ou l'Optimisme",
    410: "Germinal",
    430: "Ving Mille Lieues Sous les Mers",
    450: "Les Trois Mousquetaires",
    470: "Du Côté de chez Swann",
    490: "Mémoires d'Hadrien",
    510: "Le Père Goriot",
    530: "Les Fourmis",
    550: "Les Rois Maudits",
    570: "Illusions Perdues",
    590: "Voyage au Centre de la Terre",
    610: "Antigone",
    630: "La Planète des Singes",
    650: "L'Île Mystérieuse",
    670: "Le Tour du Monde en 80 Jours",
    690: "Le Spleen de Paris",
    710: "Le Misanthrope",
    730: "La Chute",
    750: "Discours de la Servitude Volontaire",
    770: "A l'Ombre des Jeunes Filles en Fleurs",
    790: "Au Bonheur des Dames",
    810: "L'Homme qui Rit",
    830: "La Dame aux Camélias",
    850: "Les Thanatonautes",
    870: "Le Mystère de la Chambre Jaune",
    890: "De la Terre à la Lune",
    910: "La Princesse de Clèves",
    930: "J'Accuse !",
    950: "Le Bourgeois Gentilhomme"
}

//----------------
//Variable
GoodAnswer = dword(0x14718c)
BadAnswer = dword(0x147190)
LessonLearned = word(0x147368)
CheatValue = bit0(0x147421)
//Function
function LessonCleared(Lesson) => LessonLearned == Lesson +1 && prev(LessonLearned) == Lesson && CheatValue == 0


//----------------
///Achievement Code
// --- --- --- --- --- ---
// Progression
// --- --- --- --- --- ---
    achievement(title="Très Bien !",
                description = "Display your French Mastery by obtaining a Perfect Score in the entrance exam",
                points = 5,
                trigger = LessonLearned == 1
                       && GoodAnswer == 0x32
                       && prev(GoodAnswer) == 0x31

)

    achievement(title="Paris: Ville Lumiere",
                description = "Complete Beginner's Lessons 1 ~ 16",
                points = 5,
                trigger = CheatValue == 0
                       && LessonCleared(16)

)    

    achievement(title="Northern France",
                description = "Complete Intermediate Lessons 17 ~ 37",
                points = 10,
                trigger = CheatValue == 0
                       && LessonCleared(16)

) 

    achievement(title="Southern France",
                description = "Complete Advanced Lessons 38 ~ 50",
                points = 10,
                trigger = CheatValue == 0
                       && LessonCleared(38)

)  

for i in range(70, 950, 20){    
    achievement(title=CheevoNames[i],
                description = "Complete Lessons "+ i-19+ " ~ "+ i,
                points = 10,
                trigger = CheatValue == 0
                       && LessonCleared(i)

)  
        
}

    achievement(title="Le Voyage Est Terminé !",
                description = "Complete Lessons 951 ~ 977",
                points = 25,
                trigger = CheatValue == 0
                       && LessonCleared(977)

)  
// Rich Presence

rich_presence_conditional_display(
    CheatValue == 1,
    "• 🥐Learning French like the Best of them all • Lesson {0}.",
    rich_presence_value("Lesson", LessonLearned)
)  
 
rich_presence_display(
    "• 🥐Learning French like the Best of them all • Lesson {0}",
    rich_presence_value("Lesson", LessonLearned)
)

