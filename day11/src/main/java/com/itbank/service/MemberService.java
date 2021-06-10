package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.Member2DTO;
import com.itbank.model.MemberDAO;

@Service
public class MemberService {

	@Autowired MemberDAO dao;
	
	public int checkId(String userid) {
		return dao.checkId(userid);
	}

	public Member2DTO search(String userid) {
		Member2DTO dto = dao.search(userid);
		if(dto != null) {
			dto.setUserpw("********");			
		}
		return dto;
	}
}
