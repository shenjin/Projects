********************************************************************************************************************************************

Tested mainly on:

	MacbookAir 11 inch (2011 model core i5 SandyBridge)
		-720p moniter
		-1080p moniter
		-Standard keyboard
		-Running Windows 8 (Parallels)

Note, my turing game relies on turing, which is only avaliable on windows operating systems!
********************************************************************************************************************************************

Change Log:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2/9/14
-Introduced increasing difficulty for game
-Updated collectable items in instruction screen

Next update:
	-New .png, .gif files
	-Plan on making overhaul of enemyship
	-Introduce new enemies

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2/9/14
-Changed playership, bigasteroid, enenmyship, and enemyshipboss behaviour
-Introduced dynamic background (stars moving at different rates)
-Fixed enemyshipboss x-coordinate movement
-Abstracted many repetitive lines of code
-Got rid of unecessary files
	-Game is now 4MB, as opposed to 8MB from before
	-Reorganized all directories
-Overall performance inprovements (alot smoother than before)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2/8/14
-Fixed layer problem (ship appearing below stars)
-Added Shield PowerUp
-Fixed ship bouncing bug (when you moved to the left border)

Will be making major overhaul of the code soon!
-Plan to abstract many repetitive lines of code.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
2/7/14
-Implemented adaptive fuel (as you progress in the game, the amount of gas given for each fuel collected is also increased)
	-Thinking of increasing actual amount of fuel with a floor(ln()) function rather than increasing the value of fuel.
-Polished up spaceshipboss, and spaceshipminiboss behaviour (smoother transitions)
-Made background stars more realistic, adds sense of depth
-Fixed menuscreen vs continuescreen bug
-Minor performance improvements

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Things to add to game:

Powerups: slow-speed, increase-speed, etc

Option to choose difficulty