// Kidou Senshi Gundam Part 1 - Gundam Taichi ni Tatsu
// #ID = 30887
// 20240901 Version - Sines

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

// $86DA: [8 Bit] More Consistant Screen ID
//        0xc4 > Char Face + 0x02 drawing ID
// $B000: drawing id ?
// $F3CA: Top Screen ASCII display data
// $FD28: Start of ASCII display data

//Variable
TopAscii = byte(0xf3ca)
BottomAscii = byte(0xfd28)
DrawingID = dword(0xb000)

    achievement(title="Knowledge is Power",
                description = "Get the Manual of the Federation's secret weapon",
                points = 1,
                trigger = DrawingID == 0x00001213 
			                && prev(DrawingID) == 0x00111213
			                
)    

    achievement(title="Cool Headed",
                description = "Check on Frau after the explosion",
                points = 1,
                trigger = DrawingID == 0x000c0003 
			                && prev(DrawingID) == 0x00111213
			                
)    

    achievement(title="Laughing at you",
                description = "Get to the halfway point of the story",
                points = 1,
                trigger = DrawingID == 0x00070002 
			                && prev(DrawingID) == 0x00111213
			                
)    

    achievement(title="White Protector",
                description = "Protect the civilian from the explosion",
                points = 1,
                trigger = DrawingID == 0x16000c09 
			                && prev(DrawingID) == 0x00111213
			                
)    

    achievement(title="The Quick Way",
                description = "Catch Sayla in your hand directly",
                points = 1,
                trigger = DrawingID == 0x0c000c06  
			                && prev(DrawingID) == 0x00111213
			                
)    

    achievement(title="The Red Comet",
                description = "Fight with the mysterious Red Comet",
                points = 1,
                trigger = DrawingID == 0x00 
			                && prev(DrawingID) == 0x0000040b
			                
)    


rich_presence_conditional_display(
    DrawingID == 0x07,
    "• Getting Ready to Fly •"
    )  
 
rich_presence_conditional_display(
    DrawingID == 0x00111213 ,
    "• Car Wreck •"
    )  

rich_presence_conditional_display(
    DrawingID == 0x000c000f  ,
    "• Father of the Year Award •"
    )  

rich_presence_conditional_display(
    DrawingID == 0x000c0003   ,
    "• No Time for Feelings •"
    )  

rich_presence_conditional_display(
    DrawingID == 0x000c0010    ,
    "• IT'S A GUNDAM •"
    )

rich_presence_conditional_display(
    DrawingID == 0x00070002     ,
    "• Beginning of the End •"
    )
rich_presence_conditional_display(
    DrawingID == 0x15141310      ,
    "• Welcome to the White Base •"
    )

rich_presence_conditional_display(
    DrawingID == 0x16000c09       ,
    "• Guarding Frau •"
    )

rich_presence_conditional_display(
    DrawingID == 0x0c000c06        ,
    "• Catching Sayla •"
    )

rich_presence_conditional_display(
    DrawingID == 0x00000c01         ,
    "• EXPLOSIONS •"
    )

rich_presence_conditional_display(
    DrawingID == 0x0000040b          ,
    "• The Red Comet •"
    )

rich_presence_display(
    "• Fly, Gundam! •"

)
