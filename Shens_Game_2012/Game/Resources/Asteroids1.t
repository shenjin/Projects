%Asteroids
for i : 1 .. 4
    objecty (i) := objecty (i) - 2
    if objecty (i) < 0 then
	objecty (i) := maxy
	objectx (i) := Rand.Int (0, maxx)
    end if
    Draw.FillOval (objectx (i), objecty (i), 8, 8, Rand.Int (135, 137))
    Draw.FillOval (objectx (i), objecty (i), 8, 8, Rand.Int (135, 137))
    Draw.Oval (objectx (i), objecty (i), 8, 8, black)
    Draw.Oval (objectx (i) - 5, objecty (i), 2, 2, black)
    Draw.Oval (objectx (i), objecty (i) - 5, 1, 2, black)
    Draw.Oval (objectx (i) + 5, objecty (i) - 3, 1, 1, black)
    Draw.Oval (objectx (i) + 5, objecty (i) + 2, 2, 2, black)
    Draw.Oval (objectx (i) - 1, objecty (i) + 4, 1, 2, black)
    distance_between_centres := sqrt ((objectx (i) - x1) ** 2 + (objecty (i) - y1) ** 2)
    if distance_between_centres <= 15 + 8 then
	objecty (i) := maxy
	objectx (i) := Rand.Int (0, maxx)
	Bar2 := Bar2 - 200
	Draw.FillOval (x1, y1, 10, 10, red)
	
    end if
    if counter2 > 4500 and objecty (i) < 1 then
	objecty (i) := maxy - 10
    end if
end for
