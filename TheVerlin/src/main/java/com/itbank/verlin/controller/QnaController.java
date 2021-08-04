package com.itbank.verlin.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.verlin.model.Paging;
import com.itbank.verlin.model.PopupDTO;
import com.itbank.verlin.model.QnaDTO;
import com.itbank.verlin.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired private QnaService qs;
	
//	@GetMapping("/board/qna")
//	public ModelAndView qna(ModelAndView mav) {
//		List<QnaDTO> list = qs.qnaList();
//		mav.addObject("qna", list);
//		return mav;
//	}
	
	@GetMapping("/board/qna/{page}")
	public ModelAndView qna(@PathVariable int page, String search_kind, String search_keyword) {
		ModelAndView mav = new ModelAndView("board/qna");
		
		int boardCount = qs.getBoardCount(search_kind, search_keyword);
		Paging pag = new Paging(page, boardCount);
		pag.setSearch_kind(search_kind);
		pag.setSearch_keyword(search_keyword);
		
		List<QnaDTO> list = qs.qnaList(pag);
		mav.addObject("qna", list);
		mav.addObject("pag", pag);
		return mav;
	}
	
	@GetMapping("/board/qna_write")
	public String qna_write() {
		return "board/qna_write";
	}
	
	@PostMapping("/board/qna_write")
	public String qna_write(QnaDTO dto) throws IllegalStateException, IOException {
		int row = qs.qnaWrite(dto);
		return "redirect:/board/qna";
	}
	
	@GetMapping("/board/qna_read/{qna_idx}")
	public ModelAndView qnaOne(@PathVariable int qna_idx) {
		ModelAndView mav = new ModelAndView("board/qna_read");
		QnaDTO dto = qs.qnaOne(qna_idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/board/qna_write_popup")
	public ModelAndView qna_write_popup(ModelAndView mav) {
		List<PopupDTO> dtoList = qs.productList();
		mav.addObject("product", dtoList);
		return mav;
	}
}
