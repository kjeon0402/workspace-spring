package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;

@Controller
public class Ex03Controller {

	@GetMapping("ex03")
	public String ex03() {
		return "ex01";
	}
	
	@PostMapping("ex03")						// 객체 타입으로 파리미터를 받는다. 커맨드 객체
	public ModelAndView ex03(MemberDTO dto) {	// <jsp:useBean + jsp:setProperty *>
		// ModelAndView : 	1) 컨트롤러 메서드가 반환하는 viewName, 
		//					2) jsp에게 넘기는 attribute(object) | request -> model -> mav
		// 두 가지의 작업을 한 번에 처리할 수 있는 객체
		ModelAndView mav = new ModelAndView("ex03-result");	// 생성자 매개변수 viewName
		mav.setViewName("ex03-result");						// setter viewName
		mav.addObject("dto", dto);	// request.setAttribute(), model.addAttribute()
		return mav;
	}
}
