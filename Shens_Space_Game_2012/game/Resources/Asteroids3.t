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
    if object3y (i3) <= 0 then
	object3y (i3) := maxy
	object3x (i3) := Rand.Int (0, maxx)
    end if
    Pic.Draw (picID8, object3x (i3) - 8, object3y (i3) - 8, picMerge)
    distance_between_centres := sqrt ((object3x (i3) - x1) ** 2 + (object3y (i3) - y1) ** 2)
    if distance_between_centres <= 15 + 8 then
	object3y (i3) := maxy
	object3x (i3) := Rand.Int (0, maxx)
	Bar2 := Bar2 - 100
	%Draw.FillOval (x1, y1, 10, 10, red)

    end if
    %if counter2 > 4500 and object3y (i3) < 1 then
    %    object3y (i3) := maxy - 10
    %end if
end for
Pic.Free (picID8)
