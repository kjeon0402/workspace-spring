package com.itbank.day07;

import org.apache.ibatis.annotations.Select;

public interface TestDAO {

	@Select("select * from v$version")
	String test();

}
