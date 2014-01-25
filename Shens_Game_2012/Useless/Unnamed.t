
var score : int := 0
var m2 : int := 1
var answer, anykey: string(1)
var score1,score2,score3,score4,score5 : int := 0


loop
if score = 0 then
game
end if


View.Set ("screen:max;max,nooffscreenonly")



colourback (white)
colour (blue)
cls

if score > score1 then
score5:= score4
score4:= score3
score3:= score2
score2:= score1
score1:= score

elsif score > score2 then
score1:= score1
score3:= score2
score4:= score3
score5:= score4
score2:= score

elsif score > score3 then
score5:= score4
score4:= score3
score2:= score2
score1:= score1
score3:= score

elsif score > score4 then
score5:= score4
score3:= score3
score2:= score2
score1:= score1
score4:= score

elsif score > score5 then
score4:= score4
score3:= score3
score2:= score2
score1:= score1
score5:= score

end if

put "Your Score: ", score
put "High Score: "
put "1." ,score1
put "2." ,score2
put "3." ,score3
put "4." ,score4
put "5." ,score5

loop
put "Would you like to play again? (Y/N)"
getch (answer)
if answer = "Y" or answer = "y" then 
score := 0
exit
elsif answer = "N" or answer = "n" then
put "Done"
exit
else
put "You must enter y or n as an answer"
put "Press anykey to go back."..
getch (anykey)
end if
end loop
end loop
