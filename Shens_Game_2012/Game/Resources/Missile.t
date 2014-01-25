%Missile
    locate (1, 1)
    for m : 1 .. 10
	objectymissle (m) := objectymissle (m) - Rand.Int (8, 9)
	if objectymissle (m) < 0 then
	    objectymissle (m) := maxy
	    objectxmissle (m) := Rand.Int (0, maxx)
	end if
	Draw.FillOval (objectxmissle (m), objectymissle (m), 10, Rand.Int (50, 60), Rand.Int (38, 40))
	Draw.FillOval (objectxmissle (m), objectymissle (m), 8, Rand.Int (35, 55), Rand.Int (41, 45))
	Draw.FillOval (objectxmissle (m), objectymissle (m), 6, Rand.Int (15, 30), Rand.Int (50, 55))
	Draw.FillOval (objectxmissle (m), objectymissle (m) - 45, 10, 10, 43)
	Draw.FillOval (objectxmissle (m) - 2, objectymissle (m) - 45, 7, 10, 40)
	Draw.Oval (objectxmissle (m), objectymissle (m) - 45, 10, 10, black)
	Draw.FillBox (objectxmissle (m) - 10, objectymissle (m) - 45, objectxmissle (m) + 10, objectymissle (m), grey)
	Draw.FillBox (objectxmissle (m) - 10, objectymissle (m) - 45, objectxmissle (m) - 5, objectymissle (m), 26)
	Draw.FillBox (objectxmissle (m) + 5, objectymissle (m) - 45, objectxmissle (m) + 10, objectymissle (m), 30)
	distance_between_centresm := sqrt ((objectxmissle (m) - x1) ** 2 + ((objectymissle (m) - 45) - y1) ** 2)
	if distance_between_centresm <= 15 + 10 then
	    Bar2 := Bar2 - 200
	    objectymissle (m) := maxy
	    objectxmissle (m) := Rand.Int (0, maxx)
	    Draw.FillOval (x1, y1, 10, 10, red)
	    
	end if
	if counter2 > 4500 and objectymissle (m) < 1 then
	    objectymissle (m) := maxy - 60
	end if
    end for

