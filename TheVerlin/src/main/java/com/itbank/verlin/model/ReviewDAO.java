package com.itbank.verlin.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ReviewDAO {

	@Select("select " +
			" order_log.product_id, order_log.member_uid, " +
			" product.product_price, product.product_name, product_photo.photo_path " +
			" from order_log " +
			" join product on product.product_id = order_log.product_id " +
			" join product_photo on product_photo.product_id = product.product_id " +
			" where product_photo.category = 'THUMBNAIL' and member_uid = #{member_uid}")
	public List<PopupDTO> productList();

	@Select("select" + 
			"    board_review.*, member.member_name, product.product_name, product.product_price, product_photo.photo_path, product_photo.category" + 
			"	 from board_review" + 
			"    join member on member.member_uid = board_review.member_uid" + 
			"    join product on product.product_id = board_review.product_id" +
			"	 join product_photo on product.product_id = product_photo.product_id" +
			"	 where deleted = 'n' and category = 'THUMBNAIL' order by review_idx desc")
	public List<ReviewDTO> reviewListForHome();

	@Insert("insert into board_review "
			+ "(member_uid, content, star, review_img1, review_img2, review_img3, review_img4, product_id) "
			+ "values "
			+ "(#{member_uid}, #{content}, #{star}, #{review_img1}, #{review_img2}, "
			+ "#{review_img3}, #{review_img4}, #{product_id})")
	public int reviewWrite(ReviewDTO dto);
	
	@Select("select board_review.*, member.member_name, product.product_name, product.product_price, product_photo.photo_path, product_photo.category\r\n" + 
			"    from product\r\n" + 
			"    join board_review\r\n" + 
			"    on board_review.product_id = product.product_id and board_review.deleted = 'n'\r\n" + 
			"    join member\r\n" + 
			"    on member.member_uid = board_review.member_uid\r\n" + 
			"    join product_photo\r\n" + 
			"    on product_photo.product_id = product.product_id and product_photo.category ='THUMBNAIL'\r\n" + 
			"    where product.product_id = #{product_id}")
	public List<ReviewDTO> reviewListInDetailProduct(int product_id);
	
	public List<ReviewDTO> reviewList(Paging pag);
	
	public int boardCount(String search_kind);
}
