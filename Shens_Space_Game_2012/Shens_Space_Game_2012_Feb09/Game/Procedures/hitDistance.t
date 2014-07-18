%Calculate hit box
procedure find_distance (var Ax, Ay, Bx, By : int, rds, dmg, newAx, newAy : int)
    distance_between_centers := sqrt ((Ax - Bx) ** 2 + (Ay - By) ** 2)
    if distance_between_centers <= 15 + rds then
	Bar2 := Bar2 - dmg
	Ax := newAx
	Ay := newAy
    end if
end find_distance
