import GUI
include "Shens Game.t"



%wait1
proc wait1
    var temp : string (1)
    locate (24, 10)
    put "Press any key to continue: " ..
    getch (temp)
    cls
end wait1

%intro
proc intro
    cls
maingame 
end intro


%Created by
proc created1
    cls
    put "Created by: Shen Jin"
    wait1
end created1

%More info
proc moreinfo
    cls
    put "More info here:"
    wait1
end moreinfo

%instructions
proc instructions
    cls
    put "Here are the instructions:"
    wait1
end instructions

var font := Font.New ("times New Roman:20")
var font2 := Font.New ("Impact:30")
var text : string := "SPACE INVASION"
var text2 : string := ""
var font1 := Font.New ("Times New Roman:12")
var program : string (1)
var position : int := 30
var mainscreen : int := Pic.FileNew ("savedimage.jpg")
var intropic : int := Pic.FileNew ("StartGame1.gif")
var pic : int := Pic.FileNew ("InstructionsButton1.gif")
var createdby : int := Pic.FileNew ("createdby.gif")
var link : int := Pic.FileNew ("link.gif")


%splashscreen
loop
View.Set ("screen:max;max,nooffscreenonly")
Pic.Draw (mainscreen, 0, 0, picMerge)
Font.Draw (text, 10, 10, font, white)
Font.Draw (text2, 550, maxy - 60, font, white)
var introButton : int := GUI.CreateButton (0, maxy div 4 * 3, 0, " Start Game ", intro)
var InstructionsButton : int := GUI.CreateButton (0, maxy div 4 * 2, 0, "Instructions", instructions)
var credits : int := GUI.CreateButton (0, maxy div 4, 0, " More  Info ", created1)
View.Update
    exit when GUI.ProcessEvent
end loop


