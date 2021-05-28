package com.itbank.model;
//
//IDX        NOT NULL NUMBER         
//TITLE      NOT NULL VARCHAR2(200)  
//WRITER     NOT NULL VARCHAR2(200)  
//CONTENT    NOT NULL VARCHAR2(2000) 
//WRITEDATE           VARCHAR2(20)   
//IPADDR     NOT NULL VARCHAR2(20)   
//VIEWCOUNT           NUMBER         
//UPLOADFILE          VARCHAR2(255)  
//DELETED             CHAR(1)        
public class BoardDTO {
	
	private int idx, viewCount;
	private String title, writer, content, writeDate, ipaddr, uploadFile, deleted;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
}
