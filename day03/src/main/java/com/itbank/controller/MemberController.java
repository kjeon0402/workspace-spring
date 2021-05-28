package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
public class MemberController {

	@Autowired private MemberService ms;
	
	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public String login(MemberDTO dto, HttpSession session, String url) {
		// service -> dao -> jt에게 로그인 정보를 전달하여
		// 로그인 객체를 반환받고 반환받은 로그인 객체를 session에 login 이름으로 추가
		
		System.out.println("URL : " + url);
		
		MemberDTO login = ms.login(dto);
		session.setAttribute("login", login);
		session.setMaxInactiveInterval(600);
		return url == null ?  "redirect:/" : "redirect:" + url;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
