%Missile
if GameScore >= 1000 then
    picID10 := Pic.FileNew ("Game/Pictures/Missile.gif")
    %locate (1, 1)
    for m : 1 .. 5
	if m > 3 then
	    objectymissle (m) := objectymissle (m) - 10
	else
	    objectymissle (m) := objectymissle (m) - 7
	end if
	Pic.Draw (picID10, objectxmissle (m) - 20, objectymissle (m) - 10, picMerge)
	to_top (objectxmissle (m), objectymissle (m), Rand.Int (0, maxx), maxy, -80)
	find_distance (objectxmissle (m), objectymissle (m), x1, y1, 10, floor (maxx div 10), Rand.Int (0, maxx), maxy)
    end for
    Pic.Free (picID10)
end if
