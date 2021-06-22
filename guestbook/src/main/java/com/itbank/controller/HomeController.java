package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.GuestBookDTO;
import com.itbank.service.GuestBookService;

@Controller
public class HomeController {

	@Autowired private GuestBookService gs;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
//	// 리스트 출력
//	@GetMapping("/")
//	@ResponseBody *
//	public ModelAndView selectList(ModelAndView mav) {
//		List<GuestBookDTO> list = gs.selectList();
//		mav.setViewName("home");
//		mav.addObject("list", list);
//		return mav;
//	}
	
	// 작성
	@PostMapping(value="/", produces="application/json; charset=utf-8")
	@ResponseBody
	public int write(@RequestBody GuestBookDTO dto) {
		System.out.println(dto);
		int row = gs.write(dto);
		return row;
	}
}
