package com.itbank.service;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;

// @Controller		-> @Service 	-> @Repository
// 요청받은 데이터		-> 데이터 형식 변경 	-> 준비된 데이터를 DB에 전달
// 목록을 요청			-> 데이터 요청		-> DB에서 받아와서 객체 형태로 맵핑 후 반환
// 데이터를 view에 넘김	<- 필요하다면 수정	<- 반환

import org.springframework.stereotype.Service;

import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

@Service	// Web이나 DB에 종속적이지 않은 코드를 작성한다
public class MemberService {

	@Autowired private MemberDAO dao;
	
	private String getHash(String input) {
		String hash = null;
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-512");
			md.reset();
			md.update(input.getBytes("UTF-8"));
			hash = String.format("%0128x", new BigInteger(1, md.digest()));
			
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		return hash;
	}
	
	public int join(MemberDTO dto) {
		// 패스워드를 해시처리한 이후에 dao에게 넘긴다			(입력값의 형태를 수정)
		String hash = getHash(dto.getUserpw());
		dto.setUserpw(hash);
		return dao.join(dto);
	}

	public List<MemberDTO> getMemberList() {	// 반환값의 형태를 수정
		List<MemberDTO> list = dao.selectList();
		list.forEach((dto) -> dto.setUserpw("********"));
		return list;
	}

	public MemberDTO login(MemberDTO dto) {
		dto.setUserpw(getHash(dto.getUserpw()));
		return dao.login(dto);
	}

	public int drop(int idx, String userpw) {
		userpw = getHash(userpw);
		return dao.drop(idx, userpw);
	}

	public int modify(MemberDTO dto) {
		return dao.modify(dto);
	}

	public int changepw(String userpw, int idx) {
		userpw = getHash(userpw);
		return dao.changepw(userpw, idx);
	}
}
