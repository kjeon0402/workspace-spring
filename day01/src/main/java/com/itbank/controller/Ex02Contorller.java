package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Ex02Contorller {
	
	@GetMapping("ex02")		// ex02 주소로 접근하지만
	public String ex02() {
		return "ex01";		// ex01.jsp로 포워딩한다
							// 이미 만들어진 jsp파일을 재활용할 수 있다
	}
	
	@PostMapping("ex02")
	public String ex02(String id, String pw, String name, int age, Model model) {
		
		// 파라미터를 일일이 request를 통해서 가져올 필요가 없다
		// String은 매개변수 선언만으로 받을 수 있으며, 기본 자료형은 자동으로 형 변환까지 처리해준다
		
		String data = String.format("%s | %s | %s | %d살", id, pw, name, age);
		model.addAttribute("data", data);
		// model 객체는 컨트롤러 메서드에서 매개변수로 선언하며
		// request.setAttribute와 유사한 model.addAttribute() 메서드를 호출할 수 있다
		
		return "ex01-result";
	}
}
