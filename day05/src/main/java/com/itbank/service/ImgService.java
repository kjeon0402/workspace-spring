package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ImgDAO;
import com.itbank.model.ImgDTO;

@Service
public class ImgService {

	@Autowired private ImgDAO dao;
	
	public List<ImgDTO> getImgList() {
		return dao.imgList();
	}

	public int addInfo(ImgDTO dto) throws IllegalStateException, IOException {
		File dir = new File("D:\\uploadPath");
		dir.mkdir();
		String sdf = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String fileName = sdf + "_" + dto.getFile().getOriginalFilename();
		dto.getFile().transferTo(new File(dir, fileName));
		dto.setFilename(fileName);
		return dao.addInfo(dto);
	}
}
