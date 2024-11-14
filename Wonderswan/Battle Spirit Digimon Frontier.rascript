// Battle Spirit: Digimon Frontier
// #ID = 16138
// 20241114 Version - Sines

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


Digi_Dict = { // {0}: P1ID - {1}: CheevoName Prog - {2}: Digi Name
                    0x01: [0, "Goggle Leader","Agunimon"],
                    0x02: [1, "Too Cool for School","Lobomon"],
                    0x03: [2, "Pandaman","Kumamon"],
                    0x04: [3, "Pesky Bee","Kazemon"],
                    0x05: [4, "Hard Work and Guts","Beetlemon"],
                    0x06: [5, "Umbra Lion","Loweemon"],
                    0x07: [6, "Samurai Spirit","ExAgunimon"],
                    0x08: [7, "Icy Stare","ExLobomon"]

                    }  


GameState = byte(0x1004e)
DifficultyLevel = byte(0x1005d)
Timer = byte(0x1005e)
StageID = byte(0x1006c)

DigimonShootLevel = byte(0x2018)

P1DigivolutionFlag = bit1(0xd790)
P1SpecialAttackFlag = bit3(0xd790)

P1CharID = byte(0x10058)
P1FightPoints = byte(0xd7d8)
CPUFightPoints = byte(0xd8e8)

TrainerTag = word(0xf9e2)
Rookie1Tag = word(0xf9e4)
Rookie2Tag = word(0xf9e6)
Rookie3Tag = word(0xf9e8)
Champion1Tag = word(0xf9ea)
Champion2Tag = word(0xf9ec)
Champion3Tag = word(0xf9ee)
UltimateTag = word(0xf9f0)
MegaTag = word(0xf9f2)
MasterTag = word(0xf9f4)
AncientTag = word(0xf9f6)
LoweemonUnlock = bit0(0x10067)
ExAgunimonUnlock = bit1(0x10067)
ExLobomonUnlock = bit2(0x10067)

function GameWon() => GameState == 0x0c && prev(GameState) == 0x08

function DigiProg(Digimon){
	
    title = Digi_Dict[Digimon][1]
	points = 10
	description = format("Win the arcade mode with {0}", Digi_Dict[Digimon][2])
	trigger = (P1CharID == Digi_Dict[Digimon][0]
            && GameWon()
    
    ) 

    
    achievement(title = title, points = points, description = description, trigger = trigger)
}

for Digimon in Digi_Dict
    DigiProg(Digimon)

    achievement(title="Lion's Bravery",
                description = "Unlock Loweemon",
                points = 5,
                trigger = GameState == 0x15
                       && LoweemonUnlock == 1
                       && prev(LoweemonUnlock) == 0
)  

    achievement(title="Shinobi Soul",
                description = "Unlock ExAgunimon",
                points = 5,
                trigger = GameState == 0x15
                       && ExAgunimonUnlock == 1
                       && prev(ExAgunimonUnlock) == 0
)

    achievement(title="Wolfbane",
                description = "Unlock ExLobomon",
                points = 5,
                trigger = GameState == 0x15
                       && ExLobomonUnlock == 1
                       && prev(ExLobomonUnlock) == 0
)

    achievement(title="The Hard Way",
                description = "Win the Arcade mode on Hard difficulty",
                points = 25,
                trigger = GameWon()
                       && DifficultyLevel == 2
)

    achievement(title="Perfect Digital Form",
                description = "Win the Arcade mode in Hard difficulty without using any continues past the first level",
                points = 50,
                trigger = trigger_when(GameWon())
                       && DifficultyLevel == 2
                       && once(DifficultyLevel == 2 && StageID == 1 && prev(StageID) == 0)
                       && never(GameState == 3)
                       && never(GameState == 9)
)

    achievement(title="Transcendance",
                description = "Digivolve during a Match",
                points = 2,
                trigger = GameState == 0x07
                       && P1DigivolutionFlag == 1
                       && prev(P1DigivolutionFlag) == 0

                    
)

    achievement(title="Ancient Power",
                description = "Use your special power during a Match",
                points = 3,
                trigger = GameState == 0x07
                       && P1SpecialAttackFlag == 1
                       && prev(P1SpecialAttackFlag) == 0

                    
)

    achievement(title="Violence is the Answer",
                description = "Get a Perfect in a Match",
                points = 10,
                trigger = GameState == 0x08
                       && prev(GameState) == 0x07
                       && P1FightPoints > CPUFightPoints
                       && CPUFightPoints == 0
)

    achievement(title="Zerg Rush",
                description = "Win a Match with a 50 or more point advantage over your adversary in Hard difficulty",
                points = 10,
                trigger = GameState == 0x08
                       && prev(GameState) == 0x07
                       && P1FightPoints > CPUFightPoints
                       && (P1FightPoints - CPUFightPoints) >= 50
                       && DifficultyLevel == 2
)

    achievement(title="Pushing Boundaries",
                description = "Clear the Digimon Shoot Mode",
                points = 25,
                trigger = GameState == 0x17
                       && DigimonShootLevel == 7
                       && prev(DigimonShootLevel) == 6
)

    achievement(title="Beginner's Touch",
                description = "Get your first Trainee Tamer Tag",
                points = 5,
                trigger = GameState == 0x18
                       && TrainerTag == 1
                       && prev(TrainerTag) == 0
)  

    achievement(title="New Generation",
                description = "Get your first Rookie 1 Tamer Tag",
                points = 5,
                trigger = GameState == 0x18
                       && Rookie1Tag == 1
                       && prev(Rookie1Tag) == 0
)  
    achievement(title="Double Impact",
                description = "Get your first Rookie 2 Tamer Tag",
                points = 5,
                trigger = GameState == 0x18
                       && Rookie2Tag == 1
                       && prev(Rookie2Tag) == 0
)  
    achievement(title="Third Strike",
                description = "Get your first Rookie 3 Tamer Tag",
                points = 5,
                trigger = GameState == 0x18
                       && Rookie3Tag == 1
                       && prev(Rookie3Tag) == 0
)  
    achievement(title="Arena Challenger",
                description = "Get your first Champion 1 Tamer Tag",
                points = 10,
                trigger = GameState == 0x18
                       && Champion1Tag == 1
                       && prev(Champion1Tag) == 0
)  
    achievement(title="Silver Belt",
                description = "Get your first Champion 2 Tamer Tag",
                points = 10,
                trigger = GameState == 0x18
                       && Champion2Tag == 1
                       && prev(Champion2Tag) == 0
)  
    achievement(title="Champion's Peak",
                description = "Get your first Champion 3 Tamer Tag",
                points = 10,
                trigger = GameState == 0x18
                       && Champion3Tag == 1
                       && prev(Champion3Tag) == 0
)  
    achievement(title="Digi Destiny",
                description = "Get your first Ultimate Tamer Tag",
                points = 10,
                trigger = GameState == 0x18
                       && UltimateTag == 1
                       && prev(UltimateTag) == 0
)  
    achievement(title="Thousand Fights",
                description = "Get your first Mega Tamer Tag",
                points = 25,
                trigger = GameState == 0x18
                       && MegaTag == 1
                       && prev(MegaTag) == 0
)  
    achievement(title="As Good as the Old Masters",
                description = "Get your first Master Tamer Tag",
                points = 50,
                trigger = GameState == 0x18
                       && MasterTag == 1
                       && prev(MasterTag) == 0
)  
    achievement(title="Ah Crap, Here We Go Again",
                description = "Get your first Ancient Tamer Tag",
                points = 100,
                trigger = GameState == 0x18
                       && AncientTag == 1
                       && prev(AncientTag) == 0
)  


RPDigimon = { 
                    0x00: "Agunimon",
                    0x01: "Lobomon",
                    0x02: "Kumamon",
                    0x03: "Kazemon",
                    0x04: "Beetlemon",
                    0x05: "Loweemon",
                    0x06: "ExAgunimon",
                    0x07: "ExLobomon"

                    }  

RPDifficulty = { 
                    0x00:"Easy",
                    0x01:"Normal",
                    0x02:"Hard"

                    }   

rich_presence_conditional_display(
    GameState == 6 || GameState == 7 || GameState == 8 || GameState == 9 || GameState == 0x0c || GameState == 0x0d,
    "• Fighting with {0} in Stage {1} - {2} Difficulty •",
    rich_presence_lookup("RPDigimon", P1CharID, RPDigimon),
    rich_presence_value("Stage", StageID+1),
    rich_presence_lookup("RPDifficulty", DifficultyLevel, RPDifficulty)) 

rich_presence_conditional_display(
    GameState == 0x17,
    "• Struggling against RNG in Digimon Shoot Level {0} •",
    rich_presence_value("ShootStage", DigimonShootLevel+1)) 

rich_presence_display(
    "• Digital Monsters Getting Ready • "

)  