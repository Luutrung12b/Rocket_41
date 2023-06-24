package com.vti.enity;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

//import com.vti.entity.News;





public class Program_01 {
	private Scanner sc;
	private List<News> newsList;

public Program_01() {
	sc = new Scanner(System.in); 
	newsList = new ArrayList<News>(); 
	
	}
public void myNews() {
	while(true) {
		System.out.println("Please choose the function");
		System.out.println("1 : Insert News");
		System.out.println("2 : View list News");
		System.out.println("3 : Evaluate everage value");
		System.out.println("4 : Finish");
		
		int selectNum = sc.nextInt();
		switch(selectNum) {
		case 1 : insertNews();
		break;
		case 2 : View();
		break;
		case 3 : averageRate();
		break;
		case 4:
			sc.close();
		default:
		System.out.println("moi nhap lai");
		break;
		
		
		
		}
		
	
		
	}
}
private void averageRate() {
	for(News newItem : newsList) {
		newItem.Calculate();
	}
	System.out.println("Đánh giá xong!");
	
}
private void insertNews() {
	sc.nextLine();
	System.out.println("insert Title");
	String title = sc.nextLine();
	System.out.println("insert publish day");
	String publishDate = sc.nextLine();
	System.out.println("Insert author's name");
	String author = sc.nextLine();
	System.out.println("Insert content");
	String content = sc.nextLine();
	
	
	System.out.println("Insert the first comment");
	int rate1 = sc.nextInt();
	System.out.println("Insert the second comment");
	int rate2 = sc.nextInt();
	System.out.println("Insert the third comment");
	int rate3 = sc.nextInt();
	
	
	List<Integer> rateNumberList = new ArrayList<Integer>();
	rateNumberList.add(Integer.valueOf(rate1));
	rateNumberList.add(Integer.valueOf(rate2));
	rateNumberList.add(Integer.valueOf(rate3));
	
	
	News news = new News(newsList.size() + 1, title, publishDate, author, content, rateNumberList);
	newsList.add(news);
	System.out.println("News was added : ");
	System.out.println(news);
	
	}
private void View() {
	for(News newItem : newsList) {
		newItem.Display();
	}
	
	
	
}









}

