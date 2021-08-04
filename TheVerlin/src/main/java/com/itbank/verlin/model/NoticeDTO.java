package com.itbank.verlin.model;

public class NoticeDTO {

	private int member_uid, notice_idx;
	private String rdate, member_id, content, deleted, title;
	
	public int getMember_uid() {
		return member_uid;
	}
	public void setMember_uid(int member_uid) {
		this.member_uid = member_uid;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
