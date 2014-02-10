%Keycontrols
Input.KeyDown (chars)
if chars ('p') then
    Input.Pause
end if
if chars ('s') or chars (KEY_DOWN_ARROW) and y2 < maxy and ground = false then
    yv := yv - 0.6
end if
if (chars (chr (32)) or chars ('w') or chars (KEY_UP_ARROW)) and y2 <= maxy - 10 then
%    if chars (chr (32)) then
%        boostdetection := boostdetection + 5 div 10
%    end if
    yv := 8
    Bar := Bar - 2
end if
if chars ('a') or chars (KEY_LEFT_ARROW) and x1 > 0 then
    xv := xv - 0.55
elsif chars ('d') or chars (KEY_RIGHT_ARROW) and x1 < maxx then
    xv := xv + 0.55
elsif chars (KEY_ESC) then
    exit
elsif chars ('c') then
    if (Bar2 < maxx - 10) and Color = green then
	Bar2 := Bar2 + 2
	Bar := Bar - 2
    end if
end if
%if not chars (chr (32)) then
%    boostdetection := 10
%end if
