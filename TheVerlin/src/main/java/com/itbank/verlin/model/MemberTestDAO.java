package com.itbank.verlin.model;

import org.apache.ibatis.annotations.Select;

public interface MemberTestDAO {
	
	@Select("select * from member where member_uid=2")
	MemberTestDTO selectMember();

}
