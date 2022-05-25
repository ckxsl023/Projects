package com.gabriel.mvc.shapeimpl;

import java.awt.Graphics;

import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Renderer;

public class TruckWindowRenderer implements Renderer {

	@Override
	public void draw(Object context, MyShape shape) {
		Graphics g = (Graphics) context;
		TruckWindow truckWindow = (TruckWindow) shape;
		g.drawRect(truckWindow.getLocation().getX(),truckWindow.getLocation().getY(),truckWindow.getWidth(), truckWindow.getLength());
	}

}
