package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface GuestBookDAO {

	@Insert("insert into guestbook_0614 (writer, content) values (#{writer}, #{content})")
	int write(HashMap<String, String> map);

	@Select("select * from guestbook_0614 order by idx desc")
	List<GuestBookDTO> selectList();
}
