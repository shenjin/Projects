%Highscores screen
proc highscores
    a := 1
    View.Set ("graphics:max;max,nooffscreenonly")
    Pic.Draw (highscore, 0, 0, picCopy)
    % Higscore Column
    var Score : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 + 120, 150, " High Scores: ", togglenull)
    var Scorea : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 + 80, 150, intstr (score1), togglenull)
    var Scoreb : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 + 40, 150, intstr (score2), togglenull)
    var Scorec : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2, 150, intstr (score3), togglenull)
    var Scored : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 - 40, 150, intstr (score4), togglenull)
    var Scoree : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 - 80, 150, intstr (score5), togglenull)
    loop
	% Back Button
	var GoBack : int := GUI.CreateButton (maxx div 2 - 75, maxy div 2 - 120, 150, " Go Back ", toggle)
	if a = 0 then
	    exit
	end if
	View.Update
	exit when GUI.ProcessEvent
    end loop
end highscores
