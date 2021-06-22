package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDAO;
import com.itbank.model.PhoneBookDTO;

@Service
public class MemberService {

	@Autowired MemberDAO dao;
	
	public int insert(PhoneBookDTO dto) {
		return dao.insert(dto);
	}

	public PhoneBookDTO search(String name) {
		PhoneBookDTO dto = dao.search(name);
		return dto;
	}
}
