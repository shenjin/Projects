%Relocates items when hit
procedure to_top (var xpos, ypos : int, newx, newy, range : int)
    if ypos < range then
	ypos := newy
	xpos := newx
    end if
end to_top
