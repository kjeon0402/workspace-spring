package com.itbank.verlin.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface detailDAO {
	
	@Select("select photo_path from product_photo where product_id = #{product_id} and category = 'DETAILCUT' order by product_id desc")
	List<detailDTO> selectDetailCut(int product_id);

}
