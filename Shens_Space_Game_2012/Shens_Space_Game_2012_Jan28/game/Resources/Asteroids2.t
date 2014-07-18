%Asteroids2
picID7 := Pic.FileNew ("Game/Pictures/Asteroid2.gif")
for i2 : 1 .. 6
    if i2 > 4 then
	object2y (i2) := object2y (i2) - 4
    elsif i2 > 2 then
	object2y (i2) := object2y (i2) - 3
    else
	object2y (i2) := object2y (i2) - 2
    end if
    if object2y (i2) <= 0 then
	object2y (i2) := maxy
	object2x (i2) := Rand.Int (0, maxx)
    end if
    Pic.Draw (picID7, object2x (i2) - 8, object2y (i2) - 8, picMerge)
    distance_between_centres := sqrt ((object2x (i2) - x1) ** 2 + (object2y (i2) - y1) ** 2)
    if distance_between_centres <= 15 + 10 then
	object2y (i2) := maxy
	object2x (i2) := Rand.Int (0, maxx)
	Bar2 := Bar2 - 100
	%Draw.FillOval (x1, y1, 10, 10, red)

    end if
    %if counter2 > 4500 and object2y (i2) < 1 then
    %    object2y (i2) := maxy - 10
    %end if
end for
Pic.Free (picID7)
