package com.lansang.client4;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import com.lansang.operator.fx.JaxOperatorService;

public class Client4 {

	public static void main(String[] args) throws MalformedURLException {
		URL url = new URL("http://localhost:8008/compute?wsdl");
		QName qname=new QName("http://operatorimpl.lansang.com/", "OperatorServiceImplService");
		Service service =Service.create(url, qname);
		
		JaxOperatorService operator=service.getPort(JaxOperatorService.class);
		System.out.println(operator.getDifference(3, 5));
	}

}
