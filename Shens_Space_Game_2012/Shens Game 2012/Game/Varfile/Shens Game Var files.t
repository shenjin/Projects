View.Set ("graphics:max;max,offscreenonly")
var chars : array char of boolean
var x1 : int := maxx div 2
var x2 : int := x1 + 10
var y1 : int := 10
var y2 : int := y1 + 10
var xv : real := 0
var yv : real := 0
var g : real := 1
var realnum : int := 1 div 100
var ground : boolean := true
var counter, counter2 : real := 1
var distance_between_centresf, distance_between_centres, distance_between_centressbb2 : real
var distance_between_centressbr, distance_between_centresm, distance_between_centresp : real
var distance_between_centressbb1, distance_between_centressb, distance_between_centressb2 : real
var objectradiusx, objectradiusy : int
%Power up1
var powerupx1 : int := Rand.Int (0, maxx)
var powerupy1 : int := Rand.Int (0, maxy)
var powerup1 : boolean
%Health Bar
var Healthx : int := 10
var Healthy : int := maxy - 12
var Bar2 : int := maxx - 10
%Fuel Gague
var Fuelgaguex : int := 10
var Fuelgaguey : int := maxy - 39
var Bar : int := maxx div 2
%Fuel
var Fuelx, Fuely : array 1 .. 3 of int
for f : 1 .. 3
    Fuelx (f) := Rand.Int (0, maxx)
    Fuely (f) := Rand.Int (0, maxy)
end for
%stars
var objectxstar, objectystar : array 1 .. 100 of int
for s : 1 .. 100
    objectxstar (s) := Rand.Int (0, maxx)
    objectystar (s) := Rand.Int (0, maxy)
end for
%Flashing Stars
var objectxstarf, objectystarf : array 1 .. 10 of int
for sf : 1 .. 10
    objectxstarf (sf) := Rand.Int (0, maxx)
    objectystarf (sf) := Rand.Int (0, maxy)
end for
%Asteroids1
var objectx, objecty : array 1 .. 4 of int
for i : 1 .. 4
    objectx (i) := Rand.Int (0, maxx)
    objecty (i) := Rand.Int (maxy, maxy + 1000)
end for
%Asteroids2
var object2x, object2y : array 1 .. 4 of int
for i2 : 1 .. 4
    object2x (i2) := Rand.Int (0, maxx)
    object2y (i2) := Rand.Int (maxy, maxy + 1000)
end for
%Asteroids3
var object3x, object3y : array 1 .. 4 of int
for i3 : 1 .. 4
    object3x (i3) := Rand.Int (0, maxx)
    object3y (i3) := Rand.Int (maxy, maxy + 1000)
end for
%Pulse fire
var objectx2, objecty2 : array 1 .. 5 of int
for p : 1 .. 5
    objectx2 (p) := Rand.Int (0, maxx)
    objecty2 (p) := Rand.Int (maxy, maxy + 1000)
end for
%Missles
var objectxmissle, objectymissle : array 1 .. 10 of int
for m : 1 .. 10
    objectxmissle (m) := Rand.Int (0, maxx)
    objectymissle (m) := Rand.Int (maxy, maxy + 1000)
end for
%Spaceship
var Spaceshipx, Spaceshipy : int
Spaceshipx := maxx + 55
Spaceshipy := Rand.Int (200, maxy)
%Bullets
var bulletx, bullety : array 1 .. 5 of int
for b : 1 .. 5
    bulletx (b) := Spaceshipx
    bullety (b) := Spaceshipy
end for
%Spaceship2
var Secondspaceshipx, Secondspaceshipy : int
Secondspaceshipx := 0 - 55
Secondspaceshipy := Rand.Int (200, maxy)
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
for bb1 : 1 .. 5
    bulletxbb1 (bb1) := Spaceshipxb
    bulletybb1 (bb1) := Spaceshipyb
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
%Boost detection
var boostdetection : int := 10
%Pic ID's
var picID, picID2, picID3, picID4, picID5 : int
%Background of game
colourback (7)
