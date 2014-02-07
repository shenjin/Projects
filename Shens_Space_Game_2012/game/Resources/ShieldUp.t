%Fuel

for f : 1 .. 5
    Fuely (f) := Fuely (f) - 2
    if Fuely (f) < 0 then
	Fuely (f) := maxy
	Fuelx (f) := Rand.Int (0, maxx)
    end if
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
    distance_between_centresf := sqrt ((Fuelx (f) - x1) ** 2 + (Fuely (f) - y1) ** 2)
    if distance_between_centresf <= 15 + 10 then
	Fuely (f) := maxy
	Fuelx (f) := Rand.Int (0, maxx)
	%Draw.FillOval (x1, y1, 10, 10, green)
	if Bar >= maxx - 10 then
	    Bar := Bar + 0
	elsif Bar + Gas > maxx - 10 then
	    Bar := maxx - 10
	else
	    Bar := Bar + Gas
	end if
    end if
end for
