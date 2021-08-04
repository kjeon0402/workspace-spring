package com.itbank.verlin.model;

//MEMBER_UID	NUMBER	No
//MEMBER_NAME	VARCHAR2(100 BYTE)	No
//MEMBER_HPHONE	VARCHAR2(20 BYTE)	Yes
//MEMBER_MPHONE	VARCHAR2(20 BYTE)	No
//MEMBER_EMAIL	VARCHAR2(100 BYTE)	No
//MEMBER_POST	VARCHAR2(20 BYTE)	No
//MEMBER_ADDRESS_INFO	VARCHAR2(500 BYTE)	No
//MEMBER_ADDRESS_DETAIL	VARCHAR2(300 BYTE)	Yes
//MEMBER_RDATE	VARCHAR2(20 BYTE)	No
//MEMBER_DELETED	CHAR(1 BYTE)	Yes
public class MemberTestDTO {
	
	private int member_uid;
	private String member_name, member_hphone, member_mphone, member_email, member_post,
	member_address_info, member_address_detail, member_rdate, member_deleted;
	public int getMember_uid() {
		return member_uid;
	}
	public void setMember_uid(int member_uid) {
		this.member_uid = member_uid;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_hphone() {
		return member_hphone;
	}
	public void setMember_hphone(String member_hphone) {
		this.member_hphone = member_hphone;
	}
	public String getMember_mphone() {
		return member_mphone;
	}
	public void setMember_mphone(String member_mphone) {
		this.member_mphone = member_mphone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_post() {
		return member_post;
	}
	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}
	public String getMember_address_info() {
		return member_address_info;
	}
	public void setMember_address_info(String member_address_info) {
		this.member_address_info = member_address_info;
	}
	public String getMember_address_detail() {
		return member_address_detail;
	}
	public void setMember_address_detail(String member_address_detail) {
		this.member_address_detail = member_address_detail;
	}
	public String getMember_rdate() {
		return member_rdate;
	}
	public void setMember_rdate(String member_rdate) {
		this.member_rdate = member_rdate;
	}
	public String getMember_deleted() {
		return member_deleted;
	}
	public void setMember_deleted(String member_deleted) {
		this.member_deleted = member_deleted;
	}
	
	
}
