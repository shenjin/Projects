%Fuel Gague
draw_bar (8, maxy - 37, maxx - 8, maxy - 56, grey)
draw_bar (10, maxy - 39, maxx - 10, maxy - 54, black)
draw_bar (10, maxy - 39, Bar, maxy - 54, red)
%Health Bar
draw_bar (8, maxy - 10, maxx - 8, maxy - 29, grey)
draw_bar (10, maxy - 12, maxx - 10, maxy - 27, Color2)
draw_bar (10, maxy - 12, Bar2, maxy - 27, Color)
%No Shield
if Bar2 <= 10 and Color = yellow then
    Bar2 := maxx - 10
    Color := green
    Color2 := black
end if
