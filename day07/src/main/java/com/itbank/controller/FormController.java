package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/form")
public class FormController {
		
	@GetMapping("")	// prefix + "/form" + "" + suffix = /WEB-INF/views/form.jsp
	public void form() {}
	
	@GetMapping("/ex01")	// /WEB-INF/view/form/ex01.jsp
	public void ex01() {}
	
	@PostMapping("/ex01")
	public ModelAndView ex01(int n1, char oper, int n2) {
		ModelAndView mav = new ModelAndView("form/ex01Result");
		int answer = 0;
		switch(oper) {
			case '+': answer = n1 + n2; break;
			case '-': answer = n1 - n2; break;
			case '*': answer = n1 * n2; break;
			case '/': answer = n1 / n2; break;
		}
		String result = String.format("%d %c %d = %d\n", n1, oper, n2, answer);
		mav.addObject("result", result);
		return mav;
	}
	
	@GetMapping("/ex02")
	public void ex02() {}
	
	@PostMapping("/ex02")
	public ModelAndView ex02(Ex02DTO dto) {
		ModelAndView mav = new ModelAndView("form/ex02Result");
		String result = String.format("%s님은 %d살입니다.", dto.getName(), dto.getAge());
		mav.addObject("result", result);
		return mav;
	}
}
