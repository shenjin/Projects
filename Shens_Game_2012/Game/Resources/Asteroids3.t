%Asteroids3
for i3 : 1 .. 4
    object3y (i3) := object3y (i3) - 1
    if object3y (i3) < 0 then
	object3y (i3) := maxy
	object3x (i3) := Rand.Int (0, maxx)
    end if
    Draw.FillOval (object3x (i3), object3y (i3), 8, 8, Rand.Int (135, 137))
    Draw.Oval (object3x (i3), object3y (i3), 8, 8, black)
    Draw.Oval (object3x (i3) - 3, object3y (i3) + 2, 2, 2, black)
    Draw.Oval (object3x (i3) + 3, object3y (i3) - 3, 1, 2, black)
    Draw.Oval (object3x (i3) + 3, object3y (i3) - 3, 1, 1, black)
    Draw.Oval (object3x (i3) + 5, object3y (i3) + 2, 2, 2, black)
    Draw.Oval (object3x (i3) - 3, object3y (i3) + 2, 1, 2, black)
    Draw.Oval (object3x (i3) - 2, object3y (i3) - 4, 1, 1, black)
    distance_between_centres := sqrt ((object3x (i3) - x1) ** 2 + (object3y (i3) - y1) ** 2)
    if distance_between_centres <= 15 + 8 then
	object3y (i3) := maxy
	object3x (i3) := Rand.Int (0, maxx)
	Bar2 := Bar2 - 200
	Draw.FillOval (x1, y1, 10, 10, red)
	
    end if
    if counter2 > 4500 and object3y (i3) < 1 then
	object3y (i3) := maxy - 10
    end if
end for
