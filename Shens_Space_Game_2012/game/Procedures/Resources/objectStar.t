%Stars
for s : 1 .. 100
    if s > 94 then
	objectystar (s) := objectystar (s) - 1
	Draw.FillOval (objectxstar (s), objectystar (s), 1, 2, Rand.Int (16, 31))
    elsif s > 88 then
	objectystar (s) := objectystar (s) - 1
	Draw.FillOval (objectxstar (s), objectystar (s), 1, 1, Rand.Int (16, 31))
    elsif s > 82 then
	objectystar (s) := objectystar (s) - 2
	Draw.FillOval (objectxstar (s), objectystar (s), 1, 1, Rand.Int (16, 31))
    else
	objectystar (s) := objectystar (s) - 1
	Draw.FillOval (objectxstar (s), objectystar (s), 1, 1, white)
    end if
    to_top (objectxstar (s), objectystar (s), Rand.Int (0, maxx), maxy, 0)
end for
