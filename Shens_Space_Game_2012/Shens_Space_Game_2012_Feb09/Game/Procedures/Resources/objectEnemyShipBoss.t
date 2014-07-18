if GameScore >= 2000 then
    %Spaceshipboss
    if Spaceshipyb > maxy div 5 * 4 then
	Spaceshipyb := Spaceshipyb - 1
    else
	Spaceshipxb := Spaceshipxb + m2
	if Spaceshipxb >= maxx + 125 then
	    m2 := -2
	end if
	if Spaceshipxb <= -125 then
	    m2 := 2
	end if
    end if
    %Spaceshipboss bullets
    for bb1 : 1 .. 5
	bulletybb1 (bb1) := bulletybb1 (bb1) - (bb1)
	bulletxbb1 (bb1) := bulletxbb1 (bb1) + (bb1)
	if bulletybb1 (bb1) >= maxx then
	    bulletybb1 (bb1) := 0
	end if
	Draw.FillOval (bulletxbb1 (bb1), bulletybb1 (bb1), 5, 5, Rand.Int (40, 42))
	to_top (bulletxbb1 (bb1), bulletybb1 (bb1), Spaceshipxb, Spaceshipyb, 0)
	find_distance (bulletxbb1 (bb1), bulletybb1 (bb1), x1, y1, 15, floor (maxx div 10), Spaceshipxb, Spaceshipyb)
    end for
    %Spaceshipboss bullets2
    for bb : 1 .. 5
	bulletybb2 (bb) := bulletybb2 (bb) - (bb)
	bulletxbb2 (bb) := bulletxbb2 (bb) - (bb)
	if bulletxbb2 (bb) <= 0 then
	    bulletxbb2 (bb) := maxx
	end if
	Draw.FillOval (bulletxbb2 (bb), bulletybb2 (bb), 5, 5, Rand.Int (40, 42))
	to_top (bulletxbb2 (bb), bulletybb2 (bb), Spaceshipxb, Spaceshipyb, 0)
	find_distance (bulletxbb2 (bb), bulletybb2 (bb), x1, y1, 10, floor (maxx div 10), Spaceshipxb, Spaceshipyb)
    end for
    %Blastright
    picID4 := Pic.FileNew ("Game/Pictures/Blastright.gif")
    for br : 1 .. 10
	Blastrighty (br) := Blastrighty (br) - (br) - 2
	Pic.Draw (picID4, Blastrightx (br) - 9, Blastrighty (br), picMerge)
	to_top (Blastrightx (br), Blastrighty (br), Spaceshipxb, Spaceshipyb, -108)
	find_distance (Blastrightx (br), Blastrighty (br), x1, y1, 10, floor (maxx div 10), Spaceshipxb, Spaceshipyb)
    end for
    Pic.Free (picID4)
    picID5 := Pic.FileNew ("Game/Pictures/dodonshipboss.gif")
    Pic.Draw (picID5, Spaceshipxb - 110, Spaceshipyb - 47, picMerge)
    Pic.Free (picID5)
end if
