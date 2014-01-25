%BigAsteroid
%locate (1, 1)
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
	objectx2 (p) := objectx2 (p) + Rand.Int (1, 2)
    elsif xv < 0 and objectx2 (p) > x1 + 10 then
	objectx2 (p) := objectx2 (p) - Rand.Int (1, 2)
    end if
    if objecty2 (p) < 0 then
	objecty2 (p) := maxy
	objectx2 (p) := Rand.Int (0, maxx)
    end if
    Pic.Draw (picID9, objectx2 (p) - 17, objecty2 (p) - 17, picMerge)
    distance_between_centresp := sqrt ((objectx2 (p) - x1) ** 2 + (objecty2 (p) - y1) ** 2)
    if distance_between_centresp <= 15 + 17 then
	Bar2 := Bar2 - 250
	objecty2 (p) := maxy
	objectx2 (p) := Rand.Int (0, maxx)
    %    Draw.FillOval (x1, y1, 10, 10, red)
    end if
    %if counter2 > 4500 and objecty2 (p) < 1 then
    %    objecty2 (p) := maxy - 50
    %end if
end for
Pic.Free (picID9)
