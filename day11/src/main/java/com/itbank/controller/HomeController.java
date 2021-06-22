package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itbank.model.MemberDTO;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@GetMapping("/ajax")
	public void ajax() {}
	
	@GetMapping("/member/join")
	public void join() {}
	
	@GetMapping("/member/search")
	public void search() {}
	
	@GetMapping("/test1/{name}/")
	@ResponseBody	// 이 함수가 반환하는 문자열은 viewName이 아니고, 그 자체가 응답이다
	public String test1(@PathVariable String name) {
		return name + ", Hello!";
	}
	
	// 컨트롤러의 메서드(함수)가 데이터를 입력(매개변수)받고 처리해서 출력(반환값)한다
	// 매개변수		반환값
	// 입력			출력
	// 소비			생산
	// consumes		produces
	
	@GetMapping(value="/test2/{name}", produces="application/text; charset=utf-8")
	@ResponseBody
	public String test2(@PathVariable String name) {
		System.out.println("name : " + name);
		return name + "님, 안녕하세요";
	}
	
	// <% request.setCharacterEncoding("UTF-8"); %>
	// formData를 그대로 전송할 때는 (서버에서) consumes를 작성하지 않는다
	// formData를 그대로 전송할 때는 (브라우저에서) headers의 Content-Type을 명시하지 않는다
	@PostMapping(value="/test3", 
				 produces="application/text; charset=utf-8")
	@ResponseBody
	public String test3(MemberDTO dto) {
		return String.format("%s님은 %d살입니다.", dto.getName(), dto.getAge());
	}
}
