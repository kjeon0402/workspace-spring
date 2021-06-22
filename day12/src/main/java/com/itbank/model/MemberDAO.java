package com.itbank.model;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface MemberDAO {

	@Insert("insert into phonebook values(phonebook_seq.nextval, #{name}, #{phone}, #{gender})")
	int insert(PhoneBookDTO dto);

	@Select("select * from phonebook where name = #{name}")
	PhoneBookDTO search(String name);

}
