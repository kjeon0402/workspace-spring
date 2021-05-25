package com.itbank.model;

import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired private JdbcTemplate jt;
	
	// 로그인
	public MemberDTO login(MemberDTO memberDTO) {
		String sql = "select * from member2 where userid=? and userpw=?";
		
		RowMapper<MemberDTO> rowMapper = (ResultSet rs, int row) -> {
			MemberDTO dto = new MemberDTO();
			dto.setBirth(rs.getString("birth"));
			dto.setIdx(rs.getInt("idx"));
			dto.setPhone(rs.getString("phone"));
			dto.setUserid(rs.getString("userid"));
			dto.setUserpw(rs.getString("userpw"));
			dto.setUsername(rs.getString("username"));
			return dto;
		};
		return jt.queryForObject(sql, rowMapper, memberDTO.getUserid(), memberDTO.getUserpw());
	}
	
	// 회원가입
	public int join(MemberDTO dto) {
		String sql = "insert into member2 values(member2_seq.nextval, ?, ?, ?, ?, ?)";
		int row = jt.update(sql, dto.getUserid(), dto.getUserpw(), dto.getUsername(), dto.getPhone(), dto.getBirth());
		return row;
	}
}
