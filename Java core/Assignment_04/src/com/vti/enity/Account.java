package com.vti.enity;

import java.time.LocalDateTime;
import java.util.Date;

public class Account {
	
	private int id ;
	private String firstName;
	private String lastName;
	private String fullName;
	private String email;
	public String userName;
	private Position position;
	private LocalDateTime createDate;
	// Khong co Parameter
	public Account() {
		
		
	}
	
	// Có các parameter là id, Email, Username, FirstName, LastName (với FullName = FirstName + LastName)
	
	public Account(int id, String firstName , String lastName, String fullName) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.fullName = firstName + " " + lastName;
	}
	
	//Có các parameter là id, Email, Username, FirstName, LastName (với FullName = FirstName + LastName) 
	//và Position của User, default createDate = now
	
	public Account(int id, String email, String username, String firstName, String lastName, Position position) {
        this.id = id;
        this.email = email;
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = firstName + " " + lastName;
        this.position = position;
        this.createDate = LocalDateTime.now();
    }
	
	//Có các parameter là id, Email, Username, FirstName,
	//LastName (với FullName = FirstName + LastName) và
	//Position của User, createDate
	 public Account(int id, String email, String username, String firstName, String lastName, Position position, LocalDateTime createDate) {
	        this.id = id;
	        this.email = email;
	        this.userName = userName;
	        this.firstName = firstName;
	        this.lastName = lastName;
	        this.fullName = firstName + " " + lastName;
	        this.position = position;
	        this.createDate = createDate;
	    }

	 //Khoi tao object
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	
	
	
	
	@Override
	public String toString() {
		return "Account [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", fullName=" + fullName
				+ ", email=" + email + ", userName=" + userName + ", position=" + position + ", createDate="
				+ createDate + "]";
	}

	
	 
	 

	}
	
	 

