package com.itbank.verlin.model;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface addressDAO {

	@Insert("insert into address (member_uid, address_name, address_recipient, address_post, address_info, address_detail, address_mphone) values(2, #{address_name}, #{address_recipient}, #{address_post} , #{address_info}, #{address_detail}, #{address_mphone})")	
	int insertAddress(addressDTO adto);

	@Select("select * from address")
	List<addressDTO> selectAddress();

	@Update("update address" + 
			"    		set" + 
			"    			address_name = #{address_name}," + 
			"        		address_recipient = #{address_recipient}," + 
			"        		address_info = #{address_info}," + 
			"        		address_detail = #{address_detail}," + 
			"        		address_post = #{address_post}," + 
			"        		address_mphone = #{address_mphone}" + 
			"    		where" + 
			"        		address_index = #{address_index}")
	void modifyAddress(addressDTO adto);
	

}
