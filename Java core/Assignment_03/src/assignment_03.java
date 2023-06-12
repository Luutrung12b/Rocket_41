import java.util.Scanner;

public class assignment_03 {

	public static void main(String[] args) {
		
		// ques1les4();
		// ques2Les4();
		// ques4les4();
		// ques3Les4();
		//ques5les4();
		//ques6les4();
		//ques8les4();
		//ques9les4();
	}

	public static void ques1les4() {
		String s1;
		Scanner scanner = new Scanner(System.in);
		System.out.println("nhap chuoi ky tu: ");
		s1 = scanner.nextLine();
		String[] words = s1.split(" ");
		System.out.println("so ky tu: " + words.length);
		scanner.close();
	}

	public static void ques2Les4() {
		Scanner scanner1 = new Scanner(System.in);
		System.out.println("Nhap vao xau s1");
		String s1 = scanner1.nextLine();

		Scanner scanner2 = new Scanner(System.in);
		System.out.println("Nhap vao xau s2");
		String s2 = scanner2.nextLine();

		System.out.println("Xau sau khi duoc ghep la : " + s2 + " " + s1);

	}

	public static void ques3Les4() {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhap vao ten: ");
		String ten = scanner.nextLine();

		System.out.println("ten truoc khi sua: " + ten);
		String tenCuoi = ten.substring(0, 1).toUpperCase() + ten.substring(1).toLowerCase();
		System.out.println("ten truoc sau sua: " + tenCuoi);

	}

	

	public static void ques4les4() {
		Scanner scanner = new Scanner(System.in);

		System.out.print("ten ban la: ");
		String name = scanner.nextLine();

		for (int i = 1; i < name.length(); i++) {
			char character = name.charAt(i);
			System.out.println("ky tu thu " + i + " là: " + character);
		}

	}
	
	
	public static void ques5les4() {
		Scanner scanner = new Scanner(System.in);

        System.out.print("ten ho ban la gi ");
        String lastName = scanner.nextLine();

        System.out.print("ten ban la gi: ");
        String firstName = scanner.nextLine();

      
        System.out.println("ten day du cua ban la: "+lastName + " " + firstName);
	}
	public static void ques6les4() {
		String fullName;
		String lastName = "", middleName = "", firstName = "";
		Scanner scanner = new Scanner(System.in);
		System.out.println("Nhập họ tên đầy đủ:");
		fullName = scanner.nextLine();
		// Chuẩn hóa xâu
		fullName = fullName.trim();
		String[] words = fullName.split(" ");
		lastName = words[0];
		firstName = words[words.length - 1];
		for (int i = 1; i <= words.length - 2; i++) {
		middleName += words[i] + " ";
		}
		System.out.println("Họ là: " + lastName);
		System.out.println("Tên đệm là: " + middleName);
		System.out.println("Tên là: " + firstName);
		scanner.close();
		}
	
	public static void ques8les4() {
		String[] groups = {
				"Java co ban",
				"Java nang cao",
				"Tieng nhat",
				"Java advanced"
				
		};
        String keyword = "Java";

        for (String group : groups) {
            if (group.contains(keyword)) {
                System.out.println(group);
            }
        }
	}
	
	public static void ques9les4() {
		 String[] groups = {
				 "Java", 
				 "Python", 
				 "Javascript", 
				 "Kotlin"};
	        String keyword = "Java";

	        for (String group : groups) {
	            if (group.equals(keyword)) {
	                System.out.println(group);
	            }
	        }
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
