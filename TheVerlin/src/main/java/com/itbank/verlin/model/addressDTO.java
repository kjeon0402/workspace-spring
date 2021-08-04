package com.itbank.verlin.model;
//MEMBER_UID	NUMBER	No		1	
//ADDRESS_NAME	VARCHAR2(20 BYTE)	No		2	
//ADDRESS_RECIPIENT	VARCHAR2(20 BYTE)	No		3	
//ADDRESS_INFO	VARCHAR2(500 BYTE)	No		4	
//ADDRESS_DETAIL	VARCHAR2(300 BYTE)	Yes		5	
//ADDRESS_POST	VARCHAR2(20 BYTE)	No		6	
//ADDRESS_HPHONE	VARCHAR2(20 BYTE)	Yes		7	
//ADDRESS_MPHONE	VARCHAR2(20 BYTE)	No		8	
public class addressDTO {
	
	private int member_uid,address_index;
	private String address_name,address_recipient,address_info,address_detail,address_post,address_hphone,address_mphone;
	
	
	
	public int getMember_uid() {
		return member_uid;
	}
	public void setMember_uid(int member_uid) {
		this.member_uid = member_uid;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getAddress_recipient() {
		return address_recipient;
	}
	public void setAddress_recipient(String address_recipient) {
		this.address_recipient = address_recipient;
	}
	public String getAddress_info() {
		return address_info;
	}
	public void setAddress_info(String address_info) {
		this.address_info = address_info;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getAddress_post() {
		return address_post;
	}
	public void setAddress_post(String address_post) {
		this.address_post = address_post;
	}
	public String getAddress_hphone() {
		return address_hphone;
	}
	public void setAddress_hphone(String address_hphone) {
		this.address_hphone = address_hphone;
	}
	public String getAddress_mphone() {
		return address_mphone;
	}
	public void setAddress_mphone(String address_mphone) {
		this.address_mphone = address_mphone;
	}
	public int getAddress_index() {
		return address_index;
	}
	public void setAddress_index(int address_index) {
		this.address_index = address_index;
	}
	
	
}
