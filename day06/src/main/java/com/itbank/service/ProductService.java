package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ProductDAO;
import com.itbank.model.ProductDTO;
import com.itbank.model.RevenueDTO;

@Service
public class ProductService {

	@Autowired private ProductDAO dao;

	public List<ProductDTO> selectList() {
		return dao.selectList();
	}

	public int insertRevenue(List<ProductDTO> list) {
		int row = 0;
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getCount() != 0) {
				row = row + dao.insertRevenue(list.get(i));
				dao.updateCountMinus(list.get(i));
			}
		}
		return row == list.size() ? 1 : 0;
	}

	public int insertProduct(ProductDTO dto) {
		return dao.insertProduct(dto);
	}

	public int updateProduct(List<ProductDTO> list) {
		int row = 0;
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getCount() != 0) {
				row = row + dao.updateProduct(list.get(i));
			}
		}
		return row;
	}

	public List<RevenueDTO> selectRevenueList() {
		return dao.selectRevenueList();
	}
}
