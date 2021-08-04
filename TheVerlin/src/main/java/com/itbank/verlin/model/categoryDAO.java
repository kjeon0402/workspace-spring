package com.itbank.verlin.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface categoryDAO {
	
	
	@Select("select DISTINCT option_innercategory\r\n" + 
			"    from product_option\r\n" + 
			"    where option_category = #{option_category}")
	List<categoryDTO> selectProductOptionOptionCategory(String option_category);

}
