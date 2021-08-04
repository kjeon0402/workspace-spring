package com.itbank.verlin.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface homeProductDAO {
	
	@Select("select product.*, product_option.option_color, product_option.color_count, product_photo.photo_path, product_option.size_count, product_option.color_code" + 
			"    from product\r\n" + 
			"    join product_option\r\n" + 
			"    on product_option.product_id = product.product_id\r\n" + 
			"    join product_photo\r\n" + 
			"    on product_photo.product_id = product.product_id\r\n" + 
			"    where product_photo.category = 'THUMBNAIL' order by product.product_id desc")
	List<homeProductDTO> selectProductForHome();
	
	
	@Select("select product.*, product_option.option_color, product_option.color_count, product_photo.photo_path, product_option.size_count, product_option.color_code, product_option.option_category\r\n" + 
			"			from product\r\n" + 
			"			join product_option\r\n" + 
			"			on product_option.product_id = product.product_id\r\n" + 
			"			join product_photo\r\n" + 
			"			on product_photo.product_id = product.product_id\r\n" + 
			"			where product_photo.category = 'THUMBNAIL' and product_option.option_category = #{option_category}")
	List<homeProductDTO> selectProductForCategory(String option_category);

	
	@Select("select product.*, product_option.option_color, product_option.color_count, product_photo.photo_path, product_option.size_count, product_option.color_code\r\n" + 
			"			from product\r\n" + 
			"			join product_option\r\n" + 
			"			on product_option.product_id = product.product_id\r\n" + 
			"			join product_photo\r\n" + 
			"			on product_photo.product_id = product.product_id\r\n" + 
			"			where product_photo.category = 'THUMBNAIL' and product.istodayitem = 'y'")
	List<homeProductDTO> selectProductForTodayItem();

	
	@Select("select product.*, product_option.option_color, product_option.color_count, product_photo.photo_path, product_option.size_count, product_option.color_code, product_option.option_category\r\n" + 
			"			from product\r\n" + 
			"			join product_option\r\n" + 
			"			on product_option.product_id = product.product_id\r\n" + 
			"			join product_photo\r\n" + 
			"			on product_photo.product_id = product.product_id\r\n" + 
			"			where product_photo.category = 'THUMBNAIL' and product_option.option_category = #{arg0} and product_option.option_innercategory = #{arg1}")
	List<homeProductDTO> selectProductForInnerCategory(String arg0, String arg1);

	
	@Select("select product.*, product_option.option_color, product_option.color_count, product_photo.photo_path, product_option.size_count, product_option.color_code, product_option.option_category\r\n" + 
			"			from product\r\n" + 
			"			join product_option\r\n" + 
			"			on product_option.product_id = product.product_id\r\n" + 
			"			join product_photo\r\n" + 
			"			on product_photo.product_id = product.product_id\r\n" + 
			"			where product_photo.category = 'THUMBNAIL' and product.product_icon = #{product_icon}")
	List<homeProductDTO> selectProductForProductIcon(String product_icon);

	
	@Select("select product.*, product_option.option_color, product_option.color_count, product_photo.photo_path, product_option.size_count, product_option.color_code, product_option.option_category\r\n" + 
			"			from product\r\n" + 
			"			join product_option\r\n" + 
			"			on product_option.product_id = product.product_id\r\n" + 
			"			join product_photo\r\n" + 
			"			on product_photo.product_id = product.product_id\r\n" + 
			"			where product_photo.category = 'THUMBNAIL' and product.product_name like '%%${searchProduct}%%'")
	List<homeProductDTO> selectProductForSearch(String searchProduct);

}
