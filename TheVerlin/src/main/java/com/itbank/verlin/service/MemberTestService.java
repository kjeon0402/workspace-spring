package com.itbank.verlin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.MemberTestDAO;
import com.itbank.verlin.model.MemberTestDTO;

@Service
public class MemberTestService {

	@Autowired private MemberTestDAO mdao;
	
	public MemberTestDTO selectMember() {
		MemberTestDTO mdto = mdao.selectMember();
		return mdto;
	}

}
