package com.gabriel.mvc.shapeimpl;

import java.awt.Graphics;

import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Renderer;

public class CarBodyRenderer implements Renderer {

	@Override
	public void draw(Object context, MyShape shape) {
		Graphics g = (Graphics) context;
		CarBody carBody = (CarBody) shape;
		g.drawRect(carBody.getLocation().getX(),carBody.getLocation().getY(),carBody.getWidth(), carBody.getLength());
	}

}
