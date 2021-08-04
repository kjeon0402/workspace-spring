package com.itbank.verlin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.verlin.model.NoticeDTO;
import com.itbank.verlin.model.Paging;
import com.itbank.verlin.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired private NoticeService ns;
	
//	@GetMapping("/board/notice")
//	public ModelAndView noticeList() {
//		ModelAndView mav = new ModelAndView();
//		List<NoticeDTO> list = ns.noticeList();
//		mav.addObject("list", list);
//		System.out.println(list);
//		return mav;
//	}
	
	@GetMapping("/board/notice/{page}")
	public ModelAndView noticeList(@PathVariable int page, String search_kind, String search_keyword) {
		ModelAndView mav = new ModelAndView("board/notice");
		
		int boardCount = ns.getBoardCount(search_kind, search_keyword);
		Paging pag = new Paging(page, boardCount);
		pag.setSearch_kind(search_kind);
		pag.setSearch_keyword(search_keyword);
				
		List<NoticeDTO> list = ns.noticeList(pag);
		mav.addObject("list", list);
		mav.addObject("pag", pag);
		System.out.println(list);
		return mav;
	}
	
	@GetMapping("/board/notice_read/{idx}")
	public ModelAndView noticeOne(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/notice_read");
		NoticeDTO dto = ns.noticeOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/board/notice_modify/{idx}")
	public ModelAndView noticeModify(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/notice_modify");
		NoticeDTO dto = ns.noticeOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/board/notice_modify/{notice_idx}")
	public ModelAndView noticeModify(NoticeDTO dto, @PathVariable int notice_idx) {
		ModelAndView mav = new ModelAndView("/board/notice_modify");
		ns.noticeModify(dto, notice_idx);
		return mav;
	}
	
	@GetMapping("/board/notice_write")
	public String noticeWrite() {
		return "board/notice_write";
	}
	
	@PostMapping("/board/notice_write")
	public String noticeWrite(NoticeDTO dto) {
		int row = ns.noticeWrite(dto);
		return "redirect:/board/notice";
	}
}
