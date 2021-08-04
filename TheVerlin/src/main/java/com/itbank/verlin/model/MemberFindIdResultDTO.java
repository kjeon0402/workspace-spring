package com.itbank.verlin.model;



public class MemberFindIdResultDTO {
    public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_RDATE() {
		return MEMBER_RDATE;
	}
	public void setMEMBER_RDATE(String mEMBER_RDATE) {
		MEMBER_RDATE = mEMBER_RDATE;
	}
	public int getMEMBER_LEVEL() {
		return MEMBER_LEVEL;
	}
	public void setMEMBER_LEVEL(int mEMBER_LEVEL) {
		MEMBER_LEVEL = mEMBER_LEVEL;
	}
	String  MEMBER_NAME,
            MEMBER_ID,
            MEMBER_RDATE;
    int     MEMBER_LEVEL;

}
