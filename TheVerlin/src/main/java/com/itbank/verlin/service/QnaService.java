package com.itbank.verlin.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.Paging;
import com.itbank.verlin.model.PopupDTO;
import com.itbank.verlin.model.QnaDAO;
import com.itbank.verlin.model.QnaDTO;
import com.itbank.verlin.model.QnaProductDAO;
import com.itbank.verlin.model.QnaProductDTO;

@Service
public class QnaService {

	@Autowired private QnaProductDAO qdao;
	@Autowired private QnaDAO dao;
	
	public List<QnaProductDTO> selectBoardQna(int product_id) {
		return qdao.selectBoardQna(product_id);
	}

	
//	public List<QnaDTO> qnaList() {
//		return dao.qnaList();
//	}
	
	public List<QnaDTO> qnaList(Paging pag) {
		return dao.qnaList(pag);
	}

	public List<PopupDTO> productList() {
		return dao.productList();
	}

	public QnaDTO qnaOne(int qna_idx) {
		return dao.qnaOne(qna_idx);
	}

	public int qnaWrite(QnaDTO dto) throws IllegalStateException, IOException {
		File dir = new File("D:\\theVerlinUploadPath");
		dir.mkdir();
		String fileName1 = dto.getFile1().getOriginalFilename();
		String fileName2 = dto.getFile2().getOriginalFilename();
		String fileName3 = dto.getFile3().getOriginalFilename();
		String fileName4 = dto.getFile4().getOriginalFilename();
		if("".equals(dto.getFile1().getOriginalFilename()) == false) dto.getFile1().transferTo(new File(dir, fileName1));
		if("".equals(dto.getFile2().getOriginalFilename()) == false) dto.getFile2().transferTo(new File(dir, fileName2));
		if("".equals(dto.getFile3().getOriginalFilename()) == false) dto.getFile3().transferTo(new File(dir, fileName3));
		if("".equals(dto.getFile4().getOriginalFilename()) == false) dto.getFile4().transferTo(new File(dir, fileName4));
		dto.setQna_img1(fileName1);
		dto.setQna_img2(fileName2);
		dto.setQna_img3(fileName3);
		dto.setQna_img4(fileName4);
		return dao.qnaWrite(dto);
	}
	
	public int getBoardCount(String search_kind, String search_keyword) {
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("search_kind", search_kind);
		param.put("search_keyword", search_keyword);
		return dao.boardCount(param);
	}
}
