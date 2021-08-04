package com.itbank.verlin.model;

import org.apache.ibatis.annotations.Select;

public interface TestDAO {

	@Select("select * from v$version")
	String test();
}
