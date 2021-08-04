package com.itbank.verlin.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface NoticeDAO {

//	@Select("select " + 
//			"    board_notice.*," + 
//			"    login.member_id" + 
//			"    from board_notice" + 
//			"    join login on board_notice.member_uid = login.member_uid" + 
//			"	 order by rdate desc")
//	List<NoticeDTO> noticeList();

	@Select("select * from board_notice where notice_idx = #{notice_idx}")
	NoticeDTO noticeOne(int idx);

	@Insert("insert into board_notice (member_uid, content, title) values (#{member_uid}, #{content}, #{title})")
	int noticeWrite(NoticeDTO dto);

	@Update("update board_notice set member_uid = #{member_uid}, content = #{content}, title = #{title} where notice_idx = #{notice_idx}")
	NoticeDTO noticeModify(NoticeDTO dto, int notice_idx);
	
	List<NoticeDTO> noticeList(Paging pag);
	
	int boardCount(HashMap<String, String> param);
}
