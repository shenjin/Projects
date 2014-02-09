%Fuel
for f : 1 .. 5
    Fuely (f) := Fuely (f) - 2
    Draw.FillOval (Fuelx (f), Fuely (f), 10, 10, red)
    Draw.Oval (Fuelx (f), Fuely (f), 10, 6, Rand.Int (1, 10))
    Draw.Oval (Fuelx (f), Fuely (f) + 5, 10, 8, Rand.Int (1, 10))
    Draw.Oval (Fuelx (f), Fuely (f) + 6, 8, 8, Rand.Int (1, 10))
    Draw.Oval (Fuelx (f), Fuely (f) + 4, 6, 8, Rand.Int (1, 10))
    Draw.Oval (Fuelx (f), Fuely (f) - 2, 4, 8, Rand.Int (1, 10))
    Draw.Oval (Fuelx (f), Fuely (f) - 2, 3, 8, Rand.Int (1, 10))
    Draw.Oval (Fuelx (f), Fuely (f) - 2, 3, 8, Rand.Int (1, 10))
    Draw.Oval (Fuelx (f), Fuely (f) - 2, 4, 8, Rand.Int (1, 10))
    Draw.Oval (Fuelx (f), Fuely (f) - 2, 5, 8, Rand.Int (1, 10))
    to_top (Fuelx (f), Fuely (f), Rand.Int (0, maxx), maxy, 0)
    find_distance (Fuelx (f), Fuely (f), x1, y1, 10, 0, Rand.Int (0, maxx), maxy)
    if distance_between_centers <= 15 + 10 then
	if Bar >= maxx - 10 then
	    Bar := Bar + 0
	elsif Bar + Gas > maxx - 10 then
	    Bar := maxx - 10
	else
	    Bar := Bar + Gas
	end if
    end if
end for
