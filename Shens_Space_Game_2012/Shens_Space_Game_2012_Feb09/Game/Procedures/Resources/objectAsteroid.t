%Asteroids
picID6 := Pic.FileNew ("Game/Pictures/Asteroid1.gif")
for i : 1 .. 4
    if i > 7 then
	objecty (i) := objecty (i) - 3
    elsif i > 5 then
	objecty (i) := objecty (i) - 2
    else
	objecty (i) := objecty (i) - 1
    end if
    Pic.Draw (picID6, objectx (i) - 8, objecty (i) - 8, picMerge)
    to_top (objectx (i), objecty (i), Rand.Int (0, maxx), maxy, 0)
    find_distance (objectx (i), objecty (i), x1, y1, 8, floor (maxx div 10), Rand.Int (0, maxx), maxy)
end for
Pic.Free (picID6)

%Asteroids2
picID7 := Pic.FileNew ("Game/Pictures/Asteroid2.gif")
for i2 : 1 .. 4
    if i2 > 4 then
	object2y (i2) := object2y (i2) - 4
    elsif i2 > 2 then
	object2y (i2) := object2y (i2) - 3
    else
	object2y (i2) := object2y (i2) - 2
    end if
    Pic.Draw (picID7, object2x (i2) - 8, object2y (i2) - 8, picMerge)
    to_top (object2x (i2), object2y (i2), Rand.Int (0, maxx), maxy, 0)
    find_distance (object2x (i2), object2y (i2), x1, y1, 8, floor (maxx div 10), Rand.Int (0, maxx), maxy)
end for
Pic.Free (picID7)

%Asteroids3
picID8 := Pic.FileNew ("Game/Pictures/Asteroid3.gif")
for i3 : 1 .. 4
    if i3 > 4 then
	object3y (i3) := object3y (i3) - 4
    elsif i3 > 2 then
	object3y (i3) := object3y (i3) - 3
    else
	object3y (i3) := object3y (i3) - 2
    end if
    Pic.Draw (picID8, object3x (i3) - 8, object3y (i3) - 8, picMerge)
    to_top (object3x (i3), object3y (i3), Rand.Int (0, maxx), maxy, 0)
    find_distance (object3x (i3), object3y (i3), x1, y1, 8, floor (maxx div 10), Rand.Int (0, maxx), maxy)
end for
Pic.Free (picID8)

%Bigasteroids
if GameScore >= 750 then
    picID9 := Pic.FileNew ("Game/Pictures/Asteroid4.gif")
    for p : 1 .. 4
	if p > 4 then
	    objecty2 (p) := objecty2 (p) - 4
	elsif p > 2 then
	    objecty2 (p) := objecty2 (p) - 3
	else
	    objecty2 (p) := objecty2 (p) - 2
	end if
	if xv > 0 and objectx2 (p) < x1 - 10 then
	    objectx2 (p) := objectx2 (p) + 1
	elsif xv < 0 and objectx2 (p) > x1 + 10 then
	    objectx2 (p) := objectx2 (p) - 1
	end if
	Pic.Draw (picID9, objectx2 (p) - 17, objecty2 (p) - 17, picMerge)
	to_top (objectx2 (p), objecty2 (p), Rand.Int (0, maxx), maxy, -40)
	find_distance (objectx2 (p), objecty2 (p), x1, y1, 17, floor (maxx div 8), Rand.Int (0, maxx), maxy)
    end for
    Pic.Free (picID9)
end if
