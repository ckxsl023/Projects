package com.gabriel.mvc.shapeimpl;

import java.awt.Graphics;

import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Renderer;

public class TruckGateRenderer implements Renderer {

	@Override
	public void draw(Object context, MyShape shape) {
		Graphics g = (Graphics) context;
		TruckGate truckGate = (TruckGate) shape;
		g.drawRect(truckGate.getLocation().getX(),truckGate.getLocation().getY(),truckGate.getWidth(), truckGate.getLength());
		
	}

}
