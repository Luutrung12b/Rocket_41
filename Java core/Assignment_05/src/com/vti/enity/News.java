package com.vti.enity;

import java.util.List;


public class News implements INews {
	private int id;
	private String title;
	private String publishDate;
	private String author;
	private String content;

	private float averageRate;
	
	private List<Integer> rateNumberList; // 1,2,3 

	public News() {

	}

	public News(int id, String title, String publishDate, String author, String content, List<Integer> rateNumberList) {
		super();
		this.id = id;
		this.title = title;
		this.publishDate = publishDate;
		this.author = author;
		this.content = content;
		this.rateNumberList = rateNumberList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getAverageRate() {
		return averageRate;
	}

	public void setAverageRate(float averageRate) {
		this.averageRate = averageRate;
	}

	public List<Integer> getRateNumberList() {
		return rateNumberList;
	}

	public void setRateNumberList(List<Integer> rateNumberList) {
		this.rateNumberList = rateNumberList;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", publishDate=" + publishDate + ", author=" + author
				+ ", content=" + content + ", averageRate=" + averageRate + ", rateNumberList=" + rateNumberList + "]";
	}

	
	@Override
	public void Display() {
		System.out.println("Title = " + this.title + ", PublishDate = " + this.publishDate + ", Author = " + this.author
				+ ", Content = " + this.content + ", AverageRate = " + this.averageRate);
	}

	
	@Override
	public float Calculate() {
		if (this.rateNumberList != null) {
			this.averageRate = (this.rateNumberList.get(0) + this.rateNumberList.get(1) + this.rateNumberList.get(2))/ 3;;
			return this.averageRate;
		}
		return 0;
	}

}
