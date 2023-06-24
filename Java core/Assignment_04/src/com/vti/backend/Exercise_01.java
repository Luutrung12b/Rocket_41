package com.vti.backend;

import com.vti.enity.Department;

public class Exercise_01 {
	public void question_01() {
		//khoi tao khong co tham so
		 Department department1 = new Department();
	        System.out.println("Id: " + department1.getId());
	        System.out.println("Name: " + department1.getName());
	        
	        // khoi tao voi tham so IT
	        
	        Department department2 = new Department("IT");
	        System.out.println("Id: " + department2.getId());
	        System.out.println("Name: " + department2.getName());
	}
	
	public void question_02() {
		
	}
	
}
