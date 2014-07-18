if GameScore >= 1500 then
    %Spaceship1
    Spaceshipx := Spaceshipx - 1
    if Spaceshipx < -55 then
	Spaceshipx := maxx + 55
    end if
    picID2 := Pic.FileNew ("Game/Pictures/Spaceship1.gif")
    Pic.Draw (picID2, Spaceshipx - 55, Spaceshipy - 30, picMerge)

    %Spaceship bullets
    for b : 1 .. 5
	bullety (b) := bullety (b) - b
	bulletx (b) := bulletx (b) + b
	if bulletx (b) >= maxx then
	    bulletx (b) := 0
	end if
	Draw.FillOval (bulletx (b), bullety (b), 5, 5, Rand.Int (40, 42))
	to_top (bulletx (b), bullety (b), Spaceshipx, Spaceshipy, 0)
	find_distance (bulletx (b), bullety (b), x1, y1, 10, floor (maxx div 10), Spaceshipx, Spaceshipy)
    end for
    Pic.Free (picID2)

end if
if GameScore >= 1750 then
    %Spaceship2
    Secondspaceshipx := Secondspaceshipx + 1
    if Secondspaceshipx > maxx + 55 then
	Secondspaceshipx := -55
    end if
    picID3 := Pic.FileNew ("Game/Pictures/Spaceship1.gif")
    Pic.Draw (picID3, Secondspaceshipx - 55, Secondspaceshipy - 30, picMerge)

    %Spaceship bullets2
    for b2 : 1 .. 5
	bullety2 (b2) := bullety2 (b2) - b2
	bulletx2 (b2) := bulletx2 (b2) - b2
	if bulletx2 (b2) <= 0 then
	    bulletx2 (b2) := maxx
	end if
	Draw.FillOval (bulletx2 (b2), bullety2 (b2), 5, 5, Rand.Int (40, 42))
	to_top (bulletx2 (b2), bullety2 (b2), Secondspaceshipx, Secondspaceshipy, 0)
	find_distance (bulletx2 (b2), bullety2 (b2), x1, y1, 10, floor (maxx div 10), Secondspaceshipx, Secondspaceshipy)
    end for
    Pic.Free (picID3)
end if
