package com.itbank.verlin.model;


public class AddressDataDTO {
    private int     ADDRESS_UID;
    private String  ADDRESS_NAME,
                    ADDRESS_RECIPIENT,
                    ADDRESS_INFO,
                    ADDRESS_DETAIL,
                    ADDRESS_POST,
                    ADDRESS_HPHONE,
                    ADDRESS_MPHONE,
                    ADDRESS_FIX;
	public int getADDRESS_UID() {
		return ADDRESS_UID;
	}
	public void setADDRESS_UID(int aDDRESS_UID) {
		ADDRESS_UID = aDDRESS_UID;
	}
	public String getADDRESS_NAME() {
		return ADDRESS_NAME;
	}
	public void setADDRESS_NAME(String aDDRESS_NAME) {
		ADDRESS_NAME = aDDRESS_NAME;
	}
	public String getADDRESS_RECIPIENT() {
		return ADDRESS_RECIPIENT;
	}
	public void setADDRESS_RECIPIENT(String aDDRESS_RECIPIENT) {
		ADDRESS_RECIPIENT = aDDRESS_RECIPIENT;
	}
	public String getADDRESS_INFO() {
		return ADDRESS_INFO;
	}
	public void setADDRESS_INFO(String aDDRESS_INFO) {
		ADDRESS_INFO = aDDRESS_INFO;
	}
	public String getADDRESS_DETAIL() {
		return ADDRESS_DETAIL;
	}
	public void setADDRESS_DETAIL(String aDDRESS_DETAIL) {
		ADDRESS_DETAIL = aDDRESS_DETAIL;
	}
	public String getADDRESS_POST() {
		return ADDRESS_POST;
	}
	public void setADDRESS_POST(String aDDRESS_POST) {
		ADDRESS_POST = aDDRESS_POST;
	}
	public String getADDRESS_HPHONE() {
		return ADDRESS_HPHONE;
	}
	public void setADDRESS_HPHONE(String aDDRESS_HPHONE) {
		ADDRESS_HPHONE = aDDRESS_HPHONE;
	}
	public String getADDRESS_MPHONE() {
		return ADDRESS_MPHONE;
	}
	public void setADDRESS_MPHONE(String aDDRESS_MPHONE) {
		ADDRESS_MPHONE = aDDRESS_MPHONE;
	}
	public String getADDRESS_FIX() {
		return ADDRESS_FIX;
	}
	public void setADDRESS_FIX(String aDDRESS_FIX) {
		ADDRESS_FIX = aDDRESS_FIX;
	}
}
