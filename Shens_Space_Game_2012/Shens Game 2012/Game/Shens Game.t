var score : int := 0
var m2 : int := 1
proc game
    Music.PlayFileLoop ("Game/Halo.mp3")
    include "Varfile/Shens Game Var files.t"
    loop
	%Main counter
	counter2 := counter2 + 1
	%Keycontrols
	include "Resources/Keycontrols.t"
	%Movement
	include "Resources/Movement.t"
	%Playership
	include "Resources/Playership.t"
	%Score
	locate (5, 2)
	color (white)
	score := score + 2
	put "Score: ", score
	%Fuel
	include "Resources/Fuel.t"
	%Stars
	for s : 1 .. 100
	    objectystar (s) := objectystar (s) - 1
	    if objectystar (s) < 0 then
		objectystar (s) := maxy
		objectxstar (s) := Rand.Int (0, maxx)
	    end if
	    Draw.FillOval (objectxstar (s), objectystar (s), 1, 1, white)
	end for
	%Flashing Stars
	for sf : 1 .. 10
	    objectystarf (sf) := objectystarf (sf) - 1

	    if objectystarf (sf) < 0 then
		objectystarf (sf) := maxy
		objectxstarf (sf) := Rand.Int (0, maxx)
	    end if
	    Draw.FillOval (objectxstarf (sf), objectystarf (sf), 1, 1, Rand.Int (16, 31))
	end for
	%Asteroids
	include "Resources/Asteroids1.t"
	%Asteroids2
	include "Resources/Asteroids2.t"
	%Asteroids3
	include "Resources/Asteroids3.t"
	if counter2 >= 1000 then
	    %Pulsefires
	    include "Resources/Pulsefires.t"
	end if
	%Missile
	if counter2 >= 2000 then
	    include "Resources/Missile.t"
	end if
	if counter2 >= 3000 then
	    %Spaceship1
	    include "Resources/Spaceship1.t"
	end if
	if counter2 >= 4000 then
	    %Spaceship2
	    include "Resources/Spaceship2.t"
	end if
	if counter2 >= 5000 then
	    %Spaceshipboss
	    include "Resources/SpaceshipBoss.t"
	end if

	%Fuel Gague
	Bar := Bar - 1
	Draw.FillBox (Fuelgaguex - 2, Fuelgaguey + 2, maxx - 8, maxy - 56, grey)
	Draw.FillBox (Fuelgaguex, Fuelgaguey, maxx - 10, maxy - 54, black)
	Draw.FillBox (Fuelgaguex, Fuelgaguey, Bar, maxy - 54, red)
	%Health Bar
	Draw.FillBox (Healthx - 2, Healthy + 2, maxx - 8, maxy - 29, grey)
	Draw.FillBox (Healthx, Healthy, maxx - 10, maxy - 27, black)
	Draw.FillBox (Healthx, Healthy, Bar2, maxy - 27, green)
	%Refresh
	View.Update
	delay (10)
	cls
	%Exit statement
	exit when Bar2 <= 10
	exit when Bar <= 10
    end loop
end game

proc maingame
    var Shipwreck : int := Pic.FileNew ("Game/Pictures/savedimage4.jpg")
    var answer, anykey : string (1)
    var score1, score2, score3, score4, score5 : int := 0
    loop
	if score = 0 then
	    game
	end if
	View.Set ("screen:max;max,nooffscreenonly")
	colourback (white)
	colour (blue)
	cls
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
	    score1 := score1
	    score2 := score
	elsif score > score3 then
	    score5 := score4
	    score4 := score3
	    score2 := score2
	    score1 := score1
	    score3 := score
	elsif score > score4 then
	    score5 := score4
	    score3 := score3
	    score2 := score2
	    score1 := score1
	    score4 := score
	elsif score > score5 then
	    score4 := score4
	    score3 := score3
	    score2 := score2
	    score1 := score1
	    score5 := score
	end if
	Pic.Draw (Shipwreck, 0, 0, picMerge)
	loop
	    put "Your Score: ", score
	    put "High Score: "
	    put "1.", score1
	    put "2.", score2
	    put "3.", score3
	    put "4.", score4
	    put "5.", score5
	    put "Would you like to play again? (Y/N)"
	    getch (answer)
	    if answer = "Y" or answer = "y" then
		score := 0
		exit
	    elsif answer = "N" or answer = "n" then
		put "Done"
		exit
	    else
		put "You must enter y or n as an answer"
		put "Press anykey to go back." ..
		getch (anykey)
	    end if
	    cls
	end loop
	exit when answer = "n" or answer = "N"
    end loop
end maingame
