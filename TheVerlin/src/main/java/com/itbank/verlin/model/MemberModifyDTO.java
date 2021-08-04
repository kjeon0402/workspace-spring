package com.itbank.verlin.model;


public class MemberModifyDTO {
	
    @Override
	public String toString() {
		return "MemberModifyDTO [MEMBER_UID=" + MEMBER_UID + ", MEMBER_ID=" + MEMBER_ID + ", MEMBER_PW=" + MEMBER_PW
				+ ", MEMBER_NAME=" + MEMBER_NAME + ", MEMBER_PHONE=" + MEMBER_PHONE + ", MEMBER_EMAIL=" + MEMBER_EMAIL
				+ ", MEMBER_POST=" + MEMBER_POST + ", MEMBER_ADDRESS_INFO=" + MEMBER_ADDRESS_INFO
				+ ", MEMBER_ADDRESS_DETAIL=" + MEMBER_ADDRESS_DETAIL + ", MEMBER_EMAIL_CHECK=" + MEMBER_EMAIL_CHECK
				+ ", MEMBER_ACCOUNT_NUMBER=" + MEMBER_ACCOUNT_NUMBER + ", MEMBER_POINT=" + MEMBER_POINT
				+ ", MEMBER_ACCOUNT_BANK=" + MEMBER_ACCOUNT_BANK + "]";
	}
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
	public String getMEMBER_EMAIL_CHECK() {
		return MEMBER_EMAIL_CHECK;
	}
	public void setMEMBER_EMAIL_CHECK(String mEMBER_EMAIL_CHECK) {
		MEMBER_EMAIL_CHECK = mEMBER_EMAIL_CHECK;
	}
	public String getMEMBER_ACCOUNT_NUMBER() {
		return MEMBER_ACCOUNT_NUMBER;
	}
	public void setMEMBER_ACCOUNT_NUMBER(String mEMBER_ACCOUNT_NUMBER) {
		MEMBER_ACCOUNT_NUMBER = mEMBER_ACCOUNT_NUMBER;
	}
	public String getMEMBER_POINT() {
		return MEMBER_POINT;
	}
	public void setMEMBER_POINT(String mEMBER_POINT) {
		MEMBER_POINT = mEMBER_POINT;
	}
	public String getMEMBER_ACCOUNT_BANK() {
		return MEMBER_ACCOUNT_BANK;
	}
	public void setMEMBER_ACCOUNT_BANK(String mEMBER_ACCOUNT_BANK) {
		MEMBER_ACCOUNT_BANK = mEMBER_ACCOUNT_BANK;
	}
	private int     MEMBER_UID;
    private String  MEMBER_ID,
                    MEMBER_PW,
                    MEMBER_NAME,
                    MEMBER_PHONE,
                    MEMBER_EMAIL,
                    MEMBER_POST,
                    MEMBER_ADDRESS_INFO,
                    MEMBER_ADDRESS_DETAIL,
                    MEMBER_EMAIL_CHECK,
                    MEMBER_ACCOUNT_NUMBER,
                    MEMBER_POINT,
                    MEMBER_ACCOUNT_BANK;

}
