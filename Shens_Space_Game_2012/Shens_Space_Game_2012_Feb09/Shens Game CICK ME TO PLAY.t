%Allows use of GUI features
import GUI

include "Game/Variables/initVar.t"
include "Game/Procedures/hitDistance.t"
include "Game/Procedures/relocateHit.t"
include "Game/Procedures/drawUIBar.t"
include "Game/Procedures/mainGame.t"
include "Game/Procedures/buttonToggle.t"
include "Game/Procedures/gameScreen.t"
include "Game/Procedures/musicToggle.t"
include "Game/Procedures/buttonToggle2.t"
include "Game/Procedures/instructionScreen.t"
include "Game/Procedures/highscoreScreen.t"

% Start program here
loop
    loop
	%Splashscreen
	View.Set ("graphics:max;max,offscreenonly")
	Pic.Draw (mainscreen, 0, 0, picMerge)
	Font.Draw (text, 10, 10, font, white)
	Font.Draw (text2, 10, 40, font, white)
	
	% Mainscreen Buttons
	var startGameButton : int := GUI.CreateButton (maxx - 110, maxy - 30, 0, " Start Game ", maingame)
	var instructionButton : int := GUI.CreateButton (maxx - 110, maxy - 60, 0, "Instructions ", instructions)
	var highscoresButton : int := GUI.CreateButton (maxx - 110, maxy - 90, 0, " Highscores ", highscores)
	var musicToggleButton : int := GUI.CreateButton (10, maxy - 30, 0, musicstatus, playmusic)
	View.Update
	exit when GUI.ProcessEvent
    end loop
end loop
