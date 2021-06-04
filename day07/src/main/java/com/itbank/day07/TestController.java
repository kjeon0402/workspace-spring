package com.itbank.day07;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired MemberDAO dao;
	
	@GetMapping("/img1")
	public void img1() {}	// WEB-INF/views/test/img1.jsp
	
	@GetMapping("/member")
	public ModelAndView memberList(ModelAndView mav) {
		List<MemberDTO> list = dao.getMemberList();
		mav.addObject("list", list);
		return mav;
	}
}
