package com.gabriel.mvc.shapeimpl;

import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Renderer;

public class CarRenderer implements Renderer {

	@Override
	public void draw(Object context, MyShape shape) {
		Car car = (Car)shape;
		CarBody carBody = car.getBody();
		CarBodyRenderer carBodyRenderer = new CarBodyRenderer();
		carBodyRenderer.draw(context, carBody);
		TruckFront truckFront = car.getFrontbody();
		TruckFrontRenderer truckFrontRenderer = new TruckFrontRenderer();
		truckFrontRenderer.draw(context, truckFront);
		TruckWindow truckWindow = car.getTruckWindow();
		TruckWindowRenderer truckWindowRenderer = new TruckWindowRenderer();
		truckWindowRenderer.draw(context, truckWindow);
		TruckGate truckGate = car.getTruckGate();
		TruckGateRenderer truckGateRenderer = new TruckGateRenderer();
		truckGateRenderer.draw(context, truckGate);
		Wheel frontWheel = car.getFrontWheel();
		WheelRenderer wheelRenderer = new WheelRenderer();
		wheelRenderer.draw(context, frontWheel);
		Wheel backWheel = car.getBackWheel();
		wheelRenderer.draw(context, backWheel);
		Wheel truckWheel = car.getTruckWheel();
		wheelRenderer.draw(context, truckWheel);
	}

}
