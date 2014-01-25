%Keycontrols
Input.KeyDown (chars)
if ground = true and chars ('w') and y2 < maxy then
    yv := 20
    Bar := Bar - 10
end if
if chars ('p') then
    Input.Pause
end if
if ground = true and chars (KEY_UP_ARROW) and y2 < maxy then
    yv := 20
    Bar := Bar - 10
end if
if chars ('s') or chars (KEY_DOWN_ARROW) and y2 < maxy and ground = false then
    yv := yv - 0.5
end if
if chars (chr (32)) and y2 < maxy then
    if chars (chr (32)) then
	boostdetection := boostdetection + 5 div 10
    end if
    yv := 10
    Bar := Bar - boostdetection
end if
if chars ('a') or chars (KEY_LEFT_ARROW) and x1 > 0 then
    xv -= 1
elsif chars ('d') or chars (KEY_RIGHT_ARROW) and x2 < maxx then
    xv += 1
elsif chars (KEY_ESC) then
    exit
elsif
	chars (chr (180)) and chars (KEY_DOWN_ARROW) or
	chars (chr (180)) and chars (KEY_UP_ARROW) or
	chars (chr (180)) then
    if Bar2 < maxx - 10 then
	Bar2 := Bar2 + 2
	Bar := Bar - 2
    end if
end if
if not chars (chr (32)) then
    boostdetection := 10
end if
