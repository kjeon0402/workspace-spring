package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface TestDAO {

	@Insert("insert into test0608 (title) values(#{title})")
	int insertArticle(TestDTO dto);

	@Select("select max(idx) from test0608")
	int selectMaxIdx();

	@Insert("insert into test0608_files (tidx, fileName) values (#{tidx}, #{fileName})")
	int insertImage(@Param("tidx") int maxIdx, @Param("fileName") String fileName);
	// myBatis는 대체로 매개변수를 하나로 받지만 @Param 어노테이션으로 파라미터 이름을 지정해서 여러 개 사용할 수 있다

	@Select("select * from test0608 order by idx desc")
	List<TestDTO> selectList();

	@Select("select A.idx, A.title, F.filename from test0608 A join test0608_files F on F.tidx = A.idx where A.idx = #{idx}")
	List<TestDTO> readOne(int idx);

}
