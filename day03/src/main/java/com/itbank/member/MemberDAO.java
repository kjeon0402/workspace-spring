package com.itbank.member;

import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired private JdbcTemplate jt;
	
	// RowMapper
	private RowMapper<MemberDTO> rowMapper = (ResultSet rs, int row) -> {
		MemberDTO dto = new MemberDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setUserid(rs.getString("userid"));
		dto.setUserpw(rs.getString("userpw"));
		dto.setUsername(rs.getString("username"));
		dto.setPhone(rs.getString("phone"));
		dto.setBirth(rs.getString("birth"));
		return dto;
	};

	// 로그인
	public MemberDTO login(MemberDTO dto) {
		String sql = "select * from member2 where userid=? and userpw=?";
		return jt.queryForObject(sql, rowMapper, dto.getUserid(), dto.getUserpw());
	}
}
