package com.itbank.model;

import java.util.List;

public interface ProductDAO {

	public List<ProductDTO> orderList();

	public int insertRevenue(ProductDTO productDTO);

	public void updateCountMinus(ProductDTO productDTO);

	public int updateProduct(ProductDTO productDTO);

	public List<RevenueDTO> selectRevenueList();
	
}
