package com.itbank.controller;

import java.util.List;

public class Ex04DTO {
	// 스프링 컨트롤러가 파라미터를 받으면, 매개변수의 멤버필드에 값을 넣으려는 성격을 활용
	private List<Ex02DTO> list;
	
	@Override
	public String toString() {
		return list.toString();
	}

	public List<Ex02DTO> getList() {
		return list;
	}

	public void setList(List<Ex02DTO> list) {
		this.list = list;
	}
}
