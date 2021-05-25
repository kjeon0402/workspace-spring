package com.itbank.model;

//	TITLE     NOT NULL VARCHAR2(200) 
//	AUTHOR    NOT NULL VARCHAR2(200) 
//	PUBLISHER NOT NULL VARCHAR2(200) 
//	PBDAY              VARCHAR2(200) 
//	COUNT              NUMBER        

public class BookDTO {
	
	private String title, author, publisher;
	private String pbday;
	private int count, idx;
	
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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
}
