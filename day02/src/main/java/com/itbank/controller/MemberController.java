package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired private MemberDAO dao;
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login = dao.login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
	// 컨트롤러에서 지정한 클래스 형식의 예외가 발생하면 호출되는 메서드
	// @Controller, @ControllerAdivce, @RestController에서만 사용 사능
	// throws를 활용하여 dao에서 발생한 예외를 caller에게 강제로 전가시키면 컨트롤러가 받아서 처리 가능
	@ExceptionHandler(EmptyResultDataAccessException.class)
	public ModelAndView loginFail(EmptyResultDataAccessException e) {
		ModelAndView mav = new ModelAndView("msg");
		mav.addObject("msg", "로그인 실패");
		return mav;
	}
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
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
	
	@GetMapping("/logout")
	public String logout() {
		return "member/logout";
	}
	
	@GetMapping("/drop")
	public String drop() {
		return "member/drop";
	}
	
	@PostMapping("/drop")
	public String drop(int idx, String userpw, Model model, HttpSession session) {
		int row = dao.drop(idx, userpw);
		
		if(row == 1) {
			model.addAttribute("msg", "탈퇴를 성공했습니다.");
			model.addAttribute("url", "/");
			session.invalidate();
		} else {
			model.addAttribute("msg", "탈퇴를 실패했습니다.");
		}
		return "msg";
	}
	
	@GetMapping("/modify")
	public String modify() {
		return "member/modify";
	}
	
	@PostMapping("/modify")
	public String modify(MemberDTO dto, Model model, HttpSession session) {
		int row = dao.modify(dto);
		
		if(row == 1) {
			model.addAttribute("msg", "정보 수정을 성공했습니다. 다시 로그인하세요.");
			model.addAttribute("url", "/");
			session.invalidate();
		} else {
			model.addAttribute("msg", "정보 수정에 오류가 발생했습니다.");
		}
		return "msg";
	}
	
	@GetMapping("/changepw")
	public String changepw() {
		return "member/changepw";
	}
	
	@PostMapping("/changepw")
	public String changepw(String userpw, int idx, Model model, HttpSession session) {
		int row = dao.changepw(userpw, idx);
		
		if(row == 1) {
			model.addAttribute("msg", "비밀번호를 변경했습니다. 다시 로그인하세요.");
			model.addAttribute("url", "/");
			session.invalidate();
		} else {
			model.addAttribute("msg", "오류가 발생했습니다.");
		}
		return "msg";
	}
}
