package com.itbank.verlin.model;


public class LoginDTO {
	private int MEMBER_UID;
    private String  MEMBER_ID,
                    MEMBER_PW,
                    MEMBER_DELETED;
	public int getMEMBER_UID() {
		return MEMBER_UID;
	}
	public void setMEMBER_UID(int mEMBER_UID) {
		MEMBER_UID = mEMBER_UID;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	public String getMEMBER_DELETED() {
		return MEMBER_DELETED;
	}
	public void setMEMBER_DELETED(String mEMBER_DELETED) {
		MEMBER_DELETED = mEMBER_DELETED;
	}
}
