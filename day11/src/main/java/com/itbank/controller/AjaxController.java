package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.model.Member2DTO;
import com.itbank.service.MemberService;

@RestController
public class AjaxController {

	@Autowired private MemberService ms;
	private ObjectMapper mapper = new ObjectMapper();
	
	@GetMapping("/checkId/{userid}")
	public int checkId(@PathVariable String userid) {
		return ms.checkId(userid);
	}
	
	@GetMapping(value="/search/{userid}", produces="application/json; charset=utf-8")
	public String search(@PathVariable String userid) throws JsonProcessingException {
		Member2DTO dto = ms.search(userid);
		System.out.println(dto);	// 자바에서 사용하는 일반적인 객체의 형식
		
		String data = mapper.writeValueAsString(dto);
		System.out.println(data);	// 자바스크립트에게 객체 정보를 전달하기 위한 문자열
		return data;
	}
}
