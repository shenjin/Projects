%Initiation variables
var score : int := 0
var m2 : int := 1
var score1, score2, score3, score4, score5 : int := 0
var Shipwreck : int := Pic.FileNew ("Game/Pictures/savedimage4.jpg")
var GameCounter, GameScore, Gas: int :=0

proc game 
    GameScore := 0
    GameCounter := 0
    Gas:= 0
    include "Varfile/Shens Game Var files.t"
    
    loop
	%Score
	locate (5, 2)
	color (white)
	GameScore := GameScore + 2
	put "Score: ", GameScore
	%Stars
	include "Resources/Stars.t"
	%Fuel
	include "Resources/Fuel.t"
	%Shield
	if GameScore >= 0 then
	include "Resources/ShieldUp.t"
	end if
	%Asteroids
	include "Resources/Asteroids1.t"
	%Asteroids2
	include "Resources/Asteroids2.t"
	%Asteroids3
	include "Resources/Asteroids3.t"
	%Bigasteroids
	if GameCounter >= 750 then
	    include "Resources/Bigasteroid.t"
	end if
	%Missile
	if GameCounter >= 1000 then
	    include "Resources/Missile.t"
	end if
	if GameCounter >= 1500 then
	    %Spaceship1
	    include "Resources/Spaceship1.t"
	end if
	if GameCounter >= 1750 then
	    %Spaceship2
	    include "Resources/Spaceship2.t"
	end if
	if GameCounter >= 2000 then
	    %Spaceshipboss
	    include "Resources/SpaceshipBoss.t"
	end if
	%Keycontrols
	include "Resources/Keycontrols.t"
	%Movement
	include "Resources/Movement.t"
	%Playership
	include "Resources/Playership.t"
	%Main counter
	GameCounter := GameCounter + 1
	%Gas amount
	Gas := floor(ln(GameScore)) * 5 + 200
	%UI Bars
	include "Resources/Bars.t"
	%No Shield
	if Bar2 <= 10 and Color = yellow then
	    Bar2 := maxx - 10
	    Color := green
	    Color2 := black
	end if
	%Exit statement
	if (Bar2 <= 10 and Color = green) or Bar <= 10 then
	    exit
	end if
	%Refresh
	View.Update
	delay (5)
	cls

    end loop
    if GameScore > score1 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := score1
	score1 := GameScore
    elsif GameScore > score2 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := GameScore
    elsif GameScore > score3 then
	score5 := score4
	score4 := score3
	score3 := GameScore
    elsif GameScore > score4 then
	score5 := score4
	score4 := GameScore
    elsif GameScore > score5 then
	score5 := GameScore
    end if
    GameCounter := 1
    m2 := 1
end game

%Toggle exit to menu
proc endgame
    m2 := -1
end endgame

%Toggle replay game
proc regame
    GameCounter := 0
end regame

%Do nothing when button is pressed
proc togglenull2
    GameCounter := 1
end togglenull2

%Maingame loop
proc maingame
    cls
    loop
	m2 := 1
	loop
	    if GameCounter = 0 then
		cls
		game
	    end if
	    if GameCounter = 1 then
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
	GameScore := 0
	GameCounter := 0
	if m2 = -1 then
	    exit
	end if
    end loop
end maingame
