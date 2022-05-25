package com.gabriel.mvc.shapeimpl;
import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Location;

public class TruckWindow implements MyShape {
	
	Location location;
	int length;
	int width;

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

		
	@Override
	public Location getLocation() {
		return location;
	}

	@Override
	public void setLocation(Location location) {
		this.location = location;
		
	}

}
