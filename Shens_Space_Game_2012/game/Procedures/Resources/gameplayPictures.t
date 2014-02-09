%Playership
if chars ('a') or chars (KEY_LEFT_ARROW) then
    picID := Pic.FileNew ("Game/Pictures/Spaceship2left.gif")
elsif chars ('d') or chars (KEY_RIGHT_ARROW) then
    picID := Pic.FileNew ("Game/Pictures/Spaceship2right.gif")
elsif (chars (KEY_UP_ARROW) or chars('w') or chars(chr(32))) and yv >= 0 then
    picID := Pic.FileNew ("Game/Pictures/Spaceship2up.gif")
elsif chars ('w') and yv >= 0 then
    picID := Pic.FileNew ("Game/Pictures/Spaceship2up.gif")
elsif chars ('s') or chars (KEY_DOWN_ARROW) then
    picID := Pic.FileNew ("Game/Pictures/Spaceship2down.gif")
elsif chars ('c') and Bar2 < maxx - 10 and Color = green then
    picID := Pic.FileNew ("Game/Pictures/Spaceship2shift.gif")
else
    picID := Pic.FileNew ("Game/Pictures/Spaceship2.gif")
end if
Pic.Draw (picID, x1 - 23, y1 - 10, picMerge)
Pic.Free (picID)
