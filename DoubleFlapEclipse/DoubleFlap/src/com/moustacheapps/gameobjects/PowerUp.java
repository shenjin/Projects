package com.moustacheapps.gameobjects;

import com.badlogic.gdx.math.Circle;
import com.badlogic.gdx.math.Vector2;

public class PowerUp {
	public float x, y, width, height, mid;
	public Vector2 position, velocity, acceleration;
	public Circle boundingCircle;
	public boolean isTaken;

	public PowerUp(int x, int y, int width, int height, int velocityX,
			int midPoint) {
		position = new Vector2(x, y);
		velocity = new Vector2(velocityX, 0);
		acceleration = new Vector2(0, 0);
		this.width = width;
		this.height = height;
		this.x = x;
		this.y = y;
		mid = midPoint;
		boundingCircle = new Circle();
		isTaken = false;
	}

	public void update(float delta) {

		if (ScrollHandler.getToggle() == 1) {
			if (position.x + width < 136 + 6) {
				onRestart();
			}
		} else {
			if (position.x > 136 - 6) {
				onRestart();
			}
		}

		if (position.y <= mid - 4) {
			acceleration.y = 100;
		} else if (position.y >= mid + 4) {
			acceleration.y = -100;
		}

		velocity.add(acceleration.cpy().scl(delta));
		position.add(velocity.cpy().scl(delta));

		boundingCircle.set(position.x + 6, position.y + 6, 6);

	}

	public void setVelocityX(int x) {
		velocity.x = x;
	}

	public void setAccelerationY(int y) {
		acceleration.y = y;
	}

	public void onRestart() {
		ScrollHandler.switchToggle();
		if (ScrollHandler.getToggle() > 0) {
			if (ScrollHandler.getPipeX1() > 232) {
				setX(ScrollHandler.getPipeX1() + 22 + 19);
			} else if (ScrollHandler.getPipeX2() > 236) {
				setX(ScrollHandler.getPipeX2() + 22 + 19);
			} else {
				setX(ScrollHandler.getPipeX3() + 22 + 19);
			}
		} else {
			if (ScrollHandler.getPipeXA() < 19) {
				setX(ScrollHandler.getPipeXA() - 31);
			} else if (ScrollHandler.getPipeXB() < 19) {
				setX(ScrollHandler.getPipeXB() - 31);
			} else {
				setX(ScrollHandler.getPipeXC() - 31);
			}
		}
		position.y = mid;
		velocity.y = 0;
		velocity.x = 0;
		acceleration.x = 0;
		acceleration.y = 0;
		isTaken = false;

	}

	public void setX(float x) {
		position.x = x;
	}

	public float getX() {
		return position.x;
	}

	public float getY() {
		return position.y;
	}

	public int getWidth() {
		return (int) width;
	}

	public int getHeight() {
		return (int) height;
	}

	public void stop() {
		acceleration.y = 0;
		velocity.x = 0;
		velocity.y = 0;
	}

	public Circle getBoundingCircle() {
		return boundingCircle;
	}

}
