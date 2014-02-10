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
%Initiation variables
var score : int := 0
var m2 : int := 1
var score1, score2, score3, score4, score5 : int := 0
var Shipwreck : int := Pic.FileNew ("Game/Pictures/savedimage4.jpg")
var GameScore, Gas, GameCounter : int := 0
var distance_between_centers : real := 0
var Bar : int := maxx - 10
var Bar2 : int := maxx - 10
var Color : int := green
var Color2 : int := black
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
