%Starts game loop
proc game
    Bar2 := maxx - 10
    Bar := maxx - 10
    GameScore := 0
    GameCounter := 0
    Gas := 0

    View.Set ("graphics:max;max,offscreenonly")
    %include "Resources/gameVar.t"
    var decrement : int := 0
    var chars : array char of boolean
    var x1 : int := maxx div 2 - 23
    var x2 : int := x1 + 10
    var y1 : int := 10
    var y2 : int := y1 + 10
    var xv : real := 0
    var yv : real := 0
    %var g : real := 1
    %Boost detection
    %var boostdetection : int := 10
    %var realnum : int := 1 div 100
    var ground : boolean := true

    %Shield drop
    var Shieldx, Shieldy : array 1 .. 10 of int
    for shield : 1 .. 10
	Shieldx (shield) := Rand.Int (0, maxx)
	Shieldy (shield) := maxy
    end for

    %Portal drop
    var Portalx, Portaly : array 1 .. 10 of int
    for portal : 1 .. 10
	Portalx (portal) := maxx div 11 * portal
	Portaly (portal) := maxy
    end for

    %Fuel
    var Fuelx, Fuely : array 1 .. 10 of int
    for f : 1 .. 10
	Fuelx (f) := Rand.Int (0, maxx)
	Fuely (f) := Rand.Int (maxy, maxy * 2)
    end for

    %stars
    var objectxstar, objectystar : array 1 .. 100 of int
    for s : 1 .. 100
	objectxstar (s) := Rand.Int (0, maxx)
	objectystar (s) := Rand.Int (0, maxy)
    end for

    %Asteroids1
    var objectx, objecty : array 1 .. 20 of int
    for i : 1 .. 4
	objectx (i) := Rand.Int (0, maxx)
	objecty (i) := Rand.Int (maxy, maxy * 2)
    end for

    %Asteroids2
    var object2x, object2y : array 1 .. 20 of int
    for i2 : 1 .. 4
	object2x (i2) := Rand.Int (0, maxx)
	object2y (i2) := Rand.Int (maxy, maxy * 2)
    end for

    %Asteroids3
    var object3x, object3y : array 1 .. 20 of int
    for i3 : 1 .. 4
	object3x (i3) := Rand.Int (0, maxx)
	object3y (i3) := Rand.Int (maxy, maxy * 2)
    end for

    %Big Asteroid
    var objectx2, objecty2 : array 1 .. 20 of int
    for p : 1 .. 5
	objectx2 (p) := Rand.Int (0, maxx)
	objecty2 (p) := Rand.Int (maxy, maxy * 2)
    end for

    %Missles
    var objectxmissle, objectymissle : array 1 .. 10 of int
    for i : 1 .. 6
	objectxmissle (i) := Rand.Int (0, maxx)
	objectymissle (i) := Rand.Int (maxy, maxy * 2)
    end for

    %Spaceship
    var Spaceshipx, Spaceshipy : int
    Spaceshipx := maxx + 55
    Spaceshipy := Rand.Int (maxy div 2, maxy div 4 * 3)

    %Bullets
    var bulletx, bullety : array 1 .. 5 of int
    for b : 1 .. 5
	bulletx (b) := Spaceshipx
	bullety (b) := Spaceshipy
    end for

    %Spaceship2
    var Secondspaceshipx, Secondspaceshipy : int
    Secondspaceshipx := 0 - 55
    Secondspaceshipy := Rand.Int (maxy div 2, maxy div 4 * 3)

    %Bullets2
    var bulletx2, bullety2 : array 1 .. 5 of int
    for b2 : 1 .. 5
	bulletx2 (b2) := Secondspaceshipx
	bullety2 (b2) := Secondspaceshipy
    end for

    %Spaceship Boss
    var Spaceshipxb, Spaceshipyb : int
    Spaceshipxb := maxx div 2
    Spaceshipyb := maxy + 47
    %Bullets1 Boss
    var bulletxbb1, bulletybb1 : array 1 .. 5 of int
    for b1 : 1 .. 5
	bulletxbb1 (b1) := Spaceshipxb
	bulletybb1 (b1) := Spaceshipyb
    end for

    %Bullets Boass
    var bulletxbb2, bulletybb2 : array 1 .. 5 of int
    for bb : 1 .. 5
	bulletxbb2 (bb) := Spaceshipxb
	bulletybb2 (bb) := Spaceshipyb
    end for

    %Blastright
    var Blastrightx, Blastrighty : array 1 .. 10 of int
    for br : 1 .. 10
	Blastrightx (br) := Spaceshipxb
	Blastrighty (br) := Spaceshipyb
    end for

    %Pic ID's
    var picID, picID2, picID3, picID4, picID5, picID6, picID7, picID8, picID9, picID10 : int
    colourback (7)

    loop
	%Main counter
	
	locate (5, 2)
	color (white)
	put "Score: ", GameCounter
	put "Internal Score: ", GameScore

	%Gas
	Bar := Bar - 1

	%Gas amount
	Gas := floor (ln (GameScore + 1)) * 5 + 200

	%include "Resources/objectStar.t"
	%Stars
	for s : 1 .. 100
	    if s > 94 then
		objectystar (s) := objectystar (s) - (decrement + 1)
		Draw.FillOval (objectxstar (s), objectystar (s), 1, 2, Rand.Int (16, 31))
	    elsif s > 88 then
		objectystar (s) := objectystar (s) - (decrement + 1)
		Draw.FillOval (objectxstar (s), objectystar (s), 1, 1, Rand.Int (16, 31))
	    elsif s > 82 then
		objectystar (s) := objectystar (s) - (decrement + 2)
		Draw.FillOval (objectxstar (s), objectystar (s), 1, 1, Rand.Int (16, 31))
	    else
		objectystar (s) := objectystar (s) - (decrement + 1)
		Draw.FillOval (objectxstar (s), objectystar (s), 1, 1, white)
	    end if
	    to_top (objectxstar (s), objectystar (s), Rand.Int (0, maxx), maxy, 0)
	end for

	%include "Resources/objectFuel.t"
	%Fuel
	if GameScore >= 0 then
	    for f : 1 .. 5
		Fuely (f) := Fuely (f) - (decrement + 2)
		Draw.FillOval (Fuelx (f), Fuely (f), 10, 10, red)
		Draw.Oval (Fuelx (f), Fuely (f), 10, 6, Rand.Int (1, 10))
		Draw.Oval (Fuelx (f), Fuely (f) + 5, 10, 8, Rand.Int (1, 10))
		Draw.Oval (Fuelx (f), Fuely (f) + 6, 8, 8, Rand.Int (1, 10))
		Draw.Oval (Fuelx (f), Fuely (f) + 4, 6, 8, Rand.Int (1, 10))
		Draw.Oval (Fuelx (f), Fuely (f) - 2, 4, 8, Rand.Int (1, 10))
		Draw.Oval (Fuelx (f), Fuely (f) - 2, 3, 8, Rand.Int (1, 10))
		Draw.Oval (Fuelx (f), Fuely (f) - 2, 3, 8, Rand.Int (1, 10))
		Draw.Oval (Fuelx (f), Fuely (f) - 2, 4, 8, Rand.Int (1, 10))
		Draw.Oval (Fuelx (f), Fuely (f) - 2, 5, 8, Rand.Int (1, 10))
		to_top (Fuelx (f), Fuely (f), Rand.Int (0, maxx), maxy, 0)
		find_distance (Fuelx (f), Fuely (f), x1, y1, 10, 0, Rand.Int (0, maxx), maxy)
		if distance_between_centers <= 15 + 10 then
		    if Bar >= maxx - 10 then
			Bar := Bar + 0
		    elsif Bar + Gas > maxx - 10 then
			Bar := maxx - 10
		    else
			Bar := Bar + Gas
		    end if
		end if
	    end for
	end if

	%include "Resources/objectShield.t"
	%Shield
	if GameScore >= 0 then
	    %Shield
	    for shield : 1 .. 1
		if Shieldy (shield) > -100 then
		    Shieldy (shield) := Shieldy (shield) - (decrement + 2)
		end if
		Draw.FillOval (Shieldx (shield), Shieldy (shield), 10, 10, yellow)
		Draw.Oval (Shieldx (shield), Shieldy (shield), 10, 6, Rand.Int (10, 20))
		Draw.Oval (Shieldx (shield), Shieldy (shield) + 5, 10, 8, Rand.Int (10, 20))
		Draw.Oval (Shieldx (shield), Shieldy (shield) + 6, 8, 8, Rand.Int (10, 20))
		Draw.Oval (Shieldx (shield), Shieldy (shield) + 4, 6, 8, Rand.Int (10, 20))
		Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 4, 8, Rand.Int (10, 20))
		Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 3, 8, Rand.Int (10, 20))
		Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 3, 8, Rand.Int (10, 20))
		Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 4, 8, Rand.Int (10, 20))
		Draw.Oval (Shieldx (shield), Shieldy (shield) - 2, 5, 8, Rand.Int (10, 20))
		to_top (Shieldx (shield), Shieldy (shield), Rand.Int (0, maxx), -200, 0)
		find_distance (Shieldx (shield), Shieldy (shield), x1, y1, 10, 0, Rand.Int (0, maxx), -200)
		if distance_between_centers <= 15 + 10 then
		    %Shield Bar
		    Bar2 := maxx - 10
		    Color := yellow
		    Color2 := green
		end if
	    end for
	end if

	if GameScore >= 10000 then
	    %Portal
	    GameCounter := GameCounter - (4 + decrement)
	    GameScore := GameScore - (4 + decrement)
	    for portal : 1 .. 10
		if Portaly (portal) >= maxy - 100 then
		    Portaly (portal) := Portaly (portal) - (decrement + 2)
		end if
		Draw.FillOval (Portalx (portal), Portaly (portal), 10, 10, Rand.Int (80, 100))
		Draw.Oval (Portalx (portal), Portaly (portal), 10, 6, Rand.Int (10, 20))
		Draw.Oval (Portalx (portal), Portaly (portal) + 5, 10, 8, Rand.Int (10, 20))
		Draw.Oval (Portalx (portal), Portaly (portal) + 6, 8, 8, Rand.Int (10, 20))
		Draw.Oval (Portalx (portal), Portaly (portal) + 4, 6, 8, Rand.Int (10, 20))
		Draw.Oval (Portalx (portal), Portaly (portal) - 2, 4, 8, Rand.Int (10, 20))
		Draw.Oval (Portalx (portal), Portaly (portal) - 2, 3, 8, Rand.Int (10, 20))
		Draw.Oval (Portalx (portal), Portaly (portal) - 2, 3, 8, Rand.Int (10, 20))
		Draw.Oval (Portalx (portal), Portaly (portal) - 2, 4, 8, Rand.Int (10, 20))
		Draw.Oval (Portalx (portal), Portaly (portal) - 2, 5, 8, Rand.Int (10, 20))
		to_top (Portalx (portal), Portaly (portal), Portalx (portal), Portaly (portal), 0)
		find_distance (Portalx (portal), Portaly (portal), x1, y1, 10, 0, Portalx (portal), Portaly (portal))
		if distance_between_centers <= 15 + 10 then
		    %Portal Bar
		    Bar2 := maxx - 10
		    decrement := decrement + 1
		    GameScore := 0

		    x1 := maxx div 2 - 23
		    x2 := x1 + 10
		    y1 := 10
		    y2 := y1 + 10
		    xv := 0
		    yv := 0
		    %g := 1
		    %Boost detection
		    %var boostdetection : int := 10
		    %var realnum : int := 1 div 100
		    ground := true

		    for shield : 1 .. 10
			Shieldx (shield) := Rand.Int (0, maxx)
			Shieldy (shield) := maxy
		    end for

		    %Fuel
		    for f : 1 .. 10
			Fuelx (f) := Rand.Int (0, maxx)
			Fuely (f) := Rand.Int (maxy, maxy * 2)
		    end for

		    %stars
		    for s : 1 .. 100
			objectxstar (s) := Rand.Int (0, maxx)
			objectystar (s) := Rand.Int (0, maxy)
		    end for

		    %Asteroids1
		    for i : 1 .. 4
			objectx (i) := Rand.Int (0, maxx)
			objecty (i) := Rand.Int (maxy, maxy * 2)
		    end for

		    %Asteroids2
		    for i2 : 1 .. 4
			object2x (i2) := Rand.Int (0, maxx)
			object2y (i2) := Rand.Int (maxy, maxy * 2)
		    end for

		    %Asteroids3
		    for i3 : 1 .. 4
			object3x (i3) := Rand.Int (0, maxx)
			object3y (i3) := Rand.Int (maxy, maxy * 2)
		    end for

		    %Big Asteroid
		    for p : 1 .. 5
			objectx2 (p) := Rand.Int (0, maxx)
			objecty2 (p) := Rand.Int (maxy, maxy * 2)
		    end for

		    %Missles
		    for i : 1 .. 6
			objectxmissle (i) := Rand.Int (0, maxx)
			objectymissle (i) := Rand.Int (maxy, maxy * 2)
		    end for

		    %Spaceship
		    Spaceshipx := maxx + 55
		    Spaceshipy := Rand.Int (maxy div 2, maxy div 4 * 3)

		    %Bullets
		    for b : 1 .. 5
			bulletx (b) := Spaceshipx
			bullety (b) := Spaceshipy
		    end for

		    %Spaceship2
		    Secondspaceshipx := 0 - 55
		    Secondspaceshipy := Rand.Int (maxy div 2, maxy div 4 * 3)

		    %Bullets2
		    for b2 : 1 .. 5
			bulletx2 (b2) := Secondspaceshipx
			bullety2 (b2) := Secondspaceshipy
		    end for

		    %Spaceship Boss
		    Spaceshipxb := maxx div 2
		    Spaceshipyb := maxy + 47
		    %Bullets1 Boss
		    for b1 : 1 .. 5
			bulletxbb1 (b1) := Spaceshipxb
			bulletybb1 (b1) := Spaceshipyb
		    end for

		    %Bullets Boass
		    for bb : 1 .. 5
			bulletxbb2 (bb) := Spaceshipxb
			bulletybb2 (bb) := Spaceshipyb
		    end for

		    %Blastright
		    for br : 1 .. 10
			Blastrightx (br) := Spaceshipxb
			Blastrighty (br) := Spaceshipyb
		    end for
		end if
	    end for
	end if

	%include "Resources/objectAsteroid.t"
	%Asteroids
	if GameScore >= 0 then
	    picID6 := Pic.FileNew ("Game/Pictures/Asteroid1.gif")
	    for i : 1 .. 4
		if i > 7 then
		    objecty (i) := objecty (i) - (decrement + 3)
		elsif i > 5 then
		    objecty (i) := objecty (i) - (decrement + 2)
		else
		    objecty (i) := objecty (i) - (decrement + 1)
		end if
		Pic.Draw (picID6, objectx (i) - 8, objecty (i) - 8, picMerge)
		to_top (objectx (i), objecty (i), Rand.Int (0, maxx), maxy, 0)
		find_distance (objectx (i), objecty (i), x1, y1, 8, floor (maxx div 10), Rand.Int (0, maxx), maxy)
	    end for
	    Pic.Free (picID6)
	end if

	%Asteroids2
	if GameScore >= 1250 then
	    picID7 := Pic.FileNew ("Game/Pictures/Asteroid2.gif")
	    for i2 : 1 .. 4
		if i2 > 4 then
		    object2y (i2) := object2y (i2) - (decrement + 4)
		elsif i2 > 2 then
		    object2y (i2) := object2y (i2) - (decrement + 3)
		else
		    object2y (i2) := object2y (i2) - (decrement + 2)
		end if
		Pic.Draw (picID7, object2x (i2) - 8, object2y (i2) - 8, picMerge)
		to_top (object2x (i2), object2y (i2), Rand.Int (0, maxx), maxy, 0)
		find_distance (object2x (i2), object2y (i2), x1, y1, 8, floor (maxx div 10), Rand.Int (0, maxx), maxy)
	    end for
	    Pic.Free (picID7)
	end if

	%Asteroids3
	if GameScore >= 1750 then
	    picID8 := Pic.FileNew ("Game/Pictures/Asteroid3.gif")
	    for i3 : 1 .. 4
		if i3 > 4 then
		    object3y (i3) := object3y (i3) - (decrement + 5)
		elsif i3 > 2 then
		    object3y (i3) := object3y (i3) - (decrement + 4)
		else
		    object3y (i3) := object3y (i3) - (decrement + 3)
		end if
		Pic.Draw (picID8, object3x (i3) - 8, object3y (i3) - 8, picMerge)
		to_top (object3x (i3), object3y (i3), Rand.Int (0, maxx), maxy, 0)
		find_distance (object3x (i3), object3y (i3), x1, y1, 8, floor (maxx div 10), Rand.Int (0, maxx), maxy)
	    end for
	    Pic.Free (picID8)
	end if

	%Bigasteroids
	if GameScore >= 2500 then
	    picID9 := Pic.FileNew ("Game/Pictures/Asteroid4.gif")
	    for p : 1 .. 4
		if p > 4 then
		    objecty2 (p) := objecty2 (p) - (decrement + 4)
		elsif p > 2 then
		    objecty2 (p) := objecty2 (p) - (decrement + 3)
		else
		    objecty2 (p) := objecty2 (p) - (decrement + 2)
		end if
		if xv > 0 and objectx2 (p) < x1 - 10 then
		    objectx2 (p) := objectx2 (p) + (decrement + 1) div 2
		elsif xv < 0 and objectx2 (p) > x1 + 10 then
		    objectx2 (p) := objectx2 (p) - (decrement + 1) div 2
		end if
		Pic.Draw (picID9, objectx2 (p) - 17, objecty2 (p) - 17, picMerge)
		to_top (objectx2 (p), objecty2 (p), Rand.Int (0, maxx), maxy, -40)
		find_distance (objectx2 (p), objecty2 (p), x1, y1, 17, floor (maxx div 8), Rand.Int (0, maxx), maxy)
	    end for
	    Pic.Free (picID9)
	end if

	%include "Resources/objectMissle.t"
	%Missile
	if GameScore >= 3750 then
	    picID10 := Pic.FileNew ("Game/Pictures/Missile.gif")
	    %locate (1, 1)
	    for m : 1 .. 5
		if m > 3 then
		    objectymissle (m) := objectymissle (m) - (decrement + 10)
		else
		    objectymissle (m) := objectymissle (m) - (decrement + 7)
		end if
		Pic.Draw (picID10, objectxmissle (m) - 20, objectymissle (m) - 10, picMerge)
		to_top (objectxmissle (m), objectymissle (m), Rand.Int (0, maxx), maxy, -80)
		find_distance (objectxmissle (m), objectymissle (m), x1, y1, 10, floor (maxx div 10), Rand.Int (0, maxx), maxy)
	    end for
	    Pic.Free (picID10)
	end if

	%include "Resources/objectEnemyShip.t"
	if GameScore >= 5500 then
	    %Spaceship1
	    Spaceshipx := Spaceshipx - (decrement + 1)
	    if Spaceshipx < -55 then
		Spaceshipx := maxx + 55
	    end if
	    picID2 := Pic.FileNew ("Game/Pictures/Spaceship1.gif")
	    Pic.Draw (picID2, Spaceshipx - 55, Spaceshipy - 30, picMerge)

	    %Spaceship bullets
	    for b : 1 .. 5
		bullety (b) := bullety (b) - (decrement + b)
		bulletx (b) := bulletx (b) + (decrement + b)
		if bulletx (b) >= maxx then
		    bulletx (b) := 0
		end if
		Draw.FillOval (bulletx (b), bullety (b), 5, 5, Rand.Int (40, 42))
		to_top (bulletx (b), bullety (b), Spaceshipx, Spaceshipy, 0)
		find_distance (bulletx (b), bullety (b), x1, y1, 10, floor (maxx div 10), Spaceshipx, Spaceshipy)
	    end for
	    Pic.Free (picID2)

	end if
	if GameScore >= 6000 then
	    %Spaceship2
	    Secondspaceshipx := Secondspaceshipx + (decrement + 1)
	    if Secondspaceshipx > maxx + 55 then
		Secondspaceshipx := -55
	    end if
	    picID3 := Pic.FileNew ("Game/Pictures/Spaceship1.gif")
	    Pic.Draw (picID3, Secondspaceshipx - 55, Secondspaceshipy - 30, picMerge)

	    %Spaceship bullets2
	    for b2 : 1 .. 5
		bullety2 (b2) := bullety2 (b2) - (decrement + b2)
		bulletx2 (b2) := bulletx2 (b2) - (decrement + b2)
		if bulletx2 (b2) <= 0 then
		    bulletx2 (b2) := maxx
		end if
		Draw.FillOval (bulletx2 (b2), bullety2 (b2), 5, 5, Rand.Int (40, 42))
		to_top (bulletx2 (b2), bullety2 (b2), Secondspaceshipx, Secondspaceshipy, 0)
		find_distance (bulletx2 (b2), bullety2 (b2), x1, y1, 10, floor (maxx div 10), Secondspaceshipx, Secondspaceshipy)
	    end for
	    Pic.Free (picID3)
	end if

	%include "Resources/objectEnemyShipBoss.t"
	if GameScore >= 7000 then
	    %Spaceshipboss
	    if Spaceshipyb > maxy div 5 * 4 then
		Spaceshipyb := Spaceshipyb - (decrement + 1)
	    else
		Spaceshipxb := Spaceshipxb + (m2 * (decrement + 2))
		if Spaceshipxb >= maxx + 125 then
		    m2 := -1
		end if
		if Spaceshipxb <= -125 then
		    m2 := 1
		end if
	    end if
	    %Spaceshipboss bullets
	    for bb1 : 1 .. 5
		bulletybb1 (bb1) := bulletybb1 (bb1) - (decrement + bb1)
		bulletxbb1 (bb1) := bulletxbb1 (bb1) + (decrement + bb1)
		if bulletybb1 (bb1) >= maxx then
		    bulletybb1 (bb1) := 0
		end if
		Draw.FillOval (bulletxbb1 (bb1), bulletybb1 (bb1), 5, 5, Rand.Int (40, 42))
		to_top (bulletxbb1 (bb1), bulletybb1 (bb1), Spaceshipxb, Spaceshipyb, 0)
		find_distance (bulletxbb1 (bb1), bulletybb1 (bb1), x1, y1, 15, floor (maxx div 10), Spaceshipxb, Spaceshipyb)
	    end for
	    %Spaceshipboss bullets2
	    for bb : 1 .. 5
		bulletybb2 (bb) := bulletybb2 (bb) - (decrement + bb)
		bulletxbb2 (bb) := bulletxbb2 (bb) - (decrement + bb)
		if bulletxbb2 (bb) <= 0 then
		    bulletxbb2 (bb) := maxx
		end if
		Draw.FillOval (bulletxbb2 (bb), bulletybb2 (bb), 5, 5, Rand.Int (40, 42))
		to_top (bulletxbb2 (bb), bulletybb2 (bb), Spaceshipxb, Spaceshipyb, 0)
		find_distance (bulletxbb2 (bb), bulletybb2 (bb), x1, y1, 10, floor (maxx div 10), Spaceshipxb, Spaceshipyb)
	    end for
	    %Blastright
	    picID4 := Pic.FileNew ("Game/Pictures/Blastright.gif")
	    for br : 1 .. 10
		Blastrighty (br) := Blastrighty (br) - (decrement + (br)) - 2
		Pic.Draw (picID4, Blastrightx (br) - 9, Blastrighty (br), picMerge)
		to_top (Blastrightx (br), Blastrighty (br), Spaceshipxb, Spaceshipyb, -108)
		find_distance (Blastrightx (br), Blastrighty (br), x1, y1, 10, floor (maxx div 10), Spaceshipxb, Spaceshipyb)
	    end for
	    Pic.Free (picID4)
	    picID5 := Pic.FileNew ("Game/Pictures/dodonshipboss.gif")
	    Pic.Draw (picID5, Spaceshipxb - 110, Spaceshipyb - 47, picMerge)
	    Pic.Free (picID5)
	end if

	%include "Resources/gameplayKeycontrols.t"
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

	%include "Resources/gameplayPhysics.t"
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

	%include "Resources/gameplayPictures.t"
	%Playership
	if chars ('a') or chars (KEY_LEFT_ARROW) then
	    picID := Pic.FileNew ("Game/Pictures/Spaceship2left.gif")
	elsif chars ('d') or chars (KEY_RIGHT_ARROW) then
	    picID := Pic.FileNew ("Game/Pictures/Spaceship2right.gif")
	elsif (chars (KEY_UP_ARROW) or chars ('w') or chars (chr (32))) and yv >= 0 then
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

	%include "Resources/gameplayUIManage.t"
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
	GameCounter := GameCounter + 4 + decrement
	GameScore := GameScore + 4 + decrement
	%Exit statement
	if (Bar2 <= 10 and Color = green) or Bar <= 10 then
	    exit
	end if

	%Refresh
	View.Update
	%delay (5)
	cls
    end loop
    if GameCounter > score1 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := score1
	score1 := GameCounter
    elsif GameCounter > score2 then
	score5 := score4
	score4 := score3
	score3 := score2
	score2 := GameCounter
    elsif GameCounter > score3 then
	score5 := score4
	score4 := score3
	score3 := GameCounter
    elsif GameCounter > score4 then
	score5 := score4
	score4 := GameCounter
    elsif GameCounter > score5 then
	score5 := GameCounter
    end if
    GameCounter := 1
    m2 := 1
end game
