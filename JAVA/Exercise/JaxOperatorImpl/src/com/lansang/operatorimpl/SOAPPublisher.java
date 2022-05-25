package com.lansang.operatorimpl;

import javax.xml.ws.Endpoint;

public class SOAPPublisher {

	public static void main(String[] args) {
		Endpoint.publish("http://localhost:8008/compute", new OperatorServiceImpl());

	}

}
