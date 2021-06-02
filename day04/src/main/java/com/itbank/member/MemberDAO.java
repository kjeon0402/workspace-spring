package com.itbank.member;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface MemberDAO {

//	@Select("select * from member2 order by userid")
	List<MemberDTO> selectList();
	
//	@Select("select * from member2 where userid = #{userid}")
	MemberDTO selectOne(String userid);

//	@Insert("insert into member2 values(member2_seq.nextval, #{userid}, #{userpw}, #{username}, #{phone}, #{birth})")
	int join(MemberDTO dto);

//	@Delete("delete from member2 where userid = #{userid}")
	int delete(String userid);

	int update(MemberDTO dto);
}
