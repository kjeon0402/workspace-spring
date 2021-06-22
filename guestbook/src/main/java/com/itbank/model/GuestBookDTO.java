package com.itbank.model;

//IDX       NOT NULL NUMBER         
//WRITER    NOT NULL VARCHAR2(50)   
//CONTENT   NOT NULL VARCHAR2(1000) 
//WRITEDATE NOT NULL VARCHAR2(50)   

public class GuestBookDTO {
	
	private int idx;
	private String writer, content, writedate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
}
