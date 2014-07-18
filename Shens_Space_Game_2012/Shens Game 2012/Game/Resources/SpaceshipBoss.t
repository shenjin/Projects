%Spaceshipboss
if Spaceshipyb > 600 then
    Spaceshipyb := Spaceshipyb - 1
else
    Spaceshipxb := Spaceshipxb + m2
    if Spaceshipxb = maxx - 125 then
	m2 := -1
    end if
    if Spaceshipxb = 125 then
	m2 := 1
    end if
end if
%Spaceshipboss bullets
for bb1 : 1 .. 5
    bulletybb1 (bb1) := bulletybb1 (bb1) - (bb1)
    bulletxbb1 (bb1) := bulletxbb1 (bb1) + (bb1)
    if bulletybb1 (bb1) < 0 then
	bulletybb1 (bb1) := Spaceshipyb
	bulletxbb1 (bb1) := Spaceshipxb
    end if
    if bulletybb1 (bb1) >= maxx then
	bulletybb1 (bb1) := 0
    end if
    Draw.FillOval (bulletxbb1 (bb1), bulletybb1 (bb1), 5, 5, Rand.Int (40, 42))
    distance_between_centressbb1 := sqrt ((bulletxbb1 (bb1) - x1) ** 2 + (bulletybb1 (bb1) - y1) ** 2)
    if distance_between_centressbb1 <= 15 + 5 then
	Bar2 := Bar2 - 200
	bulletybb1 (bb1) := Spaceshipyb
	bulletxbb1 (bb1) := Rand.Int (0, maxx)
	Draw.FillOval (x1, y1, 10, 10, red)
	
    end if
end for
%Spaceshipboss bullets2
for bb : 1 .. 5
    bulletybb2 (bb) := bulletybb2 (bb) - (bb)
    bulletxbb2 (bb) := bulletxbb2 (bb) - (bb)
    if bulletybb2 (bb) < 0 then
	bulletybb2 (bb) := Spaceshipyb
	bulletxbb2 (bb) := Spaceshipxb
    end if
    if bulletxbb2 (bb) >= maxx then
	bulletxbb2 (bb) := 0
    end if
    Draw.FillOval (bulletxbb2 (bb), bulletybb2 (bb), 5, 5, Rand.Int (40, 42))
    distance_between_centressbb2 := sqrt ((bulletxbb2 (bb) - x1) ** 2 + (bulletybb2 (bb) - y1) ** 2)
    if distance_between_centressbb2 <= 15 + 5 then
	Bar2 := Bar2 - 200
	bulletybb2 (bb) := Spaceshipyb
	bulletxbb2 (bb) := Rand.Int (0, maxx)
	Draw.FillOval (x1, y1, 10, 10, red)
	
    end if
end for
%Blastright
picID4 := Pic.FileNew ("Game/Pictures/Blastright.gif")
for br : 1 .. 10
    Blastrighty (br) := Blastrighty (br) - (br) - 1
    if Blastrighty (br) <= 0 then
	Blastrighty (br) := Spaceshipyb - 47
	Blastrightx (br) := Spaceshipxb
    end if
    Pic.Draw (picID4, Blastrightx (br) - 9, Blastrighty (br), picMerge)
    distance_between_centressbr := sqrt ((Blastrightx (br) - 9 - x1) ** 2 + (Blastrighty (br) - y1) ** 2)
    if distance_between_centressbr <= 15 + 10 then
	Blastrighty (br) := Spaceshipyb - 47
	Bar2 := Bar2 - 300
	
    end if
end for
Pic.Free (picID4)
picID5 := Pic.FileNew ("Game/Pictures/dodonshipboss.gif")
Pic.Draw (picID5, Spaceshipxb - 110, Spaceshipyb - 47, picMerge)
Pic.Free (picID5)
