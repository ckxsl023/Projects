package com.gabriel.mvc.shapeimpl;
import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Location;

public class Car implements MyShape{
	
	CarBody body;
	Wheel truckWheel;
	Wheel frontWheel;
	Wheel backWheel;
	Location location;
	TruckFront frontbody;
	TruckWindow truckWindow;
	TruckGate truckGate;

	public TruckGate getTruckGate() {
		return truckGate;
	}

	public void setTruckGate(TruckGate truckGate) {
		this.truckGate = truckGate;
	}

	public TruckWindow getTruckWindow() {
		return truckWindow;
	}

	public void setTruckWindow(TruckWindow truckWindow) {
		this.truckWindow = truckWindow;
	}

	public CarBody getBody() {
		return body;
	}

	public void setBody(CarBody body) {
		this.body = body;
	}
	

	public Wheel getFrontWheel() {
		return frontWheel;
	}

	public void setFrontWheel(Wheel frontWheel) {
		this.frontWheel = frontWheel;
	}

	public Wheel getBackWheel() {
		return backWheel;
	}

	public void setBackWheel(Wheel backWheel) {
		this.backWheel = backWheel;
	}
	
	public Wheel getTruckWheel() {
		return truckWheel;
	}

	public void setTruckWheel(Wheel truckWheel) {
		this.truckWheel = truckWheel;
	}

	@Override
	public Location getLocation() {
		return location;
	}

	@Override
	public void setLocation(Location location) {
		this.location = location;		
	}

	public TruckFront getFrontbody() {
		return frontbody;
	}

	public void setFrontbody(TruckFront frontbody) {
		this.frontbody = frontbody;
	}

}
