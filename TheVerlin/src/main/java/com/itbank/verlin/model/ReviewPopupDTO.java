package com.itbank.verlin.model;

public class ReviewPopupDTO {

	private int product_id, product_price;
	private String product_name, product_rdate, photo_path;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_rdate() {
		return product_rdate;
	}
	public void setProduct_rdate(String product_rdate) {
		this.product_rdate = product_rdate;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}
}
