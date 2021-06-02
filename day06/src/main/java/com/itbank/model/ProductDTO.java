package com.itbank.model;

//IDX   NOT NULL NUMBER        
//NAME  NOT NULL VARCHAR2(100) 
//PRICE NOT NULL NUMBER        
//COUNT          NUMBER 
public class ProductDTO {
	
	private int idx, price, count;
	private String name;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
}
