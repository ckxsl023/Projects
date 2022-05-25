package com.gabriel.mvc.app;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

import com.gabriel.mvc.shapeimpl.CarMover;
import com.gabriel.mvc.shapesfx.MyShape;
import com.gabriel.mvc.shapesfx.Location;
import com.gabriel.mvc.shapesfx.Mover;

public class CarController extends JFrame implements ActionListener{
	CarView carView;  
	MyShape car;
	Mover mover = new CarMover();
	JButton btnRight = new JButton("Right");
	JButton btnLeft = new JButton("Left");
	JButton btnUp = new JButton("Up");
	JButton btnDown= new JButton("Down");
	
	public void init(MyShape car, CarView carView ) {
		this.car = car;
		this.carView = carView;
	}
	
	
	public void initUI() {
		btnRight.setBounds(200,100,100,100);
		btnLeft.setBounds(10,100,100,100);
		btnUp.setBounds(100,10,100,100);
		btnDown.setBounds(100,200,100,100);
		
		add(btnRight);
		add(btnLeft);
		add(btnUp);
		add(btnDown);
		
		btnRight.addActionListener(this);
		btnLeft.addActionListener(this);
		btnUp.addActionListener(this);
		btnDown.addActionListener(this);
		
		setLayout(null);
		setVisible(true);
		setBounds(500,10,500,500);
	}


	@Override
	public void actionPerformed(ActionEvent e) {
		 Location changedLocation = new Location();
		if(e.getSource() == btnRight)
		{
			 changedLocation.setX(10);
			 changedLocation.setY(0);
			 mover.move(car, changedLocation);			 
			 carView.repaint();
		}
		else if(e.getSource() == btnLeft)
		{
			 changedLocation.setX(-10);
			 changedLocation.setY(0);
			 mover.move(car, changedLocation);			
			 carView.repaint();
		}
		else if(e.getSource() == btnUp)
		{
			 changedLocation.setX(0);
			 changedLocation.setY(-10);
			 mover.move(car, changedLocation);			
			 carView.repaint();
		}
		else if(e.getSource() == btnDown)
		{
			 changedLocation.setX(0);
			 changedLocation.setY(10);
			 mover.move(car, changedLocation);
			 carView.repaint();
		}	
		
	}
}
