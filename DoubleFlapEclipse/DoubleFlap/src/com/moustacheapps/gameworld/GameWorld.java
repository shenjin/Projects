package com.moustacheapps.gameworld;

import com.badlogic.gdx.math.Intersector;
import com.badlogic.gdx.math.Rectangle;
import com.moustacheapps.dfhelpers.AssetLoader;
import com.moustacheapps.gameobjects.Bird;
import com.moustacheapps.gameobjects.ScrollHandler;

public class GameWorld {

	private Bird bird, bird2;
	private ScrollHandler scroller;
	private Rectangle ground;
	public static Rectangle leftBound, rightBound;
	private static int score = 0, lives = 0, gamesNeeded = 10, timesPlayed;
	public static float runTime = 0;
	public static int midPointY;
	private GameRenderer renderer;
	private GameState currentState;
	private boolean shuffle = false;

	public enum GameState {
		MENU, DIFFICULTY, DIFFICULTY1, DIFFICULTY2, STARTE, STARTH, STARTI, RUNNING, GAMEOVER, HIGHSCORE
	}

	public GameWorld(int midPointY) {
		currentState = GameState.MENU;
		GameWorld.midPointY = midPointY;
		bird = new Bird(169, midPointY - 5, 17, 12);
		bird2 = new Bird(86, midPointY - 5, 17, 12);
		// The grass should start 66 pixels below the midPointY
		scroller = new ScrollHandler(this, midPointY + 66);
		ground = new Rectangle(0, midPointY + 66, 272, 11);
		leftBound = new Rectangle(0, 0, 136, midPointY * 2);
		rightBound = new Rectangle(136, 0, 136, midPointY * 2);
		// AssetLoader.setTimesPlayed(0);
	}

	public static Rectangle getRectangleLeft() {
		return leftBound;
	}

	public static Rectangle getRectangleRight() {
		return rightBound;
	}

	public GameState getGameState() {
		return currentState;
	}

	public void update(float delta) {
		runTime += delta;

		switch (currentState) {
		case MENU:
		case DIFFICULTY:
		case DIFFICULTY1:
		case DIFFICULTY2:
			updateReady(delta);
			break;
		case STARTE:
		case STARTH:
		case STARTI:
			scroller.setPipeDifficulty(currentState);
			updateRunning(delta);
			break;
		default:
			break;
		}

	}

	private void updateReady(float delta) {
		bird.updateReady(runTime);
		bird2.updateReady(runTime + 1);
		scroller.updateReady(delta);
	}

	public void updateRunning(float delta) {

		if (delta > .15f) {
			delta = .15f;
		}

		bird.update(delta, 1);
		bird2.update(delta, -1);
		scroller.update(delta);

		if ((bird.isAlive() && scroller.collidesPowerUp(bird))
				|| bird2.isAlive() && scroller.collidesPowerUp(bird2)) {
			lives = lives + 1;
			addScore(5);
			AssetLoader.powerUpSound.play(0.4f);
			scroller.restartPowerUp();
		}

		if (bird.isAlive()
				&& (scroller.collides(bird) || scroller.collidesBounds(bird))) {
			if (lives > 0 && !scroller.collidesBounds(bird)) {
				lives = lives - 1;
				scroller.rearrangePipesRight(bird);
			} else {
				scroller.stop();
				ScrollHandler.powerUp.stop();
				bird.die();
				if (bird2.isAlive()) {
					bird2.live(-1);
				}
				AssetLoader.dead.play(0.5f);
				renderer.prepareTransition(255, 255, 255, .3f);
				AssetLoader.fall.play(0.5f);
			}

		}

		if (bird2.isAlive()
				&& (scroller.collidesLeft(bird2) || scroller
						.collidesBounds(bird2))) {
			if (lives > 0 && !scroller.collidesBounds(bird2)) {
				lives = lives - 1;
				scroller.rearrangePipesLeft(bird2);
			} else {
				scroller.stop();
				bird2.die();
				if (bird.isAlive()) {
					bird.live(1);
				}
				AssetLoader.dead.play(0.5f);
				renderer.prepareTransition(255, 255, 255, .3f);
				AssetLoader.fall.play(0.5f);
			}
		}

		if (!bird.decelerated()
				&& Intersector.overlaps(bird.getBoundingCircle(), ground)) {

			if (bird.isAlive() && bird2.isAlive()) {
				scroller.stop();
				AssetLoader.dead.play(0.5f);
				renderer.prepareTransition(255, 255, 255, .3f);
				bird2.live(-1);
			}

			bird.die();
			bird.decelerate();

			if (bird2.getAccelerationY() == 0) {
				currentState = GameState.GAMEOVER;
			}

			if (score > AssetLoader.getHighScore()
					&& bird2.getAccelerationY() == 0) {
				AssetLoader.setHighScore(score);
				currentState = GameState.HIGHSCORE;
			}
		}

		if (!bird2.decelerated()
				&& Intersector.overlaps(bird2.getBoundingCircle(), ground)) {

			if (bird.isAlive()) {
				scroller.stop();
				AssetLoader.dead.play(0.5f);
				renderer.prepareTransition(255, 255, 255, .3f);
				bird.live(1);
			}

			bird2.die();
			bird2.decelerate();

			if (bird.getAccelerationY() == 0) {
				currentState = GameState.GAMEOVER;
			}
			if (score > AssetLoader.getHighScore()
					&& bird.getAccelerationY() == 0) {
				AssetLoader.setHighScore(score);
				currentState = GameState.HIGHSCORE;
			}
		}

	}

	public Bird getBird() {
		return bird;
	}

	public Bird getBird2() {
		return bird2;
	}

	public static int getMidPointY() {
		return midPointY;
	}

	public ScrollHandler getScroller() {
		return scroller;
	}

	public static int getRunTime() {
		return (int) runTime;
	}

	public static int getScore() {
		return score;
	}

	public static int getLives() {
		return lives;
	}

	public static int getGamesNeeded() {
		if (AssetLoader.getTimesPlayed() <= 10) {
			return gamesNeeded - AssetLoader.getTimesPlayed();
		}
		return 0;
	}

	public void addScore(int increment) {
		score += increment;
	}

	public void startE() {
		currentState = GameState.STARTE;
		renderer.prepareTransition(0, 0, 0, 1f);
	}

	public void startH() {
		currentState = GameState.STARTH;
		renderer.prepareTransition(0, 0, 0, 1f);
	}

	public void startI() {
		currentState = GameState.STARTI;
		renderer.prepareTransition(0, 0, 0, 1f);
	}

	public void difficulty() {
		currentState = GameState.DIFFICULTY;
		renderer.prepareTransition(0, 0, 0, 1f);
	}

	public void difficulty1() {
		currentState = GameState.DIFFICULTY1;
		renderer.prepareTransition(0, 0, 0, 1f);
	}

	public void difficulty2() {
		currentState = GameState.DIFFICULTY2;
		renderer.prepareTransition(0, 0, 0, 1f);
	}

	public void getTimesPlayedPlusOne() {
		timesPlayed = AssetLoader.getTimesPlayed() + 1;
	}

	public void restart(int prevState) {
		getTimesPlayedPlusOne();
		AssetLoader.setTimesPlayed(timesPlayed);
		score = 0;
		lives = 0;
		bird.onRestart(midPointY - 5, 169);
		bird2.onRestart(midPointY - 5, 86);
		scroller.onRestart();
		if (prevState == 0) {
			startE();
		} else if (prevState == 1) {
			startH();
		} else if (prevState == 2) {
			startI();
		} else {
			if (AssetLoader.getHighScoreHard() >= 40) {
				difficulty();
			} else if (AssetLoader.getHighScoreEasy() >= 20) {
				difficulty1();
			} else {
				difficulty2();
			}
		}
	}

	public boolean isGameOver() {
		return currentState == GameState.GAMEOVER;
	}

	public boolean isHighScore() {
		return currentState == GameState.HIGHSCORE;
	}

	public boolean isMenu() {
		return currentState == GameState.MENU;
	}

	public boolean isShuffle() {
		if (AssetLoader.getTimesPlayed() >= gamesNeeded) {
			shuffle = true;
		}
		return shuffle;
	}

	public boolean isDifficulty() {
		return currentState == GameState.DIFFICULTY;
	}

	public boolean isDifficultyHU() {
		return currentState == GameState.DIFFICULTY1;
	}

	public boolean isDifficultyIU() {
		return currentState == GameState.DIFFICULTY2;
	}

	public boolean isRunning() {
		return currentState == GameState.STARTE
				|| currentState == GameState.STARTH
				|| currentState == GameState.STARTI;
	}

	public void setRenderer(GameRenderer renderer) {
		this.renderer = renderer;
	}

}
