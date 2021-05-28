package com.itbank.model;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired private JdbcTemplate jt;
	
	// 대부분의 select 쿼리가 이 rowMapper를 참조할거니까, 멤버필드로 선언해둘 수 있다
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
	
	// 회원 전체 목록
	public List<MemberDTO> selectList() {		
		String sql = "select * from member2 order by idx";
		return jt.query(sql, rowMapper);
	}
	
	// 로그인
	public MemberDTO login(MemberDTO memberDTO) {
		String sql = "select * from member2 where userid=? and userpw=?";
		return jt.queryForObject(sql, rowMapper, memberDTO.getUserid(), memberDTO.getUserpw());
	}
	
	// 회원가입
	public int join(MemberDTO dto) {
		String sql = "insert into member2 values(member2_seq.nextval, ?, ?, ?, ?, ?)";
		int row = jt.update(sql, dto.getUserid(), dto.getUserpw(), dto.getUsername(), dto.getPhone(), dto.getBirth());
		return row;
	}
	
	// 회원 탈퇴
	public int drop(int idx, String userpw) {
		String sql = "delete from member2 where idx=? and userpw=?";
		int row = jt.update(sql, idx, userpw);
		return row;
	}
	
	// 회원 정보 수정
	public int modify(MemberDTO dto) {
		String sql = "update member2 set userid=?, username=?, phone=?, birth=? where idx=?";
		int row = jt.update(sql, dto.getUserid(), dto.getUsername(), dto.getPhone(), dto.getBirth(), dto.getIdx());
		return row;
	}
	
	// 비밀번호 변경
	public int changepw(String userpw, int idx) {
		String sql = "update member2 set userpw=? where idx=?";
		int row = jt.update(sql, userpw, idx);
		return row;
	}
}
