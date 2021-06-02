package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ImgDAO {

	@Select("select * from img order by idx desc")
	List<ImgDTO> imgList();

	@Insert("insert into img values(img_seq.nextval, #{name}, #{pnum}, #{filename})")
	int addInfo(ImgDTO dto);
}
