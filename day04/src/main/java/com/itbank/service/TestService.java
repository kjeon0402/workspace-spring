package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.TestDAO;

@Service
public class TestService {

	@Autowired private TestDAO dao;

	public String getTest1() {
		return dao.getTest1();
	}

	public String getTest2() {
		return dao.getTest2();
	}
}
