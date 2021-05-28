package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BoardDAO;
import com.itbank.model.BoardDTO;

@Controller
@RequestMapping("/board")
public class BoardController {

	 @Autowired private BoardDAO dao;
	 
	 @GetMapping("/list")
	 public ModelAndView boardList(int page, String type, String word) {
		 ModelAndView mav = new ModelAndView();
		 List<BoardDTO> list = dao.boardList(page, type, word);
		 mav.addObject("list", list);
		 mav.setViewName("board/list");
		 return mav;
	 }
}
