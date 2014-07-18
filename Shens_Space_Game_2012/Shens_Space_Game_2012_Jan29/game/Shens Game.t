%Initiation variables
var score : int := 0
var m2 : int := 1
var score1, score2, score3, score4, score5 : int := 0
var Shipwreck : int := Pic.FileNew ("Game/Pictures/savedimage4.jpg")

proc game
    score := 0
    include "Varfile/Shens Game Var files.t"
    loop
	%Main counter
	counter2 := counter2 + 1
	%Score
	locate (5, 2)
	color (white)
	score := score + 2
	put "Score: ", score
	%Keycontrols
	include "Resources/Keycontrols.t"
	%Movement
	include "Resources/Movement.t"
	%Playership
	include "Resources/Playership.t"
	%Fuel
	include "Resources/Fuel.t"
	%Stars
	include "Resources/Stars.t"
	%Asteroids
	include "Resources/Asteroids1.t"
	%Asteroids2
	include "Resources/Asteroids2.t"
	%Asteroids3
	include "Resources/Asteroids3.t"
	%Bigasteroids
	if counter2 >= 750 then
	    include "Resources/Bigasteroid.t"
	end if
	%Missile
	if counter2 >= 1000 then
	    include "Resources/Missile.t"
	end if
	if counter2 >= 1500 then
	    %Spaceship1
	    include "Resources/Spaceship1.t"
	end if
	if counter2 >= 1750 then
	    %Spaceship2
	    include "Resources/Spaceship2.t"
	end if
	if counter2 >= 1900 then
	    %Spaceshipboss
	    include "Resources/SpaceshipBoss.t"
	end if
	%UI Bars
	include "Resources/Bars.t"
	%Refresh
	View.Update
	delay (5)
	cls
	%Exit statement
	exit when Bar2 <= 10
	exit when Bar <= 10
    end loop
    if score > score1 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := score1
	score1 := score
    elsif score > score2 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := score
    elsif score > score3 then
	score5 := score4
	score4 := score3
	score3 := score
    elsif score > score4 then
	score5 := score4
	score4 := score
    elsif score > score5 then
	score5 := score
    end if
    score := 1
end game

%Toggle exit to menu
proc endgame
    m2 := -1
end endgame

%Toggle replay game
proc regame
    score := 0
end regame

%Do nothing when button is pressed
proc togglenull2
    score := 1
end togglenull2

%Maingame loop
proc maingame
    score := 0
    cls
    loop
	m2 := 1
	loop
	    if score = 0 then
		cls
		game
	    end if
	    View.Set ("screen:max;max,nooffscreenonly")
	    Pic.Draw (Shipwreck, 0, 0, picMerge)
	    var continue : int := GUI.CreateButton (maxx div 2 - 75, maxy div 4 * 2 - 80, 150, " Continue? ", togglenull2)
	    var yes : int := GUI.CreateButton (maxx div 2 - 75, maxy div 4 + 20, 150, " Yes ", regame)
	    var no : int := GUI.CreateButton (maxx div 2 - 75, maxy div 4 - 20, 150, " No  ", endgame)
	    %Condition for exit
	    if m2 = -1 then
		exit
	    end if
	    View.Update
	    exit when GUI.ProcessEvent
	end loop
	%Condition for exit
	if m2 = -1 then
	    exit
	end if
    end loop
end maingame
