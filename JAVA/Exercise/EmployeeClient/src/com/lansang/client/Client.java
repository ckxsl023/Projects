package com.lansang.client;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import com.lansang.employee.fx.Employee;
import com.lansang.employee.fx.EmployeeFx;

public class Client {
	
	public static void main(String[] args) throws MalformedURLException {
		URL url = new URL("http://localhost:8001/employee?wsdl");
		QName qname=new QName("http://impl.employee.lansang.com/", "EmployeeImplService");
		Service service =Service.create(url, qname);
		
		EmployeeFx employee = service.getPort(EmployeeFx.class);
		
		Employee emp = new Employee();
		emp.setId("1");
		emp.setName("Paul");
		emp.setEmployeeNumber("11111");
		employee.createEmployee(emp);
		
		emp = new Employee();
		emp.setId("2");
		emp.setName("Paulina");
		emp.setEmployeeNumber("22222");
		employee.createEmployee(emp);
		
		System.out.println(employee.getEmployeeDetails("1").getName() + " " + employee.getEmployeeDetails("1").getEmployeeNumber());
		System.out.println(employee.getEmployeeDetails("2").getName() + " " + employee.getEmployeeDetails("2").getEmployeeNumber());	
	}

}

