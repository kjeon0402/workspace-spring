package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface GuestBookDAO {

	@Select("select * from guestbook order by idx desc")
	List<GuestBookDTO> selectList();

	@Insert("insert into guestbook (writer, content) values (#{writer}, #{content})")
	int write(GuestBookDTO dto);
}
