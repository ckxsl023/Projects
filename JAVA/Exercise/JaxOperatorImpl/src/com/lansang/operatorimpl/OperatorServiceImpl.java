package com.lansang.operatorimpl;

import javax.jws.WebService;

import com.lansang.operator.fx.JaxOperatorService;

@WebService(endpointInterface="com.lansang.operator.fx.JaxOperatorService")
public class OperatorServiceImpl implements JaxOperatorService {

	@Override
	public double getSum(double x, double y) {
		
		return x+y;
	}

	@Override
	public double getProduct(double x, double y) {
		
		return x*y;
	}
	@Override
	public double getQuotient(double x, double y) {
		
		return x/y;
	}
	
	@Override
	public double getDifference(double x, double y) {
		
		return x-y;
	}
}
