%Movement
if y1 > 10 then
    if y1 >= maxy - 10 and yv = 0 then
	y1 := maxy - 11
	yv := yv
    elsif yv >= 0 then
	yv := yv - 1
    elsif yv <= 0 then
	yv := yv - 0.1
    end if
elsif y1 < 10 then
    yv := 0
    y1 := 10
end if
if xv > 0 then
    xv -= 0.3
elsif xv < 0 then
    xv += 0.3
end if
if x1 < 0 then
    x1 := 0
    xv := 0
elsif x1 > maxx then
    x1 := maxx
    xv := 0
end if
if y2 > maxy - 23 then
    y2 := maxy - 23
    yv := 0
end if
if y1 = 10 then
    ground := true
else
    ground := false
end if
x1 := x1 + round (xv)
y1 := y1 + round (yv)
