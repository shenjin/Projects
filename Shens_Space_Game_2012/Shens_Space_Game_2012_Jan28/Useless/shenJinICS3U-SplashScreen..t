import GUI
var win := Window.Open ("graphics:max;max,offscreenonly")

%wait1
proc wait1
    var temp : string (1)
    locate (24, 10)
    colour (2)
    put "Game Over"
    put "Press any key to go back: " ..
    getch (temp)
    cls

end wait1

%intro
proc intro
    cls
    wait1
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


%splashscreen

var font := Font.New ("times New Roman:20")
var font2 := Font.New ("Impact:30")
var text : string := "ELEMENT QUIZ"
var text2 : string := "MENU"
var font1 := Font.New ("Times New Roman:12")
var program : string (1)
var position : int := 30
var mainscreen : int := Pic.FileNew ("savedimage.jpg")
loop
    Pic.Draw (mainscreen, 0, 0, picMerge)
    Font.Draw (text, 435, maxy - position, font, white)
    Font.Draw (text2, 550, maxy - 60, font, white)
    var intropic : int := Pic.FileNew ("StartGame1.gif")
    var introButton : int := GUI.CreateButton (540, 20, 0, "Start Game", intro)
    var pic : int := Pic.FileNew ("InstructionsButton1.gif")
    var InstructionsButton : int := GUI.CreateButton (10, 20, 0, "Instructions", instructions)
    var createdby : int := Pic.FileNew ("createdby.gif")
    var credits : int := GUI.CreateButton (190, 20, 0, "Created by", created1)
    var link : int := Pic.FileNew ("link.gif")
    var linkButton : int := GUI.CreateButton (375, 20, 0, "More info", moreinfo)
    exit when GUI.ProcessEvent
    Time.Delay (1000)
end loop
