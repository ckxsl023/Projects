package com.gabriel.mvc.shapeimpl;

import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Location;
import com.gabriel.mvc.shapesfx.Mover;

public class CarMover extends Mover{
	public void move(MyShape shape, Location changeLocation)
	{
		Car car = (Car)shape;
		super.move(car, changeLocation);
		CarBody body = car.getBody();
		TruckFront truckfront = car.getFrontbody();
		TruckWindow truckWindow = car.getTruckWindow();
		TruckGate truckGate = car.getTruckGate();
		Mover mover = new Mover();
		mover.move(truckGate, changeLocation);
		mover.move(truckWindow, changeLocation);
		mover.move(truckfront, changeLocation);
		mover.move(body, changeLocation);
		Wheel front = car.getFrontWheel();
		mover.move(front, changeLocation);
		Wheel truck = car.getTruckWheel();
		mover.move(truck, changeLocation);
		Wheel back = car.getBackWheel();
		mover.move(back, changeLocation);					
	}
}
