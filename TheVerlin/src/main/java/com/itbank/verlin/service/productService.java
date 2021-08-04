package com.itbank.verlin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.productDAO;
import com.itbank.verlin.model.productDTO;

@Service
public class productService {

	@Autowired private productDAO dao;
	
	public List<productDTO> selectProduct(int product_id) {
		List<productDTO> dtoList = dao.selectProduct(product_id);
		return dtoList;
	}

	

}
