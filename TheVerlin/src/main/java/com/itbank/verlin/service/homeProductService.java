package com.itbank.verlin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.homeProductDAO;
import com.itbank.verlin.model.homeProductDTO;

@Service
public class homeProductService {

	@Autowired private homeProductDAO hpdao;
	
	public List<homeProductDTO> selectProductForHome() {
		return hpdao.selectProductForHome();
	}

	public List<homeProductDTO> selectProductForCategory(String option_category) {
		return hpdao.selectProductForCategory(option_category);
	}

	public List<homeProductDTO> selectProductForTodayItem() {
		return hpdao.selectProductForTodayItem();
	}

	public List<homeProductDTO> selectProductForInnerCategory(String option_category, String option_innercategory) {
		return hpdao.selectProductForInnerCategory(option_category, option_innercategory);
	}

	public List<homeProductDTO> selectProductForProductIcon(String product_icon) {
		return hpdao.selectProductForProductIcon(product_icon);
	}

	public List<homeProductDTO> selectProductForSearch(String searchProduct) {
		return hpdao.selectProductForSearch(searchProduct);
	}

}
