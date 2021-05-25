package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired private MemberDAO dao;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login = dao.login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String join() {
		return "join";
	}
	
	@PostMapping("/join")
	public String join(MemberDTO dto, Model model) {
		int row = dao.join(dto);
		if(row == 1) {
			model.addAttribute("msg", "회원가입을 환영합니다.");
			model.addAttribute("url", "/");
		} else {
			model.addAttribute("msg", "회원가입에 실패했습니다.");
		}
		return "msg";
	}
}
