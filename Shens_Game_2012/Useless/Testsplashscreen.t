import GUI

%wait1
proc wait1
    var temp : string (1)
    locate (24, 10)
    put "Press any key to continue: " ..
    getch (temp)
    cls
    put "This is how much i have so far for the splash screen. cheers sir."
end wait1

%intro
proc menu
cls
wait1
end menu


%button
proc button
var menupic :int := Pic.FileNew ("Menu.gif")
var menuButton : int := GUI.CreateButton (540, 20, 0, "Menu", menu)
end button


%splashscreen
var font := Font.New ("times New Roman:20")
var font2 := Font.New ("Impact:30")
var text: string := "ELEMENT QUIZ"
var text2: string := "MENU"
var font1 := Font.New ("Times New Roman:12")
var program : string (1)
var position : int := 30
var mainscreen : int := Pic.FileNew ("savedimage.jpg")
Pic.Draw (mainscreen, 0, 0, picMerge)
Font.Draw (text, 435, maxy - position, font, white)
Font.Draw (text2, 550, maxy - 60, font, white)
button


