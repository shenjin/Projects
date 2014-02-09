%Shield
if GameScore >= 0 then
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
	to_top (Shieldx (shield), Shieldy (shield), Rand.Int (0, maxx), maxy + 5000 - floor (ln (GameScore)), 0)
	find_distance (Shieldx (shield), Shieldy (shield), x1, y1, 10, 0, Rand.Int (0, maxx), maxy + 5000 - floor (ln (GameScore)))
	if distance_between_centers <= 15 + 10 then
	    %Shield Bar
	    Bar2 := maxx - 10
	    Color := yellow
	    Color2 := green
	end if
    end for
end if
