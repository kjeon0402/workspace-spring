package com.itbank.verlin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.TestDAO;

@Service
public class TestService {
	@Autowired private TestDAO dao;
	
	public String test() {
		return dao.test();
	}
}
