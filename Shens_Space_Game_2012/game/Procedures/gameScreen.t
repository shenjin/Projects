%Maingame loop
proc maingame
    GameScore := 0
    loop
	loop
	    if GameScore = 0 then
		cls
		game
	    end if
	    if GameScore = 1 then
		View.Set ("screen:max;max,nooffscreenonly")
		Pic.Draw (Shipwreck, 0, 0, picMerge)
		var continue : int := GUI.CreateButton (maxx div 2 - 75, maxy div 4 * 2 - 80, 150, " Continue? ", togglenull2)
		var yes : int := GUI.CreateButton (maxx div 2 - 75, maxy div 4 + 20, 150, " Yes ", regame)
		var no : int := GUI.CreateButton (maxx div 2 - 75, maxy div 4 - 20, 150, " No  ", endgame)
		View.Update
		exit when GUI.ProcessEvent
		%Condition for exit
		if GameScore = -1 then
		    exit
		end if
	    end if
	end loop
	if GameScore = -1 then
	    exit
	end if
    end loop
end maingame
