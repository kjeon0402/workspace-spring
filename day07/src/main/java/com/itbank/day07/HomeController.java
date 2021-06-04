package com.itbank.day07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@Autowired private TestDAO dao;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home(Model model) {
		String dbTest = dao.test();
		model.addAttribute("dbTest", dbTest);
		return "home";
	}
}
