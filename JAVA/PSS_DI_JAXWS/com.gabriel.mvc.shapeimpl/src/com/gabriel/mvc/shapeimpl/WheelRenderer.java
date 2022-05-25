package com.gabriel.mvc.shapeimpl;

import java.awt.Graphics;

import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Renderer;

public class WheelRenderer implements Renderer {

	public void draw(Object context, MyShape shape) {
		Graphics g = (Graphics) context;
		Wheel wheel = (Wheel) shape;
		g.drawOval(wheel.getLocation().getX(), wheel.getLocation().getY(), wheel.getRadius(), wheel.getRadius());
	}
}
