package com.itbank.verlin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.verlin.model.ReviewDTO;
import com.itbank.verlin.model.Paging;
import com.itbank.verlin.model.PopupDTO;
import com.itbank.verlin.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired ReviewService rs;
	
//	@GetMapping("/board/review")
//	public ModelAndView review(ModelAndView mav) {
//		List<ReviewDTO> list = rs.reviewList();
//		mav.addObject("review", list);
//		return mav;
//	}
	
	@GetMapping("/board/review/{page}")
	public ModelAndView review(@PathVariable int page, String search_keyword) {
		ModelAndView mav = new ModelAndView("board/review");
		
		int boardCount = rs.getBoardCount(search_keyword);
		Paging pag = new Paging(page, boardCount);
		pag.setSearch_keyword(search_keyword);
		
		List<ReviewDTO> list = rs.reviewList(pag);
		mav.addObject("review", list);
		mav.addObject("pag", pag);
		return mav;
	}
	
	@GetMapping("/board/review_write")
	public String review_write() {
		return "board/review_write";
	}
	
	@PostMapping("/board/review_write")
	public String review_write(ReviewDTO dto) throws IllegalStateException, IOException {
		int row = rs.reviewWrite(dto);
		return "redirect:/board/review";
	}
	
	@GetMapping("/board/review_write_popup")
	public ModelAndView review_write_popup(ModelAndView mav) {
		List<PopupDTO> dtoList = rs.productList();
		mav.addObject("product", dtoList);
		return mav;
	}
	
}
