%Spaceship1
Spaceshipx := Spaceshipx - 1
if Spaceshipx < 0 then
    Spaceshipx := maxx
end if
picID2 := Pic.FileNew ("Game/Pictures/Spaceship1.gif")
Pic.Draw (picID2, Spaceshipx - 55, Spaceshipy - 30, picMerge)
Pic.Free (picID2)
%Spaceship bullets
for b : 1 .. 5
    bullety (b) := bullety (b) - (b)
    bulletx (b) := bulletx (b) + (b)
    if bullety (b) < 0 then
	bullety (b) := Spaceshipy
	bulletx (b) := Spaceshipx
    end if
    if bulletx (b) >= maxx then
	bulletx (b) := 0
    end if
    Draw.FillOval (bulletx (b), bullety (b), 5, 5, Rand.Int (40, 42))
    distance_between_centressb := sqrt ((bulletx (b) - x1) ** 2 + (bullety (b) - y1) ** 2)
    if distance_between_centressb <= 15 + 5 then
	Bar2 := Bar2 - 200
	bullety (b) := Spaceshipy
	bulletx (b) := Rand.Int (0, maxx)
	Draw.FillOval (x1, y1, 10, 10, red)
	
    end if
end for
