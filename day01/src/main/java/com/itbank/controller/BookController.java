package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable int idx, Model model) {
		System.out.println("idx : " + idx);
		int row = dao.deleteBook(idx);	// jt.update(sql, idx)
//		return "redirect:/book/select";
		
		if(row == 1) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "/book/select");
		} else {
			model.addAttribute("msg", "존재하지 않는 도서 정보입니다.");
		}
		return "msg";	// msg.jsp는 object를 받아서 javascript:alert()을 호출하고 페이지 이동시키는 파일
	}
	
	@GetMapping("/update/{idx}/")
	public ModelAndView update(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("update");
		BookDTO dto = dao.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/update/{idx}/")
	public ModelAndView update(BookDTO dto) {
		ModelAndView mav = new ModelAndView("msg");
		
		int row = dao.updateBook(dto);
		if(row == 1) {
			mav.addObject("msg", "수정 성공");
			mav.addObject("url", "/book/select");
		} else {
			mav.addObject("msg", "수정 실패");
		}
		return mav;
	}
}

