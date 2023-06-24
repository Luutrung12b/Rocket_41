package com.vti.enity;

public class Department {
	public int id;
	public String name;

//question 1a : khoi tao khong co tham so

	public Department() {

	}

//question 1b : khoi tao voi default id = 0 , va co 1 parameter la departmentName
	public Department(String nameDepartment) {
		this.id = 0;
		this.name = nameDepartment;
	}

// khoi tao 1 object
	public static void question1() {
		Department dep1 = new Department();
		Department dep2 = new Department();

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	

}