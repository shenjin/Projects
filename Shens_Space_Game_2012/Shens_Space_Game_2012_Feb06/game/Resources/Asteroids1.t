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
    if objecty (i) <= 0 then
	objecty (i) := maxy
	objectx (i) := Rand.Int (0, maxx)
    end if

    Pic.Draw (picID6, objectx (i) - 8, objecty (i) - 8, picMerge)


    distance_between_centres := sqrt ((objectx (i) - x1) ** 2 + (objecty (i) - y1) ** 2)
    if distance_between_centres <= 15 + 8 then
	objecty (i) := maxy
	objectx (i) := Rand.Int (0, maxx)
	Bar2 := Bar2 - 100
	%Draw.FillOval (x1, y1, 10, 10, red)

    end if
    %if counter2 > 4500 and objecty (i) < 1 then
    %    objecty (i) := maxy - 10
    %end if
end for
Pic.Free (picID6)
