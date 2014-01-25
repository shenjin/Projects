%Spaceship2
Secondspaceshipx := Secondspaceshipx + 1
if Secondspaceshipx > maxx then
    Secondspaceshipx := 0
end if
picID3 := Pic.FileNew ("Game/Pictures/Spaceship1.gif")
Pic.Draw (picID3, Secondspaceshipx - 55, Secondspaceshipy - 30, picMerge)
Pic.Free (picID3)
%Spaceship bullets2
for b2 : 1 .. 5
    bullety2 (b2) := bullety2 (b2) - (b2)
    bulletx2 (b2) := bulletx2 (b2) - (b2)
    if bullety2 (b2) <= 0 then
	bullety2 (b2) := Secondspaceshipy
	bulletx2 (b2) := Secondspaceshipx
    end if
    if bulletx2 (b2) <= 0 then
	bulletx2 (b2) := maxx
    end if
    Draw.FillOval (bulletx2 (b2), bullety2 (b2), 5, 5, Rand.Int (40, 42))
    distance_between_centressb2 := sqrt ((bulletx2 (b2) - x1) ** 2 + (bullety2 (b2) - y1) ** 2)
    if distance_between_centressb2 <= 15 + 5 then
	Bar2 := Bar2 - 200
	bullety2 (b2) := Secondspaceshipy
	bulletx2 (b2) := Secondspaceshipx
	Draw.FillOval (x1, y1, 10, 10, red)
	
    end if
end for
