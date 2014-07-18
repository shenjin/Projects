%Fuel
for f : 1 .. 3
    Fuely (f) := Fuely (f) - 3
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
	Draw.FillOval (x1, y1, 10, 10, green)
	if Bar >= maxx - 10 then
	    Bar := Bar + 0
	elsif score > 2000 then
	    if Bar + 175 * 12 div 10 > maxx - 10 then
		Bar := maxx - 10
	    else
		Bar := Bar + 190
	    end if
	elsif score > 4000 then
	    if Bar + 175 * 12 div 10 > maxx - 10 then
		Bar := maxx - 10
	    else
		Bar := Bar + 200
	    end if
	elsif score > 6000 then
	    if Bar + 175 * 12 div 10 > maxx - 10 then
		Bar := maxx - 10
	    else
		Bar := Bar + 210
	    end if
	elsif score > 8000 then
	    if Bar + 175 * 12 div 10 > maxx - 10 then
		Bar := maxx - 10
	    else
		Bar := Bar + 220
	    end if
	else
	    if Bar + 175 > maxx - 10 then
		Bar := maxx - 10
	    else
		Bar := Bar + 175
	    end if
	    Draw.FillOval (x1, y1, 10, 10, green)
	end if
    end if
end for
