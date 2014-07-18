%Starts game loop
proc game
    Bar2 := maxx - 10
    Bar := maxx - 10
    GameScore := 0
    GameScore := 0
    Gas := 0
    View.Set ("graphics:max;max,offscreenonly")
    include "Resources/gameVar.t"
    loop
	%Main counter
	GameScore := GameScore + 2
	locate (5, 2)
	color (white)
	put "Score: ", GameScore
	
	%Gas
	Bar := Bar - 1
	
	%Gas amount
	Gas := floor (ln (GameScore)) * 5 + 200
	
	include "Resources/objectStar.t"
	include "Resources/objectFuel.t"
	include "Resources/objectShield.t"
	include "Resources/objectAsteroid.t"
	include "Resources/objectMissle.t"
	include "Resources/objectEnemyShip.t"
	include "Resources/objectEnemyShipBoss.t"
	include "Resources/gameplayKeycontrols.t"
	include "Resources/gameplayPhysics.t"
	include "Resources/gameplayPictures.t"
	include "Resources/gameplayUIManage.t"

	%Exit statement
	if (Bar2 <= 10 and Color = green) or Bar <= 10 then
	    exit
	end if
	
	%Refresh
	View.Update
	%delay (5)
	cls
    end loop
    if GameScore > score1 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := score1
	score1 := GameScore
    elsif GameScore > score2 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := GameScore
    elsif GameScore > score3 then
	score5 := score4
	score4 := score3
	score3 := GameScore
    elsif GameScore > score4 then
	score5 := score4
	score4 := GameScore
    elsif GameScore > score5 then
	score5 := GameScore
    end if
    GameScore := 1
    m2 := 1
end game
