package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.TestDTO;
import com.itbank.service.TestService;

@Controller
public class HomeController {
	
	@Autowired private TestService ts;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@PostMapping("/test1")
	public String test1(TestDTO dto) {
		System.out.println("<test1>\n" + dto);
		return "redirect:/";
	}
	
	@PostMapping("/test2")
	public String test2(TestDTO dto) throws IllegalStateException, IOException {
		System.out.println("<test2>\n" + dto);
		int row = ts.uploadFile(dto);
		return "redirect:/";
	}
	
	@GetMapping("/list")
	public void list(Model model) {
		List<TestDTO> list = ts.selectList();
		model.addAttribute("list", list);
	}
	
	@GetMapping("/read/{idx}")
	public ModelAndView read(@PathVariable int idx) {
		// @PathVariable을 받았을 때는 void로 반환형을 처리하면 jsp의 이름이 마구 바뀌게 되니깐
		// String이나 ModelAndView를 사용하자(서로 다른 주소로 요청을 받더라도, 고정된 jsp를 찾아가게 하자)
		
		ModelAndView mav = new ModelAndView("read");
		List<TestDTO> read = ts.readOne(idx);
		mav.addObject("read", read);
		return mav;
	}
}