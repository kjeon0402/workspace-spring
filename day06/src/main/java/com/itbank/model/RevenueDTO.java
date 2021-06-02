package com.itbank.model;

//IDX    NOT NULL NUMBER        
//RDATE           VARCHAR2(20)  
//PNAME           VARCHAR2(100) 
//COUNT           NUMBER        
//COST            NUMBER        
//CANCEL          CHAR(1) 
public class RevenueDTO {
	
	private int idx, count, cost;
	private String rdate, pname, cancel;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
}
