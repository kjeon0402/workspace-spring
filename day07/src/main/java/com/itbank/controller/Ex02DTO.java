package com.itbank.controller;

public class Ex02DTO {		// DTO 클래스 내부의 멤버필드와(String name)
						
	private String name;	// HTML의 <input name="name"> 요소의 이름이 일치하면
	private int age;		// 어느 정도의 자료형 변한을 포함하면서 파라미터를 받을 수 있다
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
