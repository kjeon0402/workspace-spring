package com.itbank.verlin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.detailDAO;
import com.itbank.verlin.model.detailDTO;

@Service
public class detailCutService {

	@Autowired private detailDAO dao;
	
	public List<detailDTO> selectDetailCut(int product_id) {
		return dao.selectDetailCut(product_id);
	}

}
