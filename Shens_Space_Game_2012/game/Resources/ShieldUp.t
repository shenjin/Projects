%Shield

for shield : 1 .. 1
    Shieldy (shield) := Shieldy (shield) - 2
    Draw.FillOval (Shieldx (shield), Shieldy (shield), 10, 10, yellow)
    Draw.Oval (Shieldx (shield), Shieldy (shield), 10, 6, Rand.Int (10, 20))
    Draw.Oval (Shieldx (shield), Shieldy (shield) + 5, 10, 8, Rand.Int (10, 20))
    Draw.Oval (Shieldx (shield), Shieldy (shield) + 6, 8, 8, Rand.Int (10, 20))
    Draw.Oval (Shieldx (shield), Shieldy (shield) + 4, 6, 8, Rand.Int (10, 20))
    Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 4, 8, Rand.Int (10, 20))
    Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 3, 8, Rand.Int (10, 20))
    Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 3, 8, Rand.Int (10, 20))
    Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 4, 8, Rand.Int (10, 20))
    Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 5, 8, Rand.Int (10, 20))
    distance_between_centresf := sqrt ((Shieldx (shield) - x1) ** 2 + (Shieldy (shield) - y1) ** 2)
    if distance_between_centresf <= 15 + 10 then
	Shieldy (shield) := maxy + 5000 - floor(ln(GameScore))
	Shieldx (shield) := Rand.Int (0, maxx)
	%Draw.FillOval (x1, y1, 10, 10, green)
	%Shield Bar
	Color := yellow
	Color2 := green
	Bar2 := maxx - 10
    end if
end for
