package com.gabriel.mvc.app;

import java.awt.Color;
import java.awt.Graphics;

import javax.swing.JFrame;

import com.gabriel.mvc.shapeimpl.CarRenderer;
import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Renderer;

public class CarView extends JFrame {
	MyShape car;
	Renderer renderer = new CarRenderer();
	void init(MyShape car) {
		this.car = car;
	}
	void initUI() {		
		setLayout(null);
		setVisible(true);
		setSize(500,500);
	}
	
	public void paint(Graphics g)
	{
		g.clearRect(0,0,600,600);
		renderer.draw(g, car);
	}
}
