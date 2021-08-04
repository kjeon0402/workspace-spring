package com.itbank.verlin.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface productDAO {
	
	
	@Select("SELECT" + 
			"    PRODUCT.*, product_option.option_category, product_option.option_color, PRODUCT_OPTION.option_size, PRODUCT_OPTION.product_count," + 
			"    product_photo.photo_path, product_option.color_count, product_option.size_count" + 
			"    FROM PRODUCT" + 
			"    JOIN PRODUCT_OPTION" + 
			"    ON PRODUCT.PRODUCT_ID = product_option.product_id" + 
			"    JOIN PRODUCT_PHOTO" + 
			"    ON product_photo.product_id = product.product_id" + 
			"    WHERE PRODUCT.PRODUCT_ID = #{product_id} and product_photo.category = 'THUMBNAIL'")
	List<productDTO> selectProduct(int product_id);
	
	
	
	
}
