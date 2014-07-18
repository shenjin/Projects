package com.moustacheapps.doubleflap;

import com.badlogic.gdx.Game;
import com.moustacheapps.dfhelpers.AssetLoader;
import com.moustacheapps.screens.SplashScreen;

public class DFGame extends Game {

	@Override
	public void create() {
		AssetLoader.load();
		setScreen(new SplashScreen(this));
	}

	@Override
	public void dispose() {
		super.dispose();
		AssetLoader.dispose();
	}

}