%Pulsefires
locate (1, 1)
for p : 1 .. 5
    objecty2 (p) := objecty2 (p) - Rand.Int (1, 10)
    if xv > 0 and objectx2 (p) < x1 - 10 then
	objectx2 (p) := objectx2 (p) + 3
    elsif xv < 0 and objectx2 (p) > x1 + 10 then
	objectx2 (p) := objectx2 (p) - 3
    end if
    if objecty2 (p) < 0 then
	objecty2 (p) := maxy
	objectx2 (p) := Rand.Int (0, maxx)
    end if
    objectradiusx := Rand.Int (3, 13)
    objectradiusy := Rand.Int (3, 13)
    Draw.FillOval (objectx2 (p), objecty2 (p), objectradiusx, objectradiusy, Rand.Int (44, 55))
    Draw.Oval (objectx2 (p), objecty2 (p) + 3, 1, 9, Rand.Int (44, 55))
    Draw.Oval (objectx2 (p), objecty2 (p) + 3, 2, 8, Rand.Int (44, 55))
    Draw.Oval (objectx2 (p), objecty2 (p) + 3, 3, 7, Rand.Int (44, 55))
    Draw.Oval (objectx2 (p), objecty2 (p) + 3, 4, 6, Rand.Int (44, 55))
    Draw.Oval (objectx2 (p), objecty2 (p) + 3, 5, 5, Rand.Int (44, 55))
    Draw.Oval (objectx2 (p), objecty2 (p) + 3, 3, 4, Rand.Int (44, 55))
    distance_between_centresp := sqrt ((objectx2 (p) - x1) ** 2 + (objecty2 (p) - y1) ** 2)
    if distance_between_centresp <= 15 + objectradiusy then
	Bar2 := Bar2 - 250
	objecty2 (p) := maxy
	objectx2 (p) := Rand.Int (0, maxx)
	Draw.FillOval (x1, y1, 10, 10, red)
    end if
    if counter2 > 4500 and objecty2 (p) < 1 then
	objecty2 (p) := maxy - 50
    end if
end for
else

