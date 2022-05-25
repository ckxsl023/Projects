package com.gabriel.mvc.shapeimpl;

import java.awt.Graphics;

import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Renderer;

public class TruckFrontRenderer implements Renderer {

	@Override
	public void draw(Object context, MyShape shape) {
		Graphics g = (Graphics) context;
		TruckFront truckFront = (TruckFront) shape;
		g.drawRect(truckFront.getLocation().getX(),truckFront.getLocation().getY(),truckFront.getWidth(), truckFront.getLength());
	}

}
