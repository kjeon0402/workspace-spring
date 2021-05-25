package com.itbank.model;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository			// 저장소에 접근하는 스프링 빈 객체
public class BookDAO {

	@Autowired		// 자료형을 우선으로 판단해서, 알맞은 스프링 빈 객체를 자동으로 연결해준다
	private JdbcTemplate jt;
	
	public String test() {
		String sql = "select * from v$version";
		
		// rs에 담긴 결과를 어떤 형태의 객체로 맵핑하여, 반환할지의 내용을 메서드에 담고 있는 객체
		RowMapper<String> rowMapper = (ResultSet rs, int row) -> {
			// while(rs.next()) 내부에 작성하는 코드
			return rs.getString(1);
		};
		
		String data = jt.queryForObject(sql, rowMapper);
		
		return data;
	}
	
	public List<BookDTO> selectList() {
		String sql = "select * from book order by idx";
		
		RowMapper<BookDTO> rowMapper = (ResultSet rs, int row) -> {
			BookDTO dto = new BookDTO();
			dto.setAuthor(rs.getString("author"));
			dto.setCount(rs.getInt("count"));
			dto.setPbday(rs.getString("pbday"));
			dto.setPublisher(rs.getString("publisher"));
			dto.setTitle(rs.getString("title"));
			dto.setIdx(rs.getInt("idx"));
			return dto;
		};
		return jt.query(sql, rowMapper);
	}
	
	public int insertBook(BookDTO dto) {
		int row = 0;
		String sql = "insert into book values(board_seq.nextval, ?, ?, ?, ?, ?)";
		row = jt.update(sql, dto.getTitle(), dto.getAuthor(), dto.getPublisher(), dto.getPbday(), dto.getCount());
		return row;
	}
	
	public int deleteBook(int idx) {
		String sql = "delete from book where idx=?";
		int row = jt.update(sql, idx);
		return row;
	}
	// PreparedStatement pstmt
	// ResultSet rs = pstmt.excuteQuery();
	// int row = pstmt.executeUpdate();
	
	public int updateBook(BookDTO dto) {
		String sql = "update book set "
				+ "title=?, author=?, publisher=?, pbday=?, count=? "
				+ "where idx=?";
		int row = jt.update(sql, dto.getTitle(), dto.getAuthor(), dto.getPublisher(), dto.getPbday(), dto.getCount(), dto.getIdx());
		return row;
	}

	public BookDTO selectOne(int idx) {
		String sql = "select * from book where idx=?";
		
		// RowMapper 객체는 select 결과에서 한 줄을 어떻게 객체 형태로 맵핑할지 담고 있는 객체
		RowMapper<BookDTO> rowMapper = (ResultSet rs, int row) -> {
			BookDTO dto = new BookDTO();
			dto.setAuthor(rs.getString("author"));
			dto.setCount(rs.getInt("count"));
			dto.setPbday(rs.getString("pbday"));
			dto.setPublisher(rs.getString("publisher"));
			dto.setTitle(rs.getString("title"));
			dto.setIdx(rs.getInt("idx"));
			return dto;
		};
		
		return jt.queryForObject(sql, rowMapper, idx);
	}
}
