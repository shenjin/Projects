%Fuel Gague
Bar := Bar - 1
Draw.FillBox (Fuelgaguex - 2, Fuelgaguey + 2, maxx - 8, maxy - 56, grey)
Draw.FillBox (Fuelgaguex, Fuelgaguey, maxx - 10, maxy - 54, black)
Draw.FillBox (Fuelgaguex, Fuelgaguey, Bar, maxy - 54, red)
%Health Bar
%if Bar2 + 1 < maxx - 10 then
%    Bar2 := Bar2 + 1
%else
%    Bar2 := Bar2
%end if
Draw.FillBox (Healthx - 2, Healthy + 2, maxx - 8, maxy - 29, grey)
Draw.FillBox (Healthx, Healthy, maxx - 10, maxy - 27, Color2)
Draw.FillBox (Healthx, Healthy, Bar2, maxy - 27, Color)

