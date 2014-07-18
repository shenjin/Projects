package com.moustacheapps.dfhelpers;

import java.util.ArrayList;
import java.util.List;

import com.badlogic.gdx.Input.Keys;
import com.badlogic.gdx.InputProcessor;
import com.moustacheapps.gameobjects.Bird;
import com.moustacheapps.gameworld.GameWorld;
import com.moustacheapps.ui.SimpleButton;

public class InputHandler implements InputProcessor {
	private Bird myBird, myBird2;
	private GameWorld myWorld;

	private List<SimpleButton> menuButtons, difficultyButtons,
			difficultyButtonsHardUnlock, difficultyButtonsInsaneUnlock,
			inputSections, retryButtons;

	private SimpleButton playButton, easyButton, hardButton, insaneButton,
			retryButton, hardLockButton, insaneLockButton, leftTap, rightTap,
			shuffleButtonOn, shuffleButtonOff, shuffleLockButton;

	private float scaleFactorX;
	private float scaleFactorY;
	private boolean shuffleTap = false;
	public static int state;
	public static int shuffleState = 0;

	public InputHandler(GameWorld myWorld, float scaleFactorX,
			float scaleFactorY) {
		this.myWorld = myWorld;
		myBird = myWorld.getBird();
		myBird2 = myWorld.getBird2();

		int midPointY = GameWorld.getMidPointY();

		this.scaleFactorX = scaleFactorX;
		this.scaleFactorY = scaleFactorY;

		inputSections = new ArrayList<SimpleButton>();

		playButton = new SimpleButton(
				272 / 2 - (AssetLoader.playButtonUp.getRegionWidth() / 2),
				midPointY + 35, 29, 16, AssetLoader.playButtonUp,
				AssetLoader.playButtonDown);
		leftTap = new SimpleButton(0, 0, 136, GameWorld.getMidPointY() * 2,
				null, null);
		rightTap = new SimpleButton(136, 0, 136, GameWorld.getMidPointY() * 2,
				null, null);

		easyButton = new SimpleButton(
				272 / 2 - (AssetLoader.easyButtonUp.getRegionWidth() / 2),
				midPointY - 62, 29, 16, AssetLoader.easyButtonUp,
				AssetLoader.easyButtonDown);
		hardButton = new SimpleButton(
				272 / 2 - (AssetLoader.hardButtonUp.getRegionWidth() / 2),
				midPointY - 28, 29, 16, AssetLoader.hardButtonUp,
				AssetLoader.hardButtonDown);
		hardLockButton = new SimpleButton(
				272 / 2 - (AssetLoader.hardButtonLockUp.getRegionWidth() / 2),
				midPointY - 28, 29, 16, AssetLoader.hardButtonLockUp,
				AssetLoader.hardButtonLockDown);
		insaneButton = new SimpleButton(
				272 / 2 - (AssetLoader.xxxxButtonUp.getRegionWidth() / 2),
				midPointY + 6, 29, 16, AssetLoader.xxxxButtonUp,
				AssetLoader.xxxxButtonDown);
		insaneLockButton = new SimpleButton(
				272 / 2 - (AssetLoader.xxxxButtonLockUp.getRegionWidth() / 2),
				midPointY + 6, 29, 16, AssetLoader.xxxxButtonLockUp,
				AssetLoader.xxxxButtonLockDown);
		shuffleButtonOff = new SimpleButton(
				272 / 2 - (AssetLoader.shuffleButtonOffUp.getRegionWidth() / 2),
				midPointY + 40, 29, 16, AssetLoader.shuffleButtonOffUp,
				AssetLoader.shuffleButtonOffDown);
		shuffleButtonOn = new SimpleButton(
				272 / 2 - (AssetLoader.shuffleButtonOnUp.getRegionWidth() / 2),
				midPointY + 40, 29, 16, AssetLoader.shuffleButtonOnUp,
				AssetLoader.shuffleButtonOnDown);
		shuffleLockButton = new SimpleButton(
				272 / 2 - (AssetLoader.shuffleButtonLockedUp.getRegionWidth() / 2),
				midPointY + 40, 29, 16, AssetLoader.shuffleButtonLockedUp,
				AssetLoader.shuffleButtonLockedDown);
		retryButton = new SimpleButton(
				272 / 2 - (AssetLoader.backButtonUp.getRegionWidth() / 2),
				midPointY + 35, 29, 16, AssetLoader.backButtonUp,
				AssetLoader.backButtonDown);

		inputSections.add(leftTap);
		inputSections.add(rightTap);
	}

	@Override
	public boolean touchDown(int screenX, int screenY, int pointer, int button) {
		screenX = scaleX(screenX);
		screenY = scaleY(screenY);

		if (myWorld.isMenu()) {
			playButton.isTouchDown(screenX, screenY);
		} else if (myWorld.isDifficulty()) {
			easyButton.isTouchDown(screenX, screenY);
			hardButton.isTouchDown(screenX, screenY);
			insaneButton.isTouchDown(screenX, screenY);
			if (myWorld.isShuffle()) {
				if (shuffleState == 1
						&& shuffleButtonOn.isTouchDown(screenX, screenY)) {
					shuffleState = 0;
				} else if (shuffleState == 0
						&& shuffleButtonOff.isTouchDown(screenX, screenY)) {
					shuffleState = 1;
				}
			} else if (!myWorld.isShuffle()) {
				shuffleLockButton.isTouchDown(screenX, screenY);
			}
		} else if (myWorld.isDifficultyHU()) {
			easyButton.isTouchDown(screenX, screenY);
			hardButton.isTouchDown(screenX, screenY);
			insaneLockButton.isTouchDown(screenX, screenY);
			if (myWorld.isShuffle()) {
				if (shuffleState == 1) {
					shuffleButtonOn.isTouchDown(screenX, screenY);
				} else if (shuffleState == 0) {
					shuffleButtonOff.isTouchDown(screenX, screenY);
				}
			} else if (!myWorld.isShuffle()) {
				shuffleLockButton.isTouchDown(screenX, screenY);
			}
		} else if (myWorld.isDifficultyIU()) {
			easyButton.isTouchDown(screenX, screenY);
			hardLockButton.isTouchDown(screenX, screenY);
			insaneLockButton.isTouchDown(screenX, screenY);
			if (myWorld.isShuffle()) {
				if (shuffleState == 1) {
					shuffleButtonOn.isTouchDown(screenX, screenY);
				} else if (shuffleState == 0) {
					shuffleButtonOff.isTouchDown(screenX, screenY);
				}
			} else if (!myWorld.isShuffle()) {
				shuffleLockButton.isTouchDown(screenX, screenY);
			}
		} else if (myWorld.isRunning()) {
			if (leftTap.isTouchDown(screenX, screenY)) {
				if (shuffleTap) {
					myBird.onClick();
				} else {
					myBird2.onClick();
				}
			}
			if (rightTap.isTouchDown(screenX, screenY)) {
				if (shuffleTap) {
					myBird2.onClick();
				} else {
					myBird.onClick();
				}
			}
		} else if (myWorld.isGameOver() || myWorld.isHighScore()) {
			retryButton.isTouchDown(screenX, screenY);
			leftTap.isTouchDown(screenX, screenY);
			rightTap.isTouchDown(screenX, screenY);
		}

		return true;
	}

	@Override
	public boolean touchUp(int screenX, int screenY, int pointer, int button) {
		screenX = scaleX(screenX);
		screenY = scaleY(screenY);
		if (myWorld.isMenu()) {
			// if add in toggle
			if (playButton.isTouchUp(screenX, screenY)) {
				if (AssetLoader.getHighScoreHard() >= 40) {
					myWorld.difficulty();
					return true;
				} else if (AssetLoader.getHighScoreEasy() >= 20) {
					myWorld.difficulty1();
					return true;
				} else {
					myWorld.difficulty2();
					return true;
				}
			}
		} else if (myWorld.isDifficulty()) {
			if (easyButton.isTouchUp(screenX, screenY)) {
				myWorld.startE();
				myBird.onClick();
				myBird2.onClick();
				state = 0;
				return true;
			} else if (hardButton.isTouchUp(screenX, screenY)) {
				myWorld.startH();
				myBird.onClick();
				myBird2.onClick();
				state = 1;
				return true;
			} else if (insaneButton.isTouchUp(screenX, screenY)) {
				myWorld.startI();
				myBird.onClick();
				myBird2.onClick();
				state = 2;
				return true;
			} else if (myWorld.isShuffle()) {
				if (shuffleState == 0
						&& shuffleButtonOff.isTouchUp(screenX, screenY)) {
					shuffleState = 1;
					if (shuffleTap) {
						shuffleTap = false;
					} else {
						shuffleTap = true;
					}
					return true;
				} else if (shuffleState == 1
						&& shuffleButtonOn.isTouchUp(screenX, screenY)) {
					shuffleState = 0;
					if (shuffleTap) {
						shuffleTap = false;
					} else {
						shuffleTap = true;
					}
					return true;
				}
			} else if (!myWorld.isShuffle()) {
				if (shuffleLockButton.isTouchUp(screenX, screenY)) {
					return true;
				}
			}
		} else if (myWorld.isDifficultyHU()) {
			if (easyButton.isTouchUp(screenX, screenY)) {
				myWorld.startE();
				myBird.onClick();
				myBird2.onClick();
				state = 0;
				return true;
			} else if (hardButton.isTouchUp(screenX, screenY)) {
				myWorld.startH();
				myBird.onClick();
				myBird2.onClick();
				state = 1;
				return true;
			} else if (insaneLockButton.isTouchUp(screenX, screenY)) {
				return true;
			} else if (myWorld.isShuffle()) {
				if (shuffleState == 0
						&& shuffleButtonOff.isTouchUp(screenX, screenY)) {
					shuffleState = 1;
					if (shuffleTap) {
						shuffleTap = false;
					} else {
						shuffleTap = true;
					}
					return true;
				} else if (shuffleState == 1
						&& shuffleButtonOn.isTouchUp(screenX, screenY)) {
					shuffleState = 0;
					if (shuffleTap) {
						shuffleTap = false;
					} else {
						shuffleTap = true;
					}
					return true;
				}
			} else if (!myWorld.isShuffle()) {
				if (shuffleLockButton.isTouchUp(screenX, screenY)) {
					return true;
				}
			}
		} else if (myWorld.isDifficultyIU()) {
			if (easyButton.isTouchUp(screenX, screenY)) {
				myWorld.startE();
				myBird.onClick();
				myBird2.onClick();
				state = 0;
				return true;
			} else if (hardLockButton.isTouchUp(screenX, screenY)) {
				return true;
			} else if (insaneLockButton.isTouchUp(screenX, screenY)) {
				return true;
			} else if (shuffleLockButton.isTouchUp(screenX, screenY)) {
				return true;
			} else if (myWorld.isShuffle()) {
				if (shuffleState == 0
						&& shuffleButtonOff.isTouchUp(screenX, screenY)) {
					shuffleState = 1;
					if (shuffleTap) {
						shuffleTap = false;
					} else {
						shuffleTap = true;
					}
					return true;
				} else if (shuffleState == 1
						&& shuffleButtonOn.isTouchUp(screenX, screenY)) {
					shuffleState = 0;
					if (shuffleTap) {
						shuffleTap = false;
					} else {
						shuffleTap = true;
					}
					return true;
				}
			} else if (!myWorld.isShuffle()) {
				if (shuffleLockButton.isTouchUp(screenX, screenY)) {
					return true;
				}
			}
		} else if (myWorld.isGameOver() || myWorld.isHighScore()) {
			if (retryButton.isTouchUp(screenX, screenY)) {
				state = 3;
				myWorld.restart(state);

				return true;
			} else if (leftTap.isTouchUp(screenX, screenY)
					|| rightTap.isTouchUp(screenX, screenY)) {
				myWorld.restart(state);
				myBird.onClick();
				myBird2.onClick();
				return true;
			}
		}

		return false;
	}

	@Override
	public boolean keyDown(int keycode) {

		// Can now use Space Bar to play the game
		if (keycode == Keys.SPACE) {

			if (myWorld.isDifficulty()) {
				myWorld.startE();
				myBird2.onClick();
				myBird.onClick();
			}

			if (myWorld.isMenu()) {
				myWorld.difficulty();
				// myBird2.onClick();
				// myBird.onClick();
			}

			myBird.onClick();
			myBird2.onClick();

			if (myWorld.isGameOver() || myWorld.isHighScore()) {
				myWorld.restart(state);
				myBird.onClick();
				myBird2.onClick();
			}

		} else if (keycode == Keys.A) {

			if (myWorld.isDifficulty()) {
				myWorld.startE();
				myBird2.onClick();
				myBird.onClick();
			}

			if (myWorld.isMenu()) {
				myWorld.difficulty();
				// myBird.onClick();
				// myBird2.onClick();
			}

			if (shuffleTap) {
				myBird.onClick();
			} else {
				myBird2.onClick();
			}

			if (myWorld.isGameOver() || myWorld.isHighScore()) {
				myWorld.restart(state);
				myBird2.onClick();
				myBird.onClick();
			}

		} else if (keycode == Keys.L) {

			if (myWorld.isDifficulty()) {
				myWorld.startE();
				myBird2.onClick();
				myBird.onClick();
			}

			if (myWorld.isMenu()) {
				myWorld.difficulty();
				// myBird.onClick();
				// myBird2.onClick();

			}

			if (shuffleTap) {
				myBird2.onClick();
			} else {
				myBird.onClick();
			}

			if (myWorld.isGameOver() || myWorld.isHighScore()) {
				myWorld.restart(state);
				myBird.onClick();
				myBird2.onClick();
			}
		}
		return false;

	}

	@Override
	public boolean keyUp(int keycode) {
		return false;
	}

	@Override
	public boolean keyTyped(char character) {
		return false;
	}

	@Override
	public boolean touchDragged(int screenX, int screenY, int pointer) {
		return false;
	}

	@Override
	public boolean mouseMoved(int screenX, int screenY) {
		return false;
	}

	@Override
	public boolean scrolled(int amount) {
		return false;
	}

	private int scaleX(int screenX) {
		return (int) (screenX / scaleFactorX);
	}

	private int scaleY(int screenY) {
		return (int) (screenY / scaleFactorY);
	}

	public static int getShuffleState() {
		return shuffleState;
	}

	public SimpleButton getPlayButton() {
		return playButton;
	}

	public SimpleButton getEasyButton() {
		return easyButton;
	}

	public SimpleButton getHardButton() {
		return hardButton;
	}

	public SimpleButton getInsaneButton() {
		return insaneButton;
	}

	public SimpleButton getHardLockButton() {
		return hardLockButton;
	}

	public SimpleButton getInsaneLockButton() {
		return insaneLockButton;
	}

	public SimpleButton getRetryButton() {
		return retryButton;
	}

	public SimpleButton getShuffleButtonOn() {
		return shuffleButtonOn;
	}

	public SimpleButton getShuffleButtonOff() {
		return shuffleButtonOff;
	}

	public SimpleButton getShuffleLockButton() {
		return shuffleLockButton;
	}

	public List<SimpleButton> getMenuButtons() {
		return menuButtons;
	}

	public List<SimpleButton> getDifficultyButtons() {
		return difficultyButtons;
	}

	public List<SimpleButton> getDifficultyButtonsHardUnlock() {
		return difficultyButtonsHardUnlock;
	}

	public List<SimpleButton> getDifficultyButtonsInsaneUnlock() {
		return difficultyButtonsInsaneUnlock;
	}

	public List<SimpleButton> getRetryButtons() {
		return retryButtons;
	}
}
