package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ProductDAO {

	@Select("select * from product order by name")
	List<ProductDTO> selectList();

	@Insert("insert into revenue(pname, count, cost) values(#{name}, #{count}, #{price})")
	int insertRevenue(ProductDTO productDTO);

	@Update("update product set count = count - #{count} where idx = #{idx}")
	void updateCountMinus(ProductDTO productDTO);

	@Insert("insert into product(name, price) values(#{name}, #{price})")
	int insertProduct(ProductDTO dto);

	@Update("update product set count = #{count} where idx = #{idx}")
	int updateProduct(ProductDTO productDTO);

	@Select("select * from revenue order by idx desc")
	List<RevenueDTO> selectRevenueList();
}
