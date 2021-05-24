package com.itbank.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("ex04")			// 컨틀롤러에 Request Mapping을 지정하고(주소만 지정)
public class Ex04Controller {

	@GetMapping("")				// 개별 하위 주소 및 Http method에 따라서 구분할 수도 있다
	public String ex04() {
		return "ex01";
	}
	
	@PostMapping("")
	public ModelAndView ex04(@RequestParam HashMap<String, String> map, ModelAndView mav) {
		mav.setViewName("ex03-result");
		mav.addObject("dto", map);
		return mav;
	}
}
