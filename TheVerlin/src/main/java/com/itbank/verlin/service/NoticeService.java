package com.itbank.verlin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.NoticeDAO;
import com.itbank.verlin.model.NoticeDTO;
import com.itbank.verlin.model.Paging;

@Service
public class NoticeService {

	@Autowired private NoticeDAO dao;
	
//	public List<NoticeDTO> noticeList() {
//		return dao.noticeList();
//	}
	
	public List<NoticeDTO> noticeList(Paging pag) {
		return dao.noticeList(pag);
	}

	public NoticeDTO noticeOne(int idx) {
		return dao.noticeOne(idx);
	}

	public int noticeWrite(NoticeDTO dto) {
		return dao.noticeWrite(dto);
	}

	public NoticeDTO noticeModify(NoticeDTO dto, int notice_idx) {
		return dao.noticeModify(dto, notice_idx);
	}

	public int getBoardCount(String search_kind, String search_keyword) {
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("search_kind", search_kind);
		param.put("search_keyword", search_keyword);
		return dao.boardCount(param);
	}
}
