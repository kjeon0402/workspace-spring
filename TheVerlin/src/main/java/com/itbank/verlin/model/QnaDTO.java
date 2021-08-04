package com.itbank.verlin.model;

import org.springframework.web.multipart.MultipartFile;

public class QnaDTO {

	private int member_uid, product_id, qna_idx;
	private String rdate, content, deleted, title, product_name;
	private String product_price, member_name, photo_path, category;
	private String qna_img1, qna_img2, qna_img3, qna_img4;
	private MultipartFile file1, file2, file3, file4;
	
	public int getMember_uid() {
		return member_uid;
	}
	public void setMember_uid(int member_uid) {
		this.member_uid = member_uid;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getQna_img1() {
		return qna_img1;
	}
	public void setQna_img1(String qna_img1) {
		this.qna_img1 = qna_img1;
	}
	public String getQna_img2() {
		return qna_img2;
	}
	public void setQna_img2(String qna_img2) {
		this.qna_img2 = qna_img2;
	}
	public String getQna_img3() {
		return qna_img3;
	}
	public void setQna_img3(String qna_img3) {
		this.qna_img3 = qna_img3;
	}
	public String getQna_img4() {
		return qna_img4;
	}
	public void setQna_img4(String qna_img4) {
		this.qna_img4 = qna_img4;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	public MultipartFile getFile4() {
		return file4;
	}
	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}
}
