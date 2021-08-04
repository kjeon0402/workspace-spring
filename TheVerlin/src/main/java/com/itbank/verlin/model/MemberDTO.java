package com.itbank.verlin.model;

import lombok.*;


public class MemberDTO {
    private int     MEMBER_UID;
    private String  MEMBER_NAME,
                    MEMBER_PHONE,
                    MEMBER_EMAIL,
                    MEMBER_POST,
                    MEMBER_ADDRESS_INFO,
                    MEMBER_ADDRESS_DETAIL,
                    MEMBER_RDATE,
                    MEMBER_DELETED;
	public int getMEMBER_UID() {
		return MEMBER_UID;
	}
	public void setMEMBER_UID(int mEMBER_UID) {
		MEMBER_UID = mEMBER_UID;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getMEMBER_PHONE() {
		return MEMBER_PHONE;
	}
	public void setMEMBER_PHONE(String mEMBER_PHONE) {
		MEMBER_PHONE = mEMBER_PHONE;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}
	public String getMEMBER_POST() {
		return MEMBER_POST;
	}
	public void setMEMBER_POST(String mEMBER_POST) {
		MEMBER_POST = mEMBER_POST;
	}
	public String getMEMBER_ADDRESS_INFO() {
		return MEMBER_ADDRESS_INFO;
	}
	public void setMEMBER_ADDRESS_INFO(String mEMBER_ADDRESS_INFO) {
		MEMBER_ADDRESS_INFO = mEMBER_ADDRESS_INFO;
	}
	public String getMEMBER_ADDRESS_DETAIL() {
		return MEMBER_ADDRESS_DETAIL;
	}
	public void setMEMBER_ADDRESS_DETAIL(String mEMBER_ADDRESS_DETAIL) {
		MEMBER_ADDRESS_DETAIL = mEMBER_ADDRESS_DETAIL;
	}
	public String getMEMBER_RDATE() {
		return MEMBER_RDATE;
	}
	public void setMEMBER_RDATE(String mEMBER_RDATE) {
		MEMBER_RDATE = mEMBER_RDATE;
	}
	public String getMEMBER_DELETED() {
		return MEMBER_DELETED;
	}
	public void setMEMBER_DELETED(String mEMBER_DELETED) {
		MEMBER_DELETED = mEMBER_DELETED;
	}
}
