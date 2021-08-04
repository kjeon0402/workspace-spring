package com.itbank.verlin.model;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	
	private int member_uid, product_id, star, good, review_idx;
	private String rdate, content, deleted;
	private String review_img1, review_img2, review_img3, review_img4;
	private MultipartFile file1, file2, file3, file4;
	private String member_name, product_name, product_price;
	private String category, photo_path;
	
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
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
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
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getReview_img1() {
		return review_img1;
	}
	public void setReview_img1(String review_img1) {
		this.review_img1 = review_img1;
	}
	public String getReview_img2() {
		return review_img2;
	}
	public void setReview_img2(String review_img2) {
		this.review_img2 = review_img2;
	}
	public String getReview_img3() {
		return review_img3;
	}
	public void setReview_img3(String review_img3) {
		this.review_img3 = review_img3;
	}
	public String getReview_img4() {
		return review_img4;
	}
	public void setReview_img4(String review_img4) {
		this.review_img4 = review_img4;
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
