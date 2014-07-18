%Stars
for s : 1 .. 100
    objectystar (s) := objectystar (s) - 1
    if objectystar (s) < 0 then
	objectystar (s) := maxy
	objectxstar (s) := Rand.Int (0, maxx)
    end if
    Draw.FillOval (objectxstar (s), objectystar (s), 1, 1, white)
end for
%Flashing Stars
for sf : 1 .. 10
    objectystarf (sf) := objectystarf (sf) - 1

    if objectystarf (sf) < 0 then
	objectystarf (sf) := maxy
	objectxstarf (sf) := Rand.Int (0, maxx)
    end if
    Draw.FillOval (objectxstarf (sf), objectystarf (sf), 1, 1, Rand.Int (16, 31))
end for
