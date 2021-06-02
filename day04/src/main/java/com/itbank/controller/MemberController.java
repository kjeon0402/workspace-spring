package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member2")
public class MemberController {
	
	@Autowired private MemberService ms;

	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = ms.getMemberList();
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/")
	public String join(MemberDTO dto) {
		int row = ms.getJoin(dto);
		return "redirect:/member2/";
	}
	
	@GetMapping("/{userid}")
	public ModelAndView info(@PathVariable String userid) {
		ModelAndView mav = new ModelAndView("/member2/info");
		MemberDTO dto = ms.selectOne(userid);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/delete/{userid}")
	public String delete(@PathVariable String userid) {
		int row = ms.delete(userid);
		return "redirect:/";
	}
	
	@GetMapping("/update/{userid}")
	public ModelAndView updateForm(@PathVariable String userid) {
		ModelAndView mav = new ModelAndView("/member2/update");
		MemberDTO dto = ms.selectOne(userid);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/update/{userid}")
	public String update(MemberDTO dto) {
		int row = ms.update(dto);
		return "redirect:/member2/";
	}
}
