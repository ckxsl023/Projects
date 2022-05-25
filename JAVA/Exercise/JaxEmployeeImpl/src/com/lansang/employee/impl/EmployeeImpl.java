package com.lansang.employee.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.jws.WebService;

import com.lansang.employee.fx.Employee;
import com.lansang.employee.fx.EmployeeFx;

@WebService (endpointInterface="com.lansang.employee.fx.EmployeeFx")
public class EmployeeImpl implements EmployeeFx{
	Map <String,Employee> employees = new HashMap<String,Employee>();
		
	@Override
	public Employee getEmployeeDetails(String id) {
		if(employees.containsKey(id))
			return employees.get(id);
		return new Employee();
	}

	@Override
	public String createEmployee(Employee employee) {
                try{
		        employees.put(employee.getId(), employee);
                        return "success";
                }catch(Exception exc){
			return "failed";
		}		
	}
	
	@Override
	public String removeEmployee(Employee employee) {
		for(int x = 0; x < employees.size(); x++)
		{
			if(employees.containsKey(employee.getId())) {
				employees.remove(employee.getId());
			}
			else
			{
				return "Employee does not exist.";
			}
			System.out.println("Employee Data has been succesfully changed.");
		} return "Employee has been removed.";
	}
	
	@Override
	public String updateEmployee(Employee employee) {
		try{
	        employees.put(employee.getId(), employee);
                    return "success";
            }catch(Exception exc){
		return "failed";
	}		
}
	

	@Override
	public Employee [] getAllEmployees() {
		ArrayList<Employee> emps = new  ArrayList<Employee>();
		Employee emp=null;
		
		for(Map.Entry<String, Employee> e : employees.entrySet())
		{
			emp=new Employee();
			emp.setId(e.getKey());
			emp.setName(e.getValue().getName());
			emps.add(emp);
		}
		return  (Employee []) emps.toArray(new Employee[emps.size()]);
	}
}