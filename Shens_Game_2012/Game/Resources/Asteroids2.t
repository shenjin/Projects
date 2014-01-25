%Asteroids2
for i2 : 1 .. 4
    object2y (i2) := object2y (i2) - 3
    if object2y (i2) < 0 then
	object2y (i2) := maxy
	object2x (i2) := Rand.Int (0, maxx)
    end if
    Draw.FillOval (object2x (i2), object2y (i2), 8, 8, Rand.Int (135, 137))
    Draw.Oval (object2x (i2), object2y (i2), 8, 8, black)
    Draw.Oval (object2x (i2) - 4, object2y (i2) + 1, 2, 2, black)
    Draw.Oval (object2x (i2) + 1, object2y (i2) - 4, 1, 2, black)
    Draw.Oval (object2x (i2) + 4, object2y (i2) - 4, 1, 1, black)
    Draw.Oval (object2x (i2) + 4, object2y (i2) + 3, 2, 2, black)
    Draw.Oval (object2x (i2) - 2, object2y (i2) + 3, 1, 2, black)
    Draw.Oval (object2x (i2) - 3, object2y (i2) - 3, 1, 1, black)
    distance_between_centres := sqrt ((object2x (i2) - x1) ** 2 + (object2y (i2) - y1) ** 2)
    if distance_between_centres <= 15 + 8 then
	object2y (i2) := maxy
	object2x (i2) := Rand.Int (0, maxx)
	Bar2 := Bar2 - 200
	Draw.FillOval (x1, y1, 10, 10, red)
	
    end if
    if counter2 > 4500 and object2y (i2) < 1 then
	object2y (i2) := maxy - 10
    end if
end for
