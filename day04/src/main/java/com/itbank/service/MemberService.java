package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDAO;
import com.itbank.member.MemberDTO;

@Service
public class MemberService {
	
	@Autowired private MemberDAO dao;

	public List<MemberDTO> getMemberList() {
		return dao.selectList();
	}
	
	public MemberDTO selectOne(String userid) {
		return dao.selectOne(userid);
	}

	public int getJoin(MemberDTO dto) {
		return dao.join(dto);
	}

	public int delete(String userid) {
		return dao.delete(userid);
	}

	public int update(MemberDTO dto) {
		return dao.update(dto);
	}
}
