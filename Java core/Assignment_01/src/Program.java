import java.time.LocalDate;

public class Program {
	public static void main(String[] args) {

		// create department

		department department1 = new department();
		department1.id = 1;
		department1.name = "Sales";

		department department2 = new department();
		department2.id = 2;
		department2.name = "Marketing";

		department department3 = new department();
		department3.id = 3;
		department3.name = "Developer";

		// create group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Fresher Java";

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "Fresher C#";

		Group group3 = new Group();
		group3.id = 3;
		group3.name = "Fresher PHP";

		Group[] groupOfAccount1 = { group1, group2, group3 };

		// create postition

		Position positition1 = new Position();
		positition1.id = 1;
		

		Position positition2 = new Position();
		positition2.id = 2;
		

		Position positition3 = new Position();
		positition3.id = 3;
		

		// create account

		account account1 = new account();
		account1.id = 1;
		account1.email = "Nguyenvana@gmail.com";
		account1.userName = "nguyenVan";
		account1.fullName = "Nguyen Van A";
		account1.departmentID = department1;
		account1.position = positition1;
		account1.groups = groupOfAccount1;
		Group[] groupAcc1 = { group1, group2 };
		account1.groups = groupAcc1;
	
		account1.createTime = LocalDate.now();

		account account2 = new account();
		account2.id = 2;
		account2.email = "Nguyenvanb@gmail.com";
		account2.userName = " NguyenB";
		account2.fullName = " Nguyen Van B";
		account2.departmentID = department2;
		account2.position = positition2;
		account2.groups = groupOfAccount1;
		account2.createTime = LocalDate.now();

		account account3 = new account();
		account3.id = 3;
		account3.email = "Nguyenvanc@gmail.com";
		account3.userName = "NguyenC";
		account3.fullName = "Nguyen Van C";
		account3.departmentID = department3;
		account3.position = positition1;
		account3.groups = groupOfAccount1;
		account3.createTime = LocalDate.now();

		//
		System.out.println(department1.name);
		
		System.out.println("In ra 1 số account");
		System.out.println("Account 1 : ID " + account1.id);
		System.out.println("Email : " + account1.email);
		System.out.println("Ten phong ban : " + account1.departmentID.name);
		System.out.println("user Name : " + account1.userName);
		System.out.println("Fullname: " + account1.fullName);
		System.out.println("department ID : " + account1.departmentID);
		System.out.println("-------------------------------------");
		System.out.println("Account 2 : ID " + account2.id);
		System.out.println("Email : " + account2.email);
		System.out.println("Ten phong ban : " + account2.departmentID.name);
		System.out.println("user Name : " + account2.userName);
		System.out.println("Fullname: " + account2.fullName);
		System.out.println("department ID : " + account2.departmentID);
		System.out.println("-------------------------------------");
		System.out.println("Account 3 : ID " + account3.id);
		System.out.println("Email : " + account3.email);
		System.out.println("Ten phong ban : " + account3.departmentID.name);
		System.out.println("user Name : " + account3.userName);
		System.out.println("Fullname: " + account3.fullName);
		System.out.println("department ID : " + account3.departmentID);
		System.out.println("Create time :" + account3.createTime );
		System.out.println("Group : " + account3.groups);
				
		
	}

}
