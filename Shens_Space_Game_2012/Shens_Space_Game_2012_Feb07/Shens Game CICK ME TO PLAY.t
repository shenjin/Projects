%Allows use of GUI features
import GUI

%Placement for game title and author
var temp : string (1)
var font := Font.New ("Times New Roman:20")
var font2 := Font.New ("Impact:30")
var text : string := "SPACE INVASION"
var text2 : string := "By: Shen Jin"
var font1 := Font.New ("Times New Roman:12")
var program : string (1)
var position : int := 30
var musicstatus : string := " Music Off "

% Initial toggle value
var a : int := 1

%Images used in game
var mainscreen : int := Pic.FileNew ("Game/Pictures/savedimage.jpg")
var highscore : int := Pic.FileNew ("Game/Pictures/highscore.jpg")
var Instructions : int := Pic.FileNew ("Game/Pictures/Instructions.jpg")
var A1 : int := Pic.FileNew ("Game/Pictures/Asteroid1.gif")
var A2 : int := Pic.FileNew ("Game/Pictures/Asteroid2.gif")
var A3 : int := Pic.FileNew ("Game/Pictures/Asteroid3.gif")
var A4 : int := Pic.FileNew ("Game/Pictures/Asteroid4.gif")
var Blast : int := Pic.FileNew ("Game/Pictures/Blastright.gif")
var Missile : int := Pic.FileNew ("Game/Pictures/Missile.gif")
var S1 : int := Pic.FileNew ("Game/Pictures/Spaceship1.gif")
var SB : int := Pic.FileNew ("Game/Pictures/dodonshipboss.gif")
var S2 : int := Pic.FileNew ("Game/Pictures/Spaceship2.gif")
var S2B : int := Pic.FileNew ("Game/Pictures/Spaceship2boost.gif")
var S2D : int := Pic.FileNew ("Game/Pictures/Spaceship2down.gif")
var S2L : int := Pic.FileNew ("Game/Pictures/Spaceship2left.gif")
var S2R : int := Pic.FileNew ("Game/Pictures/Spaceship2right.gif")
var S2S : int := Pic.FileNew ("Game/Pictures/Spaceship2shift.gif")
var S2U : int := Pic.FileNew ("Game/Pictures/Spaceship2up.gif")


include "Game/Shens Game.t"
include "Game/Procfile.t"

% Start program here
loop
    %Splashscreen
    View.Set ("graphics:max;max,offscreenonly")
    Pic.Draw (mainscreen, 0, 0, picMerge)
    Font.Draw (text, 10, 10, font, white)
    Font.Draw (text2, 10, 40, font, white)
    % Mainscreen Buttons
    var startgame : int := GUI.CreateButton (maxx - 110, maxy - 30, 0, " Start Game ", gotogame)
    var instructionset : int := GUI.CreateButton (maxx - 110, maxy - 60, 0, "Instructions ", instructions)
    var scores : int := GUI.CreateButton (maxx - 110, maxy - 90, 0, " HighScores ", highscores)
    var musicon : int := GUI.CreateButton (10, maxy - 30, 0, musicstatus, playmusic)
    View.Update
    exit when GUI.ProcessEvent
end loop

