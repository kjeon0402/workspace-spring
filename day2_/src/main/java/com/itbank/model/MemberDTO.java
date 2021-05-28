package com.itbank.model;
//IDX      NOT NULL NUMBER        
//USERID   NOT NULL VARCHAR2(20)  
//USERPW   NOT NULL VARCHAR2(130) 
//USERNAME NOT NULL VARCHAR2(20)  
//PHONE    NOT NULL VARCHAR2(20)  
//BIRTH    NOT NULL VARCHAR2(6)   
public class MemberDTO {
 
	private int idx;
	private String userid, userpw, username, phone, birth;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
}
