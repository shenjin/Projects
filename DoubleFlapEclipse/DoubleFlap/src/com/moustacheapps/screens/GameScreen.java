package com.moustacheapps.screens;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.moustacheapps.dfhelpers.InputHandler;
import com.moustacheapps.gameworld.GameRenderer;
import com.moustacheapps.gameworld.GameWorld;

public class GameScreen implements Screen {

	private GameWorld world;
	private GameRenderer renderer;
	private float runTime;
	private float ratio;

	// This is the constructor, not the class declaration
	public GameScreen() {

		float screenWidth = Gdx.graphics.getWidth();
		float screenHeight = Gdx.graphics.getHeight();
		float gameWidth = 272;
		float ratio = screenWidth / gameWidth;
		float gameHeight = screenHeight / ratio;
		int midPointY = (int) (gameHeight / 2);

		world = new GameWorld(midPointY);
		Gdx.input.setInputProcessor(new InputHandler(world, ratio, ratio));
		renderer = new GameRenderer(world, (int) gameHeight, midPointY,
				(int) screenWidth, (int) screenHeight);
		world.setRenderer(renderer);
	}

	@Override
	public void render(float delta) {
		runTime += delta;
		world.update(delta);
		renderer.render(delta, runTime);
	}

	@Override
	public void resize(int width, int height) {
	}

	@Override
	public void show() {
	}

	@Override
	public void hide() {
	}

	@Override
	public void pause() {
	}

	@Override
	public void resume() {
	}

	@Override
	public void dispose() {
	}

}
