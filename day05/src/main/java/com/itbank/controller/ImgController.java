package com.itbank.controller;

import java.io.IOException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.ImgDTO;
import com.itbank.service.ImgService;

@Controller
public class ImgController {
	
	@Autowired private ImgService ms;
	
	@GetMapping("/")
	public ModelAndView imgboard() {	
		ModelAndView mav = new ModelAndView("home");
		List<ImgDTO> list = ms.getImgList();
		mav.addObject("list", list);;
		return mav;
	}
		
	@PostMapping("/")
	public String upload(ImgDTO dto) throws IllegalStateException, IOException {
		int row = ms.addInfo(dto);
		return "redirect:/";
	}
}
