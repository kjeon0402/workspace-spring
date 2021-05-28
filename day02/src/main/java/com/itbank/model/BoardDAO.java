package com.itbank.model;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired JdbcTemplate jt;
	
	// 게시글 목록 출력
	public List<BoardDTO> boardList(int page) {
		return boardList(page, null, null);
	}
	
	public List<BoardDTO> boardList(int page, String type, String word) {
		String sql = "select * from board where deleted='n' %s order by idx desc";
		
		boolean flag = type != null && word != null;
		String search = String.format("and %s like '%%%s%%' ", type, word);
		sql = String.format(sql, flag ? search : "");
		
		String offsetquery = " offset %d rows fetch first %d rows only";
//		int boardCount = boardCount(sql);
//		Paging pag = new Paging(page, boardCount);
		
//		offsetquery = String.format(offsetquery, pag.getOffset(), pag.getPerPage());
		sql += offsetquery;
		
		RowMapper<BoardDTO> rowMapper = (ResultSet rs, int row) -> {
				BoardDTO dto = new BoardDTO();
				dto.setContent(rs.getString("content"));
				dto.setDeleted(rs.getString("deleted"));
				dto.setIdx(rs.getInt("idx"));
				dto.setIpaddr(rs.getString("ipaddr"));
				dto.setTitle(rs.getString("title"));
				dto.setUploadFile(rs.getString("uploadFile"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setWriteDate(rs.getString("writeDate"));
				dto.setWriter(rs.getString("writer"));
				return dto;
		};
		return jt.query(sql, rowMapper, page, type, word);
	}
	
	// 총 게시글의 개수
//	public int boardCount(String subquery) {
//		String sql = "select count(*) from board";
//		RowMapper<BoardDTO> rowMapper = (ResultSet rs, int row) -> {
//			return rs.getInt(1);
//		};
//		int count = jt.query(sql, rowMapper);
//		return count;
//	}
}
