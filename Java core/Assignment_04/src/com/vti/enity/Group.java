package com.vti.enity;


import java.time.LocalDateTime;
import java.util.Arrays;

public class Group {
	private int id;
	private String name;
	private Account creator;
	private LocalDateTime createDate;
	private Account[] accounts;
	
	
	// khoi tao khong co tham so
	public Group() {
		
	}
	
	// khoi tao voi id , name, creator, createDate, account
	public Group(int id, String name , Account creator, LocalDateTime createDate, Account[] accounts) {
		this.id = id;
		this.name = name;
		this.creator = creator;
		this.accounts = accounts;
		this.createDate = createDate;
	}
	
	public Group(String groupName, Account creator, String[] usernames, LocalDateTime createDate) {
        this.name = groupName;
        this.creator = creator;
        this.createDate = createDate;
        Account[] accounts = new Account[usernames.length];
	if(usernames != null) {
			for(int i = 0; i < usernames.length; i++) {
				Account acc = new Account();
				acc.userName = usernames[i];
				accounts[i] = acc;
			}
		}
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
	public Account getCreator() {
		return creator;
	}
	public void setCreator(Account creator) {
		this.creator = creator;
	}
	public LocalDateTime getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	public Account[] getAccounts() {
		return accounts;
	}
	public void setAccounts(Account[] accounts) {
		this.accounts = accounts;
	}
	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", creator=" + creator + ", createDate=" + createDate
				+ ", accounts=" + Arrays.toString(accounts) + "]";
	}
	
	
	
	
	
	
	

}
