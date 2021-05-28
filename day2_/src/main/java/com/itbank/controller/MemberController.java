package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
//	@Autowired private MemberDAO dao;
	@Autowired private MemberService ms;
	
	@GetMapping("/login")			// 요청에 담긴 주소, request.getRequestURI()
	public String login() {
		return "/member/login";		// 포워드 대상이 되는 jsp의 이름, viewName
	}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login = ms.login(dto);	// dto에는 userid와 userpw만 있다
											// login에는 DB에서 부럴온 모든 값이 들어 있다
		session.setAttribute("login", login);
		session.setMaxInactiveInterval(600);
		return "redirect:/";	// forward는 jsp의 이름을 가리켜야 하고
								// redirect는 요청 주소를 가리켜야 한다
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
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public void join() {}
	// 반환형이 void인 메서드는 요청 주소의 이름을 viewName으로 처리한다
	
	@PostMapping("/join")
	public String join(MemberDTO dto) {
		int row = ms.join(dto);
		return "redirect:/";
	}
	
	@GetMapping("/drop")
	public String drop() {
		return "member/drop";
	}
	
	@PostMapping("/drop")
	public String drop(int idx, String userpw, Model model, HttpSession session) {
		int row = ms.drop(idx, userpw);
		
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
		// 정보가 수정되면, DB에 있는 정보도 수정해야 하고, 세션에 들어 있는 정보도 갱신
		int row = ms.modify(dto);
		
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
		int row = ms.changepw(userpw, idx);
		
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
