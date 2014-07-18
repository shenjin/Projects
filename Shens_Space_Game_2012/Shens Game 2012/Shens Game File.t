import GUI
include "Game/Shens Game.t"
var temp : string (1)
var font := Font.New ("times New Roman:20")
var font2 := Font.New ("Impact:30")
var text : string := "SPACE INVASION"
var text2 : string := ""
var font1 := Font.New ("Times New Roman:12")
var program : string (1)
var position : int := 30
var mainscreen : int := Pic.FileNew ("Game/Pictures/savedimage.jpg")
var intropic : int := Pic.FileNew ("StartGame1.gif")
var pic : int := Pic.FileNew ("InstructionsButton1.gif")
var link : int := Pic.FileNew ("link.gif")
var mainscreen3 : int := Pic.FileNew ("Game/Pictures/savedimage3.jpg")
var mainscreen2 : int := Pic.FileNew ("Game/Pictures/savedimage2.jpg")
%intro
proc intro
    Music.PlayFile ("Game/sci_fi_space_door.mp3")
    cls
    maingame
end intro
%More info
proc created1
    View.Set ("graphics:max;max,nooffscreenonly")
    cls
    Pic.Draw (mainscreen3, 0, 0, picMerge)
    put "More info here:"
    Music.PlayFile ("Game/sci_fi_space_door.mp3")
    put "Press any key to continue: " ..
    getch (temp)
    cls
end created1
%instructions
proc instructions
    View.Set ("graphics:max;max,nooffscreenonly")
    cls
    put "Here are the instructions:"
    Music.PlayFile ("Game/sci_fi_space_door.mp3")
    put "Press any key to continue: " ..
    getch (temp)
    cls
end instructions
% proc start
loop
    %splashscreen
    View.Set ("graphics:max;max,offscreenonly")
    Pic.Draw (mainscreen, 0, 0, picMerge)
    Font.Draw (text, 10, 10, font, white)
    Font.Draw (text2, 550, maxy - 60, font, white)
    var introButton : int := GUI.CreateButton (0, maxy div 4 * 3, 0, " Start Game ", intro)
    var InstructionsButton : int := GUI.CreateButton (0, maxy div 4 * 2, 0, "Instructions", instructions)
    var credits : int := GUI.CreateButton (0, maxy div 4, 0, " More  Info ", created1)
    View.Update
    exit when GUI.ProcessEvent
end loop

