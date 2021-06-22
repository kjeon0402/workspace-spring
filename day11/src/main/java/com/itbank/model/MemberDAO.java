package com.itbank.model;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface MemberDAO {

	@Select("select count(*) from member2 where userid = #{userid}")
	int checkId(String userid);

	@Select("select * from member2 where userid = #{userid}")
	Member2DTO search(String userid);

	@Insert("insert into member2 values (member2_seq.nextval, #{userid}, #{userpw}, #{username}, #{phone}, #{birth})")
	int join(Member2DTO dto);
}
