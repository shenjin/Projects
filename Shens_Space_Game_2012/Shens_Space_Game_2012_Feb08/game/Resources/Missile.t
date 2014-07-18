%Missile
picID10 := Pic.FileNew ("Game/Pictures/Missile.gif")
locate (1, 1)
for m : 1 .. 5
    objectymissle (m) := objectymissle (m) - Rand.Int (8, 9)
    if objectymissle (m) < -80 then
	objectymissle (m) := maxy
	objectxmissle (m) := Rand.Int (0, maxx)
    end if
    Pic.Draw (picID10, objectxmissle (m) - 20, objectymissle (m) - 10, picMerge)
    distance_between_centresm := sqrt ((objectxmissle (m) - x1) ** 2 + (objectymissle (m) - y1) ** 2)
    if distance_between_centresm <= 15 + 10 then
	Bar2 := Bar2 - 200
	objectymissle (m) := maxy
	objectxmissle (m) := Rand.Int (0, maxx)
	%   Draw.FillOval (x1, y1, 10, 10, red)

    end if
    %if counter2 > 4500 and objectymissle (m) < 1 then
    %    objectymissle (m) := maxy - 60
    %end if
end for
Pic.Free (picID10)
