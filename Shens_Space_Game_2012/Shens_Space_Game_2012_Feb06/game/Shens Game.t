%Initiation variables
var score : int := 0
var m2 : int := 1
var score1, score2, score3, score4, score5 : int := 0
var Shipwreck : int := Pic.FileNew ("Game/Pictures/savedimage4.jpg")
var counter3, score33 :=0

proc game 
    score33 := 0
    counter3 := 0
    include "Varfile/Shens Game Var files.t"
    
    loop
	%Main counter
	counter3 := counter3 + 1
	%Score
	locate (5, 2)
	color (white)
	score33 := score33 + 2
	put "Score: ", score33
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
	if counter3 >= 750 then
	    include "Resources/Bigasteroid.t"
	end if
	%Missile
	if counter3 >= 1000 then
	    include "Resources/Missile.t"
	end if
	if counter3 >= 1500 then
	    %Spaceship1
	    include "Resources/Spaceship1.t"
	end if
	if counter3 >= 1750 then
	    %Spaceship2
	    include "Resources/Spaceship2.t"
	end if
	if counter3 >= 1900 then
	    %Spaceshipboss
	    include "Resources/SpaceshipBoss.t"
	end if
	%UI Bars
	include "Resources/Bars.t"
	%Exit statement
	if Bar2 <= 10 or Bar <= 10 then
	    exit
	end if
	%Refresh
	View.Update
	delay (5)
	cls

    end loop
    if score33 > score1 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := score1
	score1 := score33
    elsif score33 > score2 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := score33
    elsif score33 > score3 then
	score5 := score4
	score4 := score3
	score3 := score33
    elsif score33 > score4 then
	score5 := score4
	score4 := score33
    elsif score33 > score5 then
	score5 := score33
    end if
    counter3 := 1
    m2 := 1
end game

%Toggle exit to menu
proc endgame
    m2 := -1
end endgame

%Toggle replay game
proc regame
    counter3 := 0
end regame

%Do nothing when button is pressed
proc togglenull2
    counter3 := 1
end togglenull2

%Maingame loop
proc maingame
    cls
    loop
	m2 := 1
	loop
	    if counter3 = 0 then
		cls
		game
	    end if
	    if counter3 = 1 then
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
	    end if
	end loop
	%Condition for exit
	score33 := 0
	counter3 := 0
	if m2 = -1 then
	    exit
	end if
    end loop
end maingame
