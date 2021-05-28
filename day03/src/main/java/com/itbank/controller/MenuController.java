package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
	
	@GetMapping("board")
	public void board() {}
//	public String board(HttpSession session) {
//		if(session.getAttribute("login") == null) {
//			return "redirect:/login";
//		}
//		return "board";
//	}
	
	@GetMapping("gallery")
	public void gallery() {}
	
	@GetMapping("qna")
	public void qna() {}
}
