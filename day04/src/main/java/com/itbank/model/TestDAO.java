package com.itbank.model;

import org.apache.ibatis.annotations.Select;

public interface TestDAO {

	String getTest1();
	
	@Select("select to_char(sysdate, 'yyyy-MM-dd') from dual")
	String getTest2();

}
