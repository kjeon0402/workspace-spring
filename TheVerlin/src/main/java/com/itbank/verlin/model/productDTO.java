package com.itbank.verlin.model;


public class productDTO {
	
	private int product_id, product_price, product_count, color_count, size_count;
	private String product_name, product_rdate, option_category, option_color, option_size, photo_path, product_icon;
	
	public String getProduct_icon() {
		return product_icon;
	}
	public void setProduct_icon(String product_icon) {
		this.product_icon = product_icon;
	}
	public int getColor_count() {
		return color_count;
	}
	public void setColor_count(int color_count) {
		this.color_count = color_count;
	}
	public int getSize_count() {
		return size_count;
	}
	public void setSize_count(int size_count) {
		this.size_count = size_count;
	}
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
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
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
	public String getOption_category() {
		return option_category;
	}
	public void setOption_category(String option_category) {
		this.option_category = option_category;
	}
	public String getOption_color() {
		return option_color;
	}
	public void setOption_color(String option_color) {
		this.option_color = option_color;
	}
	public String getOption_size() {
		return option_size;
	}
	public void setOption_size(String option_size) {
		this.option_size = option_size;
	}
	public String getPhoto_path() {
		return photo_path;
	}
	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}
	
	
}
