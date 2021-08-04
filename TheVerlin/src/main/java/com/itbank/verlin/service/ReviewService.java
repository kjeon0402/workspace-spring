package com.itbank.verlin.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.ReviewDAO;
import com.itbank.verlin.model.ReviewDTO;
import com.itbank.verlin.model.Paging;
import com.itbank.verlin.model.PopupDTO;

@Service
public class ReviewService {

	@Autowired private ReviewDAO dao;
	
	public List<PopupDTO> productList() {
		return dao.productList();
	}

	public List<ReviewDTO> reviewListForHome() {
		return dao.reviewListForHome();
	}
	
	public List<ReviewDTO> reviewList(Paging pag) {
		return dao.reviewList(pag);
	}

	public List<ReviewDTO> reviewListInDetailProduct(int product_id) {
		return dao.reviewListInDetailProduct(product_id);
	}
	
	public int reviewWrite(ReviewDTO dto) throws IllegalStateException, IOException {
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
		dto.setReview_img1(fileName1);
		dto.setReview_img2(fileName2);
		dto.setReview_img3(fileName3);
		dto.setReview_img4(fileName4);
		return dao.reviewWrite(dto);
	}
	
	public int getBoardCount(String search_kind) {
		return dao.boardCount(search_kind);
	}
}
