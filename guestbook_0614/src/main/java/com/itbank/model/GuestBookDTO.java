package com.itbank.model;

//IDX     NOT NULL NUMBER         
//WRITER  NOT NULL VARCHAR2(100)  
//CONTENT NOT NULL VARCHAR2(2000) 
//WDATE            VARCHAR2(100)  
public class GuestBookDTO {

	private int idx;
	private String writer, content, wdate;
	
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
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
}
