%Go to game
proc gotogame
    cls
    % Goes to main game provided from "Shens Game.t" file
    maingame
end gotogame

%Music Toggle
proc playmusic
    if musicstatus = " Music Off " then
	Music.PlayFileLoop ("Game/Resources/Halo.mp3")
	musicstatus := " Music  On "
    else
	Music.PlayFileStop
	musicstatus := " Music Off "
    end if
end playmusic

%Toggle for button
proc toggle
    a := 0
end toggle

%Do nothing when button is pressed
proc togglenull
    a := 1
end togglenull

%Highscores screen
proc highscores
    a := 1
    cls
    loop
	View.Set ("graphics:max;max,nooffscreenonly")
	Pic.Draw (highscore, 0, 0, picCopy)
	% Higscore Column
	var Score : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 + 120, 150, " High Scores: ", togglenull)
	var Scorea : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 + 80, 150, intstr (score1), togglenull)
	var Scoreb : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 + 40, 150, intstr (score2), togglenull)
	var Scorec : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2, 150, intstr (score3), togglenull)
	var Scored : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 - 40, 150, intstr (score4), togglenull)
	var Scoree : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 - 80, 150, intstr (score5), togglenull)
	% Back Button
	var GoBack : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 - 120, 150, " Go Back ", toggle)
	if a = 0 then
	    exit
	end if
	View.Update
	exit when GUI.ProcessEvent
    end loop
end highscores

%instructions
proc instructions
    a := 1
    cls
    View.Set ("graphics:max;max,nooffscreenonly")
    Pic.Draw (Instructions, 0, 0, picCopy)
    %Control Column
    var Controls : int := GUI.CreateButton (maxx div 5 * 3 - 75, maxy div 9 * 8, 150, " Controls: ", togglenull)
    var Thrust : int := GUI.CreateButton (maxx div 5 * 3 + maxx div 8, maxy div 9 * 7, 200, " Thrusters: Hold Spacebar ", togglenull)
    var Boost : int := GUI.CreateButton (maxx div 5 * 3 + maxx div 8, maxy div 9 * 6, 200, " Boostforward: Up or W Key ", togglenull)
    var Left : int := GUI.CreateButton (maxx div 5 * 3 + maxx div 8, maxy div 9 * 5 + 15, 200, " Steer Left: Left or A Key ", togglenull)
    var Right : int := GUI.CreateButton (maxx div 5 * 3 + maxx div 8, maxy div 9 * 5 - 15, 200, " Steer Right: Right or D Key ", togglenull)
    var Back : int := GUI.CreateButton (maxx div 5 * 3 + maxx div 8, maxy div 9 * 4, 200, " Steer Back: Back or S Key ", togglenull)
    var Recharge : int := GUI.CreateButton (maxx div 5 * 3 + maxx div 8, maxy div 9 * 3, 200, " Recharge: C Key ", togglenull)
    var Pause : int := GUI.CreateButton (maxx div 5 * 3 + maxx div 8, maxy div 9 * 2 + 15, 200, " Pause Game: P Key ", togglenull)
    var Esc : int := GUI.CreateButton (maxx div 5 * 3 + maxx div 8, maxy div 9 * 2 - 15, 200, " Exit to Menu: Esc Key ", togglenull)
    Pic.Draw (S2L, maxx div 5 * 3 - maxx div 25 - 15, maxy div 9 * 5 - 15, picMerge)
    Pic.Draw (S2, maxx div 5 * 3 - 15, maxy div 9 * 5 - 15, picMerge)
    Pic.Draw (S2R, maxx div 5 * 3 + maxx div 25 - 15, maxy div 9 * 5 - 15, picMerge)
    Pic.Draw (S2U, maxx div 5 * 3 - 15, maxy div 9 * 6 - 15, picMerge)
    Pic.Draw (S2D, maxx div 5 * 3 - 15, maxy div 9 * 4 - 15, picMerge)
    Pic.Draw (S2B, maxx div 5 * 3 - 15, maxy div 9 * 7 - 15, picMerge)
    Pic.Draw (S2S, maxx div 5 * 3 - 15, maxy div 9 * 3 - 15, picMerge)

    %Avoid Column
    var Avoid : int := GUI.CreateButton (maxx div 5 - 75, maxy div 9 * 8, 150, "  Avoid:  ", togglenull)
    Pic.Draw (A1, maxx div 5 + maxx div 25 - 150, maxy div 9 * 7 - 20, picMerge)
    Pic.Draw (A3, maxx div 5 + maxx div 25 * 2 - 150, maxy div 9 * 7 - 20, picMerge)
    Pic.Draw (A2, maxx div 5 + maxx div 25 * 3 - 150, maxy div 9 * 7 - 20, picMerge)
    Pic.Draw (A4, maxx div 5 + maxx div 25 * 4 - 150, maxy div 9 * 7 - 20, picMerge)
    Pic.Draw (Blast, maxx div 5 + maxx div 25 * 2 - 150, maxy div 9 * 5 - 20, picMerge)
    Pic.Draw (Missile, maxx div 5 + maxx div 25 * 3 - 150, maxy div 9 * 5 - 20, picMerge)
    Pic.Draw (S1, maxx div 5 + maxx div 25 * 2 - 170, maxy div 9 * 4 - 35, picMerge)
    Pic.Draw (SB, maxx div 5 + maxx div 25 * 2 - 225, maxy div 9 * 2, picMerge)

    %Collect column
    var Collect : int := GUI.CreateButton (maxx div 5 * 2 - 75, maxy div 9 * 8, 150, " Collect: ", togglenull)
    Draw.FillOval (maxx div 5 * 2, maxy div 9 * 7, 10, 10, red)
    loop




	%Collect Column

	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7, 10, 6, Rand.Int (1, 10))
	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7 + 5, 10, 8, Rand.Int (1, 10))
	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7 + 6, 8, 8, Rand.Int (1, 10))
	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7 + 4, 6, 8, Rand.Int (1, 10))
	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7 - 2, 4, 8, Rand.Int (1, 10))
	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7 - 2, 3, 8, Rand.Int (1, 10))
	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7 - 2, 3, 8, Rand.Int (1, 10))
	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7 - 2, 4, 8, Rand.Int (1, 10))
	Draw.Oval (maxx div 5 * 2, maxy div 9 * 7 - 2, 5, 8, Rand.Int (1, 10))

	%Back Button
	var GoBack : int := GUI.CreateButton (maxx div 2 - 75, maxy div 9, 150, " Go Back ", toggle)
	if a = 0 then
	    exit
	end if
	View.Update
	exit when GUI.ProcessEvent
    end loop
end instructions
