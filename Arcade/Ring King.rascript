// Ring King
// #ID = 15565
// 20260217 Version - Sines

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


P1HitCount = byte(0x0061)
P1Stamina = byte(0x0059)
P2Stamina = byte(0x0019)
EnemyID = byte(0x0122)
MatchTimer = byte(0x019a)
Score = (bcd(byte(0x0232)) * 1000) + (bcd(byte(0x0231)) * 10000) + (bcd(byte(0x0230)) * 100000) + (bcd(byte(0x022f)) * 1000000)

P2Flag = bit3(0x0101)
DemoFlag = bit5(0x0101)

function SettingCheck() => P2Flag == 0 && DemoFlag == 0
function HardestCheck() => bit5(0x0108) == 1 && bit4(0x0108) == 1

    achievement(title="Road to Glory",
                description = "Defeat Violence Jo",
                points = 2,
                trigger = EnemyID == 1
                       && prev(EnemyID) == 0
                       && SettingCheck()
)  

    achievement(title="Geralt Who?",
                description = "Defeat White Wolf",
                points = 3,
                trigger = EnemyID == 3
                       && prev(EnemyID) == 2
                       && SettingCheck()
)  

    achievement(title="It's in the Name",
                description = "Defeat Beat Brown",
                points = 3,
                trigger = EnemyID == 5
                       && prev(EnemyID) == 4
                       && SettingCheck()
)  

    achievement(title="Mantis Punch",
                description = "Defeat Green Hante",
                points = 5,
                trigger = EnemyID == 7
                       && prev(EnemyID) == 6
                       && SettingCheck()
)  

    achievement(title="Title Defender",
                description = "Defeat Mendou Kusa",
                points = 5,
                trigger = EnemyID == 6
                       && prev(EnemyID) == 8
                       && SettingCheck()
)  

    achievement(title="Hard Work",
                description = "Defeat Mendou Kusa in Hardest difficulty [Dip Switch on Hardest before first Match]",
                points = 10,
                trigger = trigger_when(EnemyID == 6
                       && prev(EnemyID) == 8)
                       && SettingCheck()
                       && HardestCheck()
                       && once(HardestCheck() && bit1(0x101) == 1 && prev(bit4(0x101)) == 0)
                       && never(bit4(0x108) == 0)
                       && never(bit5(0x108) == 0)
)  

    achievement(title="Combo Fiend",
                description = "Inflict 10 Hits to your adversary on any match after the first one",
                points = 1,
                trigger = P1HitCount == 10
                       && prev(P1HitCount) == 9
                       && SettingCheck()
                       && MatchTimer != 0
                       && EnemyID > 0
)  

    achievement(title="Machinegun",
                description = "Inflict 20 Hits to your adversary on any match after the first one",
                points = 3,
                trigger = P1HitCount == 20
                       && prev(P1HitCount) == 19
                       && SettingCheck()
                       && MatchTimer != 0
                       && EnemyID > 0
)  

    achievement(title="Devastating Blow",
                description = "Make your opponent fly away with a devastating blow worth 2 000$ on any match after the first one",
                points = 5,
                trigger = Score == prev(Score) + 2000
                       && SettingCheck()
                       && MatchTimer != 0
                       && EnemyID > 0
)  

    achievement(title="Light's Out",
                description = "Spin down your opponent with a devastating blow worth 3 000$ on any match after the first one",
                points = 5,
                trigger = Score == prev(Score) + 3000
                       && SettingCheck()
                       && MatchTimer != 0
                       && EnemyID > 0
) 

    achievement(title="Out of this World",
                description = "Throw out your opponent with a terrible blow worth 5 000$ on any match after the first one",
                points = 5,
                trigger = Score == prev(Score) + 5000
                       && SettingCheck()
                       && MatchTimer != 0
                       && EnemyID > 0
) 

    achievement(title="Pump It Up",
                description = "Reach the end of a round and have your coach pump you up",
                points = 3,
                trigger = P1Stamina > prev(P1Stamina)
                       && SettingCheck()
                       && MatchTimer == 0
                       && prev(P1Stamina) > 0
) 

//// RP Script
RP_Enemy= { 
                    0x00:"Violence Jo",
                    0x01:"Brown Pants",
                    0x02:"White Wolf",
                    0x03:"Bomba Yern",
                    0x04:"Beat Brown",
                    0x05:"Blue Warker",
                    0x06:"Green Hante",
                    0x07:"Onetta Yank",
                    0x08:"Mendou Kusa",
                    0x09:"Matcho Mans"

                    }   


rich_presence_conditional_display(
    DemoFlag == 1 ,
    "• DEMO Mode - Ring King •"
)

rich_presence_conditional_display(
    P2Flag == 1 ,
    "• • 2P Mode - Ring King •"
)

rich_presence_conditional_display(
    P2Flag == 0 && DemoFlag == 0 ,
    "• Fighting {0} - {1}$ in the Bank •",
    rich_presence_lookup("RP_Enemy", EnemyID, RP_Enemy),
    rich_presence_value("Score", Score)
)

rich_presence_display(
    "• Long Live the Ring King! • "

)  
