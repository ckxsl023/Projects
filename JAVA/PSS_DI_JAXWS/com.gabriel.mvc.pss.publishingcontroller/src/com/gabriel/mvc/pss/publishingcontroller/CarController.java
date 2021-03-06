package com.gabriel.mvc.pss.publishingcontroller;

import javax.swing.JFrame;

import com.gabriel.pss.pssfx.Message;
import com.gabriel.pss.pssfx.Messenger;
import com.gabriel.pss.psswsimpl.MessengerImpl;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;

public class CarController extends JFrame implements ActionListener{
	String subscriberName = "carview";
	JButton btnRight = new JButton("Right");
	JButton btnLeft = new JButton("Left");
	JButton btnUp = new JButton("Up");
	JButton btnDown= new JButton("Down");
	JButton btnFaster= new JButton("Faster");
	JButton btnSlower= new JButton("Slower");
	JButton btnPark= new JButton("Park");
	
	
	Messenger  messenger; 
	
	public void init() {
		try {
			messenger = new MessengerImpl();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}					
	}
	
	
	public void initUI() {
		btnRight.setBounds(220,110,100,100);
		btnLeft.setBounds(10,110,100,100);
		btnUp.setBounds(115,5,100,100);
		btnDown.setBounds(115,215,100,100);
		btnFaster.setBounds(325,70,100,100);
		btnSlower.setBounds(325,180,100,100);
		btnPark.setBounds(115,110,100,100);
		
		add(btnRight);
		add(btnLeft);
		add(btnUp);
		add(btnDown);
		add(btnFaster);
		add(btnSlower);
		add(btnPark);
		
		btnRight.addActionListener(this);
		btnLeft.addActionListener(this);
		btnUp.addActionListener(this);
		btnDown.addActionListener(this);
		btnFaster.addActionListener(this);
		btnSlower.addActionListener(this);
		btnPark.addActionListener(this);
		
		setLayout(null);
		setVisible(true);
		setBounds(500,10,500,500);
	}


	@Override
	public void actionPerformed(ActionEvent e) {
		try {			
			Message message = new Message();
			message.setTopic(subscriberName);
			if(e.getSource() == btnRight)
			{
				message.setPayload("Right");
					messenger.publish(message);
			}
			else if(e.getSource() == btnLeft)
			{
				message.setPayload("Left");
				messenger.publish(message);
			}
			else if(e.getSource() == btnUp)
			{
				message.setPayload("Up");
				messenger.publish(message);
			}
			else if(e.getSource() == btnDown)
			{
				message.setPayload("Down");
				messenger.publish(message);
			}			
			else if(e.getSource() == btnFaster)
			{
				message.setPayload("Faster");
				messenger.publish(message);
			}			
			else if(e.getSource() == btnSlower)
			{
				message.setPayload("Slower");
				messenger.publish(message);
			}	
			else if(e.getSource() == btnPark)
			{
				message.setPayload("Park");
				messenger.publish(message);
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}

