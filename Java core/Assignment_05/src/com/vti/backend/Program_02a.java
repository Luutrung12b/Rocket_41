package com.vti.backend;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

import com.vti.enity.Student;

public class Program_02a {
	private List<Student> studentList;
	private Scanner sc;

	public Program_02a() {
		sc = new Scanner(System.in);
		studentList = new ArrayList<Student>();

	}

	public void question01() {
		while (true) {
			System.out.println("Choose function");
			System.out.println("1. Create 10 students and devide them into 3 groups");
			System.out.println("2. Everyone Assemble.");
			System.out.println("3. Ask Group1 to learn");
			System.out.println("4. Ask Group2 to clean");
			System.out.println("5. Print Student list");
			System.out.println("6. Exit program");
			int selectNum = sc.nextInt();
			switch (selectNum) {
			case 1:
				createListStudent();
				break;
			case 2:
				caLopDiemDanh();
				break;
			case 3:
				goiNhom1HocBai();
				break;
			case 4:
				goiNhom2DonVeSinh();
				break;
			case 5:
				inDanhSachHocSinh();
				break;
			case 6:
				System.out.println("Program ends here !");
				sc.close();
				return;
			default:
				System.out.println("Please choose the correct number");
				break;
			}
		}

	}

	public void createListStudent() {

		List<String> nameList = new ArrayList<String>();
		// tạo mảng tên sinh viên
		nameList.add("Leopart 2A6");
		nameList.add("M1 Abrams");
		nameList.add("Type 99");
		nameList.add("K2 Black Panther");
		nameList.add("Challenge");
		nameList.add("T14 Armata");
		nameList.add("T90 S");
		nameList.add("T80U");
		nameList.add("BMP Terminator");
		nameList.add("T72 B3");

		for (String name : nameList) {
			Random random = new Random();
			int group = random.nextInt(3) + 1;
			Student student = new Student(studentList.size() + 1, "Main battle tank " + name, group);
			studentList.add(student);
		}
	}

	public void caLopDiemDanh() {
		for (Student student : studentList) {
			student.diemDanh();
		}
	}

	public void goiNhom1HocBai() {
		boolean isCheck = false;
		for (Student student : studentList) {
			if (student.getGroup() == 1) {
				student.hocBai();
				isCheck = true;
			}
		}
		if (isCheck == false) {
			System.out.println("Nobody be in Group 1");
		}
	}

	public void goiNhom2DonVeSinh() {
		boolean isCheck = false;
		for (Student student : studentList) {
			if (student.getGroup() == 2) {
				student.diDonVeSinh();
				isCheck = true;
			}
		}
		if (isCheck == false) {
			System.out.println("Nobody be in Group 2");
		}
	}

	public void inDanhSachHocSinh() {
		for (Student student : studentList) {
			System.out.println(student);
		}
	}

}
