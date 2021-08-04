package com.itbank.verlin.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface QnaProductDAO {
	
	
	@Select("select board_qna.qna_idx, board_qna.title, product.product_name, product_photo.photo_path, member.member_name\r\n" + 
			"    from product\r\n" + 
			"    join board_qna\r\n" + 
			"    on board_qna.product_id = product.product_id\r\n" + 
			"    join product_photo\r\n" + 
			"    on product_photo.product_id = product.product_id\r\n" + 
			"    join member\r\n" + 
			"    on member.member_uid = board_qna.member_uid\r\n" + 
			"    where product.product_id = #{product_id} and product_photo.category = 'THUMBNAIL' and board_qna.deleted = 'n'")
	List<QnaProductDTO> selectBoardQna(int product_id);

}
