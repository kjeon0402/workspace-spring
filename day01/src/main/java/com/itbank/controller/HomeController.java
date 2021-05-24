package com.itbank.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BookDAO;

@Controller
public class HomeController {
	
	@Autowired private BookDAO dao;
	
//	@RequestMapping("/")
//	public String home() {
//		return "home";
//	}

	@RequestMapping("/")
	public ModelAndView home(ModelAndView mav) {
		String data = dao.test();
		mav.addObject("data", data);
		mav.setViewName("home");
		return mav;
	}
	
	@GetMapping("ex01")		// 지정한 주소에 HTTP method GET으로 접근하는 요청이 발생하면
	public void ex01() {}	// 메서드를 호출(void 반환형은 요청 주소를 viewName으로 사용한다)
	
	@PostMapping("ex01")
	public String ex01(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		String data = String.format("%s | %s | %s | %d살", id, pw, name, age);
		
		request.setAttribute("data", data);
		return "ex01-result";
	}
}