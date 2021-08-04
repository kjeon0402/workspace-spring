package com.itbank.verlin.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface QnaDAO {

//	@Select("select " + 
//			"    board_qna.*, " + 
//			"    product.product_name, product.product_price, " + 
//			"    member.member_name, product_photo.photo_path, product_photo.category " + 
//			"	 from board_qna " + 
//			"    join product on product.product_id = board_qna.product_id " + 
//			"    join member on member.member_uid = board_qna.member_uid " + 
//			"    join product_photo on product_photo.product_id = product.product_id " + 
//			"	 where category = 'THUMBNAIL' order by qna_idx desc")
//	List<QnaDTO> qnaList();
	
	List<QnaDTO> qnaList(Paging pag);

	@Select("select" + 
			"   product.*," + 
			"   product_photo.photo_path" + 
			"	from product" + 
			"	join product_photo" + 
			"	on product_photo.product_id = product.product_id" + 
			"   where product_photo.category = 'THUMBNAIL'")
	public List<PopupDTO> productList();

	@Select("select " + 
			"    board_qna.*, " + 
			"    product.product_name, product.product_price, " + 
			"    member.member_name, product_photo.photo_path, product_photo.category " + 
			"	 from board_qna " + 
			"    join product on product.product_id = board_qna.product_id " + 
			"    join member on member.member_uid = board_qna.member_uid " + 
			"    join product_photo on product_photo.product_id = product.product_id " + 
			"	 where category = 'THUMBNAIL' and qna_idx = #{qna_idx}")
	QnaDTO qnaOne(int qna_idx);
	
	@Insert("insert into board_qna "
			+ "(member_uid, product_id, content, title, qna_img1, "
			+ "qna_img2, qna_img3, qna_img4) "
			+ "values "
			+ "(#{member_uid}, #{product_id}, #{content}, #{title}, "
			+ "#{qna_img1}, #{qna_img2}, #{qna_img3}, #{qna_img4})")
	int qnaWrite(QnaDTO dto);
	
	int boardCount(HashMap<String, String> param);
}
