package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.GuestBookDAO;
import com.itbank.model.GuestBookDTO;

@Service
public class GuestBookService {

	@Autowired private GuestBookDAO dao;
	
	public List<GuestBookDTO> selectList() {
		return dao.selectList();
	}

	public int write(GuestBookDTO dto) {
		return dao.write(dto);
	}
}
