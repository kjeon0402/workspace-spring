package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BookDAO;
import com.itbank.model.BookDTO;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired private BookDAO dao;
	
	@GetMapping("/select")
	public ModelAndView select(ModelAndView mav) {
		List<BookDTO> list = dao.selectList();	// 모든 책을 num 순으로 오름차순 정렬해서 가져오기
		mav.addObject("list", list);			// jt.query(sql, rowMapper);
		mav.setViewName("bookList");			// WEB-INF/views/bookList.jsp
		return mav;
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "insert";
	}
	
	@PostMapping("/insert")
	public String insert(BookDTO dto) {
		int row = dao.insertBook(dto);	// jt.update(sql, Object... args);
		return "redirect:/book/select";	// viewName이 "redirect:"으로 시작하면 
										// foward하지 않고 redirect 처리한다
	}
}

