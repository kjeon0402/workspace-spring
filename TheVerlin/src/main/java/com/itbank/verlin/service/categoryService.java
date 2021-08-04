package com.itbank.verlin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.categoryDAO;
import com.itbank.verlin.model.categoryDTO;

@Service
public class categoryService {
	
	
	@Autowired private categoryDAO cdao;
	
	public List<categoryDTO> selectProductOptionOptionCategory(String option_category) {
		return cdao.selectProductOptionOptionCategory(option_category);
	}

}
