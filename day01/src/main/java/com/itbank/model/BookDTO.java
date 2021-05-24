package com.itbank.model;

//	TITLE     NOT NULL VARCHAR2(200) 
//	AUTHOR    NOT NULL VARCHAR2(200) 
//	PUBLISHER NOT NULL VARCHAR2(200) 
//	PBDAY              VARCHAR2(200) 
//	COUNT              NUMBER        
//	NUM       NOT NULL NUMBER

public class BookDTO {
	
	private String title, author, publisher;
	private String pbday;
	private int count, num;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPbday() {
		return pbday;
	}
	public void setPbday(String pbday) {
		this.pbday = pbday;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
