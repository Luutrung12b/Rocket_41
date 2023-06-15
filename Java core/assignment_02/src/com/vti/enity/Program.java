package com.vti.enity;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.Random;

import com.vti.enity.Position.PositionName;

public class Program {

	public static void main(String[] args) {
		// Tạo Department
		Department dep1 = new Department();
		dep1.id = 1;
		dep1.name = "Marketing";
		Department dep2 = new Department();
		dep2.id = 2;
		dep2.name = "Sale";
		Department dep3 = new Department();
		dep3.id = 3;
		dep3.name = "BOD";
		// Tạo Position
		Position pos1 = new Position();
		pos1.id = 1;
		pos1.name = PositionName.Dev;
		Position pos2 = new Position();
		pos2.id = 2;
		pos2.name = PositionName.PM;
		Position pos3 = new Position();
		pos3.id = 3;
		pos3.name = PositionName.Scrum_Master;
		// Tạo Group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Testing System";
		group1.createDate = LocalDate.of(2021, 1, 1);
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Development";
		group2.createDate = LocalDate.of(2020, 2, 1);
		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Sale";
		group3.createDate = LocalDate.of(2019, 9, 23);
		// Tạo Account
		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "daonq1";
		acc1.userName = "daonq1";
		acc1.fullName = "Dao Nguyen 1";
		acc1.department = dep1;
		acc1.position = pos1;
		acc1.createDate = LocalDate.now();
		Group[] groupAcc1 = { group1, group2 };
		acc1.groups = groupAcc1;
		Account acc2 = new Account();
		acc2.id = 2;
		acc2.email = "daonq2";
		acc2.userName = "daonq2";
		acc2.fullName = "Dao Nguyen 2";
		acc2.department = dep2;
		acc2.position = pos2;
		acc2.createDate = LocalDate.of(2021, 03, 17);
		acc2.groups = new Group[] { group3, group2 };
		Account acc3 = new Account();
		acc3.id = 3;
		acc3.email = "daonq3";
		acc3.userName = "daonq3";
		acc3.fullName = "Dao Nguyen 3";
		acc3.department = dep3;
		acc3.position = pos3;
		acc3.createDate = LocalDate.now();
		// add Group Account
		group1.accounts = new Account[] { acc1 };
		group2.accounts = new Account[] { acc1, acc2 };
		group3.accounts = new Account[] { acc2 };

		// question 1
		System.out.println("----- question 1 -------");
		if (acc2.department == null) {
			System.out.println("nhan vien chua co phong ban");
		} else {
			System.out.println("nhan vien nay thuoc phong ban " + acc2.department.name);
		}

		System.out.println("----- question 2 -------");
		// question 2
		if (acc2.department == null) {
			System.out.println("Nhan vien nay chua co phong ban");
		}

		else {
			int countGroup = acc2.groups.length;
			if (countGroup == 1 || countGroup == 2) {
				System.out.println("nguoi nay thuoc group java fresher, C# fresher" );
				//System.out.println(acc2.groups.length);
			}
			if (countGroup == 3) {
				System.out.println("nhan vien nay la nguoi quan trong, tham gia nhieu group");
			}
			if (countGroup >= 4) {
				System.out.println("nhan vien nay la nguoi hong chuyen, tham gia tat ca cac group");
			}
		}

		//question 3 
		System.out.println("----- question 3 -------");
	 System.out.println(acc2.department == null 
			 ? "Nhan vien nay chua co phong ban." 
			 : "phong cua nhan vien nay la : " + acc2.department.name );
		
		
		//question 4 
	 System.out.println("----- question 4 -------");
	 String positionName = (acc1.position.toString() == "Dev") 
			 ? "Day la developer" 
			: "Nguoi nay khong phai la developer";
	 System.out.println(positionName);
		
		//question 5
	 System.out.println("----- question 5 -------");
	 int countAccGroup = group1.accounts.length;

	 switch (countAccGroup) {
	     case 1:
	         System.out.println( "Nhom co 1 thanh vien");
	         break;
	     case 2:
	      System.out.println("Nhom co 2 thanh vien");
	         break;
	     case 3:
	    	 System.out.println("Nhom co 3 thanh vien");
	         break;
	     default:
	    	 System.out.println("Nhom co nhieu thanh vien") ;
	         break;
	 }

	//question 6
	 System.out.println("----- question 6 -------");
	 int countGroupAcc2 = acc2.groups.length;
	 switch (countGroupAcc2) {
	 case 1 :
		 System.out.println("nguoi nay thuoc group java fresher, C# fresher");
		 break;
	
	 case 2 :
		 System.out.println("nguoi nay thuoc group java fresher, C# fresher");
		 break;
	 case 3 :
		 System.out.println("\"nhan vien nay la nguoi quan trong, tham gia nhieu group\"");
		 break;
	default:
		System.out.println("nhan vien nay la nguoi hong chuyen, tham gia tat ca cac group");
	
		 
		 
	 }
	 //question 7
	 System.out.println("-------- question 7 -----");
	 String positionName1 = acc1.position.toString()  ;
	 switch (positionName1) {
	     case "Dev" :
	    	 System.out.println ("Day la developer") ;
	         break;
	     default:
	    	 System.out.println("Nguoi nay khong phai la developer")  ;
	         break;
	 }
	
	 //question 8 
	
	 System.out.println("------------ question 8 --------------");
	 Account[] accArray = { acc1, acc2, acc3 };
	 for (Account account : accArray) {
		    String email = account.email;
		    String fullName = account.fullName;
		    String departmentName = account.department.name;

		    System.out.println("Email: " + email);
		    System.out.println("Full Name: " + fullName);
		    System.out.println("Department: " + departmentName);
		  
		}
	 //question 9 
	 System.out.println("------question 9 -------");
	 Department[] departments = {dep1, dep2, dep3};

	 for (Department department : departments) {
	     int id = department.id;
	     String name = department.name;

	     System.out.println("Department ID: " + id);
	     System.out.println("Department Name: " + name);
	     
	 }

	 
	 System.out.println("-----------question 10-------------");
	 Account[] accArray1 = { acc1, acc2, acc3 };

	 for (int i = 0; i < accArray1.length; i++) {
	     
	     

	     System.out.println("Thông tin account thứ " + (i+1) + " là:");
	     System.out.println("Email: " +accArray1[i].email);
	     System.out.println("Full Name: " + accArray1[i].fullName);
	     System.out.println("Phòng ban: " + accArray1[i].department.name);
	     System.out.println("--------------------");
	 }

	 // question 13
	 System.out.println("-------question 13------");
	
	 Account[] accArray2 = { acc1 , acc3 };

	 for (int i = 0; i < accArray2.length; i++) {
	     
	     

	     System.out.println("Thông tin account thứ " + (i+1) + " là:");
	     System.out.println("Email: " +accArray2[i].email);
	     System.out.println("Full Name: " + accArray2[i].fullName);
	     System.out.println("Phòng ban: " + accArray2[i].department.name);
	     System.out.println("--------------------");
	 }
	 
	 //question 14 
	 System.out.println("----------- question 14 ---------");
	 Account[] accounts = {acc1, acc2, acc3};

	 for (Account account : accounts) {
	     if (account.id < 4) {
	       

	         System.out.println("Email: " + account.email);
	         System.out.println("Full Name: " + account.fullName);
	         System.out.println("Phòng ban: " + account.department.name);
	         System.out.println("--------------------");
	     }
	 }

	 
	 
	 //exercise 3 question 1 
	 System.out.println("--------------exercise 3 question 1  -----------");
	 
	 
	 Exam exam1 = new Exam();
	 exam1.id = 1;
	 exam1.createDate = LocalDate.of(2023, 6, 15);

	 // dinh dang ngay kieu VN
	 DateTimeFormatter vietnameseDateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy", new Locale("vi"));

	 System.out.println("Thông tin Exam thứ 1:");
	 System.out.println("Ngày tạo: " + exam1.createDate.format(vietnameseDateFormat));
	 System.out.println("--------------------");
	 
	 //exercise 3 question 2 
	 System.out.println("----------exercise 3 question 2 -----------");



	 
	 //exercise 4 question 1
	 System.out.println("---------exercise 4 question 1-----------");
	 Random random = new Random();
     int randomNumber = random.nextInt();

     System.out.println("so ngau nhien : " + randomNumber);
	 	
     //exercise 4 question 2 
     System.out.println("----------exercise 4 question 2 ----------------");
     Random random1 = new Random();
     double randomDouble = random1.nextDouble();

     System.out.println("so thuc ngau nhien: " + randomDouble);
     
     
	 //exercise 4 question 3 
     System.out.println("exercise 4 question 3 ");
     String[] names = {"T-34", "IS-2", "Tiger", "Maus", "M4 Sherman"};

     Random random3 = new Random();
     int randomIndex = random3.nextInt(names.length);
     String randomName = names[randomIndex];

     System.out.println("ten ngau nhien: " + randomName);
	 
	 
	}
	
}
